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
