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
#include "vs1003.h"
#include "../net/TCPIP.h"

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

#define VS_BUFFER_SIZE  1024

static uint8_t vsBuffer[2][VS_BUFFER_SIZE];
static uint8_t active_buffer = 0x01;
static uint8_t new_data_needed = 0;

FIL fsrc;
DIR vsdir;

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

static inline void await_data_request(void);
static inline void control_mode_on(void);
static inline void control_mode_off(void);
static inline void data_mode_on(void);
static inline void data_mode_off(void);
static uint8_t VS1003_SPI_transfer(uint8_t outB);
static uint8_t is_audio_file (char* name);
static uint8_t find_next_audio_file (FIL* file, DIR* directory, FILINFO* info);


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

uint8_t VS1003_feed_from_buffer (void) {
    static uint16_t shift = 0;
    
    if (!VS_DREQ_PIN) return 0;
    
    VS1003_sdi_send_chunk(&vsBuffer[active_buffer][shift], 32);
    shift += 32;
    if (shift >= VS_BUFFER_SIZE) {
        shift = 0;
        active_buffer ^= 0x01;
        new_data_needed = 1;
    }
    
    return 0;
}

/****************************************************************************/

void handle_file_reading (void) {
    FRESULT res;
    unsigned int br;
    static uint16_t shift = 0;
    
    if (new_data_needed) {
        //new_data_needed = 0;
        
        res = f_read(&fsrc, &vsBuffer[active_buffer ^ 0x01][shift], 512, &br);
        if (res == FR_OK) {
            printf("%d bytes of data loaded. Buffer %d. Shift %d\r\n", br, (active_buffer ^ 0x01), shift);
            shift += 512;
            if (shift >= VS_BUFFER_SIZE) {
                shift = 0;
                new_data_needed = 0;
            }
            
            if (br < 512) {
                VS1003_stopSong();
                //VS1003_startSong();
                //res = f_lseek(&fsrc, 0);
                //if (res != FR_OK) printf("f_lseek ERROR\r\n");
                //else printf("f_lseek OK\r\n");
                VS1003_play_next_audio_file_from_directory();
            }

        }

    }
}


void handle_internet_radio(void)
{
    static BYTE ServerName[] =	"ic01.cdn.eurozet.pl";
    static WORD ServerPort = 8602;
	ROM BYTE RemoteURL[] = "/ant-waw.mp3";
    BYTE 				i;
	WORD				w;
    WORD                to_load;
    static uint16_t shift = 0;
	static DWORD		Timer;
	static TCP_SOCKET	MySocket = INVALID_SOCKET;
	static enum _GenericTCPExampleState
	{
		SM_HOME = 0,
		SM_SOCKET_OBTAINED,
		SM_PROCESS_RESPONSE,
		SM_DISCONNECT,
		SM_DONE
	} GenericTCPExampleState = SM_DONE;

	switch(GenericTCPExampleState)
	{
		case SM_HOME:
			// Connect a socket to the remote TCP server
			MySocket = TCPOpen((DWORD)&ServerName[0], TCP_OPEN_RAM_HOST, ServerPort, TCP_PURPOSE_GENERIC_TCP_CLIENT);
			
			// Abort operation if no TCP socket of type TCP_PURPOSE_GENERIC_TCP_CLIENT is available
			// If this ever happens, you need to go add one to TCPIPConfig.h
			if(MySocket == INVALID_SOCKET)
				break;

			#if defined(STACK_USE_UART)
			putrsUART((ROM char*)"\r\n\r\nConnecting using Microchip TCP API...\r\n");
			#endif
            //printf("\r\n\r\nConnecting using Microchip TCP API...\r\n");

			GenericTCPExampleState++;
			Timer = TickGet();
			break;

		case SM_SOCKET_OBTAINED:
			// Wait for the remote server to accept our connection request
			if(!TCPIsConnected(MySocket))
			{
				// Time out if too much time is spent in this state
				if(TickGet()-Timer > 5*TICK_SECOND)
				{
					// Close the socket so it can be used by other modules
					TCPDisconnect(MySocket);
					MySocket = INVALID_SOCKET;
					GenericTCPExampleState--;
				}
				break;
			}

			Timer = TickGet();

			// Make certain the socket can be written to
			if(TCPIsPutReady(MySocket) < 125u)
				break;
			
			// Place the application protocol data into the transmit buffer.  For this example, we are connected to an HTTP server, so we'll send an HTTP GET request.
			TCPPutROMString(MySocket, (ROM BYTE*)"GET ");
			TCPPutROMString(MySocket, RemoteURL);
			TCPPutROMString(MySocket, (ROM BYTE*)" HTTP/1.0\r\nHost: ");
			TCPPutString(MySocket, ServerName);
			TCPPutROMString(MySocket, (ROM BYTE*)"\r\nConnection: keep-alive\r\n\r\n");

            //printf("Sending headers\r\n");
            
			// Send the packet
			TCPFlush(MySocket);
			GenericTCPExampleState++;
			break;

		case SM_PROCESS_RESPONSE:
			// Check to see if the remote node has disconnected from us or sent us any application data
			// If application data is available, write it to the UART
			if(!TCPIsConnected(MySocket))
			{
				GenericTCPExampleState = SM_DISCONNECT;
				// Do not break;  We might still have data in the TCP RX FIFO waiting for us
			}
            
            if (new_data_needed) {
			// Get count of RX bytes waiting
                to_load = TCPIsGetReady(MySocket);
                w = TCPGetArray(MySocket, &vsBuffer[active_buffer ^ 0x01][shift], (((VS_BUFFER_SIZE - shift) >= to_load) ? to_load : (VS_BUFFER_SIZE-shift)));
                //printf("Received %d bytes from audo stream, Saved in %d buffer at shift %d\r\n", w, (active_buffer ^ 0x01), shift);
                shift += w;
                if (shift >= VS_BUFFER_SIZE) {
                    shift = 0;
                    new_data_needed = 0;
                }
                //printf("New shift is %d. There is %s need for new data\r\n", shift, new_data_needed ? "still a" : "no");
            }
	
			break;
	
		case SM_DISCONNECT:
			// Close the socket so it can be used by other modules
			// For this application, we wish to stay connected, but this state will still get entered if the remote server decides to disconnect
			TCPDisconnect(MySocket);
			MySocket = INVALID_SOCKET;
			GenericTCPExampleState = SM_DONE;
			break;
	
		case SM_DONE:
			// Do nothing unless the user pushes BUTTON1 and wants to restart the whole connection/download process
			//if(BUTTON1_IO == 0u)
            GenericTCPExampleState = SM_HOME;
			break;
	}
}


