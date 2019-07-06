
#ifndef USB_ERROR_CODE_H
#define USB_ERROR_CODE_H




// ERROR code
#define USBErrorCode			 500						// Dean add
#define USBTransmitFailed		 (USBErrorCode + 1)
#define USBInvalidCtrlCode		 (USBErrorCode + 2)		
#define USBInvalidDataSize		 (USBErrorCode + 3)
#define USBAIChannelBusy		 (USBErrorCode + 4)
#define USBAIDataNotReady		 (USBErrorCode + 5)
#define USBFWUpdateFailed        (USBErrorCode + 6)
#define USBDeviceNotReady      (USBErrorCode + 7)
#define USBOperNotSuccess      (USBErrorCode + 8)
#endif
