#include <stdio.h>
#include <ctype.h>
#include <stdio.h>

#include "common.h"

char working_buffer[512];
uint16_t http_code = 0;

static http_res_t finalize_http_parsing(uri_t* uri);
static void analyze_line(char* line, uint16_t len, uri_t* uri);

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

void prepare_http_parser(void) {
    http_code = 0;
    memset(working_buffer, 0x00, sizeof(working_buffer));
}

static http_res_t finalize_http_parsing(uri_t* uri) {
    switch(http_code) {
        case 200:
        return HTTP_HEADER_OK;
        break;
        
        case 301:
        case 302:
        if ( (strlen(uri->server) == 0) || (strlen(uri->file) == 0) || (uri->port == 0) ) {
            return HTTP_HEADER_ERROR;
        }
        return HTTP_HEADER_REDIRECTED;
        break;
        
        default:
        return HTTP_HEADER_ERROR;
        break;
    }
    
    return HTTP_HEADER_ERROR;
}

static void analyze_line(char* line, uint16_t len, uri_t* uri) {
    char* tok;
    tok = strstr(line, ": ");
    if (tok == NULL) { return; }    //Delimiter not found
    tok[0] = '\0';
    tok[1] = '\0';
    tok += 2;
    if (strncmp(line, "Location", strlen(line)) == 0) {
        parse_url(tok, strlen(tok), uri);
    }
}

http_res_t parse_http_headers(char* str, size_t len, uri_t* uri) {
	char* tok;
    char* next_line;
	
	if (str == NULL) { return HTTP_HEADER_ERROR; }
    
    strncat(working_buffer, str, len);
    
    tok = strstr(working_buffer, "\r\n");
    if (!tok) {
        //There is no complete line. Return to continue later.
        return HTTP_HEADER_IN_PROGRESS;
    }
    if (tok > working_buffer+sizeof(working_buffer)-1) { return HTTP_HEADER_ERROR; }
    tok[0] = '\0';
    tok[1] = '\0';
    next_line = tok + 2;
    //printf("Current line: %s\r\n", working_buffer);
    
    if (strlen(working_buffer) == 0) {
        return finalize_http_parsing(uri);
    }
	
	if (http_code == 0) {
        //First line is not parsed
        if ( (strncmp(working_buffer, "HTTP/", 5) == 0) || (strncmp(str, "ICY", 3) == 0) ) {
            tok = strchr(working_buffer, ' ');
            if (tok == NULL) { return HTTP_HEADER_ERROR; }
            tok++;
            http_code = atoi(tok);
            if (http_code == 0) { return HTTP_HEADER_ERROR; }
            //Now we begin parsing parameters, so clean uri
            memset(uri, 0x00, sizeof(uri_t));
        }
    }
    else {
        //First line already parsed, parsing next lines
        analyze_line(working_buffer, sizeof(working_buffer)-1, uri);
    }
    
    strncpy(working_buffer, next_line, sizeof(working_buffer)-1);    
    if (memcmp(working_buffer, "\r\n", 2) == 0) {
        return finalize_http_parsing(uri);
    }
    
    return HTTP_HEADER_IN_PROGRESS;
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