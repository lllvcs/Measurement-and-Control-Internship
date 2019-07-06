/***************************************************************************
 Module Name: DEVICE.H
 Purpose: the declaration of functions, data structures, status codes,
          constants, and messages
 Version: 1.00
 Date: 10/01/1996
 Copyright (c) 1996 Advantech Corp. Ltd.
 All rights reserved.
****************************************************************************/

#ifndef _INC_DEVICE
#define _INC_DEVICE

#include "OS.H"
#include "DRIVER.H"

#ifdef _WIN31
#define FLOAT   float
#define CHAR    char
#define USHORT  unsigned short
#define ULONG   unsigned long
#endif
#ifdef __cplusplus
extern "C"
{
#endif

#define     PUBLIC   extern
#define     PRIVATE  static

/**************************************************************************
    Device Configuration Definition
***************************************************************************/
typedef struct tagDEVCONFIG_ALL
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDMA;            // DMA level
    USHORT  usTimerClock;     // clock selection
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    USHORT  usChanConfig;      // 0-single ended, 1-differential
    USHORT  usGainCtrMode;     // 1-by jumper, 0-programmable
    USHORT  usPolarity;        // 0-bipolar, 1-unipolar
    USHORT  usDasGain;         // not used if GainCtrMode = 1
    USHORT  usNumExpChan;      // attached expansion channels
    USHORT  usCjcChannel;      // cold junction channel
    DAUGHTERSET Daughter[MAX_DAUGHTER_NUM];  // expansion board settings
    AOSET   AoSettings[MAX_AO_RANGE];   // analog output settings
    WORD    wDigPortCfg[MAX_DIO_PORT];  // port configuration for input or output
    WORD    wDigGroupCfg[MAX_DIO_PORT]; // port Group configuration
} DEVCONFIG_ALL, FAR * LPDEVCONFIG_ALL;

/**************************************************************************
    Device Configuration Definition
***************************************************************************/
typedef struct tagDEVCONFIG_AD
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDMA;            // DMA level
    USHORT  usTimerClock;     // clock selection
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    USHORT  usChanConfig;      // 0-single ended, 1-differential
    USHORT  usGainCtrMode;     // 1-by jumper, 0-programmable
    USHORT  usPolarity;        // 0-bipolar, 1-unipolar
    USHORT  usDasGain;         // not used if GainCtrMode = 1
    USHORT  usNumExpChan;      // attached expansion channels
    USHORT  usCjcChannel;      // cold junction channel
    DAUGHTERSET Daughter[MAX_DAUGHTER_NUM];  // expansion board settings
    AOSET   AoSettings[MAX_AO_RANGE];   // analog output settings
} DEVCONFIG_AD, FAR * LPDEVCONFIG_AD;

/**************************************************************************
    DEVCONFIG_AO Definition
***************************************************************************/
typedef struct tagDEVCONFIG_AO
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDMA;            // DMA level
    USHORT  usTimerClock;     // clock selection
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    AOSET   AoSettings[MAX_AO_RANGE];   // analog output settings
} DEVCONFIG_AO, FAR * LPDEVCONFIG_AO;

/**************************************************************************
    DEVCONFIG_DIO Definition
***************************************************************************/
typedef struct tagDEVCONFIG_DIO
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDMA;            // DMA level
    USHORT  usTimerClock;     // clock selection
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    WORD    wDigPortCfg[MAX_DIO_PORT];  // port configuration for input or output
    WORD    wDigGroupCfg[MAX_DIO_PORT]; // port Group configuration
} DEVCONFIG_DIO, FAR * LPDEVCONFIG_DIO;

/**************************************************************************
    DEVCONFIG_ADAM Definition
***************************************************************************/
typedef struct tagDEVCONFIG_ADAM
{
    DWORD   dwBoardID;        // board ID code
	USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usDelay;		// delay time before reading response; unit-ms
	USHORT  usTimeOut;		  // time out for reading response; unit-ms
	USHORT  usRetry;		  // retry	
    USHORT  usAlarmEnabled;   // 0-disable, 1-enabled
    USHORT  usSlotNo;         // slot number
    USHORT  usChecksumEnabled; // checksum enabled
	USHORT  usDataFormat;	   // 0-Dec, 2-Hex; for 5080
	USHORT	usCounterMode;		// 0-counter mode 0; 1-counter mode 1; 2-freq mode
// Modified: 9/18/2002  by  Wangtao
    CHAR   szPreamble[20];   // prefix strings
    CHAR   szPostamble[20];  // postfix strings
} DEVCONFIG_ADAM, FAR * LPDEVCONFIG_ADAM;

