/**
 * @file      main.c
 *
 * @author    Zéro Cool
 * @date      19/02/2022
 * @brief     Driver PAD DDR USB
 *
 * @details   Code source du programme driver PAD DDR PS2 à base de ATmega164p
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
 */

// sudo cu -s 9600 -l /dev/tty.usbserial-A9IM6MKT
// sudo cu -s 115200 -l /dev/tty.usbserial-A9IM6MKT
// ~.   Terminate the conversation.

// Usage Serial port :
// 230400 8-n-2

//
//         ATmega164p / ATmega324p / ATmega644p
//

// FUSES :

// ----- extented fuse
// Fuse      | Bit No | Description                                       | Default value                          | Desired Value
// ----------|--------|---------------------------------------------------|----------------------------------------|-------------------
//           | 7      |                                                   | 1 (unprogrammed)                       | 1
//           | 6      |                                                   | 1 (unprogrammed)                       | 1
//           | 5      |                                                   | 1 (unprogrammed)                       | 1
//           | 4      |                                                   | 1 (unprogrammed)                       | 1
//           | 3      |                                                   | 1 (unprogrammed)                       | 1
// BODLEVEL2 | 2      | Brown-out Detector trigger level                  | 1 (unprogrammed)                       | 1
// BODLEVEL1 | 1      | Brown-out Detector trigger level                  | 1 (unprogrammed)                       | 1
// BODLEVEL0 | 0      | Brown-out Detector trigger level                  | 1 (unprogrammed)                       | 1
// => efuse = 0xFF (default 0xFF)

// ----- high fuse
// Fuse      | Bit No | Description                                       | Default value                          | Desired Value
// ----------|--------|---------------------------------------------------|----------------------------------------|-------------------
// OCDEN     | 7      | Enable OCD                                        | 1 (unprogrammed, OCD disabled)         | 1
// JTAGEN    | 6      | Enable JTAG                                       | 0 (programmed, JTAG enabled)           | 1
// SPIEN     | 5      | Enable SPI Serial Program and Data Downloading    | 0 (programmed, SPI prog. enabled)      | 0
// WDTON     | 4      | Watchdog Timer always on                          | 1 (unprogrammed)                       | 1
// EESAVE    | 3      | EEPROM memory is preserved through the Chip Erase | 1 (unprogrammed, EEPROM not preserved) | 1
// BOOTSZ1   | 2      | Select Boot Size (see Table 99 for details)       | 0 (programmed)                         | 0
// BOOTSZ0   | 1      | Select Boot Size (see Table 99 for details)       | 0 (programmed)                         | 0
// BOOTRST   | 0      | Select reset vector                               | 1 (unprogrammed)                       | 1
// => hfuse = 0xD9 (default 0x99)

// ----- low fuse
// Fuse       | Bit No | Description                                       | Default value                          | Desired Value
// -----------|--------|---------------------------------------------------|----------------------------------------|-------------------
// CKDIV8     | 7      | Divide clock by 8                                 | 0 (programmed)                         | 1
// CKOUT      | 6      | Clock output                                      | 1 (unprogrammed)                       | 1
// SUT1       | 5      | Select start-up time                              | 1 (unprogrammed)                       | 1 (slowly rising power)
// SUT0       | 4      | Select start-up time                              | 0 (programmed)                         | 1
// CKSEL3     | 3      | Select Clock source                               | 0 (programmed)                         | 0 (Full Swing Crystal Oscillator)
// CKSEL2     | 2      | Select Clock source                               | 0 (programmed)                         | 1
// CKSEL1     | 1      | Select Clock source                               | 1 (unprogrammed)                       | 1
// CKSEL0     | 0      | Select Clock source                               | 0 (programmed)                         | 1
// => lfuse = 0xF7 (default 0x62)

/*
echo -n -e '\xFF' > efuse.bin
echo -n -e '\xD9' > hfuse.bin
echo -n -e '\xF7' > lfuse.bin
*/

// avrdude -C avrdude.conf -p m324p -P usb -c avrispmkII -U efuse:w:efuse.bin:r -U hfuse:w:hfuse.bin:r -U lfuse:w:lfuse.bin:r
// avrdude -C avrdude.conf -p m324p -P usb -c stk600pp   -U efuse:w:efuse.bin:r -U hfuse:w:hfuse.bin:r -U lfuse:w:lfuse.bin:r

