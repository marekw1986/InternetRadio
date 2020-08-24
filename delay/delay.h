/* 
 * File:   delay.h
 * Author: Marek
 *
 * Created on 5 grudnia 2015, 18:08
 */

#ifndef DELAY_H
#define	DELAY_H

#ifdef	__cplusplus
extern "C" {
#endif

extern void delay_us(unsigned long usec);
extern void delay_ms(int ms);


#ifdef	__cplusplus
}
#endif

#endif	/* DELAY_H */

