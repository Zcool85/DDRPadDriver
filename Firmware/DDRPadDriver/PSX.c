/**
 * @file      PSX.c
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la communication avec a PlayStation
 *
 * @details   Code source de la gestion de la communication avec la PlayStation
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
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

void PSX_ack() {
    _delay_us(4);
    // Set ack low
    SPI_DDR  |=  _BV(ACK);
    _delay_us(2);
    // Set ack Hi-Z
    SPI_DDR  &= ~_BV(ACK);
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
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(0);
    }

    if (bit_is_set(data, 1)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(1);
    }

    if (bit_is_set(data, 2)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(2);
    }

    if (bit_is_set(data, 3)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(3);
    }

    if (bit_is_set(data, 4)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(4);
    }

    if (bit_is_set(data, 5)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(5);
    }

    if (bit_is_set(data, 6)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(6);
    }

    if (bit_is_set(data, 7)) {
        SPI_DDR  &= ~_BV(MISO);      // DIR as input
    } else {
        SPI_DDR  |=  _BV(MISO);      // Set ACK to low
    }
    do { } while (bit_is_set(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    do { } while (bit_is_clear(SPI_PIN, SCK) && bit_is_clear(SPI_PIN, SS));
    if (bit_is_set(SPI_PIN, SS)) return 0x00;
    if (bit_is_set(SPI_PIN, MOSI)) {
        value |= _BV(7);
    }

    return value;
}


/******************************************************************************
 * Interruptions
 ******************************************************************************/
