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
#include "autre.h"

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
    DDRB = 0b01001000;  // MISO + ACK
    DDRC = 0b00000000;  // 
    DDRD = 0b10011110;  // LED + TX + SHIFT Register

    // pull-up (1)
    PORTA = 0xFF
           ;
    PORTB = 0x00
           | _BV(PB4)       // SS
           ;
    PORTC = 0xFF
           ;
    PORTD = 0x00
           ;

    // Déjà fait
	//// Hardware SPI pin setup 
	//SPI_DDR |= _BV(ACK) | _BV(MISO);
	//SPI_PORT |= _BV(SS);	// Enable pull-up resistor on SS pin


    // NOTES : https://gist.github.com/scanlime/5042071

    // Enable slave SPI
    // LSB first
    // CPOL / CPHA : Mode 3 (Cf. diagrammes https://store.curiousinventor.com/guides/PS2/)
    SPCR = 0x00
         //| _BV(SPIE)    // SPI Interrupt Enable
         | _BV(SPE)
         | _BV(DORD)
         | _BV(CPOL)
         | _BV(CPHA)
         ;

    // Déjà fait
	//// Configure hardware SPI registers (pg.173)
	//// SPE enables SPI hardware; DORD sets data order to LSB first; CPOL sets clock polarity (high when idle)
	//// CPHA selects data setup on falling edge of clock, read on rising edge
	//SPCR |= _BV(SPE) | _BV(DORD) | _BV(CPOL) | _BV(CPHA);

	/*Set up 8-bit timer/counter 2*/
	// Timer/Counter 0 Control Register B : Prescaler set to divide system clock (8mHz) by 32 for timer clock
    // 64
	TCCR2B	|= _BV(CS22); //_BV(CS20) | _BV(CS21);
	// Write 0x01 to TCNT2 to reset timer, check for TOV2 bit in TIFR2 for timer overflow.

    ///////////////// ACK v1
    // Set Ack up
    SPI_PORT |= _BV(ACK);

    ///////////////// ACK v2 : En cours de test
    // Set Ack Hi-Z
    //SPI_DDR &= ~_BV(ACK);       // DIR as input
    //SPI_PORT &= ~_BV(ACK);      // PORT tri state (Hi-Z)

    ///////////////// MISO v2 : En cours de test
    //// Set DATA (MISO) Hi-Z
    //DDRB &= ~_BV(PORTB6);       // DIR as input
    //PORTB &= ~_BV(PORTB6);      // PORT tri state (Hi-Z)

    USART_Init();
    
    stdout = &uart_output;
    stdin  = &uart_input;

    sei();
}

//void ack(void) {
//
//    // V1
//    ////_delay_us(4);
//    //// Set ack low
//    //PORTB &= ~_BV(PORTB3);
//    //_delay_us(3);
//    //// Set ack high
//    //PORTB |= _BV(PORTB3);
//
//    // V2 en cours de test
//    //_delay_us(4);
//    
//    // Set Ack output
//    DDRB |= _BV(PORTB3);       // DIR as output
//    // Set ack low
//    PORTB &= ~_BV(PORTB3);
//    
//    _delay_us(3);
//    
//    //// Set ack high
//    //PORTB |= _BV(PORTB3);
//    
//    //_delay_us(5);
//    
//    // Set Ack Hi-Z
//    DDRB &= ~_BV(PORTB3);       // DIR as input
//    PORTB &= ~_BV(PORTB3);      // PORT tri state (Hi-Z)
//}

//uint8_t SPI_SlaveReceive(uint8_t data) {
//    SPDR = data;
//    while(!(SPSR & (1<<SPIF)));
//    return SPDR;
//}

//#define DATA_LEN    5
//volatile uint8_t data_buff[DATA_LEN]={0x41,0x5A,0xFF,0xFF,0xFF};//Reply.
//volatile uint8_t command_buff[DATA_LEN]={0x01,0x42,0x00,0x00,0x00};

#define MAX_SAMPLES     400
volatile uint8_t sampled_seq[MAX_SAMPLES];
volatile uint8_t sent_seq[MAX_SAMPLES];
volatile uint8_t seq_num[MAX_SAMPLES];
volatile uint8_t current_seq_num=0;
volatile uint16_t sample_num=0;

//volatile uint8_t curr_byte = 0;
//volatile uint8_t isok = 0;

