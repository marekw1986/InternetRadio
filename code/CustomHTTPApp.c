/*********************************************************************
 *
 *  Application to Demo HTTP2 Server
 *  Support for HTTP2 module in Microchip TCP/IP Stack
 *	 -Implements the application 
 *	 -Reference: RFC 1002
 *
 *********************************************************************
 * FileName:        CustomHTTPApp.c
 * Dependencies:    TCP/IP stack
 * Processor:       PIC18, PIC24F, PIC24H, dsPIC30F, dsPIC33F, PIC32
 * Compiler:        Microchip C32 v1.05 or higher
 *					Microchip C30 v3.12 or higher
 *					Microchip C18 v3.30 or higher
 *					HI-TECH PICC-18 PRO 9.63PL2 or higher
 * Company:         Microchip Technology, Inc.
 *
 * Software License Agreement
 *
 * Copyright (C) 2002-2010 Microchip Technology Inc.  All rights
 * reserved.
 *
 * Microchip licenses to you the right to use, modify, copy, and
 * distribute:
 * (i)  the Software when embedded on a Microchip microcontroller or
 *      digital signal controller product ("Device") which is
 *      integrated into Licensee's product; or
 * (ii) ONLY the Software driver source files ENC28J60.c, ENC28J60.h,
 *		ENCX24J600.c and ENCX24J600.h ported to a non-Microchip device
 *		used in conjunction with a Microchip ethernet controller for
 *		the sole purpose of interfacing with the ethernet controller.
 *
 * You should refer to the license agreement accompanying this
 * Software for additional information regarding your rights and
 * obligations.
 *
 * THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT
 * WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT
 * LIMITATION, ANY WARRANTY OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT SHALL
 * MICROCHIP BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR
 * CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF
 * PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
 * BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE
 * THEREOF), ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER
 * SIMILAR COSTS, WHETHER ASSERTED ON THE BASIS OF CONTRACT, TORT
 * (INCLUDING NEGLIGENCE), BREACH OF WARRANTY, OR OTHERWISE.
 *
 *
 * Author               Date    Comment
 *~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * Elliott Wood     	6/18/07	Original
 ********************************************************************/
#define __CUSTOMHTTPAPP_C

#include <time.h>
#include <string.h>
#include <stdio.h>

#include "TCPIPConfig.h"
#include "fatfs/ff.h"
#include "config/config.h"
#include "nvram/nvram.h"
#include "time/time.h"
#include "common.h"

#if defined(STACK_USE_HTTP2_SERVER)

#include "net/TCPIP.h"

extern HTTP_CONN curHTTP;
extern HTTP_STUB httpStubs[MAX_HTTP_CONNECTIONS];
extern BYTE curHTTPID;

BYTE token[9];
char* parent;

static HTTP_IO_RESULT HTTPGetRestoreCgi (void);
static HTTP_IO_RESULT HTTPGetDirJSON (void);

#if defined (HTTP_USE_POST)
static HTTP_IO_RESULT HTTPPostConfig (void);
static HTTP_IO_RESULT HTTPPostPass (void);
static HTTP_IO_RESULT HTTPPostPlay (void);
#endif

enum {PASSCHANGE_UNKNOWN, PASSCHANGE_INVALID_TOKEN, PASSCHANGE_EMPTY_OLD, PASSCHANGE_WRONG_OLD, PASSCHANGE_INVALID_NEW, PASSCHANGE_OK};
enum {CFGCHANGE_UNKNOWN, CFGCHANGE_INVALID_TOKEN, CFGCHANGE_INVALID_DHCP, CFGCHANGE_INVALID_IP, CFGCHANGE_INVALID_MAC, CFGCHANGE_INVALID_NETMASK, CFGCHANGE_INVALID_GW, CFGCHANGE_INVALID_DNS1, CFGCHANGE_INVALID_DNS2, CFGCHANGE_INVALID_NTP, CFGCHANGE_INVALID_TIMEZONE, CFGCHANGE_OK};
enum {RESTORE_UNKNOWN, RESTORE_INVALID_TOKEN, RESTORE_OK};
enum {PLAY_UNKNOWN, PLAY_OK, PLAY_INVALID_TOKEN, PLAY_EMPTY_URL, PLAY_INVALID_URL, PLAY_INVALID_SRC};
enum {DIR_UNKNOWN, DIR_OK, DIR_INVALID_TOKEN};

