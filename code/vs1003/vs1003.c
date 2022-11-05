/*
 Copyright (C) 2012 Andy Karpov <andy.karpov@gmail.com>
 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 version 2 as published by the Free Software Foundation.
 */
 
#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <p32xxxx.h>
#include <plib.h>
#include <string.h>

#include "../HardwareProfile.h"
#include "../fatfs/ff.h"
#include "ringbuffer.h"
#include "vs1003.h"
#include "../net/TCPIP.h"
#include "../common.h"

#define vs1003_chunk_size 32

/****************************************************************************/

// VS1003 SCI Write Command byte is 0x02
#define VS_WRITE_COMMAND 0x02

// VS1003 SCI Read COmmand byte is 0x03
#define VS_READ_COMMAND  0x03

// SCI Registers

#define SCI_MODE            0x0
#define SCI_STATUS          0x1
#define SCI_BASS            0x2
#define SCI_CLOCKF          0x3
#define SCI_DECODE_TIME     0x4
#define SCI_AUDATA          0x5
#define SCI_WRAM            0x6
#define SCI_WRAMADDR        0x7
#define SCI_HDAT0           0x8
#define SCI_HDAT1           0x9
#define SCI_AIADDR          0xa
#define SCI_VOL             0xb
#define SCI_AICTRL0         0xc
#define SCI_AICTRL1         0xd
#define SCI_AICTRL2         0xe
#define SCI_AICTRL3         0xf
#define SCI_num_registers   0xf

// SCI_MODE bits

#define SM_DIFF             0
#define SM_LAYER12          1
#define SM_RESET            2
#define SM_OUTOFWAV         3
#define SM_EARSPEAKER_LO    4
#define SM_TESTS            5
#define SM_STREAM           6
#define SM_EARSPEAKER_HI    7
#define SM_DACT             8
#define SM_SDIORD           9
#define SM_SDISHARE         10
#define SM_SDINEW           11
#define SM_ADPCM            12
#define SM_ADCPM_HP         13
#define SM_LINE_IN          14

FIL fsrc;
DIR vsdir;

static TCP_SOCKET	VS_Socket = INVALID_SOCKET;
static uri_t uri;
static BOOL loop_flag = FALSE;
static BOOL dir_flag = FALSE;

typedef enum {
    STREAM_HOME = 0,
    STREAM_HTTP_BEGIN,
    STREAM_HTTP_SOCKET_OBTAINED,
    STREAM_HTTP_SEND_REQUEST,
    STREAM_HTTP_PROCESS_HEADER,
    STREAM_HTTP_FILL_BUFFER,
    STREAM_HTTP_GET_DATA,
    STREAM_FILE_FILL_BUFFER,                 
    STREAM_FILE_GET_DATA,
    STREAM_HTTP_CLOSE,
    STREAM_HTTP_RECONNECT_WAIT        
} StreamState_t;

static StreamState_t StreamState = STREAM_HOME;

typedef enum {
    DO_NOT_RECONNECT = 0,
    RECONNECT_IMMEDIATELY,
    RECONNECT_WAIT_LONG,
    RECONNECT_WAIT_SHORT
} ReconnectStrategy_t;

static ReconnectStrategy_t ReconnectStrategy = DO_NOT_RECONNECT;

typedef enum {
    FEED_RET_NO_DATA_NEEDED = 0,
    FEED_RET_OK,
    FEED_RET_BUFFER_EMPTY
} feed_ret_t;

// Register names

typedef enum {
    reg_name_MODE = 0,
    reg_name_STATUS,
    reg_name_BASS,
    reg_name_CLOCKF,
    reg_name_DECODE_TIME,
    reg_name_AUDATA,
    reg_name_WRAM,
    reg_name_WRAMADDR,
    reg_name_HDAT0,
    reg_name_HDAT1,
    reg_name_AIADDR,
    reg_name_VOL,
    reg_name_AICTRL0,
    reg_name_AICTRL1,
    reg_name_AICTRL2,
    reg_name_AICTRL3
} register_names_t;

