/**
 * @file      USART.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la communication USART
 *
 * @details   Code source de la communication USART
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

#ifndef __USART_H__
#define __USART_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <stdio.h>


/******************************************************************************
 * Header files
 ******************************************************************************/


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

FILE uart_output;
FILE uart_input;
FILE uart_io;


/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

void USART_Init(void);


#endif // __USART_H__
