/* 
 * File:   common.h
 * Author: Marek
 *
 * Created on 20 grudnia 2015, 22:10
 */

#ifndef COMMON_H
#define	COMMON_H

#include <stdint.h>
#include "fatfs/ff.h"
#include "net/TCPIP.h"

typedef struct {
	uint16_t year;	/* 2000..2099 */
	uint8_t month;	/* 1..12 */
	uint8_t	mday;	/* 1.. 31 */
	uint8_t	wday;	/* 1..7 */
	uint8_t	hour;	/* 0..23 */
	uint8_t	min;	/* 0..59 */
	uint8_t	sec;	/* 0..59 */
} RTC;

#define URI_SERVER_SIZE 256
#define URI_FILE_SIZE 256

typedef struct {
	char server[URI_SERVER_SIZE+1];
	char file[URI_FILE_SIZE+1];
	uint8_t https;
	uint16_t port;
} uri_t;

typedef enum {HTTP_HEADER_ERROR = 0, HTTP_HEADER_IN_PROGRESS, HTTP_HEADER_OK, HTTP_HEADER_REDIRECTED} http_res_t;


#ifdef	__cplusplus
extern "C" {
#endif

FRESULT FormatSpiFlashDisk (void);
unsigned char BcdToByte(unsigned char bcd);
unsigned char ByteToBcd(unsigned char i);
unsigned char StringToMACAddress(BYTE* str, MAC_ADDR* MACAddress);
long map(long x, long in_min, long in_max, long out_min, long out_max);
void prepare_http_parser(void);
http_res_t parse_http_headers(char* str, size_t len, uri_t* uri);
uint8_t parse_url (const char* str, size_t len, uri_t* uri);

#ifdef	__cplusplus
}
#endif

#endif	/* COMMON_H */

