/**
 * @file      PSX.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la PlayStation
 *
 * @details   Header pour gérer la communication avec la PlayStation
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

#ifndef __PSX_H__
#define __PSX_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <stdint.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define	PSX_PAD_SELECT		    0	// data[0] byte
#define	PSX_PAD_L3			    1
#define	PSX_PAD_R3			    2
#define	PSX_PAD_START		    3
#define	PSX_PAD_UP			    4
#define	PSX_PAD_RIGHT		    5
#define	PSX_PAD_DOWN			6
#define	PSX_PAD_LEFT			7

#define	PSX_PAD_L2			    0	// data[1] byte
#define	PSX_PAD_R2			    1
#define	PSX_PAD_L1			    2
#define	PSX_PAD_R1			    3
#define	PSX_PAD_TRIANGLE		4
#define	PSX_PAD_CIRCLE		    5
#define	PSX_PAD_CROSS		    6
#define	PSX_PAD_SQUARE		    7

#define PSX_PIN_DSR             PB3	    // Acknowledge, impulsion basse après chaque octet transféré, sauf pour le denrie octet
#define PSX_PIN_DTR	            PB4	    // Slave Select
#define PSX_PIN_TXD             PB5	    // Recoit les commandes de la Playstation (cmd)
#define PSX_PIN_RXD             PB6	    // Envoi les données à la PS2 (dat)
#define PSX_PIN_SCK             PB7	    // Serial clock de la Playstation (données lues sur front montant)
#define PSX_PORT		        PORTB
#define PSX_PIN			        PINB
#define PSX_DDR			        DDRB


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

void PSX_init(void);
void PSX_ack(void);
uint8_t PSX_read_byte(uint8_t data);
void PSX_release_line(void);

#endif // __PSX_H__
