/**
 * @file      USB.c
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Gestion de l'USB
 *
 * @details   Code source de gestion de l'USB
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <avr/io.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

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

/******************************************************************************
 * Local variables
 ******************************************************************************/


/******************************************************************************
 * Implements
 ******************************************************************************/

uchar usbFunctionDescriptor(struct usbRequest *rq)
{
	if ((rq->bmRequestType & USBRQ_TYPE_MASK) != USBRQ_TYPE_STANDARD)
		return 0;

	if (rq->bRequest == USBRQ_GET_DESCRIPTOR)
	{
		// USB spec 9.4.3, high byte is descriptor type
		switch (rq->wValue.bytes[1])
		{
			case USBDESCR_DEVICE:
				usbMsgPtr = (usbMsgPtr_t)&hid_device_descriptor[0];
				return sizeof(hid_device_descriptor);
			case USBDESCR_HID_REPORT:
				usbMsgPtr = (usbMsgPtr_t)&hid_report_descriptor[0];
				return sizeof(hid_report_descriptor);
			case USBDESCR_CONFIG:
				usbMsgPtr = (usbMsgPtr_t)&hid_configuration_descriptor[0];
				return sizeof(hid_configuration_descriptor);
		}
	}

	return 0;
}

uchar usbFunctionSetup(uchar data[8])
{
	usbRequest_t *rq = (void *)data;

	if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS)	/* class request type */
	{
		switch (rq->bRequest)
		{
			/* wValue: ReportType (highbyte), ReportID (lowbyte) */
			case USBRQ_HID_GET_REPORT:
                if (rq->wValue.bytes[0] == 0)
                    return sizeof(currentReport);
                break;
		}
	} else {
		/* no vendor specific requests implemented */
	}
	return 0;
}


/******************************************************************************
 * Interruptions
 ******************************************************************************/