const char * register_names[] =
{
  "MODE",
  "STATUS",
  "BASS",
  "CLOCKF",
  "DECODE_TIME",
  "AUDATA",
  "WRAM",
  "WRAMADDR",
  "HDAT0",
  "HDAT1",
  "AIADDR",
  "VOL",
  "AICTRL0",
  "AICTRL1",
  "AICTRL2",
  "AICTRL3",
};

static void VS1003_startPlaying(void);
static void VS1003_stopPlaying(void);
static inline void await_data_request(void);
static inline void control_mode_on(void);
static inline void control_mode_off(void);
static inline void data_mode_on(void);
static inline void data_mode_off(void);
static uint8_t VS1003_SPI_transfer(uint8_t outB);
static uint8_t find_next_audio_file (FIL* file, DIR* directory, FILINFO* info);
static void VS1003_soft_stop (void);
static void VS1003_handle_end_of_file (void);
static feed_ret_t VS1003_feed_from_buffer (void);

/****************************************************************************/

uint16_t VS1003_read_register(uint8_t _reg) {
  uint16_t result;
  control_mode_on();
  delay_us(1); // tXCSS
  VS1003_SPI_transfer(VS_READ_COMMAND); // Read operation
  VS1003_SPI_transfer(_reg); // Which register
  result = VS1003_SPI_transfer(0xff) << 8; // read high byte
  result |= VS1003_SPI_transfer(0xff); // read low byte
  delay_us(1); // tXCSH
  await_data_request();
  control_mode_off();
  return result;
}

/****************************************************************************/

void VS1003_write_register(uint8_t _reg,uint16_t _value) {
  control_mode_on();
  delay_us(1); // tXCSS
  VS1003_SPI_transfer(VS_WRITE_COMMAND); // Write operation
  VS1003_SPI_transfer(_reg); // Which register
  VS1003_SPI_transfer(_value >> 8); // Send hi byte
  VS1003_SPI_transfer(_value & 0xff); // Send lo byte
  delay_us(1); // tXCSH
  await_data_request();
  control_mode_off();
}

/****************************************************************************/

void VS1003_sdi_send_buffer(const uint8_t* data, int len) {
  int chunk_length;
  
  data_mode_on();
  while ( len ) {
    await_data_request();
    delay_us(3);
    chunk_length = min(len, vs1003_chunk_size);
    len -= chunk_length;
    while ( chunk_length-- ) VS1003_SPI_transfer(*data++);
  }
  data_mode_off();
}

/****************************************************************************/

void VS1003_sdi_send_chunk(const uint8_t* data, int len) {
    if (len > 32) return;
    data_mode_on();
    await_data_request();
    while ( len-- ) VS1003_SPI_transfer(*data++);
    data_mode_off();
}

/****************************************************************************/

void VS1003_sdi_send_zeroes(int len) {
  int chunk_length;  
  data_mode_on();
  while ( len ) {
    await_data_request();
    chunk_length = min(len,vs1003_chunk_size);
    len -= chunk_length;
    while ( chunk_length-- ) VS1003_SPI_transfer(0);
  }
  data_mode_off();
}

/****************************************************************************/

static feed_ret_t VS1003_feed_from_buffer (void) {
    uint8_t data[32];

    if (!VS_DREQ_PIN) return FEED_RET_NO_DATA_NEEDED;
    do {
        if (get_num_of_bytes_in_ringbuffer() < 32) return FEED_RET_BUFFER_EMPTY;

        uint16_t w = read_array_from_ringbuffer(data, 32);
        if (w == 32) VS1003_sdi_send_chunk(data, 32);
        asm("nop");
        asm("nop");
        asm("nop");
    } while(VS_DREQ_PIN);

    return FEED_RET_OK;
}

/****************************************************************************/

