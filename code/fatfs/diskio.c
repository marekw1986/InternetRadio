/*-----------------------------------------------------------------------*/
/* Low level disk I/O module skeleton for FatFs     (C)ChaN, 2014        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control modules to the FatFs module with a defined API.       */
/*-----------------------------------------------------------------------*/

#include "diskio.h"		/* FatFs lower layer API */
#include <stdio.h>
#include <stdlib.h>

#include "SPIFlash.h"
#include "sd.h"
#include "../usb/usb.h"
#include "../usb/usb_host_msd.h"
#include "../usb/usb_host_msd_scsi.h"


/* Definitions of physical drive number for each drive */
#define SPI_FLASH		0	/* Example: Map SPI flash memory to physical drive 0 */
#define USB             1	/* Example: Map USB MSD to physical drive 1 */
#define MMC             2	/* Example: Map MMC/SD card to physical drive 2 */

DSTATUS USBStatus = STA_NOINIT;	/* Disk status */
DSTATUS SDStatus = STA_NOINIT;

/*-----------------------------------------------------------------------*/
/* Get Drive Status                                                      */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE pdrv		/* Physical drive nmuber to identify the drive */
)
{
	switch (pdrv) {
        case SPI_FLASH :
            return 0;

        case USB :
            return USBStatus;
            
        case MMC:
            return SDStatus;            
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE pdrv				/* Physical drive nmuber to identify the drive */
)
{
    MEDIA_INFORMATION *USBresult;

	switch (pdrv) {
        case SPI_FLASH :
            SPIFlashInit();
            return 0;

        case USB :
            USBresult = USBHostMSDSCSIMediaInitialize();
            if (USBresult->errorCode != MEDIA_NO_ERROR) USBStatus &= ~STA_NOINIT;
            return USBStatus;
            
        case MMC:
            if (SDStatus & STA_NODISK) return STA_NOINIT; //No card in the socket
            if (sd_init() == 0) SDStatus &= ~STA_NOINIT;
            return SDStatus;            
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber to identify the drive */
	BYTE *buff,		/* Data buffer to store read data */
	DWORD sector,	/* Sector address in LBA */
	UINT count		/* Number of sectors to read */
)
{
	switch (pdrv) {
        case SPI_FLASH :
            {
                BYTE tmpbuff[4096];
                WORD shift;

                while (count) {
                    SPIFlashReadArray((sector/8)*4096, tmpbuff, 4096);
                    shift = (sector%8)*512;
                    memcpy(buff, tmpbuff+shift, 512);
                    buff+=512;
                    sector++;
                    count--;
                }
            }
            return RES_OK;

        case USB :
            if (!count) return RES_PARERR;
            if (USBStatus & STA_NOINIT) return RES_NOTRDY;
            while (count) {
                if(!USBHostMSDSCSISectorRead(sector,buff)) break;
                buff+=512;
                sector++;
                count--;
            }
            return count ? RES_ERROR : RES_OK;
            
        case MMC:
            while (count) {
                if(!sd_readSECTOR(sector,(char*)buff)) break;
                buff+=512;
                sector++;
                count--;
            }
            return count ? RES_ERROR : RES_OK;            
	}

	return RES_PARERR;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber to identify the drive */
	const BYTE *buff,	/* Data to be written */
	DWORD sector,		/* Sector address in LBA */
	UINT count			/* Number of sectors to write */
)
{
	switch (pdrv) {
        case SPI_FLASH :
			{
				BYTE tmpbuff[4096];
				WORD shift;
				// translate the arguments here
				while (count) {
					// We need to read sector first to local buffer
					// Then we need calculater the the 512 bytes part of the buffer that needs to be modified
					// Then We modify that part and write back
					SPIFlashReadArray((sector/8)*4096, tmpbuff, 4096);
					shift = (sector%8)*512;
					memcpy(tmpbuff+shift, buff, 512);                
					SPIFlashEraseSector((sector/8)*4096);
					SPIFlashBeginWrite((sector/8)*4096);
					SPIFlashWriteArray((unsigned char *)tmpbuff, 4096);
					buff+=512;
					sector++;
					count--;
				}
			}
            return RES_OK;

        case USB :
            if (!count) return RES_PARERR;
            if (USBStatus & STA_NOINIT) return RES_NOTRDY;
            while (count) {
                if(!USBHostMSDSCSISectorWrite(sector,(unsigned char*)buff)) break;
                buff+=512;
                sector++;
                count--;
            }   
            return count ? RES_ERROR : RES_OK;
            
        case MMC:
            while(count){
                if(!sd_writeSECTOR(sector,(char*)buff)) break;
                buff+=512;
                sector++;
                count--;
            }
            return count ? RES_ERROR : RES_OK;            
	}

	return RES_PARERR;
}
#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

#if _USE_IOCTL
DRESULT disk_ioctl (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	switch (pdrv) {
        case SPI_FLASH :
            // Process of the command for the SPI drive
            if (cmd == CTRL_SYNC) {

            }
            else if (cmd == GET_SECTOR_COUNT) {
                *(DWORD*)buff = (480*8);
                return RES_OK;
            }
            else if (cmd == GET_SECTOR_SIZE) {
                *(WORD*)buff = 4096;
                return RES_OK;
            }
            else if (cmd == GET_BLOCK_SIZE) {
                *(DWORD*)buff = 1;
                return RES_OK;
            }
            return 0;

        case USB :
            if (cmd == GET_SECTOR_SIZE) {
                *(WORD*)buff = 512;
                return RES_OK;
            }
            if (USBStatus & STA_NOINIT) {return RES_NOTRDY;}
            
        case MMC:
            if (cmd == GET_SECTOR_SIZE) {
                *(WORD*)buff = 512;
                return RES_OK;
            }
            if (SDStatus & STA_NOINIT) {return RES_NOTRDY;}            
	}

	return RES_PARERR;
}

void disk_timerproc (void)
{
	DSTATUS s;
    static uint32_t proctimer = 0;
    
    if ((uint32_t)(millis()-proctimer) > 10) {
        proctimer = millis();
        /* Update status */
        s = USBStatus;
        if (USBHostMSDSCSIMediaDetect()) {s &= ~STA_NOINIT;}
        else {s |= STA_NOINIT;}
        USBStatus = s;

        s = SDStatus;
        if (sd_getCD()) {s &= ~STA_NODISK;}
        else {s |= (STA_NODISK | STA_NOINIT);}
        SDStatus = s;
    }
}
#endif
