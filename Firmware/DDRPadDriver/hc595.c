/**
 * @file      hc595.c
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion du module HC595
 *
 * @details   Code source de la gestion du module HC595
 *
 * @copyright   Copyright © 2022 Zéro Cool. All rights reserved.
 */

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <stdint.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

#include "hc595.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

#define HC595DataHigh()     (HC595_PORT |=  _BV(HC595_SER_POS))
#define HC595DataLow()      (HC595_PORT &= ~_BV(HC595_SER_POS))

/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

static void HC595_shiftPulse(void);
static void HC595_shiftLatch(void);

/******************************************************************************
 * Local variables
 ******************************************************************************/


/******************************************************************************
 * Implements
 ******************************************************************************/

//void HC595_init()
//{
//   //Make the Data(DS), Shift clock (SH_CP), Store Clock (ST_CP) lines output
//   HC595_DDR|=((1<<HC595_CLOCK_POS)|(1<<HC595_STORE_CLOCK_POS)|(1<<HC595_SER_POS));
//}

static void HC595_shiftPulse()
{
    HC595_PORT |=  _BV(HC595_CLOCK_POS); //HIGH
    HC595_PORT &= ~_BV(HC595_CLOCK_POS); //LOW
}

static void HC595_shiftLatch()
{
    HC595_PORT |=  _BV(HC595_STORE_CLOCK_POS);  //HIGH
    HC595_PORT &= ~_BV(HC595_STORE_CLOCK_POS);  //LOW
}

// Write a byte to Shift registerr
void HC595_write(uint8_t data)
{
    // MSB first
    for (uint8_t i=0; i<8; i++)
    {
        if(data & 0b10000000)
        {
            HC595DataHigh();
        }
        else
        {
            HC595DataLow();
        }

        HC595_shiftPulse();
        data=data<<1;
    }

    HC595_shiftLatch();
}

/******************************************************************************
 * Interruptions
 ******************************************************************************/