void VS1003_handle(void) {   
	static DWORD		Timer;
    WORD i, w;
    uint8_t data[32];
    unsigned int br;
    FRESULT fres;    

	switch(StreamState)
	{
		case STREAM_HOME:
            //nothing to do here, just wait
            break;
        
        case STREAM_HTTP_BEGIN:
			// Connect a socket to the remote TCP server
			//MySocket = TCPOpen((DWORD)&ServerName[0], TCP_OPEN_RAM_HOST, ServerPort, TCP_PURPOSE_GENERIC_TCP_CLIENT);
            VS_Socket = TCPOpen((DWORD)&uri.server[0], TCP_OPEN_RAM_HOST, uri.port, TCP_PURPOSE_GENERIC_TCP_CLIENT);
			
			// Abort operation if no TCP socket of type TCP_PURPOSE_GENERIC_TCP_CLIENT is available
			// If this ever happens, you need to go add one to TCPIPConfig.h
			if(VS_Socket == INVALID_SOCKET) {
                StreamState=STREAM_HTTP_RECONNECT_WAIT;
                ReconnectStrategy = RECONNECT_WAIT_SHORT;
				break;
            }

			#if defined(STACK_USE_UART)
			putrsUART((ROM char*)"\r\n\r\nConnecting using Microchip TCP API...\r\n");
			#endif

			StreamState=STREAM_HTTP_SOCKET_OBTAINED;
			Timer = TickGet();
			break;

		case STREAM_HTTP_SOCKET_OBTAINED:
			// Wait for the remote server to accept our connection request
			if(!TCPIsConnected(VS_Socket))
			{
				// Time out if too much time is spent in this state
				if((DWORD)(TickGet()-Timer) > 5*TICK_SECOND)
				{
					// Close the socket so it can be used by other modules
					TCPDisconnect(VS_Socket);
					VS_Socket = INVALID_SOCKET;
					StreamState = STREAM_HTTP_BEGIN;     //was StreamState--
                    ReconnectStrategy = DO_NOT_RECONNECT;
                    //TODO limit number of reconnections or repair differently
                    //If we stuck here, it breaks state machine!!!!!
				}
				break;
			}
            StreamState = STREAM_HTTP_SEND_REQUEST;
			Timer = TickGet();
            break;
            
        case STREAM_HTTP_SEND_REQUEST:
			// Make certain the socket can be written to
			if( TCPIsPutReady(VS_Socket) < (49u + strlen(uri.file) + strlen(uri.server)) ) {
                if ( (DWORD)(TickGet()-Timer) > 5*TICK_SECOND ) {
                    StreamState = STREAM_HTTP_CLOSE;
                    ReconnectStrategy = RECONNECT_WAIT_LONG;
                }
				break;
            }
			
			// Place the application protocol data into the transmit buffer.  For this example, we are connected to an HTTP server, so we'll send an HTTP GET request.
			TCPPutROMString(VS_Socket, (ROM BYTE*)"GET ");
			TCPPutString(VS_Socket, uri.file);
			TCPPutROMString(VS_Socket, (ROM BYTE*)" HTTP/1.0\r\nHost: ");
			TCPPutString(VS_Socket, uri.server);
			TCPPutROMString(VS_Socket, (ROM BYTE*)"\r\nConnection: keep-alive\r\n\r\n");

            //printf("Sending headers\r\n");
            
            TCPWasReset(VS_Socket);
			// Send the packet
			TCPFlush(VS_Socket);
            Timer = TickGet();
			StreamState = STREAM_HTTP_PROCESS_HEADER;
            prepare_http_parser();
			break;
            
        case STREAM_HTTP_PROCESS_HEADER:
			if(TCPWasReset(VS_Socket))
			{
				StreamState = STREAM_HTTP_CLOSE;
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                printf("Internet radio: socket disconnected - reseting\r\n");
				break;
			}
            
            w = TCPGetArray(VS_Socket, data, 32);
            if (w) {
                http_res_t http_result = parse_http_headers((char*)data, w, &uri);
                switch (http_result) {
                    case HTTP_HEADER_ERROR:
                        printf("Parsing headers error\r\n");
                        ReconnectStrategy = RECONNECT_WAIT_LONG;
                        StreamState = STREAM_HTTP_CLOSE;
                        break;
                    case HTTP_HEADER_OK:
                        printf("It is 200 OK\r\n");
                        Timer = TickGet();
                        StreamState = STREAM_HTTP_FILL_BUFFER;     //STREAM_HTTP_GET_DATA
                        VS1003_startPlaying();
                        break;
                    case HTTP_HEADER_REDIRECTED:
                        printf("Stream redirected\r\n");
                        ReconnectStrategy = RECONNECT_IMMEDIATELY;
                        StreamState = STREAM_HTTP_CLOSE;
                        break;
                    case HTTP_HEADER_IN_PROGRESS:
                        break;
                    default:
                        break;
                }
            }
            
            if ( (DWORD)(TickGet()-Timer) > 1*TICK_SECOND) {
                //There was no data in 5 seconds - reconnect
                printf("Internet radio: no header timeout - reseting\r\n");
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                StreamState = STREAM_HTTP_CLOSE;
            }            
            break;

        case STREAM_HTTP_FILL_BUFFER:
            while (get_remaining_space_in_ringbuffer() > 128) {
                if (TCPGet(VS_Socket, &data[0])) {
                    Timer = TickGet();
                    write_byte_to_ringbuffer(data[0]);
                }
                else { break; }
            }
            
            if (get_remaining_space_in_ringbuffer() <= 128) {
                printf("Buffer filled\r\n");
                Timer = TickGet();
                StreamState = STREAM_HTTP_GET_DATA;
                break;
            }
    
			if(TCPWasReset(VS_Socket))
			{
				StreamState = STREAM_HTTP_CLOSE;
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                printf("Internet radio: socket disconnected - reseting\r\n");
				// Do not break;  We might still have data in the TCP RX FIFO waiting for us
			}
    
            if ( (DWORD)(TickGet()-Timer) > 5*TICK_SECOND) {
                //There was no data in 5 seconds - reconnect
                printf("Internet radio: no new data timeout - reseting\r\n");
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                StreamState = STREAM_HTTP_CLOSE;
            }            
            break;
            
		case STREAM_HTTP_GET_DATA:
            if (get_remaining_space_in_ringbuffer() > 1024) {
                for (i=0; i<32; i++) {
                    if (TCPGet(VS_Socket, &data[0])) {
                        Timer = TickGet();
                        write_byte_to_ringbuffer(data[0]);
                    }
                    else { break; }
                }
            }
                
            if (VS1003_feed_from_buffer() == FEED_RET_BUFFER_EMPTY) {
                StreamState = STREAM_HTTP_FILL_BUFFER;
                Timer = TickGet();
                break;
            }
			if(TCPWasReset(VS_Socket))
			{
				StreamState = STREAM_HTTP_CLOSE;
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                printf("Internet radio: socket disconnected - reseting\r\n");
				// Do not break;  We might still have data in the TCP RX FIFO waiting for us
			}
            if ( (DWORD)(TickGet()-Timer) > 5*TICK_SECOND) {
                //There was no data in 5 seconds - reconnect
                printf("Internet radio: no new data timeout - reseting\r\n");
                ReconnectStrategy = RECONNECT_WAIT_LONG;
                StreamState = STREAM_HTTP_CLOSE;
            }
			break;
            
         case STREAM_FILE_FILL_BUFFER:
            if (get_remaining_space_in_ringbuffer() > 128) {
                fres = f_read(&fsrc, data, 32, &br);
                if (fres == FR_OK) {
                    if (br) { write_array_to_ringbuffer(data, br); }
                    if (br < 32) {  //enn of file
                        VS1003_handle_end_of_file();
                    }
                }
            }
            else {
                StreamState = STREAM_FILE_GET_DATA;
            }
            break;
            
        case STREAM_FILE_GET_DATA:
            if (get_remaining_space_in_ringbuffer() > 1024) {
                for (i=0; i<64; i++) {
                    fres = f_read(&fsrc, &data[0], 1, &br);
                    if ( fres == FR_OK ) {
                        if (br) { write_byte_to_ringbuffer(data[0]); }
                        else {     //end of file
                            VS1003_handle_end_of_file();
                        }
                    }
                    if (VS_DREQ_PIN) break;
                }
            }
            if (StreamState == STREAM_HOME) {
                //File had been closed in previous step
                //due to reaching end of file with loop
                //and dir flags cleared.
                break;
            }
            if (VS1003_feed_from_buffer() == FEED_RET_BUFFER_EMPTY) {
                //buffer empty
                StreamState = STREAM_FILE_FILL_BUFFER;
            }            
            break;
	
		case STREAM_HTTP_CLOSE:
			// Close the socket so it can be used by other modules
			// For this application, we wish to stay connected, but this state will still get entered if the remote server decides to disconnect
			TCPDisconnect(VS_Socket);
			VS_Socket = INVALID_SOCKET;
            VS1003_stopPlaying();
            switch(ReconnectStrategy) {
                case DO_NOT_RECONNECT:
                    StreamState = STREAM_HOME;
                    break;
                case RECONNECT_IMMEDIATELY:
                    StreamState = STREAM_HTTP_BEGIN;
                    break;
                case RECONNECT_WAIT_LONG:
                case RECONNECT_WAIT_SHORT:
                    StreamState = STREAM_HTTP_RECONNECT_WAIT;
                    break;
                default:
                    StreamState = STREAM_HOME;
                    break;
            }
            Timer = TickGet();
			break;
            
        case STREAM_HTTP_RECONNECT_WAIT:
            if ( (DWORD)(TickGet()-Timer) > ((ReconnectStrategy == RECONNECT_WAIT_LONG) ? (5*TICK_SECOND) : (1*TICK_SECOND)) ) {
                printf("Internet radio: reconnecting\r\n");
                StreamState = STREAM_HTTP_BEGIN;
            }
            break;
	}
}