void VS1003_handle (void) {
    handle_internet_radio();
    VS1003_feed_from_buffer();
}

/****************************************************************************/

void VS1003_play (char* url) {
    FRESULT res;
    
    f_close(&fsrc);
    
    VS1003_stopSong();          //Stop song that is already playing
    
    res = f_open(&fsrc, url, FA_READ);
    if (res != FR_OK) {
        printf("f_open error code: %i\r\n", res);
        return;
    }
    
    VS1003_startSong();         //Start playing song
}

/****************************************************************************/

void VS1003_play_dir (const char* url) {
    FRESULT res;
    
    res = f_opendir(&vsdir, url);
    if (res != FR_OK) {
        printf("f_opendir error code: %i\r\n", res);
        return;
    }
    VS1003_play_next_audio_file_from_directory();
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
  VS1003_write_register(SCI_CLOCKF,0xB800); // Experimenting with higher clock settings
  delay_ms(1);
  await_data_request();

  // Now you can set high speed SPI clock
  //SPI.setClockDivider(SPI_CLOCK_DIV4); // Fastest available
  //SPI1 configuration     
  SPI1CON = (_SPI1CON_ON_MASK  | _SPI1CON_CKE_MASK | _SPI1CON_MSTEN_MASK);    //8 bit master mode, CKE=1, CKP=0
  SPI1BRG = (GetPeripheralClock()-1ul)/2ul/4000000;       //4MHz

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

void VS1003_startSong(void) {
  VS1003_sdi_send_zeroes(10);
}

/****************************************************************************/

void VS1003_playChunk(const uint8_t* data, size_t len) {
  VS1003_sdi_send_buffer(data,len);
}

/****************************************************************************/

void VS1003_stopSong(void) {
  //VS1003_sdi_send_zeroes(2048);
    memset(vsBuffer, 0x00, sizeof(vsBuffer));
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
  
  static uint8_t VS1003_SPI_transfer(uint8_t outB) {
    SPI1BUF = outB;
    while (SPI1STATbits.SPITBF);
    while (!SPI1STATbits.SPIRBF);
    return SPI1BUF;
}
  

static uint8_t is_audio_file (char* name) {
    if (strstr(name, ".MP3") || strstr(name, ".WMA") || strstr(name, ".MID") || strstr(name, ".mp3") || strstr(name, ".wma") || strstr(name, ".mid")) {
        return 1;
    }
    return 0;
 }
  
  
void VS1003_play_next_audio_file_from_directory (void) {
    FILINFO info;
    char buf[257];
            
    while (f_readdir(&vsdir, &info) == FR_OK) {
        if (!info.fname[0]) {           //Empty string - end of directory
            f_rewinddir(&vsdir);
        }
        else {
            if (is_audio_file(info.fname)) {
                //f_close(file);
                //f_open(file, info.fname, FA_READ);
                snprintf(buf, sizeof(buf)-1, "2:/%s", info.fname);
                VS1003_play(buf);
                return;
            }
        }
    }
    
    return;
}