/*****************************************************************************
  Function:
	BYTE HTTPNeedsAuth(BYTE* cFile)
	
  Internal:
  	See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/
#if defined(HTTP_USE_AUTHENTICATION)
BYTE HTTPNeedsAuth(BYTE* cFile)
{
    if(memcmppgm2ram(cFile, (ROM void*)"ui/", 3) == 0) return 0x00;
	return 0x80;
}
#endif

/*****************************************************************************
  Function:
	BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
	
  Internal:
  	See documentation in the TCP/IP Stack API or HTTP2.h for details.
  ***************************************************************************/
#if defined(HTTP_USE_AUTHENTICATION)
BYTE HTTPCheckAuth(BYTE* cUser, BYTE* cPass)
{
    if(strcmppgm2ram((char *)cUser,(ROM char *)"admin") == 0
    && strcmp((char *)cPass, config.password) == 0)
    return 0x80;
	
	return 0x00;
}
#endif

/*********************************************************************
 * Function:        HTTP_IO_RESULT HTTPExecuteGet(void)
 *
 * PreCondition:    curHTTP is loaded
 *
 * Input:           None
 *
 * Output:          HTTP_IO_DONE on success
 *					HTTP_IO_WAITING if waiting for asynchronous process
 *
 * Side Effects:    None
 *
 * Overview:        This function is called if data was read from the
 *					HTTP request from either the GET arguments, or
 *					any cookies sent.  curHTTP.data contains
 *					sequential pairs of strings representing the
 *					data received.  Any required authentication has 
 *					already been validated.
 *
 * Note:            Custom implementation for WebVend Application
 ********************************************************************/
HTTP_IO_RESULT HTTPExecuteGet(void)
{
	BYTE name[20];
//    BYTE* ptr;
    
    MPFSGetFilename(curHTTP.file, name, 20);
    if (strcmppgm2ram((char*)name, (ROM char*)"ui/restore.cgi") == 0) {
        return HTTPGetRestoreCgi();
    }
    else if (strcmppgm2ram((char*)name, (ROM char*)"ui/dir.json") == 0) {
        return HTTPGetDirJSON();
    }
	return HTTP_IO_DONE;
}

static HTTP_IO_RESULT HTTPGetRestoreCgi (void) {
    BYTE* ptr;
    ptr = HTTPGetROMArg(curHTTP.data, (ROM BYTE *)"token");
    if ( !ptr || (strcmp((char*)ptr, (char*)token) != 0) ) {
        curHTTP.data[0] = RESTORE_INVALID_TOKEN;
        return HTTP_IO_DONE;
    }
    curHTTP.data[0] = RESTORE_OK;
    return HTTP_IO_DONE;
}

static HTTP_IO_RESULT HTTPGetDirJSON (void) {
    BYTE* ptr;
    
//    ptr = HTTPGetROMArg(curHTTP.data, (ROM BYTE *)"token");
//    if ( !ptr || (strcmp((char*)ptr, (char*)token) != 0) ) {
//        curHTTP.data[0] = DIR_INVALID_TOKEN;
//        return HTTP_IO_DONE;
//    }
    
    ptr = HTTPGetROMArg(curHTTP.data, (ROM BYTE *)"url");
    if (ptr) {
        parent = (char*)ptr;
        curHTTP.data[0] = DIR_OK;
        return HTTP_IO_DONE;
    }
    
    curHTTP.data[0] = DIR_OK;   //TEMP
    return HTTP_IO_DONE;
}

#if defined(HTTP_USE_POST)

