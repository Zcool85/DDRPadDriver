/**
 * @file      HIDDescriptor.h
 *
 * @author    Zéro Cool
 * @date      12/03/2022
 * @brief     Fichier description USB
 *
 * @details   Code source de la description du périphérique USB
 *
 * @copyright   Copyright © 2022 Zéro Cool
 */

#ifndef __HID_DESCRIPTOR_H__
#define __HID_DESCRIPTOR_H__

/******************************************************************************
 * Standard libraries
 ******************************************************************************/

#include <stdint.h>
#include <avr/pgmspace.h>


/******************************************************************************
 * Header files
 ******************************************************************************/

#include "usbdrv.h"


/******************************************************************************
 * Defines and typedefs (enums, typedefs, constant macro defines, function macro defines)
 ******************************************************************************/

static const uint8_t hid_device_descriptor[] PROGMEM =
{
    0x12,                       // bLength
    USBDESCR_DEVICE,            // bDescriptorType (Device)
    0x00, 0x02,                 // bcdUSB 2.00
    USB_CFG_DEVICE_CLASS,       // bDeviceClass (Use class information in the Interface Descriptors)
    USB_CFG_DEVICE_SUBCLASS,    // bDeviceSubClass
    0x00,                       // bDeviceProtocol
    0x08,                          // bMaxPacketSize0 8
    (char)USB_CFG_VENDOR_ID,/* 2 bytes */
    (char)USB_CFG_DEVICE_ID,/* 2 bytes */
    USB_CFG_DEVICE_VERSION, /* 2 bytes */
    0x01,                        // iManufacturer (String Index)
    0x02,                        // iProduct (String Index)
    0x00,                        // iSerialNumber (String Index)
    0x01,                        // bNumConfigurations 1
};

static const uint8_t hid_configuration_descriptor[] PROGMEM =
{
    0x09,                        // bLength
    USBDESCR_CONFIG,             // bDescriptorType (Configuration)
    0x22, 0x00,                  // wTotalLength 34
    //18 + 7 * USB_CFG_HAVE_INTRIN_ENDPOINT + 7 * USB_CFG_HAVE_INTRIN_ENDPOINT3 +
    //            (USB_CFG_DESCR_PROPS_HID & 0xff), 0x00,
    0x01,                        // bNumInterfaces 1
    0x01,                        // bConfigurationValue
    0x00,                        // iConfiguration (String Index)
#if USB_CFG_IS_SELF_POWERED
    (1 << 7) | USBATTR_SELFPOWER,
#else
    (1 << 7),
#endif
    USB_CFG_MAX_BUS_POWER/2,    // max USB current in 2mA units
    0x09,                       // bLength
    USBDESCR_INTERFACE,         // bDescriptorType (Interface)
    0x00,                       // bInterfaceNumber 0
    0x00,                       // bAlternateSetting
    USB_CFG_HAVE_INTRIN_ENDPOINT + USB_CFG_HAVE_INTRIN_ENDPOINT3, // bNumEndpoints
    USB_CFG_INTERFACE_CLASS,    // bInterfaceClass
    USB_CFG_INTERFACE_SUBCLASS, // bInterfaceSubClass
    USB_CFG_INTERFACE_PROTOCOL, // bInterfaceProtocol
    0,          				// iInterface (String Index)

    0x09,        				// bLength
    USBDESCR_HID,        		// bDescriptorType (HID)
    0x11, 0x01,  				// bcdHID 1.11
    0x00,        				// bCountryCode
    0x01,        				// bNumDescriptors
    0x22,        				// bDescriptorType[0] (HID)
    USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH, 0x00,  // wDescriptorLength[0] 81

    0x07,        				// bLength
    USBDESCR_ENDPOINT,        	// bDescriptorType (Endpoint)
    (char)0x81,        			// bEndpointAddress (IN/D2H)
    0x03,        				// bmAttributes (Interrupt)
    0x08, 0x00,       			// wMaxPacketSize 8
    USB_CFG_INTR_POLL_INTERVAL, // in ms
};

// NOTE : Don't forget to change USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH
// if hid_report_descriptor length change !!
static const uint8_t hid_report_descriptor[] PROGMEM = {
    0x05, 0x01,        // Usage Page (Generic Desktop Ctrls)
    0x09, 0x05,        // Usage (Game Pad)
    0xA1, 0x01,        // Collection (Application)

    // One report for 16 buttons
    0x15, 0x00,        //   Logical Minimum (0)
    0x25, 0x01,        //   Logical Maximum (1)
    0x35, 0x00,        //   Physical Minimum (0)
    0x45, 0x01,        //   Physical Maximum (1)
    0x75, 0x01,        //   Report Size (1)
    0x95, 0x10,        //   Report Count (16)
    0x05, 0x09,        //   Usage Page (Button)
    0x19, 0x01,        //   Usage Minimum (0x01)
    0x29, 0x10,        //   Usage Maximum (0x10)
    0x81, 0x02,        //   Input (Data,Var,Abs,No Wrap,Linear,Preferred State,No Null Position)

    0xC0,              // End Collection
};

/******************************************************************************
 * External data déclarations (extern)
 ******************************************************************************/

/******************************************************************************
 * Prototypes and descriptions
 ******************************************************************************/

#endif // __HID_DESCRIPTOR_H__