// Show USB device on Mac OS :
// ioreg -p IOUSB

// Test gamepad sous Windows :
// joy.cpl

// Note sur les pilotes Windows : https://www.raphnet-tech.com/support/testing/index_fr.php

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/power.h>
#include <avr/wdt.h>
#include <util/delay.h>
#include <stdio.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

// Gestion de l'USART
#include "usart.h"

// HC595
#include "hc595.h"

// PlayStation 2 headers
#include "definitions.h"

// USB Headers
#include "usbdrv.h"
#include "HIDDescriptor.h"
#include "USB.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

/**
 * @brief       Fonction de désactivation du chien de garde
 * @details     Cette fonction permet de désactiver le chien de garde
 */
static void disable_watchdog(void);

/**
 * @brief       Fonction d'initialisation générale du microcontroleur
 * @details     Cette fonction permet l'initialisation des différents éléments
 *              du microcontroller telles que ces entrées / sorties ou la
 *              gestion de l'alimentation
 */
static void global_init(void);

/**
 * @brief       Fonction de mise à jour du prochain report à transmetrte
 * @details     Fonction appelée le plus souvent possible
 */
static void updateHIDReport(HIDReport *report);

/**
 * @brief       Fonction de mise à jour des LEDs actives
 * @details     Cette fonction active la ou les leds correspondant
 *              aux touches appuyées sur le tapis.
 *              La correspondance se fait en fonction d'un tapis pour PS2
 */
static void updateLEDs(void);

/**
 * @brief       Point d'entrée principal du programme
 * @details     Fonction appelée au démarrage du microcontroleur
 */
int main(void);


/******************************************************************************
 * Local variables
 ******************************************************************************/

// Report USB
HIDReport currentReport;


/******************************************************************************
 * Implements
 ******************************************************************************/

static void updateHIDReport(HIDReport *report)
{
	report->buttons = 0
		| (bit_is_clear(PINA, PINA0) ? HID_MASK_BTN_01 : 0)
		| (bit_is_clear(PINA, PINA1) ? HID_MASK_BTN_02 : 0)
		| (bit_is_clear(PINA, PINA2) ? HID_MASK_BTN_03 : 0)
		| (bit_is_clear(PINA, PINA3) ? HID_MASK_BTN_04 : 0)
		| (bit_is_clear(PINA, PINA4) ? HID_MASK_BTN_05 : 0)
		| (bit_is_clear(PINA, PINA5) ? HID_MASK_BTN_06 : 0)
		| (bit_is_clear(PINA, PINA6) ? HID_MASK_BTN_07 : 0)
		| (bit_is_clear(PINA, PINA7) ? HID_MASK_BTN_08 : 0)
		| (bit_is_clear(PINC, PINC0) ? HID_MASK_BTN_09 : 0)
		| (bit_is_clear(PINC, PINC1) ? HID_MASK_BTN_10 : 0)
		| (bit_is_clear(PINC, PINC2) ? HID_MASK_BTN_11 : 0)
		| (bit_is_clear(PINC, PINA3) ? HID_MASK_BTN_12 : 0)
		| (bit_is_clear(PINC, PINA4) ? HID_MASK_BTN_13 : 0)
		| (bit_is_clear(PINC, PINA5) ? HID_MASK_BTN_14 : 0)
		| (bit_is_clear(PINC, PINA6) ? HID_MASK_BTN_15 : 0)
		| (bit_is_clear(PINC, PINA7) ? HID_MASK_BTN_16 : 0)
	;

    // TODO : A garder ? (DEBUG)
    if (report->buttons > 0) {
        PORTD |=  _BV(PORTD7);
    } else {
        PORTD &= ~_BV(PORTD7);
    }
}