/*********************************************************************
 * Function:        HTTP_IO_RESULT HTTPExecutePost(void)
 *
 * PreCondition:    curHTTP is loaded
 *
 * Input:           None
 *
 * Output:          HTTP_IO_DONE on success
 *					HTTP_IO_NEED_DATA if more data is requested
 *					HTTP_IO_WAITING if waiting for asynchronous process
 *
 * Side Effects:    None
 *
 * Overview:        This function is called if the request method was
 *					POST.  It is called after HTTPExecuteGet and 
 *					after any required authentication has been validated.
 *
 * Note:            Custom implementation for WebVend Application
 ********************************************************************/
HTTP_IO_RESULT HTTPExecutePost(void) {
	BYTE name[20];
    
    // Load the file name
    MPFSGetFilename(curHTTP.file, name, sizeof(name));
    // Make sure it's the ui/net.htm page
    if (strcmppgm2ram((char*)name, (ROM char*)"ui/config.cgi") == 0) {
		return HTTPPostConfig();
    }
    else if (strcmppgm2ram((char*)name, (ROM char*)"ui/play.cgi") == 0) {
        return HTTPPostPlay();
    }    
    else if (strcmppgm2ram((char*)name, (ROM char*)"ui/pass.cgi") == 0) {
        return HTTPPostPass();
    }
	return HTTP_IO_DONE;
}

static HTTP_IO_RESULT HTTPPostConfig (void) {
    WORD len;
    config_t newConfig;
    BYTE tokenValid = 0;
    
    curHTTP.data[0] = CFGCHANGE_UNKNOWN;

    // Check to see if the browser is attempting to submit more data than we can parse at once.
	if (curHTTP.byteCount > TCPIsGetReady(sktHTTP) + TCPGetRxFIFOFree(sktHTTP)) return HTTP_IO_DONE;

	// Ensure that all data is waiting to be parsed.  If not, keep waiting for all of it to arrive.
	if (TCPIsGetReady(sktHTTP) < curHTTP.byteCount) return HTTP_IO_NEED_DATA;

    eprom_read((void*)&newConfig, sizeof(newConfig));    
    	
	// Loop while data remains
	while (curHTTP.byteCount) {
		// Check for complete variable
		len = TCPFind(sktHTTP, '&', 0, FALSE);
		if ( (len == 0xFFFF) && (TCPIsGetReady(sktHTTP) == curHTTP.byteCount) ) len = curHTTP.byteCount - 1; //Check if this is the last one

		len = TCPGetArray(sktHTTP, curHTTP.data, len+1);
		curHTTP.byteCount -= len;
		curHTTP.data[len] = '\0';
		HTTPURLDecode(curHTTP.data);
		// Figure out which variable it is
		if (memcmppgm2ram(curHTTP.data, (ROM void*)"token", 5) == 0) {
             if (strcmp(&curHTTP.data[6], token) == 0 ) {
                tokenValid = 1;
            }
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_TOKEN;
                return HTTP_IO_DONE;
            }
        }
        else if (memcmppgm2ram(curHTTP.data, (ROM void*)"dhcp", 4) == 0) {
			if (memcmppgm2ram(&curHTTP.data[5], (ROM void*)"yes", 3) == 0) {
				newConfig.AppConfig.Flags.bIsDHCPEnabled = TRUE;
			}
			else if (memcmppgm2ram(&curHTTP.data[5], (ROM void*)"no", 2) == 0) {
				newConfig.AppConfig.Flags.bIsDHCPEnabled = FALSE;
			}
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_DHCP;
                return HTTP_IO_DONE;
            }
		}            
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"ip", 2) == 0) {
			if (StringToIPAddress(&curHTTP.data[3], &newConfig.AppConfig.MyIPAddr)) {
                newConfig.AppConfig.DefaultIPAddr.Val = newConfig.AppConfig.MyIPAddr.Val;
            }
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_IP;
                return HTTP_IO_DONE;
            }
		}
        else if (memcmppgm2ram(curHTTP.data, (ROM void*)"mac", 3) == 0) {
            if (StringToMACAddress(&curHTTP.data[4], &newConfig.AppConfig.MyMACAddr)) {
                
            }
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_MAC;
                return HTTP_IO_DONE;
            }
        }
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"netmask", 7) == 0) {
			if (StringToIPAddress(&curHTTP.data[8], &newConfig.AppConfig.MyMask)) {
                newConfig.AppConfig.DefaultMask.Val = newConfig.AppConfig.MyMask.Val;
            }
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_NETMASK;
                return HTTP_IO_DONE;
            }
		}
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"gw", 2) == 0) {
			if (!StringToIPAddress(&curHTTP.data[3], &newConfig.AppConfig.MyGateway)) {
                curHTTP.data[0] = CFGCHANGE_INVALID_GW;
                return HTTP_IO_DONE;
            }
		}
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"dns1", 4) == 0) {
			if (!StringToIPAddress(&curHTTP.data[5], &newConfig.AppConfig.PrimaryDNSServer)) {
                curHTTP.data[0] = CFGCHANGE_INVALID_DNS1;
                return HTTP_IO_DONE;
            }
		}
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"dns2", 4) == 0) {
			if (!StringToIPAddress(&curHTTP.data[5], &newConfig.AppConfig.SecondaryDNSServer)) {
                curHTTP.data[0] = CFGCHANGE_INVALID_DNS2;
                return HTTP_IO_DONE;
            }
		}
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"ntp", 3) == 0) {
            if (strlen(&curHTTP.data[4])) {
                strncpy(newConfig.AppConfig.NtpServer, &curHTTP.data[4], sizeof(newConfig.AppConfig.NtpServer));
            }
            else {
                curHTTP.data[0] = CFGCHANGE_INVALID_NTP;
                return HTTP_IO_DONE;
            }
		}
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"timezone", 8) == 0) {
            newConfig.timeZone = atoi(&curHTTP.data[9]) * -60;
            if ( (newConfig.timeZone < -780) || (newConfig.timeZone > 660) ) {
                curHTTP.data[0] = CFGCHANGE_INVALID_TIMEZONE;
                return HTTP_IO_DONE;
            }
		}          
	}   
    
    if (!tokenValid) {
        curHTTP.data[0] = CFGCHANGE_INVALID_TOKEN;
        return HTTP_IO_DONE;
    }
    
	// Tu zapisujemy zmiany
    eprom_write((void*)&newConfig, sizeof(newConfig));
    curHTTP.data[0] = CFGCHANGE_OK;
	return HTTP_IO_DONE;
}

