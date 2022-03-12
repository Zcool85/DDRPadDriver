/**
 * @file      usart.c
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de l'USART
 *
 * @details   Code source de la gestion de l'USART
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
 */

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <avr/power.h>
#include <avr/io.h>
#define BAUD 115200UL
#define BAUD_TOL 2
#include <util/setbaud.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

#include "usart.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

static int uart_putchar(char c, FILE *stream);
static int uart_getchar(FILE *stream);

/******************************************************************************
 * Local variables
 ******************************************************************************/

FILE uart_output = FDEV_SETUP_STREAM(uart_putchar, NULL, _FDEV_SETUP_WRITE);
FILE uart_input = FDEV_SETUP_STREAM(NULL, uart_getchar, _FDEV_SETUP_READ);
FILE uart_io = FDEV_SETUP_STREAM(uart_putchar, uart_getchar, _FDEV_SETUP_RW);


/******************************************************************************
 * Implements
 ******************************************************************************/

static int uart_putchar(char c, FILE *stream) {
    if (c == '\n') {
        uart_putchar('\r', stream);
    }
    loop_until_bit_is_set(UCSR0A, UDRE0);
    UDR0 = c;

    return 0;
}

static int uart_getchar(FILE *stream) {
    loop_until_bit_is_set(UCSR0A, RXC0); /* Wait until data exists. */
    return UDR0;
}

void USART_Init(void) {
    power_usart0_enable();

    UBRR0H = UBRRH_VALUE;
    UBRR0L = UBRRL_VALUE;

    #if USE_2X
    UCSR0A |= (1 << U2X0);
    #else
    UCSR0A &= ~(1 << U2X0);
    #endif

    /* Enable receiver and transmitter */
    UCSR0B = (1<<RXEN0)|(1<<TXEN0);
    /* Set frame format: 8data, 2stop bit */
    UCSR0C = (1<<USBS0)|(1<<UCSZ01)|(1<<UCSZ00);
}

/******************************************************************************
 * Interruptions
 ******************************************************************************/