static void updateLEDs(void) {
    // Map PS2 pad to led
    uint8_t leds = 0x00
        | (bit_is_clear(PINC, PINC7) ? _BV(7) : 0) // LED-BR (SQUARE B3   - PC 7)
        | (bit_is_clear(PINA, PINA6) ? _BV(6) : 0) // LED-B  (DOWN        - PA 6)
        | (bit_is_clear(PINC, PINC4) ? _BV(5) : 0) // LED-BL (TRIANGLE B4 - PC 4)
        | (bit_is_clear(PINA, PINA5) ? _BV(4) : 0) // LED-R  (RIGHT       - PA 5)
        | (bit_is_clear(PINA, PINA7) ? _BV(3) : 0) // LED-L  (LEFT        - PA 7)
        | (bit_is_clear(PINC, PINC5) ? _BV(2) : 0) // LED-UR (CIRCLE B2   - PC 5)
        | (bit_is_clear(PINA, PINA4) ? _BV(1) : 0) // LED-U  (UP          - PA 4)
        | (bit_is_clear(PINC, PINC6) ? _BV(0) : 0) // LED-UL (CROSS B1    - PC 6)
    ;
    HC595_write(leds);
}

static void disable_watchdog(void) {
    wdt_reset();
    // Clear WDRF in MCUSR
    MCUSR &= ~_BV(WDRF);
    // Write logical one to WDCE and WDE
    // Keep old prescaler setting to prevent unintentional time-out
    WDTCSR |= _BV(WDCE) | _BV(WDE);
    // Turn off WDT
    WDTCSR = 0x00;
}

static void global_init(void) {
    cli();

    // Par défaut, on coupe tout
    power_adc_disable();
    power_spi_disable();
    power_timer0_disable();
    power_timer1_disable();
    power_timer2_disable();
    power_twi_disable();
    power_usart0_disable();
    power_usart1_disable();

    //                             ------U------
    //    D- --------------- PB0 -| 1        40 |- PA0 <------------ S1-SELECT
    //    D+ --------------- PB1 -| 2        39 |- PA1 <------------ L3
    //    3V3 input -------> PB2 -| 3        38 |- PA2 <------------ R3
    //    ACK <------------- PB3 -| 4        37 |- PA3 <------------ S2-START
    //    _SS_ ------------> PB4 -| 5        36 |- PA4 <------------ UP
    //    MOSI ------------> PB5 -| 6        35 |- PA5 <------------ RIGHT
    //    MISO <------------ PB6 -| 7        34 |- PA6 <------------ DOWN
    //    SCK -------------> PB7 -| 8        33 |- PA7 <------------ LEFT
    //                   _RESET_ -| 9        32 |- AREF
    //                       VCC -| 10       31 |- GND
    //                       GND -| 11       30 |- AVCC
    //                     XTAL2 -| 12       29 |- PC7 <------------ B3-SUARE
    //                     XTAL1 -| 13       28 |- PC6 <------------ B1-CROSS
    //    RX --------------> PD0 -| 14       27 |- PC5 <------------ B2-CIRCLE
    //    TX <-------------- PD1 -| 15       26 |- PC4 <------------ B4-TRIANGLE
    //    SHIFT_SER <------- PD2 -| 16       25 |- PC3 <------------ R1
    //    SHIFT_CLK <------- PD3 -| 17       24 |- PC2 <------------ L1
    //    SHIFT_RCK <------- PD4 -| 18       23 |- PC1 <------------ R2
    //                       PD5 -| 19       22 |- PC0 <------------ L2
    //                       PD6 -| 20       21 |- PD7 ------------> LED
    //                             -------------

    // 1 output; 0 input
    DDRA = 0b00000000;  // 
    DDRB = 0b00000000;  // MISO (Hi-Z) + ACK (Hi-Z)
    DDRC = 0b00000000;  // 
    DDRD = 0b10011110;  // LED + TX + SHIFT Register

    // pull-up (set to 1)
    PORTA = 0xFF
           ;
    PORTB = 0x00
           | _BV(PB4)       // SS (pull-up)
           | _BV(PB7)       // SCK (pull-up)
           ;
    PORTC = 0xFF
           ;
    PORTD = 0x00
           ;

    // Set Ack Hi-Z
    SPI_DDR  &= ~_BV(ACK);      // DIR as input
    SPI_PORT &= ~_BV(ACK);      // PORT tri state (Hi-Z)

    // Set DATA (MISO) Hi-Z
    SPI_DDR  &= ~_BV(MISO);      // DIR as input
    SPI_PORT &= ~_BV(MISO);      // PORT tri state (Hi-Z)

    USART_Init();
    
    stdout = &uart_output;
    stdin  = &uart_input;

    sei();
}

void ack(void) {
    _delay_us(4);
    // Set ack low
    SPI_DDR  |=  _BV(ACK);
    _delay_us(2);
    // Set ack Hi-Z
    SPI_DDR  &= ~_BV(ACK);
}