const char *bit_rep[16] = {
    [ 0] = "0000", [ 1] = "0001", [ 2] = "0010", [ 3] = "0011",
    [ 4] = "0100", [ 5] = "0101", [ 6] = "0110", [ 7] = "0111",
    [ 8] = "1000", [ 9] = "1001", [10] = "1010", [11] = "1011",
    [12] = "1100", [13] = "1101", [14] = "1110", [15] = "1111",
};

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
                usbSetInterrupt(&currentReport, sizeof(currentReport));

                while (!usbInterruptIsReady())
                {
                    usbPoll();
                }
            }
        }
    }

    printf("Playstation 2 Mode (3.3V)\n");

    disable_watchdog();

    power_spi_enable();


    uint8_t final_data[18];            // array stores final formatted data that is sent to ps2
    uint8_t command[6];            // array stores commands sent from ps2 in order they are received
    uint8_t CSR0 = 0x00;            // command status register 0
    uint8_t reader = 0x00;

    final_data[0] = 0xFF;            // Initialise data variables with neutral values
    final_data[1] = 0xFF;
    final_data[2] = 0x80;
    final_data[3] = 0x80;
    final_data[4] = 0x80;
    final_data[5] = 0x80;
    command[0] = 0x00;
    command[1] = 0x00;
    command[2] = 0x00;
    command[3] = 0x00;
    command[4] = 0x00;


    //while(1) {
    //    printf("PINA %s%s - PINC %s%s\n",
    //        bit_rep[PINA >> 4], bit_rep[PINA & 0x0F],
    //        bit_rep[PINC >> 4], bit_rep[PINC & 0x0F]);
    //    _delay_us(50);
    //}

    uint16_t total = 0;
    uint8_t first_call = 10;

    /* Infinite while loop*/
    while(1)
    {
        total++;
    

        // DEBUG
        //if (sample_num > 250) {
        //    for (uint16_t t = 0; t < sample_num; t++) {
        //        printf("%03d: Tx 0x%02X -> Rx 0x%02X (%02d)\n", t, sent_seq[t], sampled_seq[t], seq_num[t]);
        //    }
        //    sample_num = 0;
        //}

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
        
        if (total > 400) {
            while(1) {
        
            }
        }



        loop_until_bit_is_clear(SPI_PIN, SS);

        reader = SPSR;                  // Read SPI status register to clear SPIF flag
        SPDR = 0xFF;                    // Write SPI data register with initial dummy byte
        sent_seq[sample_num] = 0xFF;
        current_seq_num = 0;
        seq_num[sample_num] = current_seq_num;

        loop_until_bit_is_set(SPSR, SPIF);
        command[0] = SPDR;
        sampled_seq[sample_num++] = command[0]; // DEBUG

        if (command[0] == 0x01 && bit_is_clear(SPI_PIN, SS)) {
            ACKNOWLEDGE;
            //if (first_call == 0) {
            //    PS_AVR_COMM(0x41, command[1]);      // Digital mode
            //} else {
                PS_AVR_COMM(0x73, command[1]);      // Dual shock Analogic mode (SCPH-10010)
            //}

        //    //PS_AVR_COMM(0x41, command[1]);      // Digital mode
        //    //PS_AVR_COMM(0x43, command[1]);      // Digital PS2 mode
        //    //PS_AVR_COMM(0x73, command[1]);      // Dual shock Analogic mode
        //    PS_AVR_COMM(0x79, command[1]);      // Dual shock Full analogic mode
        //    //PS_AVR_COMM(0xF3, command[1]);      // Config mode
//
            if (command[1] == 0x42 && bit_is_clear(SPI_PIN, SS)) {
                ACKNOWLEDGE;
                PS_AVR_COMM(0x5A, command[2]);        // filler byte, always 0x5A

                if (command[2] == 0x00 && bit_is_clear(SPI_PIN, SS)) {
                    ACKNOWLEDGE;

                    final_data[0] = PINA;

                    PS_AVR_COMM(final_data[0], command[3]);    // first data byte (8 buttons)

                    // NOTE :
                    // command[3] & command[4] : Donne la valeur des moteurs
                    // après les autre command[x] sont à 0x00
                    if (bit_is_clear(SPI_PIN, SS)) {
                        ACKNOWLEDGE;
                        final_data[1] = PINC;
                        PS_AVR_COMM(final_data[1], command[4]);    // second data byte (8 buttons)

                        //if (first_call == 0) {
                        //    first_call = 1;
                        //    goto fin;
                        //}

                        ACKNOWLEDGE;
                        PS_AVR_COMM(0x80, command[4]);    // right_analog_x
                        // No check, it's rumble value ! if (command[4] != 0x00) goto fin;
                        ACKNOWLEDGE;
                        PS_AVR_COMM(0x80, command[4]);    // right_analog_y
                        // No check, it's rumble value ! if (command[4] != 0x00) goto fin;
                        ACKNOWLEDGE;
                        PS_AVR_COMM(0x80, command[4]);    // left_analog_x
                        // No check, it's rumble value ! if (command[4] != 0x00) goto fin;
                        ACKNOWLEDGE;
                        PS_AVR_COMM(0x80, command[4]);    // left_analog_y
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                        //if (command[4] != 0x00) goto fin;
                        //ACKNOWLEDGE;
                        //PS_AVR_COMM(0x00, command[4]);    // 
                    }
                }

            } else if (command[1] == 0x45 && bit_is_clear(SPI_PIN, SS)) {
                ACKNOWLEDGE;
                PS_AVR_COMM(0x5A, command[2]);        // filler byte, always 0x5A

                if (command[2] == 0x00 && bit_is_clear(SPI_PIN, SS)) {
                    ACKNOWLEDGE;

                    final_data[0] = 0x03;   // Dual Shock

                    PS_AVR_COMM(final_data[0], command[3]);    // Pad type
                    if (command[3] != 0x5A) goto fin;
                    ACKNOWLEDGE;
                    PS_AVR_COMM(0x02, command[3]);    // Constante
                    if (command[3] != 0x5A) goto fin;
                    ACKNOWLEDGE;
                    PS_AVR_COMM(0x00, command[3]);    // LED Off
                    if (command[3] != 0x5A) goto fin;
                    ACKNOWLEDGE;
                    PS_AVR_COMM(0x02, command[3]);    // Constante
                    if (command[3] != 0x5A) goto fin;
                    ACKNOWLEDGE;
                    PS_AVR_COMM(0x01, command[3]);    // Constante
                    if (command[3] != 0x5A) goto fin;
                    ACKNOWLEDGE;
                    PS_AVR_COMM(0x00, command[3]);    // Constante
                }

            }

        } else {
            // Globalemennt inutile sur PS2 car il y a 4 lilgnes SPI dédiées
            printf("Disable SPI: 0x%02X\n", command[0]);
            DISABLE_SPI;    // Disable SPI hardware to avoid conflict with mem-card comm
        }

fin:

        loop_until_bit_is_set(SPI_PIN, SS);   // Wait for end of communication
        ENABLE_SPI;

        
/*PS-AVR SPI SECTION*******************************************************************************************/

//        if (~SPI_PIN & _BV(SS)) {    // If attention line (SS/PB2) is brought low, enter transmission mode
//            
//            reader = SPSR;        // Read SPI status register to clear SPIF flag
//            SPDR = (uint8_t)~0xFF;        // Write SPI data register with initial dummy byte
//            sent_seq[sample_num] = 0xFF;
//            //START_TIMER_AT(1);    // setup 1ms timer
//
//            // loop while timer counts up, SS remains low, and SPI transmission flag not set
//            while((!(TIFR2 & _BV(TOV2))) && (~SPI_PIN & _BV(SS)) && (!(SPSR & _BV(SPIF))));
//
//            // If these two remain true it means SPI hardware has received a byte and communication continues
//            if((!(TIFR2 & _BV(TOV2))) && (~SPI_PIN &_BV(SS))){
//
//                command[0] = SPDR;    // Read first command byte from SPI buffer
//                sampled_seq[sample_num++] = command[0];
//
//            if (command[0] == 0x01) {    // If PS is not addressing controller, abandon communication
//
//                    ACKNOWLEDGE;    // ACK pulse sent following every byte except final byte
//                                
//            if((CSR0 & _BV(ANALOG_MODE_BIT)) && (!(CSR0 & _BV(CONFIG_MODE_BIT)))){ // if analog mode is active and config mode is inactive...
//                    PS_AVR_COMM(0x73, command[1]);}        // ...send 0x73, analog mode ID
//            else if((!(CSR0 & _BV(ANALOG_MODE_BIT))) && (!(CSR0 & _BV(CONFIG_MODE_BIT)))){ // if neither config mode nor analog mode active...
//                    PS_AVR_COMM(0x41, command[1]);
//            }        // ...send 0x41, digital mode ID
//            else if(CSR0 & _BV(CONFIG_MODE_BIT)){            // if config mode is active...
//                    PS_AVR_COMM(0xF3, command[1]);}        // ...send 0xF3, config mode ID
//
//        // tests for known commands which the adapter will reply to, commands not listed will terminate communication for the current packet
//        // 0x42 = main polling command used to get control data from adapter
//        // 0x43 = enter/exit config mode command
//        // 0x44 = switch between analog/digital modes and lock/unlock controller in specified mode
//        // 0x45 = command to retrieve status/ID info from adapter
//        // 0x46 = command to retrieve 10 bytes of mystery data from adapter over two packets
//        // 0x47 = command to retrieve 5 bytes of mystery data from adapter
//        // 0x4C = command to retrieve 10 bytes of mystery data from adapter over two packets
//        // 0x4D = maps rumble motor commands to command bytes 3 and 4 in 0x42 polling packet
//        if (   (command[1] == 0x42)
//            || (command[1] == 0x43)
//            || (command[1] == 0x44)
//            || (command[1] == 0x45)
//            || (command[1] == 0x46)
//            || (command[1] == 0x47)
//            || (command[1] == 0x4C)
//            || (command[1] == 0x4D)
//            ) {
//
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(0x5A, command[2]);        // filler byte, always 0x5A
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x45)){    // if adapter is in config mode and 0x45 command is received
//                final_data[0] = 0x01;        // meaning of these bytes is unknown, copied from analysis of a real Ps1 controller response
//                final_data[1] = 0x02;
//                (CSR0 & _BV(ANALOG_MODE_BIT)) ? (final_data[2] = 0x01) : (final_data[2] = 0x00); // 1 if in analog mode, otherwise 0
//                final_data[3] = 0x02;
//                final_data[4] = 0x01;
//                final_data[5] = 0x00;
//                }
//
//            // sets up first two data bytes for a 0x4D command, these bytes report the current rumble motor mapping 
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x4D)){
//                if(CSR0 & _BV(FIRST_MOTOR_BYTE_SMALL))
//                    final_data[0] = 0x00;
//                else if(CSR0 & _BV(FIRST_MOTOR_BYTE_LARGE))
//                    final_data[0] = 0x01;
//                else
//                    final_data[0] = 0xFF;
//
//                if(CSR0 & _BV(SECOND_MOTOR_BYTE_SMALL))
//                    final_data[1] = 0x00;
//                else if(CSR0 & _BV(SECOND_MOTOR_BYTE_LARGE))
//                    final_data[1] = 0x01;
//                else
//                    final_data[1] = 0xFF;
//                }
//
//            // ps1 will reject data in the 0x46, 0x47, and 0x4C packets if final_data[0] is not 0x00 
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && ((command[1] == 0x46) || (command[1] == 0x47) || (command[1] == 0x4C))){
//                    final_data[0] = 0x00;
//                }
//
//                        ACKNOWLEDGE;
//
//        // TODO : I y a du mieux, mais c'est pas ça...
//        uint8_t pb1_value = ~PIND & _BV(PD2);
//        if (pb1_value > 0) {
//            final_data[0] &= ~(_BV(PS_UP));
//            //final_data[1] = ~(_BV(4));
//            PORTD &= ~_BV(PORTD7);
//        } else {
//            final_data[0] = 0xFF;
//            //final_data[1] = 0xFF;
//            PORTD |= _BV(PORTD7);
//        }
//
//                    PS_AVR_COMM(final_data[0], command[3]);    // first data byte (8 buttons)
//
//            if(command[1] == 0x43){
//                // command[3] tells the adapter to enter or exit config mode when command[1] is 0x43
//                (command[3] == 0x00) ? (CSR0 &= ~_BV(CONFIG_MODE_BIT)) : (CSR0 |= _BV(CONFIG_MODE_BIT));
//                }
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x46)){
//                if(command[3] == 0x00){
//                    final_data[1] = 0x00;    // meaning of these bytes is unknown, copied from analysis of a real Ps1 controller response
//                    final_data[2] = 0x01;
//                    final_data[3] = 0x02;
//                    final_data[4] = 0x00;
//                    final_data[5] = 0x0A;
//                    }
//                else if(command[3] == 0x01){
//                    final_data[1] = 0x00;
//                    final_data[2] = 0x01;
//                    final_data[3] = 0x01;
//                    final_data[4] = 0x01;
//                    final_data[5] = 0x14;
//                    }
//                }
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x47)){
//                final_data[1] = 0x00;    // meaning of these bytes is unknown, copied from analysis of a real Ps1 controller response
//                final_data[2] = 0x02;
//                final_data[3] = 0x00;
//                final_data[4] = 0x01;
//                final_data[5] = 0x00;
//                }
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x4C)){
//                if(command[3] == 0x00){
//                    final_data[1] = 0x00;    // meaning of these bytes is unknown, copied from analysis of a real Ps1 controller response
//                    final_data[2] = 0x00;
//                    final_data[3] = 0x04;
//                    final_data[4] = 0x00;
//                    final_data[5] = 0x00;
//                    }
//                else if(command[3] == 0x01){
//                    final_data[1] = 0x00;
//                    final_data[2] = 0x00;
//                    final_data[3] = 0x07;
//                    final_data[4] = 0x00;
//                    final_data[5] = 0x00;
//                    }
//                }
//
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(final_data[1], command[4]);    // second data byte (8 buttons)
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x44)){
//                // command[3] turns analog mode on or off, command[4] locks controller in specified mode
//                (command[3] == 0x00) ? (CSR0 &= ~_BV(ANALOG_MODE_BIT)) : (CSR0 |= _BV(ANALOG_MODE_BIT));
//                (command[4] == 0x03) ? (CSR0 |= _BV(LOCK_BIT)) : (CSR0 &= ~_BV(LOCK_BIT));
//                }
//
//            if((CSR0 & _BV(CONFIG_MODE_BIT)) && (command[1] == 0x4D)){
//                if(command[3] == 0){
//                    CSR0 |= _BV(FIRST_MOTOR_BYTE_SMALL);
//                    CSR0 &= ~_BV(FIRST_MOTOR_BYTE_LARGE);}
//                else if(command[3] == 1){
//                    CSR0 |= _BV(FIRST_MOTOR_BYTE_LARGE);
//                    CSR0 &= ~_BV(FIRST_MOTOR_BYTE_SMALL);}
//                else{
//                    CSR0 &= ~_BV(FIRST_MOTOR_BYTE_SMALL);
//                    CSR0 &= ~_BV(FIRST_MOTOR_BYTE_LARGE);}
//
//                if(command[4] == 0){
//                    CSR0 |= _BV(SECOND_MOTOR_BYTE_SMALL);
//                    CSR0 &= ~_BV(SECOND_MOTOR_BYTE_LARGE);}
//                else if(command[4] == 1){
//                    CSR0 |= _BV(SECOND_MOTOR_BYTE_LARGE);
//                    CSR0 &= ~_BV(SECOND_MOTOR_BYTE_SMALL);}
//                else{
//                    CSR0 &= ~_BV(SECOND_MOTOR_BYTE_SMALL);
//                    CSR0 &= ~_BV(SECOND_MOTOR_BYTE_LARGE);}
//                }
//                    
//            //START_TIMER_AT(253);
//            // loop while timer counts up, and SS remains low, timeout skips ACK and remaining bytes if Ps cuts off communication early
//            while((!(TIFR2 & _BV(TOV2))) && (~SPI_PIN & _BV(SS)));
//            // continue with transmission of the final 4 bytes if adapter is in analog mode, config mode, or if command[1] is 0x43
//            if(((CSR0 & _BV(ANALOG_MODE_BIT)) || (CSR0 & _BV(CONFIG_MODE_BIT)) || (command[1] == 0x43)) && (~SPI_PIN & _BV(SS))){
//
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(final_data[2], command[5]);    // Right analog X data Byte
//                        
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(final_data[3], command[5]);    // Right analog Y data byte
//
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(final_data[4], command[5]);    // Left analog X data byte
//
//                        ACKNOWLEDGE;
//
//                    PS_AVR_COMM(final_data[5], command[5]);    // Left analog Y data byte
//
//            }// if analog mode or config mode
//
//            }// if command[1] == one of the recognised commands
//
//            }// 0x01 controller address check
//
//            else {
//                SPI_PORT &= ~_BV(MISO);    // Clear data output
//                DISABLE_SPI;                // Disable SPI hardware to avoid conflict with mem-card comm
//            }
//
//            }// timer overflow and SS line check
//
//            }// if SS is low
//            
//        SPI_PORT &= ~_BV(MISO);        // Clear data output
//
//        while (~SPI_PIN & _BV(SS));    // Loop until SS returns high after communication is complete
//
//
///*CONTROLLER POLLING SECTION*****************************************************************************************/
//
//    ENABLE_SPI;                    // re-enable SPI hardware
//    //START_TIMER_AT(64);
//
////    while((!(TIFR2 & _BV(TOV2))) && (SPI_PIN & _BV(SS)));    // Loop while timer counts up and SS pin remains high
////
////    if(SPI_PIN & _BV(SS)){                // if SS line is high, SPI communication is not being requested
////
////    final_data[0] = 0xFF;                    // Clear data bytes before controller polling
////    final_data[1] = 0xFF;
////    final_data[2] = 0x80;
////    final_data[3] = 0x80;
////    final_data[4] = 0x80;
////    final_data[5] = 0x80;
////
////
/////*DATA FORMATTING SECTION********************************************************************************************/
////
/////*END DATA FORMATTING************************************************************************************************/
////
////
////    //if(command[1] == 0x42){        // command 0x42 is the main polling command sent continually once the adapter is configured
////    //        LED_PORT |= _BV(STATUS_LED_RED2);        // Red status LED off
////    //        LED_PORT &= ~_BV(STATUS_LED_GREEN2);        // Green status LED on to indicate that everything is cool
//////
////    //        LED_PORT |= _BV(STATUS_LED_GREEN2);    // FOR DEBUGGING
////    //        _delay_us(4);                // FOR DEBUGGING
////    //        LED_PORT &= ~_BV(STATUS_LED_GREEN2);    // FOR DEBUGGING
////    //}
////    //else{
////    //        LED_PORT |= _BV(STATUS_LED_GREEN2);        // Green status LED off
////    //        LED_PORT &= ~_BV(STATUS_LED_RED2);        // Red status LED on to indicate that something might be wrong
//////
////    //        LED_PORT |= _BV(STATUS_LED_RED2);    // FOR DEBUGGING
////    //        _delay_us(4);                // FOR DEBUGGING
////    //        LED_PORT &= ~_BV(STATUS_LED_RED2);    // FOR DEBUGGING
////    //}
////
////    command[1] = 0x00;
////    command[3] = 0x00;
////    command[4] = 0x00;
////
////    }// if SS line is still high after timeout
////
//    COMM_IS_OK;        // set flag in "CSR0" to allow SPI communication
////
////    // loop waits for call from spi master, if not called in 20ms loop to top to keep everything else going
////    for(uint8_t x = 0; ((x < 18) && (SPI_PIN & _BV(SS))); x++){
////        //START_TIMER_AT(1);
////        while((!(TIFR2 & _BV(TOV2))) && (SPI_PIN & _BV(SS)));
////        }
        
    }// infinite while(1) loop

    return 0;
}

/******************************************************************************
 * Interruptions
 ******************************************************************************/

//ISR(INT0_vect) {
//
//}

//ISR(SPI_STC_vect) {
//    uint8_t readed = SPDR;
//
//    if (sample_num < MAX_SAMPLES)
//        sampled_seq[sample_num] = readed;   //DEBUG!
//
//    if (readed == command_buff[curr_byte]) {		
//		SPDR = ~data_buff[curr_byte];
//
//        if (sample_num < MAX_SAMPLES)
//            sent_seq[sample_num] = data_buff[curr_byte];    //DEBUG!
//
//		curr_byte++;
//
//		if (curr_byte < DATA_LEN) {
//            ack();
//		} else {
//			SPDR = ~0xFF;
//			curr_byte=0;
//		}
//	} else {
//		SPDR = ~0xFF;
//		curr_byte=0;
//	}
//
//    sample_num++;   //DEBUG!
//}
