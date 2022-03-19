/**
 * @file      PSX.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la PlayStation
 *
 * @details   Header pour gérer la communication avec la PlayStation
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
 */

#ifndef __PSX_H__
#define __PSX_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

/******************************************************************************
 * Header files
 ******************************************************************************/

/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define	PSX_SELECT		    0	// data[0] byte
#define	PSX_L3			    1
#define	PSX_R3			    2
#define	PSX_START		    3
#define	PSX_UP			    4
#define	PSX_RIGHT		    5
#define	PSX_DOWN			6
#define	PSX_LEFT			7

#define	PSX_L2			    0	// data[1] byte
#define	PSX_R2			    1
#define	PSX_L1			    2
#define	PSX_R1			    3
#define	PSX_TRIANGLE		4
#define	PSX_CIRCLE		    5
#define	PSX_CROSS		    6
#define	PSX_SQUARE		    7

// Hardware specs
#define MOSI			PB5	    // SPI MOSI; receives commands from Ps2
#define MISO			PB6	    // SPI MISO; sends outgoing data to Ps2
#define SCK			    PB7	    // SPI SCK; serial clock controlled by Ps2, data is read on rising edge
#define ACK			    PB3	    // ACKNOWLEDGE, brief low pulse after each byte transfer in packet, except after final byte
#define SS			    PB4	    // SPI slave select pin
#define SPI_PORT		PORTB
#define SPI_PIN			PINB
#define SPI_DDR			DDRB


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

void PSX_ack(void);
uint8_t PSX_read_byte(uint8_t data);

#endif // __PSX_H__