static HTTP_IO_RESULT HTTPPostPass (void) {
    WORD len;
    config_t newConfig;
    BYTE tokenValid = 0;
    BYTE passValid = 0;
    
    curHTTP.data[0] = PASSCHANGE_UNKNOWN;
    
     // Check to see if the browser is attempting to submit more data than we can parse at once.
	if (curHTTP.byteCount > TCPIsGetReady(sktHTTP) + TCPGetRxFIFOFree(sktHTTP)) return HTTP_IO_DONE;

	// Ensure that all data is waiting to be parsed.  If not, keep waiting for all of it to arrive.
	if (TCPIsGetReady(sktHTTP) < curHTTP.byteCount) return HTTP_IO_NEED_DATA;
    
    eprom_read((void*)&newConfig, sizeof(newConfig));
    
	// Loop while data remains
	while (curHTTP.byteCount) {
		// Check for complete variable
		len = TCPFind(sktHTTP, '&', 0, FALSE);
        if ( (len == 0xFFFF) && (TCPIsGetReady(sktHTTP) == curHTTP.byteCount) ) len = curHTTP.byteCount - 1; //Check if this is the last one

		len = TCPGetArray(sktHTTP, curHTTP.data, len+1);
		curHTTP.byteCount -= len;
		curHTTP.data[len] = '\0';
		HTTPURLDecode(curHTTP.data);
		// Figure out which variable it is
		if (memcmppgm2ram(curHTTP.data, (ROM void*)"token", 5) == 0) {
            if (strcmp(&curHTTP.data[6], token) == 0 ) {
                tokenValid = 1;
            }
            else {
                curHTTP.data[0] = PASSCHANGE_INVALID_TOKEN;                
                return HTTP_IO_DONE;                
            }
		}          
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"oldpass", 7) == 0) {
			if (strlen(&curHTTP.data[8]) == 0) {
                curHTTP.data[0] = PASSCHANGE_EMPTY_OLD;                
                return HTTP_IO_DONE;
            }
            if (strcmp(&curHTTP.data[8], config.password) == 0 ) {
                passValid = 1;
            }
            else {
                curHTTP.data[0] = PASSCHANGE_WRONG_OLD;                
                return HTTP_IO_DONE;                
            }
		}            
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"newpass", 7) == 0) {
			if (strlen(&curHTTP.data[8]) == 0) {
                curHTTP.data[0] = PASSCHANGE_INVALID_NEW; 
                return HTTP_IO_DONE;
            }
            strncpy(newConfig.password, &curHTTP.data[8], sizeof(newConfig.password));
		}        
	}
    
    if (!tokenValid || !passValid) return HTTP_IO_DONE;
    
	// Saving new configuration to flash
    eprom_write((void*)&newConfig, sizeof(newConfig));
    curHTTP.data[0] = PASSCHANGE_OK; 
	return HTTP_IO_DONE;
}

