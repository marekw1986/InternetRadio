#ifndef CONFIG_H
#define	CONFIG_H

#include <xc.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <p32xxxx.h>
#include <plib.h>

#include "../common.h"
#include "../net/TCPIP.h"
#include "../nvram/nvram.h"

typedef struct __attribute__((__packed__)) {
    SHORT timeZone;
    BYTE password[34];
    APP_CONFIG AppConfig;
} config_t;

config_t config;

void loadDefaultSettings(void);
void CheckAndLoadDefaults( void );

#endif	/* CONFIG_H */