/****************************************************************************/

void VS1003_begin(void) {
  // Keep the chip in reset until we are ready
  VS_RESET_TRIS = 0;
  VS_RESET_PIN = 0;

  // The SCI and SDI will start deselected
  VS_CS_TRIS = 0;
  VS_CS_PIN = 1;
  VS_DCS_TRIS = 0;
  VS_DCS_PIN = 1;

  // DREQ is an input
  VS_DREQ_TRIS = 1;

  // Boot VS1003
  printf("Booting VS1003...\r\n");

  delay_ms(1);

  // init SPI slow mode
  //SPI1 configuration     
  SPI1CON = (_SPI1CON_ON_MASK  | _SPI1CON_CKE_MASK | _SPI1CON_MSTEN_MASK);    //8 bit master mode, CKE=1, CKP=0
  SPI1BRG = (GetPeripheralClock()-1ul)/2ul/250000;       //250 kHz  

  // release from reset
  VS_RESET_PIN = 1;
  
  // Declick: Immediately switch analog off
  VS1003_write_register(SCI_VOL,0xffff); // VOL

  /* Declick: Slow sample rate for slow analog part startup */
  VS1003_write_register(SCI_AUDATA,10);

  delay_ms(100);

  /* Switch on the analog parts */
  VS1003_write_register(SCI_VOL,0xfefe); // VOL
  
  printf("VS1003 still booting\r\n");

  VS1003_write_register(SCI_AUDATA,44101); // 44.1kHz stereo

  VS1003_write_register(SCI_VOL,0x2020); // VOL
  
  // soft reset
  VS1003_write_register(SCI_MODE, (1 << SM_SDINEW) | (1 << SM_RESET) );
  delay_ms(1);
  await_data_request();
  VS1003_write_register(SCI_CLOCKF,0xF800); // Experimenting with highest clock settings
  delay_ms(1);
  await_data_request();

  // Now you can set high speed SPI clock
  //SPI.setClockDivider(SPI_CLOCK_DIV4); // Fastest available
  //SPI1 configuration     
  SPI1CON = (_SPI1CON_ON_MASK  | _SPI1CON_CKE_MASK | _SPI1CON_MSTEN_MASK);    //8 bit master mode, CKE=1, CKP=0
  SPI1BRG = (GetPeripheralClock()-1ul)/2ul/8000000;       //8MHz

  printf("VS1003 Set\r\n");
  VS1003_printDetails();
  printf("VS1003 OK\r\n");
}