static HTTP_IO_RESULT HTTPPostPlay (void) {
    enum {PLAY_SRC_STREAM, PLAY_SRC_FILE, PLAY_SRC_DIR};
    
    WORD len;
    BYTE tokenValid = 0;
    BYTE playsrc = PLAY_SRC_STREAM; //stream is default
    
    char newurl[256];
    
    curHTTP.data[0] = PLAY_UNKNOWN;
    
     // Check to see if the browser is attempting to submit more data than we can parse at once.
	if (curHTTP.byteCount > TCPIsGetReady(sktHTTP) + TCPGetRxFIFOFree(sktHTTP)) return HTTP_IO_DONE;

	// Ensure that all data is waiting to be parsed.  If not, keep waiting for all of it to arrive.
	if (TCPIsGetReady(sktHTTP) < curHTTP.byteCount) return HTTP_IO_NEED_DATA;
    
	// Loop while data remains
	while (curHTTP.byteCount) {
		// Check for complete variable
		len = TCPFind(sktHTTP, '&', 0, FALSE);
        if ( (len == 0xFFFF) && (TCPIsGetReady(sktHTTP) == curHTTP.byteCount) ) len = curHTTP.byteCount - 1; //Check if this is the last one

		len = TCPGetArray(sktHTTP, curHTTP.data, len+1);
		curHTTP.byteCount -= len;
		curHTTP.data[len] = '\0';
		HTTPURLDecode(curHTTP.data);
		// Figure out which variable it is
		if (memcmppgm2ram(curHTTP.data, (ROM void*)"token", 5) == 0) {
            if (strcmp((const char*)&curHTTP.data[6], (const char*)token) == 0 ) {
                tokenValid = 1;
            }
            else {
                curHTTP.data[0] = PLAY_INVALID_TOKEN;                
                return HTTP_IO_DONE;                
            }
		}          
		else if (memcmppgm2ram(curHTTP.data, (ROM void*)"url", 3) == 0) {
            printf("play.cgi received URL: %s\r\n", &curHTTP.data[4]);
			if (strlen((const char*)&curHTTP.data[4]) == 0) {
                curHTTP.data[0] = PLAY_EMPTY_URL;                
                return HTTP_IO_DONE;
            }
            else {
                strncpy(newurl, (const char*)&curHTTP.data[4], sizeof(newurl));
                printf("New URL: %s\r\n", newurl);
                curHTTP.data[0] = PLAY_OK;
            }
		}
        else if (memcmppgm2ram(curHTTP.data, (ROM void*)"src", 3) == 0) {
            if (memcmppgm2ram(&curHTTP.data[4], (ROM void*)"stream", 6) == 0) { playsrc = PLAY_SRC_STREAM; }
            else if (memcmppgm2ram(&curHTTP.data[4], (ROM void*)"file", 4) == 0) { playsrc = PLAY_SRC_FILE; }
            else if (memcmppgm2ram(&curHTTP.data[4], (ROM void*)"dir", 4) == 0) { playsrc = PLAY_SRC_DIR; }
            else {
                curHTTP.data[0] = PLAY_INVALID_SRC;
                return HTTP_IO_DONE;
            }
        }
	}
    
    //if (!tokenValid) return HTTP_IO_DONE;
    
    VS1003_stop();
    switch (playsrc) {
        case PLAY_SRC_FILE:
            printf("Calling VS1003_play_file()\r\n");
            VS1003_play_file(newurl);              
            break;
        case PLAY_SRC_DIR:
            printf("Calling VS1003_play_dir()\r\n");
            VS1003_play_dir(newurl);            
            break;
        default:
            printf("Calling VS1003_play_http_stream()\r\n");
            VS1003_play_http_stream(newurl);
            break;
    }
    
	return HTTP_IO_DONE;
}

