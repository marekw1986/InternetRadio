#include <stdio.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

FRESULT FormatSpiFlashDisk (void) {
    FRESULT res;
    char buffer[4096];
    res = f_mkfs("0:", FM_ANY, 0, buffer, sizeof(buffer));
    if (res != FR_OK) {printf("f_mmkfs error code: %i\r\n", res);}
    else {printf("f_mkfs OK\r\n");}
    return res;
}


unsigned char BcdToByte(unsigned char bcd) {
    return ((bcd & 0xF0) >> 4) * 10 + (bcd & 0x0F);
}

unsigned char ByteToBcd(unsigned char i) {
    return ((i / 10) << 4) + (i % 10);
}

unsigned char StringToMACAddress(BYTE* str, MAC_ADDR* MACAddress) {
    int values[6];
    unsigned char i;
    for (i=0; i<17; i++) {
        if (i % 3 != 2 && !isxdigit(str[i])) {
            return 0;
        }
        if (i % 3 == 2 && str[i] != ':') {
            return 0;
        }
    }
    if (str[17] != '\0') return 0;
    
    if (sscanf(str, "%x:%x:%x:%x:%x:%x", &values[0], &values[1], &values[2], &values[3], &values[4], &values[5]) == 6) {
        for (i=0; i<6; i++) {
            MACAddress->v[i] = (uint8_t)values[i];
        }
        return 1;
    }
    return 0;
}

long map(long x, long in_min, long in_max, long out_min, long out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

http_res_t parse_http_headers(char* str, size_t len, uri_t* uri) {
	char* tok;
	
	if (str == NULL) { return HTTP_HEADER_ERROR; }
	
	if ( (strncmp(str, "HTTP/", 5) != 0) && (strncmp(str, "ICY", 3) != 0) ) {
		return HTTP_HEADER_ERROR;
	}
	tok = strchr(str, ' ');
	if (tok) {
		char* code = tok+1;
		if (code >= str+len) { return HTTP_HEADER_ERROR; }
		if (strncmp(code, "200 OK", 6) == 0) {
			return HTTP_HEADER_OK;
		}
		else if ( (strncmp(code, "301 Moved Permanently", 21) == 0) || (strncmp(code, "302 Moved Temporarily", 21) == 0) || (strncmp(code, "302 Found", 9) == 0) ) {
			char* location = strstr(code, "Location: ");
			if (location) {
				char* newurl = location+10;
				if (newurl >= str+len) { return HTTP_HEADER_ERROR; }
				tok = strstr(newurl, "\r\n");
				if(!tok || (tok >= str+len)) return HTTP_HEADER_ERROR;
				*tok = '\0';
                if (parse_url(newurl, strlen(newurl), uri)) {
                    return HTTP_HEADER_REDIRECTED;
                }
				return HTTP_HEADER_ERROR;
			}
		}
		else {
			printf("Unsupported code\r\n");
			return HTTP_HEADER_ERROR;
		}
	}
}


uint8_t parse_url (const char* url, size_t len, uri_t* uri) {
	const char* tok;
    const char* serverbegin = url;
	const char* rest;
	const char* port;
	size_t serverlen = 0;
    size_t filelen = 0;
    
	if (uri == NULL) return 0;
	
	tok = strstr(url, "://");
	if (tok) {
		if (tok >= url+len) return 0;
		if (strncasecmp(url, "https", 5) == 0) {    //HTTPS
			uri->https = 1;
			uri->port = 443;
		}
		else if (strncasecmp(url, "http", 4) == 0) {    //plain old HTTP
			uri->https = 0;
			uri->port = 80;
		}
		else {
			//It is different protocol
			return 0;
		}
		rest = tok+3;
        serverbegin = rest;
		if (rest >= url+len) return 0;
	}
	else {
		//printf("No protocol specified - assuming HTTP\r\n");
		uri->https = 0;
		uri->port = 80;
	}
	
	//printf("%s\r\n", url);
	
	tok = strchr(serverbegin, ':');
	if (tok) {
		if (tok >= url+len) return 0;
        serverlen = tok-serverbegin;
		rest = tok+1;
		if (rest >= url+len) return 0;
		//printf("Wykryto dwukropek: %s\r\n", rest);
		tok = strchr(rest, '/');
		if (tok) {
			if (tok >= url+len) return 0;
			//printf("Wykryto znak /, wszystko ok. %s\r\n", tok);
			port = rest;
            size_t portlen = tok-port;
            if (portlen > 5) {
                return 0;
            }
            char tmp[6];
            memcpy((char*)tmp, (const char*)port, portlen);
            tmp[portlen] = '\0';
			uri->port = atoi(tmp);
			if (uri->port == 0) {
				//printf("Nieprawid?owy port %d\r\n", uri->port);
				return 0;
			}
			rest = tok;
		}
		else {
			//printf("Oczekiwano znaku /, cos jest nie tak\r\n");
			return 0;
		}
	}
	else {
		//printf("Nie wykryto dwukropka\r\n");
		tok = strchr(serverbegin, '/');
		if (tok) {
			if (tok >= url+len) { return 0; }
            serverlen = tok-serverbegin;
			rest = tok;
			if (rest >= url+len) { return 0; }
		}
		else {
			//printf("Oczekiwano znaku /, cos jest nie tak\r\n");
			return 0;
		}
	}
    
    if (serverlen > (sizeof(uri->server)-1)) { return 0; }
	memcpy(uri->server, serverbegin, serverlen);
    uri->server[serverlen] = '\0';
	filelen = strlen(rest);
    if (filelen > (sizeof(uri->file)+1)) { return 0; }
	memcpy(uri->file, rest, filelen);
    uri->file[filelen] = '\0';
	return 1;
}