#ifndef SD_H
#define	SD_H

#include "../HardwareProfile.h"

#define FAIL    0
// Init ERROR code definitions
#define E_COMMAND_ACK     0x80
#define E_INIT_TIMEOUT    0x81


extern unsigned long sdsread, sd_bytesread;
extern char sd_led;

typedef unsigned long LBA;     // logic block address, 32 bit wide


int sd_init( void);     // initializes the SD/MMC memory device
int sd_getCD();              // chech card presence
int getWP();              // check write protection tab
int sd_readSECTOR ( LBA, char *); // reads a block of data
int sd_writeSECTOR( LBA, const char *); // writes a block of data

#define SD_CS_TRIS TRISFbits.TRISF3
#define SD_CS LATFbits.LATF3
#define SD_CD_TRIS TRISFbits.TRISF2 // card detect
#define SD_CD PORTFbits.RF2
#define SD_SPICON SPI4CON
#define SD_SPICONbits SPI4CONbits
#define SD_SPIBRG SPI4BRG
#define SD_SPIBRGINITVAL (GetPeripheralClock()-1ul)/2ul/250000
#define SD_SPIBRGRUNVAL (GetPeripheralClock()-1ul)/2ul/20000000
#define SD_SPIBUF SPI4BUF
#define SD_BUFNSENT !SPI4STATbits.SPIRBF


#endif /* SD_H */