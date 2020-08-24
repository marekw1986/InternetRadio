#include "usb.h"
#include "usb_host_msd.h"
#include "usb_host_msd_scsi.h"

extern volatile int media_initialized;

volatile BOOL deviceAttached = FALSE;

BOOL USB_ApplicationEventHandler( BYTE address, USB_EVENT event, void *data, DWORD size )
{
USB_VBUS_POWER_EVENT_DATA *pd;

    switch( event )
    {
        case EVENT_VBUS_REQUEST_POWER:
            // The data pointer points to a byte that represents the amount of power
            // requested in mA, divided by two.  If the device wants too much power,
            // we reject it.
            pd= (USB_VBUS_POWER_EVENT_DATA *) data;

			printf("power request %d mA size %d\n",(pd->current)*2,size);
            return TRUE;

        case EVENT_VBUS_RELEASE_POWER:
            // Turn off Vbus power.
            // The PIC24F with the Explorer 16 cannot turn off Vbus through software.

            //This means that the device was removed
            deviceAttached = FALSE;
            return TRUE;
            break;

        case EVENT_HUB_ATTACH:
			    printf("\r\n***** UNSUPPORTED HUB_ATTACH *****\n" );
            return TRUE;
            break;

        case EVENT_UNSUPPORTED_DEVICE:
			 printf("\r\n*****  EVENT_UNSUPPORTED_DEVICE *****\n" );
            return TRUE;
            break;

        case EVENT_CANNOT_ENUMERATE:
			printf("\r\n***** USB Error - cannot enumerate device *****\n" );
            return TRUE;
            break;

        case EVENT_CLIENT_INIT_ERROR:
			printf("\r\n***** USB Error - client driver initialization error *****\n" );
            return TRUE;
            break;

        case EVENT_OUT_OF_MEMORY:
			printf ( "\r\n***** USB Error - out of heap memory *****\n" );
            return TRUE;
            break;

        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
			printf( "\r\n***** USB Error - unspecified *****\n" );
            return TRUE;
            break;

        default:
            break;
    }

    return FALSE;
}
