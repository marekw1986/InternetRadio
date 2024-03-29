/* 
 * File:   vs1003.h
 * Author: Przemyslaw Stasiak
 *
 * Created on 4 maja 2020, 10:33
 */

#ifndef VS1003_H
#define	VS1003_H

#include <stdlib.h>
#include <stdint.h>
#include <xc.h>


#define VS_DREQ_TRIS    TRISCbits.TRISC1
#define VS_DREQ_PIN     PORTCbits.RC1       //It is input!
#define VS_CS_TRIS      TRISEbits.TRISE7
#define VS_CS_PIN		LATEbits.LATE7
#define VS_DCS_TRIS     TRISEbits.TRISE6
#define VS_DCS_PIN      LATEbits.LATE6
#define VS_RESET_TRIS   TRISCbits.TRISC2
#define VS_RESET_PIN	LATCbits.LATC2

#define RXNE    0x01
#define TXE     0x02
#define BSY     0x80

#ifdef	__cplusplus
extern "C" {
#endif


//public functions
void VS1003_begin(void);    
uint16_t VS1003_read_register(uint8_t _reg);
void VS1003_write_register(uint8_t _reg,uint16_t _value);
void VS1003_sdi_send_buffer(const uint8_t* data, int len);
void VS1003_sdi_send_zeroes(int len);
void VS1003_handle (void);
void VS1003_setVolume(uint8_t vol);
void VS1003_playChunk(const uint8_t* data, size_t len);
void VS1003_print_byte_register(uint8_t reg);
void VS1003_printDetails(void);
void VS1003_loadUserCode(const uint16_t* buf, size_t len);
void VS1003_play_next_audio_file_from_directory (void);
void VS1003_play_http_stream(const char* url);
void VS1003_play_next_http_stream_from_list(void);
void VS1003_play_file (char* url);
void VS1003_stop(void);
void VS1003_setLoop(BOOL val);
BOOL VS1003_getLoop(void);


#ifdef	__cplusplus
}
#endif

#endif	/* VS1003_H */
