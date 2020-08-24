#include "config.h"

config_t config;
APP_CONFIG AppConfig;
static unsigned short wOriginalAppConfigChecksum;    // Checksum of the ROM defaults for AppConfig
int time_zone;

static BYTE SerializedMACAddress[6] = {MY_DEFAULT_MAC_BYTE1, MY_DEFAULT_MAC_BYTE2, MY_DEFAULT_MAC_BYTE3, MY_DEFAULT_MAC_BYTE4, MY_DEFAULT_MAC_BYTE5, MY_DEFAULT_MAC_BYTE6};
//#pragma romdata

void loadDefaultSettings(void) {
    memset((void*)&config, 0x00, sizeof(config));
    config.timeZone = -60;
    memcpypgm2ram((void*)&config.password, (char*)"s3cr3t", 7);
    memcpypgm2ram((void*)&config.AppConfig.MyMACAddr, (ROM void*)SerializedMACAddress, sizeof(AppConfig.MyMACAddr));
    memcpypgm2ram((void*)&config.AppConfig.NetBIOSName, (char*)"board", 6);
    memcpypgm2ram((void*)&config.AppConfig.NtpServer, (char*)"ntp1.tp.pl", 11);
    config.AppConfig.Flags.bIsDHCPEnabled = TRUE;
    config.AppConfig.MyIPAddr.Val = MY_DEFAULT_IP_ADDR_BYTE1 | MY_DEFAULT_IP_ADDR_BYTE2<<8ul | MY_DEFAULT_IP_ADDR_BYTE3<<16ul | MY_DEFAULT_IP_ADDR_BYTE4<<24ul;
    config.AppConfig.DefaultIPAddr.Val = AppConfig.MyIPAddr.Val;
    config.AppConfig.MyMask.Val = MY_DEFAULT_MASK_BYTE1 | MY_DEFAULT_MASK_BYTE2<<8ul | MY_DEFAULT_MASK_BYTE3<<16ul | MY_DEFAULT_MASK_BYTE4<<24ul;
    config.AppConfig.DefaultMask.Val = AppConfig.MyMask.Val;
    config.AppConfig.MyGateway.Val = MY_DEFAULT_GATE_BYTE1 | MY_DEFAULT_GATE_BYTE2<<8ul | MY_DEFAULT_GATE_BYTE3<<16ul | MY_DEFAULT_GATE_BYTE4<<24ul;
    config.AppConfig.PrimaryDNSServer.Val = MY_DEFAULT_PRIMARY_DNS_BYTE1 | MY_DEFAULT_PRIMARY_DNS_BYTE2 <<8ul  | MY_DEFAULT_PRIMARY_DNS_BYTE3<<16ul  | MY_DEFAULT_PRIMARY_DNS_BYTE4<<24ul;
    config.AppConfig.SecondaryDNSServer.Val = MY_DEFAULT_SECONDARY_DNS_BYTE1 | MY_DEFAULT_SECONDARY_DNS_BYTE2<<8ul  | MY_DEFAULT_SECONDARY_DNS_BYTE3<<16ul  | MY_DEFAULT_SECONDARY_DNS_BYTE4<<24ul;
}

void CheckAndLoadDefaults( void ) {
	BYTE i, len = sizeof(config);
	BYTE * ram_wsk = (BYTE*)&config;

	eprom_read((void*)&config, sizeof(config));
	for(i=0; i<len; i++) {
		if( 0xFF == *ram_wsk++ ) continue;
		break;
	}

	if( i == len ) {
		loadDefaultSettings();
        eprom_write((void*)&config, sizeof(config));
	}
    
    memcpy(&AppConfig, &config.AppConfig, sizeof(AppConfig));
    time_zone = config.timeZone;
}