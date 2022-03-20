/**
 * @file      PSX.c
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la communication avec a PlayStation
 *
 * @details   Code source de la gestion de la communication avec la PlayStation
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <avr/io.h>
#include <util/delay.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

#include "PSX.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define PSX_ACK_HIGH()      (PSX_DDR  &= ~_BV(PSX_PIN_DSR))     // Hi-Z
#define PSX_ACK_LOW()       (PSX_DDR  |=  _BV(PSX_PIN_DSR))

#define PSX_RXD_HIGH()      (PSX_DDR  &= ~_BV(PSX_PIN_RXD))     // Hi-Z
#define PSX_RXD_LOW()       (PSX_DDR  |=  _BV(PSX_PIN_RXD))


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

/******************************************************************************
 * Local variables
 ******************************************************************************/

/******************************************************************************
 * Implements
 ******************************************************************************/

void PSX_init() {
    PSX_DDR &= ~_BV(PSX_PIN_DSR);       // input
    PSX_DDR &= ~_BV(PSX_PIN_DTR);       // input
    PSX_DDR &= ~_BV(PSX_PIN_TXD);       // input
    PSX_DDR &= ~_BV(PSX_PIN_RXD);       // input
    PSX_DDR &= ~_BV(PSX_PIN_SCK);       // input

    PSX_PORT &= ~_BV(PSX_PIN_DSR);      // Hi-Z
    PSX_PORT |=  _BV(PSX_PIN_DTR);      // pull-up
    PSX_PORT &= ~_BV(PSX_PIN_TXD);      // Hi-Z
    PSX_PORT &= ~_BV(PSX_PIN_RXD);      // Hi-Z
    PSX_PORT |=  _BV(PSX_PIN_SCK);      // pull-up
}

void PSX_ack() {
    _delay_us(4);
    PSX_ACK_LOW();
    _delay_us(2);
    PSX_ACK_HIGH();
}

uint8_t PSX_read_byte(uint8_t data) {
    // NOTE : NE PAS FAIRE DE BOUCLE !
    // - Le timing est TRES serré
    // - L'optimiseur GCC ne permet pas de rester dans le timing si usage d'une boucle
    // - Solution crade : NE PAS FAIRE DE BOUCLE
    // - A voir un jour : Faire cette partie en assembleur ?? :-/

    // Read SPI value
    uint8_t value = 0x00;

    if (bit_is_set(data, 0)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(0);
    }

    if (bit_is_set(data, 1)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(1);
    }

    if (bit_is_set(data, 2)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(2);
    }

    if (bit_is_set(data, 3)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(3);
    }

    if (bit_is_set(data, 4)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(4);
    }

    if (bit_is_set(data, 5)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(5);
    }

    if (bit_is_set(data, 6)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(6);
    }

    if (bit_is_set(data, 7)) {
        PSX_RXD_HIGH();
    } else {
        PSX_RXD_LOW();
    }
    do { } while (bit_is_set(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    do { } while (bit_is_clear(PSX_PIN, PSX_PIN_SCK) && bit_is_clear(PSX_PIN, PSX_PIN_DTR));
    if (bit_is_set(PSX_PIN, PSX_PIN_DTR)) return 0x00;
    if (bit_is_set(PSX_PIN, PSX_PIN_TXD)) {
        value |= _BV(7);
    }

    return value;
}

void PSX_release_line() {
    PSX_RXD_HIGH();
}


/******************************************************************************
 * Interruptions
 ******************************************************************************/
