/* 
 * File:   uart.h
 * Author: Marek
 *
 * Created on 7 grudnia 2015, 15:43
 */

#ifndef UART_H
#define	UART_H

#include <stdint.h>

#define UART1BAUD (115200)

#ifdef	__cplusplus
extern "C" {
#endif

extern volatile uint8_t ascii_line;


void uart_init (void);
int uart_getc(void);
char * uart_get_str(char * buf);
void UART_RX_STR_EVENT(char * rbuf);
void register_uart_str_rx_event_callback(void (*callback)(char * pBuf));


#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