#endif //(use_post)

/*********************************************************************
 * Function:        void HTTPPrint_varname(TCP_SOCKET sktHTTP, 
 *							DWORD callbackPos, BYTE *data)
 *
 * PreCondition:    None
 *
 * Input:           sktHTTP: the TCP socket to which to write
 *					callbackPos: 0 initially
 *						return value of last call for subsequent callbacks
 *					data: this connection's data buffer
 *
 * Output:          0 if output is complete
 *					application-defined otherwise
 *
 * Side Effects:    None
 *
 * Overview:        Outputs a variable to the HTTP client.
 *
 * Note:            Return zero to indicate that this callback function 
 *					has finished writing data to the TCP socket.  A 
 *					non-zero return value indicates that more data 
 *					remains to be written, and this callback should 
 *					be called again when more space is available in 
 *					the TCP TX FIFO.  This non-zero return value will 
 *					be the value of the parameter callbackPos for the 
 *					next call.
 ********************************************************************/


void HTTPPrint_dhcpyes(void) {
    if (DHCPIsEnabled(0)) {
        TCPPutROMString(sktHTTP, (ROM void*)" checked");
    }
    return;
}

void HTTPPrint_dhcpno(void) {
    if (!DHCPIsEnabled(0)) {
        TCPPutROMString(sktHTTP, (ROM void*)" checked");
    }    
    return;
}

void HTTPPrint_ipdisp(void) {
    if (DHCPIsEnabled(0)) {
        TCPPutROMString(sktHTTP, (ROM void*)"none");
    }
    else {
        TCPPutROMString(sktHTTP, (ROM void*)"block");
    }
    return;
}

void HTTPPrint_ip(void) {
    int i;
    char buf[4];
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, AppConfig.MyIPAddr.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }
    return;
}

void HTTPPrint_mac(void) {
    int i;
    char buf[4];
    
    for (i=0; i<6; i++) {
        snprintf(buf, 3, "%02X", AppConfig.MyMACAddr.v[i]);
        TCPPutString(sktHTTP, buf);
        if (i<5) TCPPutROMString(sktHTTP, (ROM void*)":");
    }
}

void HTTPPrint_netmask(void) {
    int i;
    char buf[4];
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, AppConfig.MyMask.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }    
    return;
}

void HTTPPrint_gw(void) {
    int i;
    char buf[4];
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, AppConfig.MyGateway.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }    
    return;
}

void HTTPPrint_dns1(void) {
    int i;
    char buf[4];
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, AppConfig.PrimaryDNSServer.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }    
    return;
}

void HTTPPrint_dns2(void) {
    int i;
    char buf[4];
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, AppConfig.SecondaryDNSServer.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }    
    return;
}

void HTTPPrint_ntp(void) {
    TCPPutString(sktHTTP, AppConfig.NtpServer);
    return;
}

