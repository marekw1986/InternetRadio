#include <plib.h>

#include "time.h"


static volatile uint32_t milliseconds = 0;
static volatile uint32_t upt = 0;


void time_init (void) {
    OpenTimer3(T3_ON | T3_PS_1_1 | T3_SOURCE_INT, 80000);
    ConfigIntTimer3(T3_INT_ON | T3_INT_PRIOR_2);
}

uint32_t millis (void) {
    return milliseconds;
}

uint32_t uptime (void) {
    return upt;
}

time_t rtccGetTimestamp (void) {
    struct tm current_time;
    rtccTime time;
    rtccDate date;
    RtccGetTimeDate(&time, &date);
    current_time.tm_hour = BcdToByte(time.hour);
    current_time.tm_min = BcdToByte(time.min);
    current_time.tm_sec = BcdToByte(time.sec);
    current_time.tm_mday = BcdToByte(date.mday);
    current_time.tm_mon = BcdToByte(date.mon);
    current_time.tm_year = BcdToByte(date.year);
    return mktime(&current_time);
}

uint32_t get_fattime (void) {
    time_t rawtime;
    struct tm* current_time;
    
    rawtime = rtccGetTimestamp();
    current_time = localtime(&rawtime);
    return ((DWORD)(current_time->tm_year - 80) << 25)
         | ((DWORD)(current_time->tm_mon + 1) << 21)
         | ((DWORD)current_time->tm_mday << 16)
         | ((DWORD)current_time->tm_hour << 11)
         | ((DWORD)current_time->tm_min << 5)
         | ((DWORD)current_time->tm_sec >> 1);
//    return 0xFFFFFFFF;
}

void __ISR(_TIMER_3_VECTOR, ipl2auto) _Timer3Handler(void) {
    //IFS0CLR = _IFS0_T1IF_MASK;
    mT3ClearIntFlag();
	milliseconds++;
    if (milliseconds%1000 == 0) upt++;
}
