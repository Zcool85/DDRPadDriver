/**
 * @file      hc595.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion du module HC595
 *
 * @details   Code source du module HC595
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
 */

#ifndef __HC595_H__
#define __HC595_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <avr/io.h>


/******************************************************************************
 * Header files
 ******************************************************************************/


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define HC595_PORT              PORTD
#define HC595_PIN               PIND
#define HC595_DDR               DDRD
#define HC595_SER_POS           PD2      // Data pin (DS) pin location
#define HC595_CLOCK_POS         PD3      // Shift Clock (SH_CP) pin location
#define HC595_STORE_CLOCK_POS   PD4      // Store Clock (ST_CP) pin location


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/


/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

void HC595_init(void);
void HC595_write(uint8_t data);

#endif // __HC595_H__