/****************************************************************************/

void VS1003_setVolume(uint8_t vol) {
  uint16_t value = vol;
  value <<= 8;
  value |= vol;

  VS1003_write_register(SCI_VOL,value); // VOL
}

/****************************************************************************/

void VS1003_playChunk(const uint8_t* data, size_t len) {
  VS1003_sdi_send_buffer(data,len);
}

/****************************************************************************/

void VS1003_print_byte_register(uint8_t reg) {
  char extra_tab = strlen(register_names[reg]) < 5 ? '\t' : 0;
  printf("%02x %s\t%c = 0x%02x\r\n", reg, register_names[reg], extra_tab, VS1003_read_register(reg));
}

/****************************************************************************/

void VS1003_printDetails(void) {
  printf("VS1003 Configuration:\r\n");
  int i = 0;
  while ( i <= SCI_num_registers )
    VS1003_print_byte_register(i++);
}

/****************************************************************************/

void VS1003_loadUserCode(const uint16_t* buf, size_t len) {
  while (len) {
    uint16_t addr = *buf++; len--;
    uint16_t n = *buf++; len--;
    if (n & 0x8000U) { /* RLE run, replicate n samples */
      n &= 0x7FFF;
      uint16_t val = *buf++; len--;
      while (n--) {
	    printf("W %02x: %04x\r\n", addr, val);
        VS1003_write_register(addr, val);
      }
    } else {           /* Copy run, copy n samples */
      while (n--) {
	uint16_t val = *buf++; len--;
	printf("W %02x: %04x\r\n", addr, val);
        VS1003_write_register(addr, val);
      }
    }
  }
}

