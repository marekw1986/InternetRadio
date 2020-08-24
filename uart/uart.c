#include <xc.h>
#include <stdlib.h>
#include <p32xxxx.h>
#include <plib.h>

#include "uart.h"


#define UART_RX_BUF_SIZE 64 // definiujemy bufor o rozmiarze 32 bajtów
// definiujemy mask? dla naszego bufora
#define UART_RX_BUF_MASK ( UART_RX_BUF_SIZE - 1)

#define OpenUART1B(config1, config2, ubrg)   (U1BBRG = (ubrg), U1BMODE = (config1), U1BSTA = (config2))


volatile uint8_t ascii_line;

volatile char UART_RxBuf[UART_RX_BUF_SIZE];
volatile uint8_t UART_RxHead; // indeks oznaczaj?cy ?g?ow? w??a?
volatile uint8_t UART_RxTail; // indeks oznaczaj?cy ?ogon w??a?

// wska?nik do funkcji callback dla zdarzenia UART_RX_STR_EVENT()
static void (*uart_rx_str_event_callback)(char * pBuf);



// funkcja do rejestracji funkcji zwrotnej w zdarzeniu UART_RX_STR_EVENT()
void register_uart_str_rx_event_callback(void (*callback)(char * pBuf)) {
	uart_rx_str_event_callback = callback;
}


// Zdarzenie do odbioru danych ?a?cucha tekstowego z bufora cyklicznego
void UART_RX_STR_EVENT(char * rbuf) {

	if( ascii_line ) {
		if( uart_rx_str_event_callback ) {
			uart_get_str( rbuf );
			(*uart_rx_str_event_callback)( rbuf );
		} else {
			UART_RxHead = UART_RxTail;
		}
	}
}


void uart_init (void) {
    TRISBSET = _TRISD_TRISD14_MASK;
    TRISBCLR = _TRISD_TRISD15_MASK;
    
    INTSetVectorPriority(INT_VECTOR_UART(UART1B), INT_PRIORITY_LEVEL_1);
    INTSetVectorSubPriority(INT_VECTOR_UART(UART1B), INT_SUB_PRIORITY_LEVEL_1);

    INTClearFlag(INT_SOURCE_UART_RX(UART1B));
    INTClearFlag(INT_SOURCE_UART_TX(UART1B));
    INTEnable(INT_SOURCE_UART_RX(UART1B), INT_ENABLED);
    OpenUART1B(UART_EN | UART_NO_PAR_8BIT | UART_1STOPBIT | UART_DIS_BCLK_CTS_RTS, UART_RX_ENABLE | UART_TX_ENABLE, SYSCLK/16/UART1BAUD-1);
}


// definiujemy funkcj? pobieraj?c? jeden bajt z bufora cyklicznego
int uart_getc(void) {
	int data = -1;
    // sprawdzamy czy indeksy s? równe
    if ( UART_RxHead == UART_RxTail ) return data;
    // obliczamy i zapami?tujemy nowy indeks ?ogona w??a? (mo?e si? zrówna? z g?ow?)
    UART_RxTail = (UART_RxTail + 1) & UART_RX_BUF_MASK;
    // zwracamy bajt pobrany z bufora  jako rezultat funkcji
    data = UART_RxBuf[UART_RxTail];
    return data;
}


char * uart_get_str(char * buf) {
	char c;
	char * wsk = buf;
	if( ascii_line ) {
		while( (c = uart_getc()) ) {
			if( 13 == c || c < 0) break;
			*buf++ = c;
		}
		*buf=0;
		ascii_line--;
	}
	return wsk;
}


void _mon_putc (char c)
 {
   while (U1BSTAbits.UTXBF); //Wait till transmission is complete
   U1BTXREG = c;
 }


void __ISR(_UART1_VECTOR, IPL1AUTO) IntUart1Handler (void) {
    
    uint8_t tmp_head;
    char data;
    
    if (INTGetFlag(INT_SOURCE_UART_RX(UART1B))) {
        while(U1BSTAbits.URXDA) {
            data = U1BRXREG;
            tmp_head = ( UART_RxHead + 1) & UART_RX_BUF_MASK;
            if ( tmp_head == UART_RxTail ) {
                UART_RxHead = UART_RxTail;
            } else {
                switch( data ) {
                    case 0:					// ignorujemy bajt = 0
                    case 10: break;			// ignorujemy znak LF
                    case 13: ascii_line++;	// sygnalizujemy obecno?? kolejnej linii w buforze
                    default : UART_RxHead = tmp_head; UART_RxBuf[tmp_head] = data;
                }

            }
        }
        INTClearFlag(INT_SOURCE_UART_RX(UART1B));
    }
    
    if (INTGetFlag(INT_SOURCE_UART_TX(UART1B))) {
        INTClearFlag(INT_SOURCE_UART_TX(UART1B));
    }
}