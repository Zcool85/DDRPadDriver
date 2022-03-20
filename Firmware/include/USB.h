/**
 * @file      USB.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de la communication USB
 *
 * @details   Code source de la communication USB
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

#ifndef __USB_H__
#define __USB_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <stdint.h>
#include <avr/io.h>
#include <avr/pgmspace.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

#include "usbdrv.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

// Button report (16 bits)
#define HID_MASK_BTN_01     _BV(0)
#define HID_MASK_BTN_02     _BV(1)
#define HID_MASK_BTN_03     _BV(2)
#define HID_MASK_BTN_04     _BV(3)
#define HID_MASK_BTN_05     _BV(4)
#define HID_MASK_BTN_06     _BV(5)
#define HID_MASK_BTN_07     _BV(6)
#define HID_MASK_BTN_08     _BV(7)
#define HID_MASK_BTN_09     _BV(8)
#define HID_MASK_BTN_10     _BV(9)
#define HID_MASK_BTN_11     _BV(10)
#define HID_MASK_BTN_12     _BV(11)
#define HID_MASK_BTN_13     _BV(12)
#define HID_MASK_BTN_14     _BV(13)
#define HID_MASK_BTN_15     _BV(14)
#define HID_MASK_BTN_16     _BV(15)

typedef struct __attribute((packed, aligned(1)))
{
    uint16_t buttons;
} HIDReport;


/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

extern HIDReport currentReport;


/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

uchar usbFunctionDescriptor(struct usbRequest *rq);
uchar usbFunctionSetup(uchar data[8]);


#endif // __USB_H__