void HTTPPrint_newip(void) {
    config_t newConfig;
    int i;
    char buf[4];
    
    eprom_read((void*)&newConfig, sizeof(newConfig));
    
    for (i=0; i<4; i++) {
        TCPPutString(sktHTTP, itoa(buf, newConfig.AppConfig.MyIPAddr.v[i], 10));
        if (i < 3) TCPPutROMString(sktHTTP, (ROM void*)".");
    }
    return;
}

void HTTPPrint_reset(void) {
    Reset();
}

void HTTPPrint_restore(void) {
    switch(curHTTP.data[0]) {
        case RESTORE_INVALID_TOKEN:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid token");
        break;
        
        case RESTORE_OK:
        loadDefaultSettings();
        eprom_write((void*)&config, sizeof(config));
        FormatSpiFlashDisk();
        TCPPutROMString(sktHTTP, (ROM void*)"ok");    
        break;
        
        default:
        TCPPutROMString(sktHTTP, (ROM void*)"unknown_error");
        break;        
    }
}

void HTTPPrint_passChangeStatus (void) {
    switch (curHTTP.data[0]) {
        case PASSCHANGE_INVALID_TOKEN:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_token");
        break;
                    
        case PASSCHANGE_EMPTY_OLD:
        TCPPutROMString(sktHTTP, (ROM void*)"empty_old");
        break;
        
        case PASSCHANGE_WRONG_OLD:
        TCPPutROMString(sktHTTP, (ROM void*)"wrong_old");  
        break;
        
        case PASSCHANGE_INVALID_NEW:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_new");
        break;
        
        case PASSCHANGE_OK:
        TCPPutROMString(sktHTTP, (ROM void*)"ok");
        break;
        
        default:
        TCPPutROMString(sktHTTP, (ROM void*)"unknown_error");
        break;
    }
}

void HTTPPrint_configChangeStatus (void) {
    switch (curHTTP.data[0]) {
        case CFGCHANGE_INVALID_TOKEN:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_token");
        break;
                    
        case CFGCHANGE_INVALID_DHCP:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_dhcp");
        break;
        
        case CFGCHANGE_INVALID_IP:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_ip");  
        break;
        
        case CFGCHANGE_INVALID_MAC:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_mac");  
        break;           
        
        case CFGCHANGE_INVALID_NETMASK:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_netmask");
        break;
        
        case CFGCHANGE_INVALID_GW:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_gw");
        break;
        
        case CFGCHANGE_INVALID_DNS1:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_dns1");
        break;
        
        case CFGCHANGE_INVALID_DNS2:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_dns2");
        break;
        
        case CFGCHANGE_INVALID_NTP:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_ntp");
        break;
        
        case CFGCHANGE_INVALID_TIMEZONE:
        TCPPutROMString(sktHTTP, (ROM void*)"invalid_timezone");
        break;
        
        case CFGCHANGE_OK:
        TCPPutROMString(sktHTTP, (ROM void*)"ok");
        break;
        
        default:
        TCPPutROMString(sktHTTP, (ROM void*)"unknown_error");
        break;
    }
}

void HTTPPrint_playStatus (void) {
    switch (curHTTP.data[0]) {
        case PLAY_OK:
            TCPPutROMString(sktHTTP, (ROM void*)"ok");
            break;
        case PLAY_INVALID_TOKEN:
            TCPPutROMString(sktHTTP, (ROM void*)"invalid_token");
            break;       
        case PLAY_EMPTY_URL:
            TCPPutROMString(sktHTTP, (ROM void*)"empty_url");
            break;            
        default:
            TCPPutROMString(sktHTTP, (ROM void*)"unknown_error");
            break;
    }
}

void HTTPPrint_parent (void) {
    TCPPutString(sktHTTP, (BYTE*)parent);  
}

