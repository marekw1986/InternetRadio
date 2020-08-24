#include <plib.h>
#include <stdio.h>
#include "delay.h"



/* CP0.Count counts at half the CPU rate */
#define CP0_TICK_HZ (SYSCLK/2)


/* wait at least usec microseconds */
void delay_us(unsigned long usec)
{
unsigned long start, stop;

  /* calculate number of ticks for the given number of microseconds */
 // stop = (usec * 1000000) / CP0_TICK_HZ; // dont use ths line, 1000us is to big for this multiplication
  stop=(CP0_TICK_HZ/1000000)*usec;
   /* get start ticks */
  start = ReadCoreTimer();
 // printf("start=%u stop=%u %u\r\n",start,stop,usec);
 // stop=  (usec *33);

  /* add start value */
  //stop += start;
  // RedadCoreTImer may overflow now, won't hurt delay calculation
  while (ReadCoreTimer() - start < stop);
}

void delay_ms(int ms)
{
while(ms--) delay_us(1000);
}

void DelayMs(SHORT ms)
{
while(ms--) delay_us(1000);
}

int pass_ms(int init,unsigned long msec) //check if selectef time passed
{
static unsigned long start,stop;

if(init)
{
 stop=(CP0_TICK_HZ/1000)*msec;
 start = ReadCoreTimer();
 return 1;
}

if (ReadCoreTimer() - start < stop) return 0;
 else return 1;
} 



void SSleep(int s){
delay_ms(s*1000);
}