void VS1003_play_next(void) {
    switch (StreamState) {
        case STREAM_FILE_FILL_BUFFER:
        case STREAM_FILE_GET_DATA:
            if (dir_flag) {
                VS1003_play_next_audio_file_from_directory();
            }
            break;
        case STREAM_HTTP_FILL_BUFFER:
        case STREAM_HTTP_GET_DATA:
            VS1003_stop();
            VS1003_play_next_http_stream_from_list();
            break;
        default:
            break;
    }
}


static inline void await_data_request(void) {
    while ( !VS_DREQ_PIN );
}

static inline void control_mode_on(void) {
    VS_DCS_PIN = 1;
    VS_CS_PIN = 0;
}

static inline void control_mode_off(void) {
    VS_CS_PIN = 1;
}

static inline void data_mode_on(void) {
    VS_CS_PIN = 1;
    VS_DCS_PIN = 0;
}

static inline void data_mode_off(void) {
    VS_DCS_PIN = 1;
}
  
static void VS1003_startPlaying(void) {
  VS1003_sdi_send_zeroes(10);
}
  
static void VS1003_stopPlaying(void) {
    VS1003_sdi_send_zeroes(2048);
    ringbuffer_clear();
}
  
static uint8_t VS1003_SPI_transfer(uint8_t outB) {
    SPI1BUF = outB;
    while (SPI1STATbits.SPITBF);
    while (!SPI1STATbits.SPIRBF);
    return SPI1BUF;
}
  

uint8_t is_audio_file (char* name) {
    if (strstr(name, ".MP3") || strstr(name, ".WMA") || strstr(name, ".MID") || strstr(name, ".mp3") || strstr(name, ".wma") || strstr(name, ".mid")) {
        return 1;
    }
    return 0;
 }

/* This is needed for directory playing - it stops playing
 and closes current file, but doesn't close directory and 
 leaves flag unchanged */