void HTTPPrint_dirs (void) {
    static DIR dir;
    static uint8_t first_one = 1;
    FRESULT res;
    FILINFO info;
    
    if (curHTTP.callbackPos == 0) {
        res = f_opendir(&dir, parent);
        if (res != FR_OK) {
            return;
        }
        first_one = 1;
        curHTTP.callbackPos = 0x01;
    }
    
    if (f_readdir(&dir, &info) != FR_OK) {
        f_closedir(&dir);
        curHTTP.callbackPos = 0x00;
        return;
    }
    
    if (info.fname[0]) {
        if (info.fattrib & AM_DIR) {
            if (!first_one) { TCPPutROMString(sktHTTP, (ROM void*)", "); }
            else { first_one = 0; }
            TCPPutROMString(sktHTTP, (ROM void*)"\"");
            TCPPutString(sktHTTP, (BYTE*)info.fname);
            TCPPutROMString(sktHTTP, (ROM void*)"\"");
        }
    }
    else {  //Empty string - end of dir
        f_closedir(&dir);
        curHTTP.callbackPos = 0x00;
        return;
    }     
}

void HTTPPrint_files (void) {
    static DIR dir;
    static uint8_t first_one = 1;
    FRESULT res;
    FILINFO info;
    
    if (curHTTP.callbackPos == 0) {
        res = f_opendir(&dir, parent);
        if (res != FR_OK) {
            return;
        }
        first_one = 1;
        curHTTP.callbackPos = 0x01;
    }
    
    if (f_readdir(&dir, &info) != FR_OK) {
        f_closedir(&dir);
        curHTTP.callbackPos = 0x00;
        return;
    }    
    
    if (info.fname[0]) {
        if (is_audio_file((char*)info.fname)) {
            if (!first_one) { TCPPutROMString(sktHTTP, (ROM void*)", "); }
            else { first_one = 0; }
            TCPPutROMString(sktHTTP, (ROM void*)"\"");
            TCPPutString(sktHTTP, (BYTE*)info.fname);
            TCPPutROMString(sktHTTP, (ROM void*)"\"");
        }
    }
    else {
        f_closedir(&dir);
        curHTTP.callbackPos = 0x00;
        return;
    }
}

void HTTPPrint_configToken (void) {
    BYTE i;
    for (i=0; i<8; i++) token[i] = 'a'+(rand() % 26);
    token[8] = '\0';
    TCPPutString(sktHTTP, token);
}

void HTTPPrint_uptime (void) {
    WORD days, hours, minutes;
    DWORD seconds;
    BYTE buff[32];
    
    seconds = uptime();
    
    days = seconds / 86400;
    seconds -= days * 86400;
    hours = seconds / 3600;
    seconds -= hours * 3600;
    minutes = seconds / 60;
    seconds -= minutes * 60;
 
    if (days) {
        sprintf(buff, "%d dni, ", days);
        TCPPutString(sktHTTP, buff);
    }
    sprintf(buff, "%02d:%02d:%02d", hours, minutes, seconds);
    TCPPutString(sktHTTP, buff);
}

void HTTPPrint_time (void) {
    BYTE buff[64];
    time_t timestamp; 
    
    timestamp = rtccGetTimestamp();
    strncpy(buff, ctime(&timestamp), sizeof(buff)-1);
    TCPPutString(sktHTTP, buff);
}


void HTTPPrint_timezone (void) {
    BYTE buff[16];
    
    sprintf(buff, "%d", time_zone/-60);
    TCPPutString(sktHTTP, buff);
    
}

void HTTPPrint_cpufreq (void) {
    BYTE buff[16];
    time_t timestamp;
    
    sprintf(buff, "%d MHz", SYSCLK/1000000);
    TCPPutString(sktHTTP, buff);
}

void HTTPPrint_lstfls (void) {
    BYTE buff[512];
    FRESULT fr;     /* Return value */
    DIR dj;         /* Directory search object */
    FILINFO fno;    /* File information */
    
    fr = f_findfirst(&dj, &fno, "0:/", "*.txt");
    
    while (fr == FR_OK && fno.fname[0]) {         /* Repeat while an item is found */
        sprintf(buff, "%s (%lu bajtow)<br>\n", fno.fname, fno.fsize);                /* Display the object name */
        TCPPutString(sktHTTP, buff);
        fr = f_findnext(&dj, &fno);               /* Search for next item */
    }

    f_closedir(&dj);
}

#endif