#define MAX_SAMPLES     400
volatile uint8_t sampled_seq[MAX_SAMPLES];
volatile uint8_t sent_seq[MAX_SAMPLES];
volatile uint16_t sample_num=0;

// Premiers signes encourageant !!
// - Le timing est TRES serré
// - L'optimiseur GCC ne permet pas de rester dans le timing
// - Solution crade : NE PAS FAIRE DE BOUCLE
// - A voir un jour : Faire cette partie en assembleur ?? :-/

uint8_t read_byte(uint8_t data) {

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


void try_hard(void) {

    // NOTES :
    // La console interroge la manette toutes les 20ms.
    // MISO et ACK sont en collecteur ouvert (open drain)
    // Durée d'un ack : 2us
    // Délai entre dernier bit lu et un ack : 10us
    // Le dernrier bit n'a jamais de ACK
    // si _SS_ high, alors la communication est terminée

    // TODO : Mettre un timer pour la sécurrité. Si timeout : Fin de la com


    while(1) {

        // Wait for _SS_
        loop_until_bit_is_clear(SPI_PIN, SS);

        // Read SPI value
        char value1 = 0xFF;
        char value2 = 0xFF;
        char value3 = 0xFF;
        char value4 = 0xFF;
        char value5 = 0xFF;

        // NOTES : https://gist.github.com/scanlime/5042071

        value1 = read_byte(0xFF);
        sent_seq[sample_num] = 0xFF;
        sampled_seq[sample_num++] = value1;

        if (value1 == 0x01 && bit_is_clear(SPI_PIN, SS)) {
        
            ack();
            value2 = read_byte(0x41);
            sent_seq[sample_num] = 0x41;
            sampled_seq[sample_num++] = value2;

            if (value2 == 0x42 && bit_is_clear(SPI_PIN, SS)) {
                ack();
                
                value3 = read_byte(0x5A);
                sent_seq[sample_num] = 0x5A;
                sampled_seq[sample_num++] = value3;
                if (bit_is_clear(SPI_PIN, SS)) {
                    ack();
                    
                    value4 = read_byte(PINA);
                    sent_seq[sample_num] = PINA;
                    sampled_seq[sample_num++] = value4;
                    if (bit_is_clear(SPI_PIN, SS)) {
                        ack();
                        
                        value5 = read_byte(PINC);
                        sent_seq[sample_num] = PINC;
                        sampled_seq[sample_num++] = value5;
                    }
                }
            }
        }

        // Set MISO Hi-Z
        SPI_DDR  &= ~_BV(MISO);

        // Wait end of _SS_
        loop_until_bit_is_set(SPI_PIN, SS);

        // We have aproximately 19 ms for doing what we want

        printf("TX  -> ");
        for (uint8_t i = 0; i < sample_num; i++) {
            printf("0x%02X ", sampled_seq[i]);
        }
        if (sample_num < 4) {
            printf("(fail)");
        }
        printf("\n");
        
        printf("  RX > ");
        for (uint8_t i = 0; i < sample_num; i++) {
            printf("0x%02X ", sent_seq[i]);
        }
        printf("\n\n");

        sample_num = 0;
    }
}


int main(void) {

    global_init();

    // TODO : Tester avec un condo 47uF si le lancement est mieux ou pas

    printf("\n");
    printf("-------- Démarrage ------------\n");
    printf("\n");

    if (bit_is_clear(PINB, PINB2)) {
        printf("USB Mode (5V)\n");

        // Cf. https://codeandlife.com/2012/01/29/avr-attiny-usb-tutorial-part-3/
        
        // TODO : Mettre un watchdog

        usbInit();

        usbDeviceDisconnect(); // enforce re-enumeration
        _delay_ms(500);
        usbDeviceConnect();

        while (1) {
            usbPoll();
            updateHIDReport(&currentReport);
            updateLEDs();

            if (usbInterruptIsReady())
            {
                usbSetInterrupt((uchar *)&currentReport, sizeof(currentReport));

                while (!usbInterruptIsReady())
                {
                    usbPoll();
                }
            }
        }
    }

    printf("Playstation 2 Mode (3.3V)\n");

    disable_watchdog();

    try_hard();

    return 0;
}

/******************************************************************************
 * Interruptions
 ******************************************************************************/

