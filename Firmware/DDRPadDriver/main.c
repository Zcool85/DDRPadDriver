/**
 * @file      main.c
 *
 * @author    Zéro Cool
 * @date      19/02/2022
 * @brief     Driver PAD DDR USB
 *
 * @details   Code source du programme driver PAD DDR PS2 à base de ATmega164p
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

//
//         ATmega164p / ATmega324p / ATmega644p
//

//                             ------U------
//    D- --------------- PB0 -| 1        40 |- PA0 <------------ S1-SELECT
//    D+ --------------- PB1 -| 2        39 |- PA1 <------------ L3
//    3V3 input -------> PB2 -| 3        38 |- PA2 <------------ R3
//    PSX_DSR <--Hi-Z--- PB3 -| 4        37 |- PA3 <------------ S2-START
//    PSX_DTR ---------> PB4 -| 5        36 |- PA4 <------------ UP
//    PSX_TXD ---------> PB5 -| 6        35 |- PA5 <------------ RIGHT
//    PSX_RXD <--Hi-Z--- PB6 -| 7        34 |- PA6 <------------ DOWN
//    PSX_SCK ---------> PB7 -| 8        33 |- PA7 <------------ LEFT
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
//    LED PSX <--------- PD5 -| 19       22 |- PC0 <------------ L2
//    LED USB <--------- PD6 -| 20       21 |- PD7 ------------> LED PAD
//                             -------------

// FUSES :
// -------

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

// PlayStation headers
#include "PSX.h"

// USB Headers
#include "usbdrv.h"
#include "HIDDescriptor.h"
#include "USB.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define LED_PSX_ON()        (PORTD |=  _BV(PORTD5))
#define LED_PSX_OFF()       (PORTD &= ~_BV(PORTD5))
#define LED_USB_ON()        (PORTD |=  _BV(PORTD6))
#define LED_USB_OFF()       (PORTD &= ~_BV(PORTD6))
#define LED_PAD_ON()        (PORTD |=  _BV(PORTD7))
#define LED_PAD_OFF()       (PORTD &= ~_BV(PORTD7))


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
static void init(void);

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
 * @brief       Boucle de gestion du mode USB
 * @details     Cette fonction permet de gérer le PAD en mode USB
 */
static void usb_mode(void);

/**
 * @brief       Boucle de gestion du mode Playstation
 * @details     Cette fonction permet de gérer le PAD en mode Playstation
 */
static void playstation_mode(void);

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

    if ((uint8_t)~PINA || (uint8_t)~PINC) {
        LED_PAD_ON();
    } else {
        LED_PAD_OFF();
    }
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

static void init(void) {
    cli();

    disable_watchdog();

    // Par défaut, on coupe tout
    power_adc_disable();
    power_spi_disable();
    power_timer0_disable();
    power_timer1_disable();
    power_timer2_disable();
    power_twi_disable();
    power_usart0_disable();
    power_usart1_disable();

    // 1 output; 0 input
    DDRA = 0b00000000;
    DDRB = 0b00000000;
    DDRC = 0b00000000;
    DDRD = 0b11100000;  // LEDs output

    // pull-up for pads (set to 1)
    PORTA = 0b11111111;
    PORTB = 0b00000000;
    PORTC = 0b11111111;
    PORTD = 0b00000000;

    USART_Init();

    stdout = &uart_output;
    stdin  = &uart_input;

    HC595_init();

    sei();
}

// For DEBUG purposes
#define MAX_SAMPLES     400
volatile uint8_t sampled_seq[MAX_SAMPLES];
volatile uint8_t sent_seq[MAX_SAMPLES];
volatile uint16_t sample_num=0;

static void playstation_mode() {
    printf("Playstation Mode (3.3V)\n");

    LED_PSX_ON();
    LED_USB_OFF();

    PSX_init();

    // NOTES :
    // La console interroge la manette toutes les 20ms.
    // PSX_PIN_RXD (MISO) et PSX_PIN_DSR (ACK) sont en collecteur ouvert (open drain)
    // Durée d'un ack : 2us
    // Délai entre dernier bit lu et un ack : 10us
    // Le dernrier bit n'a jamais de ACK
    // si _PSX_PIN_DTR_ high, alors la communication est terminée

    // TODO : Mettre un timer pour la sécurrité. Si timeout : Fin de la com
    // TODO : Mettre un watchdog

    while(1) {

        // Wait for _PSX_PIN_DTR_
        loop_until_bit_is_clear(PSX_PIN, PSX_PIN_DTR);

        // NOTES :
        // - Inspiration : https://gist.github.com/scanlime/5042071
        // - Pour DDR, nous n'avons pas besoin de coder tout le protocol
        //   d'un dualshock 2.
        // - Jeux testés :
        //     + DDR Supernova (JAP)
        //     + DDR Supernova 2 (US)
        //     + DDR MAX 2 7ème mix (JAP)
        //     + DDR MAX 6ème mix (JAP)
        //     + DDR MAX (US)
        //     + DDR MAX 2 (US)
        //     + DDR Extreme 2 (US)
        //     + DDR X (FR)

        uint8_t value = PSX_read_byte(0xFF);
        sent_seq[sample_num] = 0xFF;
        sampled_seq[sample_num++] = value;

        if (value == 0x01 && bit_is_clear(PSX_PIN, PSX_PIN_DTR)) {
        
            PSX_ack();
            value = PSX_read_byte(0x41);
            sent_seq[sample_num] = 0x41;
            sampled_seq[sample_num++] = value;

            if (value == 0x42 && bit_is_clear(PSX_PIN, PSX_PIN_DTR)) {
                PSX_ack();
                
                value = PSX_read_byte(0x5A);
                sent_seq[sample_num] = 0x5A;
                sampled_seq[sample_num++] = value;
                if (bit_is_clear(PSX_PIN, PSX_PIN_DTR)) {
                    PSX_ack();
                    
                    value = PSX_read_byte(PINA);
                    sent_seq[sample_num] = PINA;
                    sampled_seq[sample_num++] = value;
                    if (bit_is_clear(PSX_PIN, PSX_PIN_DTR)) {
                        PSX_ack();
                        
                        value = PSX_read_byte(PINC);
                        sent_seq[sample_num] = PINC;
                        sampled_seq[sample_num++] = value;
                    }
                }
            }
        }

        PSX_release_line();

        // Wait end of _SS_
        loop_until_bit_is_set(PSX_PIN, PSX_PIN_DTR);

        //
        // On a approximativement 19ms pour faire ce que l'on veut ici
        //

        // On met à jour les LED
        updateLEDs();

        // DEBUG : A voir si l'on garde ce bout de code...
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

static void usb_mode() {
    printf("USB Mode (5V)\n");

    LED_PSX_OFF();
    LED_USB_ON();

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

        if (usbInterruptIsReady()) {
            usbSetInterrupt((uchar *)&currentReport, sizeof(currentReport));

            while (!usbInterruptIsReady()) {
                usbPoll();
            }
        }
    }
}

int main(void) {

    init();

    // On éteint les leds
    // NOTE : Il restera tout de même un flash à l'allumage
    HC595_write(0x00);
    LED_PSX_OFF();
    LED_USB_OFF();
    LED_PAD_OFF();

    printf("\n");
    printf("-------- Démarrage ------------\n");
    printf("\n");

    if (bit_is_clear(PINB, PINB2)) {
        usb_mode();
    } else {
        playstation_mode();
    }

    return 0;
}

/******************************************************************************
 * Interruptions
 ******************************************************************************/