/**************************************************************************
    DEVCONFIG_DEVNET Definition
***************************************************************************/
typedef struct tagDEVCONFIG_DEVNET
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDelayTime;      // EPR
    USHORT  usAlarmEnabled;   // 0-disable, 1-enabled
    DWORD   dwMemoryAddress;  // beginning address of memory mapped IO to be controlled
    DWORD   dwMemoryCount;    // number of bytes to be controlled
    USHORT  usMyMacID;        // host MAC ID
    USHORT  usBaudRate;       // baud rate
    USHORT  usPortNum;        // port number
    USHORT  usSlotNo;         // slot number
    USHORT  usMacID;          // MAC ID
    USHORT  usEventEnabled;   // 0-disable, 1-enabled
    CHAR    APEventName[15];   // Event name
    HANDLE  hEventAP;         // Event handle
    WORD    wStatus;      // status of single slot (device)
} DEVCONFIG_DEVNET, FAR * LPDEVCONFIG_DEVNET;

/**************************************************************************
    DEVCONFIG_QCOUNTER Definition
***************************************************************************/
typedef struct tagDEVCONFIG_QCOUNTER
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usDMA;            // DMA level
    USHORT  usTimerClock;     // clock selection
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    USHORT  usCascadeMode;    // Cascade Mode ,=0 no cascade, =1 cascade
    USHORT  usTimeBase;       // Timer Latch setting for time base
    USHORT  usTimeDivider;    // Timer Latch setting for time divider
} DEVCONFIG_QCOUNTER, FAR * LPDEVCONFIG_QCOUNTER;

/**************************************************************************
    DEVCONFIG_836 Definition
***************************************************************************/
typedef struct tagDEVCONFIG_836
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    USHORT  usCountEdge;      // =0 Positive, =1 Negative
    // Joshua change these two parameters 08-08-2003
    USHORT  usFilterEnabled[6];  // 0-disable, 1-enable
    DWORD   dwMaxInFreq[6];      // Max input frequency in Hz
} DEVCONFIG_836, FAR * LPDEVCONFIG_836;

/**************************************************************************
    Direct I/O Definition
***************************************************************************/
typedef struct tagDEVCONFIG_IO
{
    DWORD   dwBoardID;         // board ID code
    USHORT  usBaseAddress;     // beginning address of ports to be controlled
    USHORT  usInterrupt;       // interrupt number
    USHORT  usIoPortCount;     // number of bytes to be controlled
    USHORT  usAllowConflicts;  // 1 allow IO conflicts
		CHAR    szDescription[50]; // Description
} DEVCONFIG_IO, FAR * LPDEVCONFIG_IO;

/**************************************************************************
    DEVCONFIG_175X Definition
***************************************************************************/
typedef struct tagDEVCONFIG_175X
{
    DWORD   dwBoardID;        // board ID code
	USHORT	usCardNo;		  // card no of this series
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usInterrupt;      // interrupt number
    USHORT  usIoPortCount;    // number of bytes to be controlled
    USHORT  usAllowConflicts; // 1 allow IO conflicts
    USHORT  usIntMode;        // divide two parts, 0XBB0XAA (8 bits)
                              // this bit 7 and 3 fixed to zero
                              // the meant of BB port1 mode
                              // the meant of AA port0 mode
                              // bit 6 is port 1 interrupt trigger edge
                              // bit 2 is port 0 interrupt trigger edge
                              // (= 1 Rising, = 0 falling)
    USHORT  usCascadeMode;    // cascade Mode ,=0 no cascade, =1 cascade
    DWORD   dwTimer1Count;    // timer1 (hi is Counter1, lo is Counter0)
    USHORT  dwCounter2Count;  // counter 2 count value
	WORD    wDigPortCfg[MAX_DIO_PORT];  // port configuration for input or output
} DEVCONFIG_175X, FAR * LPDEVCONFIG_175X;

typedef struct  _AD_WRITE_INPUT {
    ULONG   PortNumber;     // Port # to write to
    union   {               // Data to be output to port
        ULONG   LongData;
        USHORT  ShortData;
        UCHAR   CharData;
    };
}   AD_WRITE_INPUT;

/**************************************************************************
    DEVCONFIG_SIMU Definition
***************************************************************************/
typedef struct tagDEVCONFIG_SIMU
{
    DWORD   dwBoardID;        // board ID code
    USHORT  usBaseAddress;    // beginning address of ports to be controlled
    USHORT  usSimulate;     // 1: Simulate IO
    USHORT  usDataType;       // 0: Float, 1: Long, 2:Byte
} DEVCONFIG_SIMU, FAR * LPDEVCONFIG_SIMU;

#ifdef __cplusplus
}
#endif

#endif