static void VS1003_soft_stop (void) {
    //Can be used only if it is actually playing from file
    if (StreamState == STREAM_FILE_GET_DATA) { 
        f_close(&fsrc);
        VS1003_stopPlaying();
        StreamState = STREAM_HOME;        
    }
}
  
  
void VS1003_play_next_audio_file_from_directory (void) {
    FILINFO info;
    char buf[257];
    
    if(!dir_flag) return;       //currently we are not playing directory
    
    while (f_readdir(&vsdir, &info) == FR_OK) {
        if (!info.fname[0]) {           //Empty string - end of directory
            if (loop_flag) {
                f_rewinddir(&vsdir);
            }
            else {
                VS1003_stop();          //It handles closing dir and resetting dir_flag
            }
        }
        else {
            if (is_audio_file(info.fname)) {
                snprintf(buf, sizeof(buf)-1, "%s/%s", uri.server, info.fname);
                VS1003_soft_stop();
                VS1003_play_file(buf);
                return;
            }
        }
    }
    
    return;
}

static void VS1003_handle_end_of_file (void) {
    FRESULT res;
    
    if (dir_flag) {
        VS1003_play_next_audio_file_from_directory();   //it handles loops
    }
    else {
        if (loop_flag) {
            res = f_lseek(&fsrc, 0);
            if (res != FR_OK) printf("f_lseek ERROR\r\n");
        }
        else {
            VS1003_stopPlaying();
            f_close(&fsrc);
            StreamState = STREAM_HOME;
        }
    }    
}

/*Always call VS1003_stop() before calling that function*/
void VS1003_play_http_stream(const char* url) {
    if (StreamState != STREAM_HOME) return;
    
    if (parse_url(url, strlen(url), &uri)) {
        StreamState = STREAM_HTTP_BEGIN;
        ReconnectStrategy = RECONNECT_WAIT_SHORT;
    }
    else {
        StreamState = STREAM_HOME;
        ReconnectStrategy = DO_NOT_RECONNECT;
    }
    VS1003_startPlaying();
}

void VS1003_play_next_http_stream_from_list(void) {
    static int ind = 1;
    
    char* url = get_station_url_from_file(ind, NULL, 0);
    if (url == NULL) {
        //Function returned NULL, there is no stream with such ind
        //Try again from the beginning
        ind = 1;
        url = get_station_url_from_file(ind, NULL, 0);
        if (url == NULL) return;
    }
    else {
        ind++;
    }
    VS1003_stop();
    VS1003_play_http_stream(url);
}

/*Always call VS1003_stop() or VS1003_soft_stop() before calling that function*/
void VS1003_play_file (char* url) {
    if (StreamState != STREAM_HOME) return;
    
    FRESULT res = f_open(&fsrc, url, FA_READ);
    if (res != FR_OK) {
        printf("f_open error code: %i\r\n", res);
        StreamState = STREAM_HOME;
        return;
    }
    
    StreamState = STREAM_FILE_GET_DATA;
    VS1003_startPlaying();         //Start playing song
}


void VS1003_play_dir (const char* url) {
    FRESULT res;
    
    res = f_opendir(&vsdir, url);
    if (res != FR_OK) {
        printf("f_opendir error code: %i\r\n", res);
        return;
    }
    dir_flag = TRUE;
    strncpy(uri.server, url, sizeof(uri.server)-1);		//we use uri.server to store current directory path
    VS1003_play_next_audio_file_from_directory();
}

void VS1003_stop(void) {
    //Can be stopped only if it is actually playing
    switch (StreamState) {
        case STREAM_HTTP_BEGIN:
        case STREAM_HTTP_SOCKET_OBTAINED:
        case STREAM_HTTP_SEND_REQUEST:
        case STREAM_HTTP_PROCESS_HEADER:
        case STREAM_HTTP_FILL_BUFFER:
        case STREAM_HTTP_GET_DATA:
            if(VS_Socket != INVALID_SOCKET) {
                TCPDisconnect(VS_Socket);
                VS_Socket = INVALID_SOCKET;       
            }
            break;
        case STREAM_FILE_GET_DATA:
            f_close(&fsrc);
            if (dir_flag) {
                f_closedir(&vsdir);
                dir_flag = FALSE;
            }
            break;
        default:
            return;
            break;
    }
    VS1003_stopPlaying();
    StreamState = STREAM_HOME;
}

void VS1003_setLoop(BOOL val) {
    loop_flag = val;
}

BOOL VS1003_getLoop(void) {
    return loop_flag;
}