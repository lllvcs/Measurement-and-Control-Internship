/***************************************************************************
 Module Name: DRIVER.H
 Purpose: the declaration of functions, data structures, status codes,
          constants, and messages
 Version: 3.01
 Date: 04/16/1998
 Copyright (c) 1996 Advantech Corp. Ltd.
 All rights reserved.
****************************************************************************/
#pragma pack(push, 8)

#ifndef _INC_DRIVER
#define _INC_DRIVER

#include "OS.H"
//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
#include "Event.H"
#include "Paras.H"
///////////////////// V2.0B /////////////////////
#include "USBErrorCode.h"   // Dean add for USE device        

#ifdef _WIN31
#define FLOAT   float
#define CHAR    char
#define USHORT  unsigned short
#define SHORT   short
#define ULONG   unsigned long
#endif
#ifdef _WIN64
#define LONG_PTR LONG_PTR
#define ULONG_PTR ULONG_PTR
#else
#define LONG_PTR LONG
#define ULONG_PTR ULONG
#ifndef GWLP_USERDATA
#define GWLP_USERDATA GWL_USERDATA
#endif
#ifndef GetWindowLongPtr
#define GetWindowLongPtr GetWindowLong
#endif
#ifndef SetWindowLongPtr
#define SetWindowLongPtr SetWindowLong
#endif
#endif
#ifdef __cplusplus
extern "C"
{
#endif

#define     PUBLIC   extern
#define     PRIVATE  static

/****************************************************************************
    Constant Definition
***************************************************************************/
#define     MaxDev                255 // max. # of devices
#define     MaxDevNameLen         64  // max lenght of device name
#define     MaxGroup              6
#define     MaxPort               3
#define     MaxErrMsgLen          80
#define     MAX_DEVICE_NAME_LEN   64
#define     MAX_DRIVER_NAME_LEN   16
#define     MAX_DAUGHTER_NUM      16    // V2.0 mod 8 to 16
#define     MAX_DIO_PORT          48
#define     MAX_AO_RANGE          32    // V2.0 mod 8 to 16

#define     LOCAL                   0
#define     REMOTE                  1
#define     REMOTE1                 REMOTE+1      // For PCL-818L JP7 = 5V
#define     REMOTE2                 REMOTE1+1     // For PCL-818L JP7 = 10V
#define     NONPROG                 LOCAL
#define     PROG                    REMOTE
#define     INTERNAL                0
#define     EXTERNAL                1
#define     SINGLEENDED             0
#define     DIFFERENTIAL            1
#define     BIPOLAR                 0
#define     UNIPOLAR                1
#define     PORTA                   0
#define     PORTB                   1
#define     PORTC                   2
#define     INPORT                  0
#define     OUTPORT                 1

/***************************************************************************
    Define board vendor ID
**************************************************************************/
#define    AAC      0x0000                     //Advantech
#define    MB       0x1000                     //Keithley/MetraByte
#define    BB       0x2000                     //Burr Brown
#define    GRAYHILL 0x3000                     //Grayhill
#define    KGS      0x4000

/****************************************************************************
    Define DAS I/O CardType ID.
****************************************************************************/
#define      NONE           0x00              // not available
	
//\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
// Notes:
// change the software defined ID from Board ID to CardType ID.
// Board ID is especially used as the term of hardware dip-switch ID.
//
//Advantech CardType ID
///////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/
//Advantech CardType ID
#define      BD_DEMO        (AAC | 0x00)     // demo board
#define      BD_PCL711      (AAC | 0x01)     // PCL-711 board
#define      BD_PCL812      (AAC | 0x02)     // PCL-812 board
#define      BD_PCL812PG    (AAC | 0x03)     // PCL-812PG board
#define      BD_PCL718      (AAC | 0x04)     // PCL-718 board
#define      BD_PCL818      (AAC | 0x05)     // PCL-818 board
#define      BD_PCL814      (AAC | 0x06)     // PCL-814 board
#define      BD_PCL720      (AAC | 0x07)     // PCL-722 board
#define      BD_PCL722      (AAC | 0x08)     // PCL-720 board
#define      BD_PCL724      (AAC | 0x09)     // PCL-724 board
#define      BD_AD4011      (AAC | 0x0a)     // ADAM 4011 Module
#define      BD_AD4012      (AAC | 0x0b)     // ADAM 4012 Module
#define      BD_AD4013      (AAC | 0x0c)     // ADAM 4013 Module
#define      BD_AD4021      (AAC | 0x0d)     // ADAM 4021 Module
#define      BD_AD4050      (AAC | 0x0e)     // ADAM 4050 Module
#define      BD_AD4060      (AAC | 0x0f)     // ADAM 4060 Module
#define      BD_PCL711B     (AAC | 0x10)     // PCL-711B
#define      BD_PCL818H     (AAC | 0x11)     // PCL-818H
#define      BD_PCL814B     (AAC | 0x12)     // PCL-814B
#define      BD_PCL816      (AAC | 0x13)     // PCL-816
#define      BD_814_DIO_1   (AAC | 0x14)     // PCL-816/814B 8255 DIO module
#define      BD_814_DA_1    (AAC | 0x15)     // PCL-816/814B 12 bit D/A module
#define      BD_816_DA_1    (AAC | 0x16)     // PCL-816/814B 16 bit D/A module
#define      BD_PCL830      (AAC | 0x17)     // PCL-830 9513A Counter Card
#define      BD_PCL726      (AAC | 0x18)     // PCL-726 D/A card
#define      BD_PCL727      (AAC | 0x19)     // PCL-727 D/A card
#define      BD_PCL728      (AAC | 0x1a)     // PCL-728 D/A card
#define      BD_AD4052      (AAC | 0x1b)     // ADAM 4052 Module
#define      BD_AD4014D     (AAC | 0x1c)     // ADAM 4014D Module
#define      BD_AD4017      (AAC | 0x1d)     // ADAM 4017 Module
#define      BD_AD4080D     (AAC | 0x1e)     // ADAM 4080D Module
#define      BD_PCL721      (AAC | 0x1f)     // PCL-721 32-bit Digital in
#define      BD_PCL723      (AAC | 0x20)     // PCL-723 24-bit Digital in
#define      BD_PCL818L     (AAC | 0x21)     // PCL-818L
#define      BD_PCL818HG    (AAC | 0x22)     // PCL-818HG
#define      BD_PCL1800     (AAC | 0x23)     // PCL-1800
#define      BD_PAD71A      (AAC | 0x24)     // PCIA-71A
#define      BD_PAD71B      (AAC | 0x25)     // PCIA-71B
#define      BD_PCR420      (AAC | 0x26)     // PCR-420
#define      BD_PCL731      (AAC | 0x27)     // PCL-731 48-bit Digital I/O card
#define      BD_PCL730      (AAC | 0x28)     // PCL-730 board
#define      BD_PCL813      (AAC | 0x29)     // PCL-813 32-channel A/D card
#define      BD_PCL813B     (AAC | 0x2a)     // PCL-813B 32-channel A/D card
#define      BD_PCL818HD    (AAC | 0x2b)     // PCL-818HD
#define      BD_PCL725      (AAC | 0x2c)     // PCL-725 digital I/O card
#define      BD_PCL732      (AAC | 0x2d)     // PCL-732 high speed DIO card
#define      BD_AD4018      (AAC | 0x2e)     // ADAM 4018 Module
#define      BD_814_TC_1    (AAC | 0x2f)     // PCL-816/814B 16 bit TC module
#define      BD_PAD71C      (AAC | 0x30)     // PCIA-71C
#define      BD_AD4024      (AAC | 0x31)     // ADAM 4024
#define      BD_AD5017      (AAC | 0x32)     // ADAM 5017
#define      BD_AD5018      (AAC | 0x33)     // ADAM 5018
#define      BD_AD5024      (AAC | 0x34)     // ADAM 5024
#define      BD_AD5051      (AAC | 0x35)     // ADAM 5051
#define      BD_AD5060      (AAC | 0x36)     // ADAM 5060
#define      BD_PCM3718     (AAC | 0x37)     // PCM-3718
#define      BD_PCM3724     (AAC | 0x38)     // PCM-3724
#define      BD_MIC2718     (AAC | 0x39)     // MIC-2718
#define      BD_MIC2728     (AAC | 0x3a)     // MIC-2728
#define      BD_MIC2730     (AAC | 0x3b)     // MIC-2730
#define      BD_MIC2732     (AAC | 0x3c)     // MIC-2732
#define      BD_MIC2750     (AAC | 0x3d)     // MIC-2750
#define      BD_MIC2752     (AAC | 0x3e)     // MIC-2752
#define      BD_PCL733      (AAC | 0x3f)     // PCL-733
#define      BD_PCL734      (AAC | 0x40)     // PCL-734
#define      BD_PCL735      (AAC | 0x41)     // PCL-735
#define      BD_AD4018M     (AAC | 0x42)     // ADAM 4018M Module
#define      BD_AD4080      (AAC | 0x43)     // ADAM 4080 Module
#define      BD_PCL833      (AAC | 0x44)     // PCL-833
#define      BD_PCA6157     (AAC | 0x45)     // PCA-6157
#define      BD_PCA6149     (AAC | 0x46)     // PCA-6149
#define      BD_PCA6147     (AAC | 0x47)     // PCA-6147
#define      BD_PCA6137     (AAC | 0x48)     // PCA-6137
#define      BD_PCA6145     (AAC | 0x49)     // PCA-6145
#define      BD_PCA6144     (AAC | 0x4a)     // PCA-6144
#define      BD_PCA6143     (AAC | 0x4b)     // PCA-6143
#define      BD_PCA6134     (AAC | 0x4c)     // PCA-6134
#define      BD_AD5056      (AAC | 0x4d)     // ADAM 5056 for Device Net
#define      BD_DN5017      (AAC | 0x4e)     // ADAM 5017 for Device Net
#define      BD_DN5018      (AAC | 0x4f)     // ADAM 5018 for Device Net
#define      BD_DN5024      (AAC | 0x50)     // ADAM 5024 for Device Net
#define      BD_DN5051      (AAC | 0x51)     // ADAM 5051 for Device Net
#define      BD_DN5056      (AAC | 0x52)     // ADAM 5056 for Device Net
#define      BD_DN5060      (AAC | 0x53)     // ADAM 5060 for Device Net
#define      BD_PCL836      (AAC | 0x54)     // PCL-836
#define      BD_PCL841      (AAC | 0x55)     // PCL-841
#define      BD_DN5050      (AAC | 0x56)     // ADAM 5050 for DeviceNet
#define      BD_DN5052      (AAC | 0x57)     // ADAM 5052 for DeviceNet
#define      BD_AD5050      (AAC | 0x58)     // ADAM 5050 for RS-485
#define      BD_AD5052      (AAC | 0x59)     // ADAM 5052 for RS-485
#define      BD_PCM3730     (AAC | 0x5a)     // PCM-3730
#define      BD_AD4011D     (AAC | 0x5b)     // ADAM 4011D
#define      BD_AD4016      (AAC | 0x5c)     // ADAM 4016
#define      BD_AD4053      (AAC | 0x5d)     // ADAM 4053
#define      BD_PCI1750     (AAC | 0x5e)     // PCI-1750
#define      BD_PCI1751     (AAC | 0x5f)     // PCI-1751
#define      BD_PCI1710     (AAC | 0x60)     // PCI-1710
#define      BD_PCI1712     (AAC | 0x61)     // PCI-1712
#define      BD_AD5068      (AAC | 0x62)     // ADAM 5068
#define      BD_AD5013      (AAC | 0x63)     // ADAM 5013
#define      BD_AD5017H     (AAC | 0x64)     // ADAM 5017H
#define      BD_AD5080      (AAC | 0x65)     // ADAM 5080 
#define      BD_MIC2760     (AAC | 0x66)     // MIC-2760
#define      BD_PCI1710HG   (AAC | 0x67)     // PCI-1710HG
#define      BD_PCI1713     (AAC | 0x68)     // PCI-1713
#define      BD_PCI1753     (AAC | 0x69)     // PCI-1753
#define      BD_PCI1760     (AAC | 0x6a)     // PCI-1760
#define      BD_PCI1720     (AAC | 0x6b)     // PCI-1720
#define      BD_PCL752      (AAC | 0x6c)     // PCL-772
#define      BD_PCM3718H    (AAC | 0x6d)     // PCM-3718H
#define      BD_PCM3718HG   (AAC | 0x6e)     // PCM-3718HG
#define      BD_DN5068      (AAC | 0x6f)     // ADAM 5068 for Device Net
#define      BD_DN5013      (AAC | 0x70)     // ADAM 5013 for Device Net
#define      BD_DN5017H     (AAC | 0x71)     // ADAM 5017H for Device Net
#define      BD_DN5080      (AAC | 0x72)     // ADAM 5080 for Device Net (unavailable)
#define      BD_PCI1711     (AAC | 0x73)     // PCI-1711
#define      BD_PCI1711L    (AAC | 0x75)     // PCI-1711
#define      BD_PCI1716     (AAC | 0x74)     // PCI-1716
#define      BD_PCI1731     (AAC | 0x75)     // PCI-1731
#define      BD_AD5051D     (AAC | 0x76)     // ADAM 5051D 
#define      BD_AD5056D     (AAC | 0x77)     // ADAM 5056D 
#define      BD_DN5051D     (AAC | 0x78)     // ADAM 5051D for Device Net
#define      BD_DN5056D     (AAC | 0x79)     // ADAM 5056D for Device Net
#define      BD_SIMULATE    (AAC | 0x7a)     // Simulate IO
#define      BD_PCI1754     (AAC | 0x7b)     // PCI-1754
#define      BD_PCI1752     (AAC | 0x7c)     // PCI-1752
#define      BD_PCI1756     (AAC | 0x7d)     // PCI-1756
#define      BD_PCL839      (AAC | 0x7e)     // PCL-839
#define      BD_PCM3725     (AAC | 0x7f)     // PCM-3725
#define      BD_PCI1762     (AAC | 0x80)     // PCI-1762
#define      BD_PCI1721     (AAC | 0x81)     // PCI-1721
#define      BD_PCI1761     (AAC | 0x82)     // PCI-1761
#define      BD_PCI1723     (AAC | 0x83)     // PCI-1723
#define      BD_AD4019      (AAC | 0X84)     // ADAM 4019 Module
#define      BD_AD5055      (AAC | 0X85)     // ADAM 5055 Module
#define      BD_AD4015      (AAC | 0X86)     // ADAM 4015 Module
#define      BD_PCI1730     (AAC | 0x87)     // PCI-1730
#define      BD_PCI1733     (AAC | 0x88)     // PCI-1733
#define      BD_PCI1734     (AAC | 0x89)     // PCI-1734
#define      BD_MIC2750A    (AAC | 0x8A)     // MIC-2750A
#define      BD_MIC2718A    (AAC | 0x8B)     // MIC-2718A
#define      BD_AD4017P     (AAC | 0X8c)     // ADAM 4017P Module
#define      BD_AD4051      (AAC | 0X8d)     // ADAM 4051 Module
#define      BD_AD4055      (AAC | 0X8e)     // ADAM 4055 Module
#define      BD_AD4018P     (AAC | 0x8f)     // ADAM 4018P Module
#define      BD_PCI1710L    (AAC | 0x90)     // PCI-1710L
#define      BD_PCI1710HGL  (AAC | 0x91)     // PCI-1710HGL
#define      BD_AD4068      (AAC | 0x92)     // ADAM-4068
#define      BD_PCM3712     (AAC | 0x93)     // PCM-3712
#define      BD_PCM3723     (AAC | 0x94)     // PCM-3723

#ifdef _WIN32_WCE
//Add by Ann.He 03/02/21
#define      BD_DATALGR_KR1     (AAC | 0x81)     // PCM-KR1
//end
#endif

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
#define      BD_PCI1780     (AAC | 0x95)     // PCI-1780
#define      BD_CPCI3756    (AAC | 0x96)     // CPCI-3756
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
#define      BD_PCI1755     (AAC | 0x97)     // PCI-1755
#define      BD_PCI1714     (AAC | 0x98)     // PCI-1714
///////////////////// V2.0B ////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.1 /////////////////////
#define      BD_PCI1757     (AAC | 0x99)     // PCI-1757
///////////////////// V2.1 ////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.1a /////////////////////
#define      BD_MIC3716    (AAC | 0x9A)     // MIC-3716
#define      BD_MIC3761    (AAC | 0x9B)     // MIC-3761
#define      BD_MIC3753    (AAC | 0x9C)     // MIC-3753
#define      BD_MIC3780    (AAC | 0x9D)     // MIC-3780
///////////////////// V2.1a ////////////////////

#define      BD_PCI1724    (AAC | 0x9E)     // PCI-1724
#define      BD_AD4015T    (AAC | 0x9F)     // ADAM 4015T Module
#define      BD_UNO2052    (AAC | 0xA0)     // UNO  2052 Module
#define      BD_PCI1680    (AAC | 0xA1)     // PCI-1680

//\\\\\\\\\\\\\\\\\\\ V2.2 /////////////////////
#define      BD_PCL839P    (AAC | 0xA2)     // PCI-839+
#define      BD_PCI1758UDI     (AAC | 0xA3)     // PCI-1758UDI
#define      BD_PCI1758UDO     (AAC | 0xA4)     // PCI-1758UDO
#define      BD_PCI1747     (AAC | 0xA5)     // PCI-1747
#define      BD_PCM3780     (AAC | 0xA6)     // PCM-3780 
#define      BD_MIC3747     (AAC | 0xA7)     // MIC-3747
#define      BD_PCI1758UDIO    (AAC | 0xA8)     // PCI-1758UDIO
#define      BD_PCI1712L    (AAC | 0xA9)     // PCI-1712L
#define      BD_AD4056S     (AAC | 0xAA)     // ADAM 4056S Module
#define      BD_AD4056SO    (AAC | 0xAB)     // ADAM 4056SO Module
#define      BD_PCI1763UP   (AAC | 0xAC)     // PCI-1763UP
#define      BD_PCI1736UP   (AAC | 0xAD)     // PCI-1736UP
#define      BD_PCI1714UL   (AAC | 0xAE)     // PCI-1714UL
#define      BD_MIC3714     (AAC | 0xAF)     // MIC-3714
#define      BD_AD5069      (AAC | 0xB0)     // ADAM 5069 Module
#define      BD_PCM3718HO   (AAC | 0xB1)     // PCM-3718HO
#define      BD_PCI1741U    (AAC | 0xB3)     // PCI-1741U. 0xB2 reserved to MIC-3680
#define      BD_MIC3723     (AAC | 0xB4)     // MIC-3723 
#define      BD_PCI1718HDU  (AAC | 0xB5)     // PCI-1718HDU
#define      BD_MIC3758DIO  (AAC | 0xB6)     // MIC-3758DIO
#define      BD_PCI1727U    (AAC | 0xB7)     // PCI-1727U
#define      BD_PCI1718HGU  (AAC | 0xB8)     // PCI-1718HGU
///////////////////// V2.2 ////////////////////

#define      BD_PCI1715U    (AAC | 0xB9)     // PCI-1715U
#define      BD_PCI1716L    (AAC | 0xBA)     // PCI-1716L
#define      BD_PCI1735U    (AAC | 0xBB)     // PCI-1735U

#define      BD_USB4711     (AAC | 0xBC)     // USB-4711
#define      BD_PCI1737U    (AAC | 0xBD)     // PCI-1737U
#define      BD_PCI1739U    (AAC | 0xBE)     // PCI-1739U
#define      BD_AD4069      (AAC | 0xBF)     // ADAM 4069 Module
#define      BD_PCI1742U    (AAC | 0xC0)     // PCI-1742U
#define      BD_AD4117      (AAC | 0xC1)     // ADAM 4117 Module
#define      BD_AD4118      (AAC | 0xC2)     // ADAM 4118 Module
#define      BD_AD4150      (AAC | 0xC3)     // ADAM 4150 Module
#define      BD_AD4168      (AAC | 0xC4)     // ADAM 4168 Module
#define      BD_AD4022T     (AAC | 0xC5)     // ADAM 4022T Module
#define      BD_USB4718     (AAC | 0xC6)     // USB-4718
#define      BD_MIC3755     (AAC | 0xC7)     // MIC3755
#define      BD_USB4761     (AAC | 0xC8)     // USB4761
#define      BD_AD4019P     (AAC | 0xC9)     // ADAM 4019 Plus Module
#define      BD_AD5056S     (AAC | 0xCA)     // ADAM 5056S Module
#define      BD_AD5056SO    (AAC | 0xCB)     // ADAM 5056SO Module
#define      BD_PCI1784     (AAC | 0XCC)     // PCI-1784
#define      BD_USB4716     (AAC | 0xCD)     // USB4716
#define      BD_PCI1752U    (AAC | 0xCE)     // PCI-1752U
#define      BD_PCI1752USO  (AAC | 0xCF)     // PCI-1752USO
#define      BD_USB4751     (AAC | 0xD0)     // USB4751
#define      BD_USB4751L    (AAC | 0xD1)     // USB4751L
#define      BD_USB4750     (AAC | 0xD2)     // USB4750
#define      BD_MIC3713     (AAC | 0xD3)     // MIC-3713
#define      BD_USB4813     (AAC | 0xD4)     // USB4813
#define      BD_USB4823     (AAC | 0xD5)     // USB4823
#define      BD_USB4878     (AAC | 0xD6)     // USB4878
#define      BD_USB4879     (AAC | 0xD7)     // USB4879
#define      BD_USB4711A    (AAC | 0xD8)     // USB-4711A

#define      BD_PCM3753P    (AAC | 0xD9)     // PCM-3753P
#define      BD_PCM3784     (AAC | 0xDA)     // PCM-3784
#define      BD_PCM3761I    (AAC | 0xDB)     // PCM-3761I
#define      BD_MIC3751     (AAC | 0xDC)     // MIC-3751
#define      BD_PCM3730I    (AAC | 0xDD)     // PCM-3730I
#define      BD_PCM3813I    (AAC | 0xE0)     // PCM-3813P

#define		 BD_PCIE1744	(AAC | 0xE1)     //PCIE-1744
#define		 BD_PCI1730U	(AAC | 0xE2)	 // PCI-1730U
#define		 BD_PCI1760U	(AAC | 0xE3)	 //PCI-1760U
#define		 BD_MIC3720		(AAC | 0xE4)	 //MIC-3720

#define      BD_USB4913     (AAC | 0xE5)      // USB-4913
#define      BD_USB4916     (AAC | 0xE6)      // USB-4916
#define      BD_USB4919     (AAC | 0xE7)      // USB-4919
#define      BD_USB4923     (AAC | 0xE8)      // USB-4923

#define      BD_PCM3810I    (AAC | 0xE9)      // PCM-3810I
#define      BD_USB4702     (AAC | 0xEA)     // USB4716
#define      BD_USB4704     (AAC | 0xEB)     // USB4716
#define      BD_PCM3810I_HG (AAC | 0xEC)     // PCM-3810I_HG
#define	     BD_PCI1713U    (AAC | 0xED)	 //PCI-1713U



#define      BD_MICRODAC    (GRAYHILL | 0x1) // Grayhill MicroDAC Board ID
#define      BD_GIA10       (KGS | 0x01)     // KGS GIA-10 module Board ID

/*****************************************************************************
    Define Expansion Board ID.
*****************************************************************************/
#define AAC_EXP            (AAC | 0x00000100)   //Advantech expansion bits

//define Advantech expansion board ID.
#define      BD_PCLD780     0x00000000          // PCLD-780
#define      BD_PCLD789     (AAC_EXP | 0x0)     // PCLD-789
#define      BD_PCLD779     (AAC_EXP | 0x1)     // PCLD-779
#define      BD_PCLD787     (AAC_EXP | 0x2)     // PCLD-787
#define      BD_PCLD8115    (AAC_EXP | 0x3)     // PCLD-8115
#define      BD_PCLD770     (AAC_EXP | 0x4)     // PCLD-770
#define      BD_PCLD788     (AAC_EXP | 0x5)     // PCLD-788
#define      BD_PCLD8710    (AAC_EXP | 0x6)     // PCLD-8710
#define      BD_PCLD8712    (AAC_EXP | 0x7)     // PCLD-8712

/****************************************************************************
    Define subsection identifier
****************************************************************************/
#define     DAS_AISECTION       0x1         // A/D subsection
#define     DAS_AOSECTION       0x2         // D/A sbusection
#define     DAS_DISECTION       0x3         // Digital input subsection
#define     DAS_DOSECTION       0x4         // Digital output sbusection
#define     DAS_TEMPSECTION     0x5         // thermocouple section
#define     DAS_ECSECTION       0x6         // Event count subsection
#define     DAS_FMSECTION       0x7         // frequency measurement section
#define     DAS_POSECTION       0x8         // pulse output section
#define     DAS_ALSECTION       0x9         // alarm section
#define     MT_AISECTION        0x0a        // monitoring A/D subsection
#define     MT_DISECTION        0x0b        // monitoring D/I subsection

/***************************************************************************
    Define Transfer Mode
****************************************************************************/
#define     POLLED_MODE          0x0         // software transfer
#define     DMA_MODE             0x1         // DMA transfer
#define     INTERRUPT_MODE       0x2         // Interrupt transfer

/***************************************************************************
    Define Acquisition Mode
****************************************************************************/
#define     FREE_RUN             0
#define     PRE_TRIG             1
#define     POST_TRIG            2
#define     POSITION_TRIG        3

/***************************************************************************
    Define Comparator's Condition
****************************************************************************/
#define     NOCONDITION          0
#define     LESS                 1
#define     BETWEEN              2
#define     GREATER              3
#define     OUTSIDE              4

/***************************************************************************
    Define Channel
****************************************************************************/
#define      ADV_CHANNEL0      0x01
#define      ADV_CHANNEL1      0x02
#define      ADV_CHANNEL2      0x04
#define      ADV_CHANNEL3      0x08
#define      ADV_CHANNEL4      0x10
#define      ADV_CHANNEL5      0x20
#define      ADV_CHANNEL6      0x40
#define      ADV_CHANNEL7      0x80

/**************************************************************************
    Define Status Code
***************************************************************************/
#define SUCCESS                  0
#define DrvErrorCode             1
#define KeErrorCode              100
#define DnetErrorCode            200
#define GeniDrvErrorCode         300
#define OPCErrorCode             1000
#define MemoryAllocateFailed     (DrvErrorCode + 0)
#define ConfigDataLost           (DrvErrorCode + 1)
#define InvalidDeviceHandle      (DrvErrorCode + 2)
#define AIConversionFailed       (DrvErrorCode + 3)
#define AIScaleFailed            (DrvErrorCode + 4)
#define SectionNotSupported      (DrvErrorCode + 5)
#define InvalidChannel           (DrvErrorCode + 6)
#define InvalidGain              (DrvErrorCode + 7)
#define DataNotReady             (DrvErrorCode + 8)
#define InvalidInputParam        (DrvErrorCode + 9)
#define NoExpansionBoardConfig   (DrvErrorCode + 10)
#define InvalidAnalogOutValue    (DrvErrorCode + 11)
#define ConfigIoPortFailed       (DrvErrorCode + 12)
#define CommOpenFailed           (DrvErrorCode + 13)
#define CommTransmitFailed       (DrvErrorCode + 14)
#define CommReadFailed           (DrvErrorCode + 15)
#define CommReceiveFailed        (DrvErrorCode + 16)
#define CommConfigFailed         (DrvErrorCode + 17)
#define CommChecksumError        (DrvErrorCode + 18)
#define InitError                (DrvErrorCode + 19)
#define DMABufAllocFailed        (DrvErrorCode + 20)
#define IllegalSpeed             (DrvErrorCode + 21)
#define ChanConflict             (DrvErrorCode + 22)
#define BoardIDNotSupported      (DrvErrorCode + 23)
#define FreqMeasurementFailed    (DrvErrorCode + 24)
#define CreateFileFailed         (DrvErrorCode + 25)
#define FunctionNotSupported     (DrvErrorCode + 26)
#define LoadLibraryFailed        (DrvErrorCode + 27)
#define GetProcAddressFailed     (DrvErrorCode + 28)
#define InvalidDriverHandle      (DrvErrorCode + 29)
#define InvalidModuleType        (DrvErrorCode + 30)
#define InvalidInputRange        (DrvErrorCode + 31)
#define InvalidWindowsHandle     (DrvErrorCode + 32)
#define InvalidCountNumber       (DrvErrorCode + 33)
#define InvalidInterruptCount    (DrvErrorCode + 34)
#define InvalidEventCount        (DrvErrorCode + 35)
#define OpenEventFailed          (DrvErrorCode + 36)
#define InterruptProcessFailed   (DrvErrorCode + 37)
#define InvalidDOSetting         (DrvErrorCode + 38)
#define InvalidEventType         (DrvErrorCode + 39)
#define EventTimeOut             (DrvErrorCode + 40)
#define InvalidDmaChannel        (DrvErrorCode + 41)
#define IntDamChannelBusy        (DrvErrorCode + 42)
//
#define CheckRunTimeClassFailed  (DrvErrorCode + 43)
#define CreateDllLibFailed       (DrvErrorCode + 44)
#define ExceptionError           (DrvErrorCode + 45)
#define RemoveDeviceFailed       (DrvErrorCode + 46)
#define BuildDeviceListFailed    (DrvErrorCode + 47)
#define NoIOFunctionSupport      (DrvErrorCode + 48)

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
#define ResourceConflict        (DrvErrorCode + 49)
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

//\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
#define InvalidClockSource		 (DrvErrorCode + 50)
#define InvalidPacerRate		 (DrvErrorCode + 51)
#define InvalidTriggerMode     (DrvErrorCode + 52)
#define InvalidTriggerEdge     (DrvErrorCode + 53)
#define InvalidTriggerSource   (DrvErrorCode + 54)
#define InvalidTriggerVoltage  (DrvErrorCode + 55)
#define InvalidCyclicMode      (DrvErrorCode + 56)
#define InvalidDelayCount      (DrvErrorCode + 57)
#define InvalidBuffer          (DrvErrorCode + 58)
#define OverloadedPCIBus       (DrvErrorCode + 59)
#define OverloadedInterruptRequest (DrvErrorCode + 60)
///////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/

//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
#define ParamNameNotSupported      (DrvErrorCode + 61)
///////////////////// V2.0C /////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.2B /////////////////////
#define CheckEventFailed           (DrvErrorCode + 62)
///////////////////// V2.2B /////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.2C /////////////////////
#define InvalidPort                (DrvErrorCode + 63)
#define DaShiftBusy                (DrvErrorCode + 64)
///////////////////// V2.2C /////////////////////
#define ThermoCoupleDisconnect     (DrvErrorCode + 65)


/*#define NoSerialFunctionSupported   (DrvErrorCode + 49)
#define NoAiFunctionSupported      (DrvErrorCode + 50
#define NoAoFunctionSupported      (DrvErrorCode + 51)
#define NoDiFunctionSupported      (DrvErrorCode + 52)
#define NoDoFunctionSupported      (DrvErrorCode + 53)
#define NoAlarmFunctionSupported    (DrvErrorCode + 54)
#define NoCounterFunctionSupported  (DrvErrorCode + 55)
#define NoTempFunctionSupported      (DrvErrorCode + 56)
#define NoIOFunctionSupported      (DrvErrorCode + 57)*/
#define NoSerialFunctionSupported  (GeniDrvErrorCode + 5)
#define NoAiFunctionSupported      (GeniDrvErrorCode + 6)
#define NoAoFunctionSupported      (GeniDrvErrorCode + 7)
#define NoDiFunctionSupported      (GeniDrvErrorCode + 8)
#define NoDoFunctionSupported      (GeniDrvErrorCode + 9)
#define NoAlarmFunctionSupported   (GeniDrvErrorCode + 10)
#define NoCounterFunctionSupported (GeniDrvErrorCode + 11)
#define NoTempFunctionSupported    (GeniDrvErrorCode + 12)
#define NoIOFunctionSupported      (GeniDrvErrorCode + 13)

#define KeInvalidHandleValue     (KeErrorCode + 0)
#define KeFileNotFound           (KeErrorCode + 1)
#define KeInvalidHandle          (KeErrorCode + 2)
#define KeTooManyCmds            (KeErrorCode + 3)
#define KeInvalidParameter       (KeErrorCode + 4)
#define KeNoAccess               (KeErrorCode + 5)
#define KeUnsuccessful           (KeErrorCode + 6)
#define KeConInterruptFailure    (KeErrorCode + 7)
#define KeCreateNoteFailure      (KeErrorCode + 8)
#define KeInsufficientResources  (KeErrorCode + 9)
#define KeHalGetAdapterFailure   (KeErrorCode +10)
#define KeOpenEventFailure       (KeErrorCode +11)
#define KeAllocCommBufFailure    (KeErrorCode +12)
#define KeAllocMdlFailure        (KeErrorCode +13)
#define KeBufferSizeTooSmall     (KeErrorCode +14)

#define DNInitFailed              (DnetErrorCode + 1)
#define DNSendMsgFailed           (DnetErrorCode + 2)
#define DNRunOutOfMsgID           (DnetErrorCode + 3)
#define DNInvalidInputParam       (DnetErrorCode + 4)
#define DNErrorResponse           (DnetErrorCode + 5)
#define DNNoResponse              (DnetErrorCode + 6)
#define DNBusyOnNetwork           (DnetErrorCode + 7)
#define DNUnknownResponse         (DnetErrorCode + 8)
#define DNNotEnoughBuffer         (DnetErrorCode + 9)
#define DNFragResponseError       (DnetErrorCode + 10)
#define DNTooMuchDataAck          (DnetErrorCode + 11)
#define DNFragRequestError        (DnetErrorCode + 12)
#define DNEnableEventError        (DnetErrorCode + 13)
#define DNCreateOrOpenEventError  (DnetErrorCode + 14)
#define DNIORequestError          (DnetErrorCode + 15)
#define DNGetEventNameError       (DnetErrorCode + 16)
#define DNTimeOutError            (DnetErrorCode + 17)
#define DNOpenFailed              (DnetErrorCode + 18)
#define DNCloseFailed             (DnetErrorCode + 19)
#define DNResetFailed             (DnetErrorCode + 20)

#define WM_ATODNOTIFY            (WM_USER+200)
#define WM_DTOANOTIFY            (WM_USER+201)
#define WM_DIGINNOTIFY           (WM_USER+202)
#define WM_DIGOUTNOTIFY          (WM_USER+203)
#define WM_MTNOTIFY              (WM_USER+204)
#define WM_CANTRANSMITCOMPLETE   (WM_USER+205)
#define WM_CANMESSAGE            (WM_USER+206)
#define WM_CANERROR              (WM_USER+207)

// define the wParam in user window message
#define AD_NONE                  0  //AD Section
#define AD_TERMINATE             1
#define AD_INT                   2
#define AD_BUFFERCHANGE          3
#define AD_OVERRUN               4
#define AD_WATCHDOGACT           5
#define AD_TIMEOUT               6
#define DA_TERMINATE             0  // DA Section
#define DA_DMATC                 1
#define DA_INT                   2
#define DA_BUFFERCHANGE          3
#define DA_OVERRUN               4
#define DI_TERMINATE             0  // DI Section
#define DI_DMATC                 1
#define DI_INT                   2
#define DI_BUFFERCHANGE          3
#define DI_OVERRUN               4
#define DI_WATCHDOGACT           5
#define DO_TERMINATE             0  // DO Section
#define DO_DMATC                 1
#define DO_INT                   2
#define DO_BUFFERCHANGE          3
#define DO_OVERRUN               4
#define MT_ATOD                  0  // MT Section
#define MT_DIGIN                 1

#define CAN_TRANSFER             0  // CAN Section
#define CAN_RECEIVE              1
#define CAN_ERROR                2

/****************************************************************************
    define thermocopule type J, K, S, T, B, R, E
*****************************************************************************/
#define BTC  4
#define ETC  6
#define JTC  0
#define KTC  1
#define RTC  5
#define STC  2
#define TTC  3

/****************************************************************************
    define  temperature scale
*****************************************************************************/
#define     C  0       //Celsius
#define     F  1       //Fahrenheit
#define     R  2       // Rankine
#define     K  3       // Kelvin


/****************************************************************************
    define service type for COMEscape()
*****************************************************************************/
#define     EscapeFlushInput        1
#define     EscapeFlushOutput       2
#define     EscapeSetBreak          3
#define     EscapeClearBreak        4


/****************************************************************************
    define  gate mode
*****************************************************************************/
#define     GATE_DISABLED       0       // no gating
#define     GATE_HIGHLEVEL      1       // active high level
#define     GATE_LOWLEVEL       2       // active low level
#define     GATE_HIGHEDGE       3       // active high edge
#define     GATE_LOWEDGE        4       // active low edge


/****************************************************************************
    define input mode for PCL-833
*****************************************************************************/
#define     DISABLE             0       // disable mode
#define     ABPHASEX1           1       // Quadrature input X1
#define     ABPHASEX2           2       // Quadrature input X2
#define     ABPHASEX4           3       // Quadrature input X4
#define     TWOPULSEIN          4       // 2 pulse input
#define     ONEPULSEIN          5       // 1 pulse input

/****************************************************************************
    define latch source for PCL-833 and PCI-1784
*****************************************************************************/
#define     SWLATCH             0       // S/W read latch data
#define     INDEXINLATCH        1       // Index-in latch data
#define     DI0LATCH            2       // DI0 latch data
#define     DI1LATCH            3       // DI1 latch data
#define     TIMERLATCH          4       // Timer latch data
#define     DI2LATCH            5
#define     DI3LATCH            6

/****************************************************************************
    define timer base mode for PCL-833
*****************************************************************************/
#define     TPOINT1MS     0       //    0.1 ms timer base
#define     T1MS          1       //    1   ms timer base
#define     T10MS         2       //   10   ms timer base
#define     T100MS        3       //  100   ms timer base
#define     T1000MS       4       // 1000   ms timer base

/****************************************************************************
	define timer base mode for PCL-1784
*****************************************************************************/
#define     T50KHZ        0       //    50KHZ timer base
#define     T5KHZ         1       //    5KHZ  timer base
#define     T500HZ        2       //    500HZ timer base
#define     T50HZ         3       //    50HZ  timer base
#define     T5HZ          4       //    5HZ   timer base

/****************************************************************************
	define counter lock type for PCL-1784
*****************************************************************************/
#define    OVERFLOWLOCK  1
#define    UNDERFLOWLOCK 2
#define    OVERUNDERLOCK 3

/****************************************************************************
	define counter indicator type for PCL-1784
*****************************************************************************/
#define    OVERCOMPLEVEL  0X1
#define    OVERCOMPPULSE  0X2
#define    UNDERCOMPLEVEL 0X4
#define    UNDERCOMPPULSE 0X8


/****************************************************************************
    define clock source for PCL-833
*****************************************************************************/
#define     SYS8MHZ          0       // 8 MHZ system clock
#define     SYS4MHZ          1       // 4 MHZ system clock
#define     SYS2MHZ          2       // 2 MHZ system clock
#define     SYS1MHZ          3

/****************************************************************************
    define cascade mode for PCL-833
*****************************************************************************/
#define     NOCASCADE           0       // 24-bit(no cascade)
#define     CASCADE             1       // 48-bit(CH1, CH2 cascade)

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
// ----------------------------------------------------------------------------
// define parameter for PCI1780
// ----------------------------------------------------------------------------
// define the counter mode register parameter
// CM0~CM1
#define		PA_MODE_ACT_HIGH_TC_PULSE		0x0000 // default value
#define		PA_MODE_ACT_LOW_TC_PULSE		0x0001
#define		PA_MODE_TC_TOGGLE_FROM_LOW		0x0002
#define		PA_MODE_TC_TOGGLE_FROM_HIGH	0x0003
// CM2
#define		PA_MODE_ENABLE_OUTPUT			0x0004 // default value
#define		PA_MODE_DISABLE_OUTPUT			0x0000
// CM3~CM6
#define		PA_MODE_COUNT_DOWN			   0x0000 // default value
#define		PA_MODE_COUNT_UP			      0x0008
// CM7
#define		PA_MODE_COUNT_RISE_EDGE			0x0000 // default value
#define		PA_MODE_COUNT_FALL_EDGE			0x0080
// CM8~CM11
#define		PA_MODE_COUNT_SRC_OUT_N_M1		0x0100 // N_M1 means n minus 1
#define		PA_MODE_COUNT_SRC_CLK_N			0x0200
#define		PA_MODE_COUNT_SRC_CLK_N_M1		0x0300
#define		PA_MODE_COUNT_SRC_FOUT_0		0x0400
#define		PA_MODE_COUNT_SRC_FOUT_1		0x0500
#define		PA_MODE_COUNT_SRC_FOUT_2		0x0600
#define		PA_MODE_COUNT_SRC_FOUT_3		0x0700
#define     PA_MODE_COUNT_SRC_GATE_N_M1     0x0C00
#define     PA_MODE_COUNT_SRC_GATE_N        0x0C00

#define   PA_MODE_COUNT_SRC_20MHz     0x0400
#define   PA_MODE_COUNT_SRC_2MHz      0x0500
#define   PA_MODE_COUNT_SRC_200KHz    0x0600
#define   PA_MODE_COUNT_SRC_20KHz     0x0700
#define   PA_MODE_COUNT_SRC_2KHz      0x0800
#define   PA_MODE_COUNT_SRC_200Hz     0x0900  
#define   PA_MODE_COUNT_SRC_20Hz      0x0A00  
#define   PA_MODE_COUNT_SRC_2Hz       0x0B00  

// CM12~CM13
#define		PA_MODE_GATE_SRC_GATE_NO		0x0000 // default value
#define		PA_MODE_GATE_SRC_OUT_N_M1		0x1000
#define		PA_MODE_GATE_SRC_GATE_N			0x2000
#define		PA_MODE_GATE_SRC_GATE_N_M1		0x3000
// CM14~CM15
#define		PA_MODE_GATE_POSITIVE   		0x0000 // default value
#define		PA_MODE_GATE_NEGATIVE		   0x4000

// Counter Mode
#define MODE_A          0x0000
#define MODE_B          0x0000
#define MODE_C          0x8000

#define MODE_D          0x0010
#define MODE_E          0x0010
#define MODE_F          0x8010

#define MODE_G          0x0020  
#define MODE_H          0x0020
#define MODE_I          0x8020

#define MODE_J          0x0030
#define MODE_K          0x0030
#define MODE_L          0x8030

#define MODE_O          0x8040
#define MODE_R          0x8050
#define MODE_U          0x8060
#define MODE_X          0x8070

#define MODE_M          0x000C  //For PCM3810I
#define MODE_N          0x000D  //For PCM3810I

// ----------------------------------------------------------------------------
// define the FOUT register parameter
#define		PA_FOUT_SRC_EXTER_CLK		     0x0000 // default value
#define		PA_FOUT_SRC_CLK_N		           0x0100
#define		PA_FOUT_SRC_FOUT_N_M1		     0x0200
#define		PA_FOUT_SRC_CLK_10MHZ		     0x0300
#define		PA_FOUT_SRC_CLK_1MHZ		        0x0400
#define		PA_FOUT_SRC_CLK_100KHZ		     0x0500
#define		PA_FOUT_SRC_CLK_10KHZ		     0x0600
#define		PA_FOUT_SRC_CLK_1KHZ		        0x0700
// PCI1780 parameters defined 
#define     PA_FOUT_SRC_CLK_20MHZ				0x0800
#define     PA_FOUT_SRC_CLK_5MHZ				0x0900
//USB4751 parameter defined.
///////////////////// V2.0B ///////////////////

/****************************************************************************
    define event type for interrupt and DMA transfer
*****************************************************************************/
#define     ADS_EVT_INTERRUPT           0x1     // interrupt
#define     ADS_EVT_BUFCHANGE           0x2     // buffer change
#define     ADS_EVT_TERMINATED          0x4     // termination
#define     ADS_EVT_OVERRUN             0x8     // overrun
#define     ADS_EVT_WATCHDOG            0x10    // watchdog actived
#define     ADS_EVT_CHGSTATE            0x20    // change state event
#define     ADS_EVT_ALARM               0x40    // alarm event
#define     ADS_EVT_PORT0               0x80    // port 0 event
#define     ADS_EVT_PORT1               0x100   // port 1 event
#define     ADS_EVT_PORT2               0x800   // port 2 event
#define     ADS_EVT_PATTERNMATCH        0x200   // Pattern Match for DI
#define     ADS_EVT_COUNTER             0x201   // Persudo event for COUNTERMATCH and COUNTEROVERFLOW
#define     ADS_EVT_COUNTERMATCH        0x202   // Counter Match setting NO. for DI
#define     ADS_EVT_COUNTEROVERFLOW     0x203   // Counter Overflow for DI
#define     ADS_EVT_STATUSCHANGE        0x204   // Status Change for DI
#define     ADS_EVT_FILTER              0x205   // Filter Event
//\\\\\\\\\\\\\\\\\\\\\2.2////////////////////////
#define     ADS_EVT_WATCHDOG_OVERRUN    0x206   // Watchdong over run Event
///////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\
//Modified by Ann.He
#ifdef _WIN32_WCE
#define		ADS_EVT_3724INTERRUPT		0x300	  // for PCM-3724 port 2 int
#endif
//end
#define     ADS_EVT_DEVREMOVED          0x400 // for USB device

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
// Moved to Event.H
/*
#define     ADS_EVT_INTERRUPT_DI0       0x300   // interrupt from DI0
#define     ADS_EVT_INTERRUPT_DI1       0x301   // interrupt from DI1
#define     ADS_EVT_INTERRUPT_DI2       0x302   // interrupt from DI2
#define     ADS_EVT_INTERRUPT_DI3       0x303   // interrupt from DI3
#define     ADS_EVT_INTERRUPT_DI4       0x304   // interrupt from DI4
#define     ADS_EVT_INTERRUPT_DI5       0x305   // interrupt from DI5
#define     ADS_EVT_INTERRUPT_DI6       0x306   // interrupt from DI6
#define     ADS_EVT_INTERRUPT_DI7       0x307   // interrupt from DI7
*/
///////////////////// V2.0B ///////////////////////

/****************************************************************************
    define event name by device number
*****************************************************************************/
#define     ADS_EVT_INTERRUPT_NAME               "ADS_EVT_INTERRUPT"
#define     ADS_EVT_PORT0_NAME                   "ADS_EVT_PORT0"
#define     ADS_EVT_PORT1_NAME                   "ADS_EVT_PORT1"
#define     ADS_EVT_PORT2_NAME                   "ADS_EVT_PORT2"
#define     ADS_EVT_BUFCHANGE_NAME               "ADS_EVT_BUFCHANGE"
#define     ADS_EVT_TERMINATED_NAME              "ADS_EVT_TERMINATED"
#define     ADS_EVT_OVERRUN_NAME                 "ADS_EVT_OVERRUN"
#define     ADS_EVT_WATCHDOG_NAME                "ADS_EVT_WATCHDOG"
#define     ADS_EVT_CHGSTATE_NAME                "ADS_EVT_CHGSTATE"
#define     ADS_EVT_ALARM_NAME                   "ADS_EVT_ALARM"
#define     ADS_EVT_PATTERNMATCH_NAME            "ADS_EVT_PATTERNMATCH"   
#define     ADS_EVT_COUNTERMATCH_NAME            "ADS_EVT_COUNTERMATCH"
#define     ADS_EVT_COUNTEROVERFLOW_NAME         "ADS_EVT_COUNTEROVERFLOW"
#define     ADS_EVT_STATUSCHANGE_NAME            "ADS_EVT_STATUSCHANGE"
//\\\\\\\\\\\\\\\\\\\\\2.2////////////////////////
#define     ADS_EVT_WATCHDOG_OVERRUN_NAME        "ADS_EVT_WATCHDOG_OVERRUN"   // Watchdong 
///////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\

#define		ADS_EVT_DEVREMOVED_NAME				"ADS_EVT_DEVREMOVED"	  // for USB device

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
// Moved to Event.H
/*
#define     ADS_EVT_INTERRUPT_DI0_NAME          "ADS_EVT_INTERRUPT_DI0"
#define     ADS_EVT_INTERRUPT_DI1_NAME          "ADS_EVT_INTERRUPT_DI1"
#define     ADS_EVT_INTERRUPT_DI2_NAME          "ADS_EVT_INTERRUPT_DI2"
#define     ADS_EVT_INTERRUPT_DI3_NAME          "ADS_EVT_INTERRUPT_DI3"
#define     ADS_EVT_INTERRUPT_DI4_NAME           "ADS_EVT_INTERRUPT_DI4"
#define     ADS_EVT_INTERRUPT_DI5_NAME          "ADS_EVT_INTERRUPT_DI5"
#define     ADS_EVT_INTERRUPT_DI6_NAME           "ADS_EVT_INTERRUPT_DI6"
#define     ADS_EVT_INTERRUPT_DI7_NAME          "ADS_EVT_INTERRUPT_DI7"
*/
///////////////////// V2.0B ///////////////////////

/****************************************************************************
    define FIFO size
*****************************************************************************/
#define     FIFO_SIZE           512     // 1K FIFO size (512* 2byte/each data)
#define     FIFO_SIZE4          2048    // 4K FIFO size (2048* 2byte/each data)

/****************************************
    define Data Type ID
****************************************/
#define AI_BUFFER_DATATYPE32    0x32b

/****************************************************************************
    Function ID Definition
*****************************************************************************/
#define FID_DeviceOpen                  0
#define FID_DeviceClose                 1
#define FID_DeviceGetFeatures           2
#define FID_AIConfig                    3
#define FID_AIGetConfig                 4
#define FID_AIBinaryIn                  5
#define FID_AIScale                     6
#define FID_AIVoltageIn                 7
#define FID_AIVoltageInExp              8
#define FID_MAIConfig                   9
#define FID_MAIBinaryIn                10
#define FID_MAIVoltageIn               11
#define FID_MAIVoltageInExp            12
#define FID_TCMuxRead                  13
#define FID_AOConfig                   14
#define FID_AOBinaryOut                15
#define FID_AOVoltageOut               16
#define FID_AOScale                    17
#define FID_DioSetPortMode             18
#define FID_DioGetConfig               19
#define FID_DioReadPortByte            20
#define FID_DioWritePortByte           21
#define FID_DioReadBit                 22
#define FID_DioWriteBit                23
#define FID_DioGetCurrentDOByte        24
#define FID_DioGetCurrentDOBit         25
#define FID_WritePortByte              26
#define FID_WritePortWord              27
#define FID_ReadPortByte               28
#define FID_ReadPortWord               29
#define FID_CounterEventStart          30
#define FID_CounterEventRead           31
#define FID_CounterFreqStart           32
#define FID_CounterFreqRead            33
#define FID_CounterPulseStart          34
#define FID_CounterReset               35
#define FID_QCounterConfig             36
#define FID_QCounterConfigSys          37
#define FID_QCounterStart              38
#define FID_QCounterRead               39
#define FID_AlarmConfig                40
#define FID_AlarmEnable                41
#define FID_AlarmCheck                 42
#define FID_AlarmReset                 43
#define FID_COMOpen                    44
#define FID_COMConfig                  45
#define FID_COMClose                   46
#define FID_COMRead                    47
#define FID_COMWrite232                48
#define FID_COMWrite485                49
#define FID_COMWrite85                 50
#define FID_COMInit                    51
#define FID_COMLock                    52
#define FID_COMUnlock                  53
#define FID_WDTEnable                  54
#define FID_WDTRefresh                 55
#define FID_WDTReset                   56
#define FID_FAIIntStart                57
#define FID_FAIIntScanStart            58
#define FID_FAIDmaStart                59
#define FID_FAIDmaScanStart            60
#define FID_FAIDualDmaStart            61
#define FID_FAIDualDmaScanStart        62
#define FID_FAICheck                   63
#define FID_FAITransfer                64
#define FID_FAIStop                    65
#define FID_FAIWatchdogConfig          66
#define FID_FAIIntWatchdogStart        67
#define FID_FAIDmaWatchdogStart        68
#define FID_FAIWatchdogCheck           69
#define FID_FAOIntStart                70
#define FID_FAODmaStart                71
#define FID_FAOScale                   72
#define FID_FAOLoad                    73
#define FID_FAOCheck                   74
#define FID_FAOStop                    75
#define FID_ClearOverrun               76
#define FID_EnableEvent                77
#define FID_CheckEvent                 78
#define FID_AllocateDMABuffer          79
#define FID_FreeDMABuffer              80
#define FID_EnableCANEvent             81
#define FID_GetCANEventData            82
#define FID_TimerCountSetting            83
#define FID_CounterPWMSetting          84
#define FID_CounterPWMEnable           85
#define FID_DioTimerSetting             86
#define FID_EnableEventEx                87
#define FID_DICounterReset             88
#define FID_FDITransfer                89
#define FID_EnableSyncAO               90
#define FID_WriteSyncAO                91
#define FID_AOCurrentOut               92
#define FID_ADAMCounterSetHWConfig     93   
#define FID_ADAMCounterGetHWConfig     94
#define FID_ADAMAISetHWConfig          95   
#define FID_ADAMAIGetHWConfig          96
#define FID_ADAMAOSetHWConfig          97   
#define FID_ADAMAOGetHWConfig          98
#define FID_GetFIFOSize                99
#define FID_PWMStartRead               100
#define FID_FAIDmaExStart              101
#define FID_FAOWaveFormStart           102    

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
#define FID_FreqOutStart              104
#define FID_FreqOutReset              105
#define FID_CounterConfig             106
#define FID_DeviceGetParam            107
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
#define FID_DeviceSetProperty	      108	
#define FID_DeviceGetProperty         109
#define FID_WritePortDword            110
#define FID_ReadPortDword             111
#define FID_FDIStart                  112
#define FID_FDICheck                  113
#define FID_FDIStop                   114
#define FID_FDOStart                  115
#define FID_FDOCheck                  116
#define FID_FDOStop                   117
#define FID_ClearFlag                 118
///////////////////// V2.0C /////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.2 /////////////////////
#define FID_WatchdogStart             119
#define FID_WatchdogFeed              120
#define FID_WatchdogStop              121
///////////////////// V2.2/////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.2C /////////////////////
#define FID_DioReadPortWord           122
#define FID_DioWritePortWord          123
#define FID_DioReadPortDword          124
#define FID_DioWritePortDword         125
#define FID_DioGetCurrentDOWord       126
#define FID_DioGetCurrentDODword      127
#define FID_FAODmaExStart             128
#define FID_FAITerminate              129
#define FID_FAOTerminate              130
///////////////////// V2.2C /////////////////////

// Supporting new device driver structure
//\\\\\\\\\\\\\\\\\\\ V2.3a /////////////////////
#define FID_DioEnableEventAndSpecifyDiPorts     131
#define FID_DioDisableEvent                     132
#define FID_DioGetLatestEventDiPortsState       133
#define FID_DioReadDiPorts                      134
#define FID_DioWriteDoPorts                     135
#define FID_DioGetCurrentDoPortsState           136
///////////////////// V2.3a /////////////////////
// End of new device driver structure.

// For new Unified FAO functions
#define FID_FAOCheckEx                          137 

#define FID_DioEnableEventAndSpecifyEventCounter     138
#define FID_CntrEnableEventAndSpecifyEventCounter    139
#define FID_CntrGetLatestEventCounterValue      140
#define FID_CntrDisableEvent                    141
#define  FID_CustomerDataRead                     142
#define  FID_CustomerDataWrite                    143

// For 32-bit Data structure
#define  FID_AIBinaryIn32                   144
#define  FID_AIVoltageIn32                  145
#define  FID_MAIBinaryIn32                  146
#define  FID_MAIVoltageIn32                 147
#define  FID_FAIIntStart32                  148
#define  FID_FAIIntScanStart32              149
#define  FID_FAIDmaExStart32                150


typedef struct _DRIVERINFO
{
    struct      _DRIVERINFO far * pNext;  // next device info. address
    ULONG       ulDeviceNum;              // device number
    HGLOBAL     hDriverInfo;              // driver info. handle
    USHORT      usUsageCount;             // usage count
    HINSTANCE   hDriverInstance;          // driver instance handle
    FARPROC     lpfnDriverEntry;          // driver entry address
    LONG        hDeviceInfo;              // deivce info. (Lock data)
} DRIVERINFO, FAR * LPDRIVERINFO;

/*************************************************************************
    define gain listing
*************************************************************************/
typedef  struct tagGAINLIST
{
   USHORT   usGainCde;
   FLOAT    fMaxGainVal;
   FLOAT    fMinGainVal;
   
#ifndef _WIN32_WCE
   CHAR     szGainStr[16];
#else
   TCHAR     szGainStr[16];
#endif

} GAINLIST;

/*************************************************************************
    Define hardware board(device) features.

    Note: definition for dwPermutaion member

           Bit 0: Software AI
           Bit 1: DMA AI
           Bit 2: Interrupt AI
           Bit 3: Condition AI
           Bit 4: Software AO
           Bit 5: DMA AO
           Bit 6: Interrupt AO
           Bit 7: Condition AO
           Bit 8: Software DI
           Bit 9: DMA DI
           Bit 10: Interrupt DI
           Bit 11: Condition DI
           Bit 12: Software DO
           Bit 13: DMA DO
           Bit 14: Interrupt DO
           Bit 15: Condition DO
           Bit 16: High Gain
           Bit 17: Auto Channel Scan
           Bit 18: Pacer Trigger
           Bit 19: External Trigger
           Bit 20: Down Counter
           Bit 21: Dual DMA
           Bit 22: Monitoring
           Bit 23: QCounter

************************************************************************/
typedef struct tagDEVFEATURES
{
	
 #ifndef _WIN32_WCE
    CHAR     szDriverVer[8];    // device driver version
    CHAR     szDriverName[MAX_DRIVER_NAME_LEN];  // device driver name
#else
    TCHAR     szDriverVer[8];    // device driver version
    TCHAR     szDriverName[MAX_DRIVER_NAME_LEN];  // device driver name
#endif    

    DWORD    dwBoardID;         // board ID
    USHORT   usMaxAIDiffChl;    // Max. number of differential channel
    USHORT   usMaxAISiglChl;    // Max. number of single-end channel
    USHORT   usMaxAOChl;        // Max. number of D/A channel
    USHORT   usMaxDOChl;        // Max. number of digital out channel
    USHORT   usMaxDIChl;        // Max. number of digital input channel
    USHORT   usDIOPort;         // specifies if programmable or not
    USHORT   usMaxTimerChl;     // Max. number of Counter/Timer channel
    USHORT   usMaxAlarmChl;     // Max number of  alram channel
    USHORT   usNumADBit;        // number of bits for A/D converter
    USHORT   usNumADByte;       // A/D channel width in bytes.
    USHORT   usNumDABit;        // number of bits for D/A converter.
    USHORT   usNumDAByte;       // D/A channel width in bytes.
    USHORT   usNumGain ;        // Max. number of gain code
    GAINLIST glGainList[16];    // Gain listing
    DWORD    dwPermutation[4];  // Permutation
} DEVFEATURES, FAR * LPDEVFEATURES;

/*************************************************************************
    AOSET Definition
*************************************************************************/
typedef  struct tagAOSET
{
    USHORT  usAOSource;     // 0-internal, 1-external
    FLOAT   fAOMaxVol;      // maximum output voltage
    FLOAT   fAOMinVol;      // minimum output voltage
    FLOAT   fAOMaxCur;      // maximum output voltage
    FLOAT   fAOMinCur;      // minimum output voltage

} AOSET, FAR * LPAOSET;

// Set AO range
typedef  struct tagAORANGESET
{
   USHORT  usGainCount;    // how many gains will be suported
   USHORT  usAOSource;     // 0-internal, 1-external   
   USHORT  usAOType;       // 0-voltage, 1-current   
   USHORT  usChan;   
   FLOAT   fAOMax;         // maximum output voltage   
   FLOAT   fAOMin;         // minimum output voltage   
} AORANGESET, FAR * LPAORANGESET;

/* 2.0C mask, declare it later
//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
typedef struct tagPT_DeviceGetParam
{
    USHORT    nID;
    DWORD*    pSize;
    PVOID     pBuffer;
} PT_DeviceGetParam, FAR * LPT_DeviceGetParam;
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\
*/

/*************************************************************************
    DaughterSet Definition
*************************************************************************/
typedef  struct tagDAUGHTERSET
{
    DWORD   dwBoardID;              // expansion board ID
    USHORT  usNum;                  // available expansion channels
    FLOAT   fGain;                  // gain for expansion channel
    USHORT  usCards;                // number of expansion cards
} DAUGHTERSET, FAR * LPDAUGHTERSET;

/**************************************************************************
    Analog Input Configuration Definition
***************************************************************************/
typedef struct tagDEVCONFIG_AI
{
    DWORD   dwBoardID;         // board ID code
    DWORD   ulChanConfig;      // 0-single ended, 1-differential
    USHORT  usGainCtrMode;     // 1-by jumper, 0-programmable
    USHORT  usPolarity;        // 0-bipolar, 1-unipolar
    USHORT  usDasGain;         // not used if GainCtrMode = 1
    USHORT  usNumExpChan;      // DAS channels attached expansion board
    USHORT  usCjcChannel;      // cold junction channel
    DAUGHTERSET Daughter[MAX_DAUGHTER_NUM];   // expansion board settings
    DWORD   ulChanConfigEx[3]; // Extension the channel configuration, so we can max support 128 AI channels' setting.
} DEVCONFIG_AI, FAR * LPDEVCONFIG_AI;

/**************************************************************************
    DEVCONFIG_COM Definition
***************************************************************************/
typedef struct tagDEVCONFIG_COM
{
    USHORT  usCommPort;                     // serial port
    DWORD   dwBaudRate;                     // baud rate
    USHORT  usParity;                       // parity check
    USHORT  usDataBits;                     // data bits
    USHORT  usStopBits;                     // stop bits
    USHORT  usTxMode;                       // transmission mode
    USHORT  usPortAddress;                  // communication port address
} DEVCONFIG_COM, FAR * LPDEVCONFIG_COM;

/**************************************************************************
    TRIGLEVEL Definition
***************************************************************************/
typedef struct tagTRIGLEVEL
{
   FLOAT fLow;
   FLOAT fHigh;
} TRIGLEVEL;


typedef struct tagPT_DEVLIST
{
    DWORD   dwDeviceNum;

#ifndef _WIN32_WCE    
    char szDeviceName[50];    
#else    
    TCHAR  szDeviceName[50];    
#endif

    SHORT   nNumOfSubdevices;
} DEVLIST, FAR *LPDEVLIST;

typedef struct tagPT_DeviceGetFeatures
{
    LPDEVFEATURES  buffer;
    USHORT         size;
} PT_DeviceGetFeatures, FAR * LPT_DeviceGetFeatures;

typedef struct tagPT_AIConfig
{
    USHORT      DasChan;
    USHORT      DasGain;
} PT_AIConfig, FAR * LPT_AIConfig;

typedef struct tagPT_AIGetConfig
{
    LPDEVCONFIG_AI buffer;
    USHORT         size;
} PT_AIGetConfig, FAR * LPT_AIGetConfig;

/*typedef struct tagPT_AIBinaryIn
{
    USHORT      chan;
    USHORT      TrigMode;
    USHORT far  *reading;
} PT_AIBinaryIn, FAR * LPT_AIBinaryIn;*/

typedef struct tagPT_AIScale
{
    USHORT      reading;
    FLOAT       MaxVolt;
    USHORT      MaxCount;
    USHORT      offset;
    FLOAT far   *voltage;
} PT_AIScale, FAR * LPT_AIScale;

typedef struct tagPT_AIVoltageIn
{
    USHORT      chan;
    USHORT      gain;
    USHORT      TrigMode;
    FLOAT far   *voltage;
} PT_AIVoltageIn, FAR * LPT_AIVoltageIn;

typedef struct tagPT_AIVoltageInExp
{
    USHORT      DasChan;
    USHORT      DasGain;
    USHORT      ExpChan;
    FLOAT far   *voltage;
} PT_AIVoltageInExp, FAR * LPT_AIVoltageInExp;

typedef struct tagPT_MAIConfig
{
    USHORT      NumChan;
    USHORT      StartChan;
    USHORT far  *GainArray;
} PT_MAIConfig, FAR * LPT_MAIConfig;

/*typedef struct tagPT_MAIBinaryIn
{
    USHORT      NumChan;
    USHORT      StartChan;
    USHORT      TrigMode;
    USHORT far  *ReadingArray;
} PT_MAIBinaryIn, FAR * LPT_MAIBinaryIn;*/

typedef struct tagPT_MAIVoltageIn
{
    USHORT      NumChan;
    USHORT      StartChan;
    USHORT far  *GainArray;
    USHORT      TrigMode;
    FLOAT far   *VoltageArray;
} PT_MAIVoltageIn, FAR * LPT_MAIVoltageIn;

typedef struct tagPT_MAIVoltageInExp
{
    USHORT      NumChan;
    USHORT far  *DasChanArray;
    USHORT far  *DasGainArray;
    USHORT far  *ExpChanArray;
    FLOAT far   *VoltageArray;
} PT_MAIVoltageInExp, FAR * LPT_MAIVoltageInExp;

typedef struct tagPT_TCMuxRead
{
    USHORT      DasChan;
    USHORT      DasGain;
    USHORT      ExpChan;
    USHORT      TCType;
    USHORT      TempScale;
    FLOAT far   *temp;
} PT_TCMuxRead, FAR * LPT_TCMuxRead;

typedef struct tagPT_AOConfig
{
    USHORT      chan;
    USHORT      RefSrc;
    FLOAT       MaxValue;
    FLOAT       MinValue;
} PT_AOConfig, FAR * LPT_AOConfig;

typedef struct tagPT_AOBinaryOut
{
    USHORT      chan;
    USHORT      BinData;
} PT_AOBinaryOut, FAR * LPT_AOBinaryOut;

typedef struct tagPT_AOVoltageOut
{
    USHORT      chan;
    FLOAT       OutputValue;
} PT_AOVoltageOut, FAR * LPT_AOVoltageOut;

typedef struct tagPT_AOScale
{
    USHORT      chan;
    FLOAT       OutputValue;
    USHORT far  *BinData;
}PT_AOScale,    FAR * LPT_AOScale;

typedef struct tagPT_DioSetPortMode
{
    USHORT      port;
    USHORT      dir;
} PT_DioSetPortMode, FAR * LPT_DioSetPortMode;

typedef struct tagPT_DioGetConfig
{
    SHORT far      *PortArray;
    USHORT         NumOfPorts;
} PT_DioGetConfig, FAR * LPT_DioGetConfig;

typedef struct tagPT_DioReadPortByte
{
    USHORT      port;
    USHORT far  *value;
} PT_DioReadPortByte, FAR * LPT_DioReadPortByte;

typedef struct tagPT_DioWritePortByte
{
    USHORT      port;
    USHORT      mask;
    USHORT      state;
} PT_DioWritePortByte, FAR * LPT_DioWritePortByte;

typedef struct tagPT_DioReadBit
{
    USHORT      port;
    USHORT      bit;
    USHORT far  *state;
} PT_DioReadBit, FAR * LPT_DioReadBit;

typedef struct tagPT_DioWriteBit
{
    USHORT      port;
    USHORT      bit;
    USHORT      state;
} PT_DioWriteBit, FAR * LPT_DioWriteBit;

typedef struct tagPT_DioGetCurrentDOByte
{
    USHORT      port;
    USHORT far  *value;
} PT_DioGetCurrentDOByte, FAR * LPT_DioGetCurrentDOByte;

typedef struct tagPT_DioGetCurrentDOBit
{
    USHORT      port;
    USHORT      bit;
    USHORT far  *state;
} PT_DioGetCurrentDOBit, FAR * LPT_DioGetCurrentDOBit;


typedef struct tagPT_WritePortByte
{
    USHORT      port;
    USHORT      ByteData;
} PT_WritePortByte, FAR * LPT_WritePortByte;

typedef struct tagPT_WritePortWord
{
    USHORT      port;
    USHORT      WordData;
} PT_WritePortWord, FAR * LPT_WritePortWord;

//\\\\\\\\\\\\\\\\\\\\ 2.0C ///////////////////
typedef struct tagPT_WritePortDword
{
    USHORT      port;
    ULONG       DwordData;
} PT_WritePortDword, FAR * LPT_WritePortDword;
////////////////////// 2.0C ///////////////////


typedef struct tagPT_ReadPortByte
{
    USHORT      port;
    USHORT far  *ByteData;
} PT_ReadPortByte, FAR * LPT_ReadPortByte;

typedef struct tagPT_ReadPortWord
{
    USHORT      port;
    USHORT far  *WordData;
} PT_ReadPortWord, FAR * LPT_ReadPortWord;

//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
typedef struct tagPT_ReadPortDword
{
    USHORT      port;
    ULONG far  *DwordData;
}PT_ReadPortDword, FAR * LPT_ReadPortDword;
////////////////////// 2.0C \\\\\\\\\\\\\\\\\\\\

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
typedef struct tagPT_CounterConfig
{
   USHORT usCounter;                // counter selected
   USHORT usInitValue;              // initial counter value
   USHORT usCountMode;              // pre-defined mode for counter 
   USHORT usCountDirect;            // counting direction 0-down; 1-up
   USHORT usCountEdge;              // count source edge
	USHORT usOutputEnable;           // counter output enable-1, disable-0
   USHORT usOutputMode;             // output mode
   USHORT usClkSrc;                 // clock source selection
   USHORT usGateSrc;                // gate source selection
   USHORT usGatePolarity;           // gating porality 
} PT_CounterConfig, FAR * LPT_CounterConfig;
///////////////////// V2.0B /////////////////////

typedef struct tagPT_CounterEventStart
{
    USHORT      counter;
    USHORT      GateMode;
} PT_CounterEventStart, FAR * LPT_CounterEventStart;

typedef struct tagPT_CounterEventRead
{
    USHORT      counter;
    USHORT far  *overflow;
    ULONG far   *count;
} PT_CounterEventRead, FAR * LPT_CounterEventRead;

typedef struct tagPT_CounterFreqStart
{
    USHORT      counter;
    USHORT      GatePeriod;
    USHORT      GateMode;
} PT_CounterFreqStart, FAR * LPT_CounterFreqStart;

typedef struct tagPT_CounterFreqRead
{
    USHORT      counter;
    FLOAT far   *freq;
} PT_CounterFreqRead, FAR * LPT_CounterFreqRead;

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
typedef struct tagPT_FreqOutStart
{
   USHORT  usChannel;   // channel selected
   USHORT  usDivider;   // divider value
   USHORT  usFoutSrc;   // freq out source   
} PT_FreqOutStart, * LPT_FreqOutStart;
///////////////////// V2.0B /////////////////////

typedef struct tagPT_CounterPulseStart
{
    USHORT      counter;
    FLOAT       period;
    FLOAT       UpCycle;
    USHORT      GateMode;
} PT_CounterPulseStart, FAR * LPT_CounterPulseStart;

typedef struct tagPT_QCounterConfig
{
    USHORT      counter;
    USHORT      LatchSrc;
    USHORT      LatchOverflow;
    USHORT      ResetOnLatch;
    USHORT      ResetValue;
} PT_QCounterConfig, FAR * LPT_QCounterConfig;

typedef struct tagPT_QCounterConfigSys
{
    USHORT      SysClock;
    USHORT      TimeBase;
    USHORT      TimeDivider;
    USHORT      CascadeMode;
} PT_QCounterConfigSys, FAR * LPT_QCounterConfigSys;

typedef struct tagPT_QCounterStart
{
    USHORT      counter;
    USHORT      InputMode;
} PT_QCounterStart, FAR * LPT_QCounterStart;

typedef struct tagPT_QCounterRead
{
    USHORT      counter;
    USHORT far  *overflow;
    ULONG far   *LoCount;
    ULONG far   *HiCount;
} PT_QCounterRead, FAR * LPT_QCounterRead;

typedef struct tagPT_AlarmConfig
{
    USHORT      chan;
    FLOAT       LoLimit;
    FLOAT       HiLimit;
} PT_AlarmConfig, FAR * LPT_AlarmConfig;

typedef struct tagPT_AlarmEnable
{
    USHORT      chan;
    USHORT      LatchMode;
    USHORT      enabled;
} PT_AlarmEnable, FAR * LPT_AlarmEnable;

typedef struct tagPT_AlarmCheck
{
    USHORT      chan;
    USHORT far  *LoState;
    USHORT far  *HiState;
} PT_AlarmCheck, FAR * LPT_AlarmCheck;

typedef struct tagPT_WDTEnable
{
    USHORT      message;
    HWND        Destination;
} PT_WDTEnable, FAR * LPT_WDTEnable;

/*typedef struct tagPT_FAIIntStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    USHORT      gain;
    USHORT far  *buffer;
    ULONG       count;
    USHORT      cyclic;
    USHORT      IntrCount;
} PT_FAIIntStart, FAR * LPT_FAIIntStart;*/

/*typedef struct tagPT_FAIIntScanStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      NumChans;
    USHORT      StartChan;
    USHORT far  *GainList;
    USHORT far  *buffer;
    ULONG       count;
    USHORT      cyclic;
    USHORT      IntrCount;
} PT_FAIIntScanStart, FAR * LPT_FAIIntScanStart;*/

typedef struct tagPT_FAIDmaStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    USHORT      gain;
    USHORT far  *buffer;
    ULONG       count;
} PT_FAIDmaStart, FAR * LPT_FAIDmaStart;

typedef struct tagPT_FAIDmaScanStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      NumChans;
    USHORT      StartChan;
    USHORT far  *GainList;
    USHORT far  *buffer;
    ULONG       count;
} PT_FAIDmaScanStart, FAR * LPT_FAIDmaScanStart;

typedef struct tagPT_FAIDualDmaStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    USHORT      gain;
    USHORT far  *BufferA;
    USHORT far  *BufferB;
    ULONG       count;
    USHORT      cyclic;
} PT_FAIDualDmaStart, FAR * LPT_FAIDualDmaStart;

typedef struct tagPT_FAIDualDmaScanStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      NumChans;
    USHORT      StartChan;
    USHORT far  *GainList;
    USHORT far  *BufferA;
    USHORT far  *BufferB;
    ULONG       count;
    USHORT      cyclic;
} PT_FAIDualDmaScanStart, FAR * LPT_FAIDualDmaScanStart;

typedef struct tagPT_FAITransfer
{
    USHORT      ActiveBuf;
    LPVOID      DataBuffer;
    USHORT      DataType;
    ULONG       start;
    ULONG       count;
    USHORT far *overrun;
} PT_FAITransfer, FAR * LPT_FAITransfer;

typedef struct tagPT_FAICheck
{
    USHORT far  *ActiveBuf;
    USHORT far  *stopped;
    ULONG  far  *retrieved;
    USHORT far  *overrun;
    USHORT far  *HalfReady;
} PT_FAICheck, FAR * LPT_FAICheck;

typedef struct tagPT_FAIWatchdogConfig
{
    USHORT      TrigMode;
    USHORT      NumChans;
    USHORT      StartChan;
    USHORT far  *GainList;
    USHORT far  *CondList;
    TRIGLEVEL far *LevelList;
} PT_FAIWatchdogConfig, FAR * LPT_FAIWatchdogConfig;

typedef struct tagPT_FAIIntWatchdogStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT far  *buffer;
    ULONG       count;
    USHORT      cyclic;
    USHORT      IntrCount;
} PT_FAIIntWatchdogStart, FAR * LPT_FAIIntWatchdogStart;

typedef struct tagPT_FAIDmaWatchdogStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT far  *BufferA;
    USHORT far  *BufferB;
    ULONG       count;
} PT_FAIDmaWatchdogStart, FAR * LPT_FAIDmaWatchdogStart;

typedef struct tagPT_FAIWatchdogCheck
{
    USHORT      DataType;
    USHORT far  *ActiveBuf;
    USHORT far  *triggered;
    USHORT far  *TrigChan;
    ULONG  far  *TrigIndex;
    LPVOID      TrigData;
} PT_FAIWatchdogCheck, FAR * LPT_FAIWatchdogCheck;

typedef struct tagPT_FAOIntStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    LONG   far  *buffer;
    ULONG       count;
    USHORT      cyclic;
} PT_FAOIntStart, FAR * LPT_FAOIntStart;

typedef struct tagPT_FAODmaStart
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    LONG   far  *buffer;
    ULONG       count;
} PT_FAODmaStart, FAR * LPT_FAODmaStart;

typedef struct tagPT_FAODmaExStart
{
   USHORT      TrigSrc;
   DWORD       SampleRate;
   USHORT      StartChan;
   USHORT      NumChans;
   LONG   far  *buffer;
   ULONG       count;
   USHORT      CyclicMode;
   USHORT      PacerSource;
   DWORD       Reserved[4];
   LPVOID      pReserved[4];
} PT_FAODmaExStart, FAR * LPT_FAODmaExStart;

typedef struct tagPT_FAOScale
{
    USHORT      chan;
    ULONG       count;
    FLOAT far   *VoltArray;
    USHORT far  *BinArray;
} PT_FAOScale, FAR * LPT_FAOScale;

typedef struct tagPT_FAOLoad
{
    USHORT      ActiveBuf;
    USHORT far  *DataBuffer;
    ULONG       start;
    ULONG       count;
} PT_FAOLoad, FAR * LPT_FAOLoad;

typedef struct tagPT_FAOCheck
{
   USHORT far  *ActiveBuf;   
   USHORT far  *stopped;   
   ULONG  far  *CurrentCount;                   // Only for FAOWaveForm function 
   USHORT far  *overrun;                        // reserved
   USHORT far  *HalfReady;   
} PT_FAOCheck, FAR * LPT_FAOCheck;

// For new unified FAO functions
typedef struct tagPT_FAOCheckEx
{
   USHORT far  *ActiveBuf;   
   USHORT far  *stopped;
   ULONG  far  *Transfered; 
   USHORT FAR  *Underrun;
   USHORT far  *HalfReady;   
} PT_FAOCheckEx, FAR * LPT_FAOCheckEx;

typedef struct tagPT_EnableEvent
{
    USHORT      EventType;
    USHORT      Enabled;
    USHORT      Count;
} PT_EnableEvent, FAR * LPT_EnableEvent;

typedef struct tagPT_CheckEvent
{
    USHORT far *EventType;
    DWORD      Milliseconds;
} PT_CheckEvent, FAR * LPT_CheckEvent;

typedef struct tagPT_EnableCANEvent
{
    USHORT      EventType;
    USHORT      Enabled;
    CHAR        APEventName[15];
} PT_EnableCANEvent, FAR * LPT_EnableCANEvent;

typedef struct tagPT_GetCANEventData
{
    USHORT far *EventType;
    USHORT far *PortNum;
    USHORT far *MacID;
    CHAR       Data[8];
} PT_GetCANEventData, FAR * LPT_GetCANEventData;

typedef struct tagPT_AllocateDMABuffer
{
    USHORT      CyclicMode;
    ULONG       RequestBufSize;
    ULONG far * ActualBufSize;
    LONG_PTR  far * buffer;
} PT_AllocateDMABuffer, FAR * LPT_AllocateDMABuffer;

typedef struct tagPT_TimerCountSetting
{
   USHORT      counter;
   ULONG      Count;
} PT_TimerCountSetting, FAR * LPT_TimerCountSetting;

typedef struct tagPT_DIFilter
{
    USHORT       usEventType;
   USHORT       usEventEnable;
   USHORT       usCount;
    USHORT       usEnable;    // Filter enable data
   USHORT far * usHiValue;     // Filter value array pointer    
   USHORT far * usLowValue;
} PT_DIFilter, FAR * LPT_DIFilter;

typedef struct tagPT_DIPattern
{
   USHORT       usEventType;
   USHORT       usEventEnable;
   USHORT       usCount;
   USHORT       usEnable;    // Pattern Match enable data
   USHORT       usValue;     // Pattern Match pre_setting value;
} PT_DIPattern, FAR * LPT_DIPattern;

typedef struct tagPT_DICounter
{
   USHORT       usEventType;
   USHORT       usEventEnable;
   USHORT       usCount;
   USHORT       usEnable;    // Counter enable data
   USHORT       usTrigEdge;  // Counter Trigger edge 0: Rising edge  1:Falling edge
   USHORT far * usPreset;    // counter pre_setting value
   USHORT       usMatchEnable;// counter match enable data
   USHORT far * usValue;     // counter match value
   USHORT       usOverflow;  // counter overflow data
   USHORT       usDirection; // up/down counter direction

} PT_DICounter, FAR * LPT_DICounter;

typedef struct tagPT_Status
{
   USHORT       usEventType;
   USHORT       usEventEnable;
   USHORT       usCount;
   USHORT       usEnable;     // status change enable data
   USHORT       usRisingedge; // record Rising edge trigger type 
   USHORT       usFallingedge;// record Falling edge trigger type
} PT_DIStatus, FAR * LPT_DIStatus;

typedef union tagPT_EnableEventEx
{
    PT_DIFilter       Filter;
    PT_DIPattern      Pattern;
    PT_DICounter      Counter;
    PT_DIStatus       Status;
} PT_EnableEventEx, FAR * LPT_EnableEventEx;

//typedef struct tagPT_EnableEventEx
//{
//   USHORT        usEventType;
//   USHORT        usEventEnable;
//   USHORT        usCount;
//   PT_EventST    EventST;    
//
//} PT_EnableEventEx, FAR * LPT_EnableEventEx;

typedef struct tagPT_CounterPWMSetting
{
   USHORT      Port;  //counter port
   float       Period;   //ms 
   float       HiPeriod;  //UpCycle period ms
   ULONG       OutCount;    //Stop count
   USHORT      GateMode;
} PT_CounterPWMSetting, FAR * LPT_CounterPWMSetting;

typedef struct tagPT_DioTimerSetting
{
   USHORT       Port;
   USHORT       TimeronEnable;
   USHORT       TimeroffEnable;
   USHORT far * OnDuration;  //Timer on duration
   USHORT far * OffDuration; //Timer off duration
} PT_DioTimerSetting, FAR * LPT_DioTimerSetting;

typedef struct tagPT_FDITransfer
{
   USHORT       usEventType;
   ULONG far *  ulRetData;
} PT_FDITransfer, FAR * LPT_FDITransfer;

typedef struct tagPT_AOCurrentOut
{
   USHORT      chan;
   float       OutputValue;
} PT_AOCurrentOut, FAR * LPT_AOCurrentOut;

typedef struct tagPT_ADAMCounterSetHWConfig
{
   USHORT      usCounterMode;
   USHORT      usDataFormat;   // Only for adam5080
   USHORT      usGateTime;      // Only for adam4080,4080D
} PT_ADAMCounterSetHWConfig, FAR * LPT_ADAMCounterSetHWConfig;

typedef struct tagPT_ADAMCounterGetHWConfig
{
   USHORT   far *usCounterMode;
   USHORT   far *usDataFormat;  // Only for adam5080
   USHORT   far *usGateTime;    // Only for adam4080,4080D
} PT_ADAMCounterGetHWConfig, FAR * LPT_ADAMCounterGetHWConfig;

typedef struct tagPT_ADAMAISetHWConfig
{
   USHORT      usInputRange;
   USHORT      usDataFormat;
   USHORT      usIntegrationTime;
} PT_ADAMAISetHWConfig, FAR * LPT_ADAMAISetHWConfig;

typedef struct tagPT_ADAMAIGetHWConfig
{
   USHORT   far *usInputRange;
   USHORT   far   *usDataFormat;
   USHORT   far *usIntegrationTime;
} PT_ADAMAIGetHWConfig, FAR * LPT_ADAMAIGetHWConfig;

typedef struct tagPT_ADAMAOSetHWConfig
{
   USHORT      usChan;
   USHORT      usOutputRange;
   USHORT      usDataFormat;
   USHORT      usSlewRate;
} PT_ADAMAOSetHWConfig, FAR * LPT_ADAMAOSetHWConfig;

typedef struct tagPT_ADAMAOGetHWConfig
{
   USHORT   usChan;
   USHORT   far *usOutputRange;
   USHORT   far   *usDataFormat;
   USHORT   far *usSlewRate;
} PT_ADAMAOGetHWConfig, FAR * LPT_ADAMAOGetHWConfig;

typedef struct tagPT_PWMStartRead
{
   USHORT usChan;
   FLOAT  far *flHiperiod;
   FLOAT  far *flLowperiod;
}PT_PWMStartRead, FAR * LPT_PWMStartRead;

/*typedef struct tagPT_FAIDmaExStart
{
   USHORT      TrigSrc;      //Trigger source : internal,external
   USHORT      TrigMode;     //Trigger Mode : Pacer, Post, Delay, About
   USHORT      ClockSrc;     //Clock source : internel, external
   USHORT      TrigEdge;     //Trigger Edge : Rise 0 Fall 1
   USHORT      SRCType;      //Source type  : Digtal 0, Analog
   FLOAT       TrigVol;      //Analog Trigger type Trigger voltage
   USHORT      CyclicMode;   //Cyclic, noncyclic
   USHORT      NumChans;     //Scan number of channel
   USHORT      StartChan;    //Start channel
   ULONG       ulDelayCnt;   //Delay count
   ULONG       count;        //Number of sample
   ULONG       SampleRate;   //Sampling rate
   USHORT      *GainList;    //Gain code list
   USHORT      *CondList;    //Trigger condition
   TRIGLEVEL   *LevelList;   //Trigger level
   USHORT      *buffer0;     //Buffer pointer
   USHORT      *buffer1;     //Buffer pointer
   USHORT      *Pt1;         //Reserve parameter
   USHORT      *Pt2;         //Reserve Parameter
   USHORT      *Pt3;         //Reserve Parameter
}PT_FAIDmaExStart, *LPT_FAIDmaExStart;*/


typedef struct tagPT_FAOWaveFormStart
{
   USHORT        TrigSrc;
   DWORD         SampleRate;
   ULONG         WaveCount;
   ULONG         Count;
   USHORT far *  Buffer;
   USHORT        EnabledChannel;
} PT_FAOWaveFormStart, FAR * LPT_FAOWaveFormStart;

//\\\\\\\\\\\\\\\\\ 2.0C ////////////////////
typedef struct tagPT_DeviceSetParam         // PCI-1755
{
	USHORT    nID;              //IN, Paramarter name ID
	ULONG   Length;             //IN: buffer length
	PVOID   pData;	             //IN, buffer for trandsferring in.
} PT_DeviceSetParam, FAR * LPT_DeviceSetParam;

typedef struct tagPT_DeviceGetParam         //PCI-1755
{
	USHORT    nID;              //IN, Paramater name ID.
	PULONG  Length;             //IN: buffer length, out data length required.
	PVOID	  pData;	             //OUT, data return buffer.
} PT_DeviceGetParam, FAR * LPT_DeviceGetParam;

typedef struct tagPT_AIStart                //PCI-1755 use the same define.
{
  USHORT cyclic;              //IN, 0: non-cyclic, 1: Cyclic
  ULONG  count;               //IN, convertion count.
  void*  pBuffer;             //OUT, Buffer for data return.
}PT_AIStart, *LPT_AIStart;

typedef struct tagPT_FastFunctionCheck    //PCI-1755
{
  PULONG    pdwStatus;        //OUT, status return buffer.
  PULONG    pdwRetrieved;     //OUT, Conversion count stored in buffer.
}PT_FastFunctionCheck, FAR *LPT_FastFunctionCheck;
////////////////// 2.0C ///////////////////

////////////////// 2.2 ///////////////////

typedef struct tagPT_WatchdogStart    //PCI-1758
{
  long    Reserved0;        
  long    Reserved1;      
}PT_WatchdogStart, FAR *LPT_WatchdogStart;
////////////////// 2.2 ///////////////////

////////////////// 2.2C ///////////////////
typedef struct tagPT_DioReadPortWord
{
   USHORT      port;
   USHORT far  *value;
   USHORT      *ValidChannelMask;         // Xi'an added
} PT_DioReadPortWord, FAR * LPT_DioReadPortWord;

typedef struct tagPT_DioWritePortWord
{
   USHORT      port;
   USHORT      mask;
   USHORT      state;
} PT_DioWritePortWord, FAR * LPT_DioWritePortWord;

typedef struct tagPT_DioReadPortDword
{
   USHORT      port;
   ULONG far  *value;
   ULONG      *ValidChannelMask;
} PT_DioReadPortDword, FAR * LPT_DioReadPortDword;

typedef struct tagPT_DioWritePortDword
{
   USHORT      port;
   ULONG       mask;
   ULONG       state;
} PT_DioWritePortDword, FAR * LPT_DioWritePortDword;	

typedef struct tagPT_DioGetCurrentDOWord
{
   USHORT      port;
   USHORT far  *value;
   USHORT      *ValidChannelMask;     // Xi'an added
} PT_DioGetCurrentDOWord, FAR * LPT_DioGetCurrentDOWord;

typedef struct tagPT_DioGetCurrentDODword
{
   USHORT      port;
   ULONG  far  *value;
   ULONG      *ValidChannelMask;      // Xi'an added
} PT_DioGetCurrentDODword, FAR * LPT_DioGetCurrentDODword;

typedef struct _AD_DIO_READ_PORT {
   ULONG i_ulDioPortNum;		// port # to read
   ULONG i_ulDioDataLen;		// number of data (bytes) to read.
}	AD_DIO_READ_PORT, FAR * LPAD_DIO_READ_PORT;

typedef struct _AD_DIO_WRITE_PORT {
   ULONG i_ulDioPortNum;		// port # to write
   ULONG i_ulDioDataLen;		// number of data (bytes) to write
   union   {
      ULONG   ulData;
      USHORT  usData;
      UCHAR   ucData;
   }   DataBuffer; 
} AD_DIO_WRITE_PORT, FAR * LPAD_DIO_WRITE_PORT;

////////////////// 2.2C ///////////////////	

// Supporting new device driver structure.
////////////////// 2.3a ///////////////////
//struct used to enable DI event(DI Interrupt, DI PatternMatch, DI Status Change )
typedef struct _AD_DIO_EVENT_CFG{
   ULONG eventID;
   ULONG scanStart;
   ULONG scanCount;
}AD_DIO_EVENT_CFG, *PAD_DIO_EVENT_CFG, FAR * LPAD_DIO_EVENT_CFG;

//struct used to GET DI event DATA(when DI Interrupt, DI PatternMatch, DI Status Change 
// occures )
typedef struct _AD_DIO_EVENT_DATA{
   ULONG  eventID;
   LPBYTE dataBuf;
   ULONG  bufLen;
} AD_DIO_EVENT_DATA, *PAD_DIO_EVENT_DATA, FAR * LPAD_DIO_EVENT_DATA;

//struct used to read / write a range of DI/DO ports.
typedef struct _AD_DIO_PORTS_DATA{
   ULONG   portStart;
   ULONG   portCount;
   LPBYTE  dataBuf;
}AD_DIO_PORTS_DATA,*PAD_DIO_PORTS_DATA,*LPAD_DIO_PORTS_DATA;
////////////////// 2.3a ///////////////////	
// End of new device driver structure.

//struct used to GET counter event DATA(when Counter Interrupt occures )
typedef struct _AD_COUNTER_EVENT_DATA{
	ULONG  eventID;
	LPDWORD dataBuf;
	ULONG  bufLen;
} AD_COUNTER_EVENT_DATA, *PAD_COUNTER_EVENT_DATA, FAR * LPAD_COUNTER_EVENT_DATA;

// Customer_Data is DAQ driver private structure. 
// struct used to read / write customer data 
typedef struct _AD_CUSTOMER_DATA{
	ULONG address;
	LPBYTE dataBuf;
	ULONG dataCount;
} AD_CUSTOMER_DATA, *PAD_CUSTOMER_DATA, FAR * LPAD_CUSTOMER_DATA;

// struct used to read / write customer WORD data 
typedef struct _AD_CUSTOMER_WORDDATA{
	ULONG address;
	LPWORD dataBuf;
} AD_CUSTOMER_WORDDATA, *PAD_CUSTOMER_WORDDATA, FAR * LPAD_CUSTOMER_WORDDATA;
// End of Customer_Data

// the scale and offset structure for Gain Code
typedef struct tagDEVSCALES
{
    USHORT  usGainCde;
    double  dOffset;
    double  dScale;
} DEVSCALES, *LPDEVSCALES;

// For 32-bit Data Structure ************************************
typedef struct tagPT_AIBinaryIn32
{
    USHORT      chan;
    USHORT      TrigMode;
    PVOID       reading;
    USHORT      typeID;
} PT_AIBinaryIn32, *LPT_AIBinaryIn32;
typedef PT_AIBinaryIn32 PT_AIBinaryIn;
typedef LPT_AIBinaryIn32 LPT_AIBinaryIn;

typedef struct tagPT_MAIBinaryIn32
{
    USHORT      NumChan;
    USHORT      StartChan;
    USHORT      TrigMode;
    PVOID       ReadingArray;
    USHORT      typeID;
} PT_MAIBinaryIn32, *LPT_MAIBinaryIn32;
typedef PT_MAIBinaryIn32 PT_MAIBinaryIn;
typedef LPT_MAIBinaryIn32 LPT_MAIBinaryIn;

typedef struct tagPT_FAIIntStart32
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      chan;
    USHORT      gain;
    PVOID       buffer;
    ULONG       count;
    USHORT      cyclic;
    USHORT      IntrCount;
    USHORT      typeID;
} PT_FAIIntStart32, *LPT_FAIIntStart32;
typedef PT_FAIIntStart32 PT_FAIIntStart;
typedef LPT_FAIIntStart32 LPT_FAIIntStart;

typedef struct tagPT_FAIIntScanStart32
{
    USHORT      TrigSrc;
    DWORD       SampleRate;
    USHORT      NumChans;
    USHORT      StartChan;
    USHORT*     GainList;
    PVOID       buffer;
    ULONG       count;
    USHORT      cyclic;
    USHORT      IntrCount;
    USHORT      typeID;
} PT_FAIIntScanStart32, *LPT_FAIIntScanStart32;
typedef PT_FAIIntScanStart32 PT_FAIIntScanStart;
typedef LPT_FAIIntScanStart32 LPT_FAIIntScanStart;

typedef struct tagPT_FAIDmaExStart32
{
    USHORT      TrigSrc;        //Trigger source : internal,external
    USHORT      TrigMode;       //Trigger Mode : Pacer, Post, Delay, About
    USHORT      ClockSrc;       //Clock source : internel, external
    USHORT      TrigEdge;       //Trigger Edge : Rise 0 Fall 1
    USHORT      SRCType;        //Source type  : Digtal 0, Analog
    FLOAT       TrigVol;        //Analog Trigger type Trigger voltage
    USHORT      CyclicMode;     //Cyclic, noncyclic
    USHORT      NumChans;       //Scan number of channel
    USHORT      StartChan;      //Start channel
    ULONG       ulDelayCnt;     //Delay count
    ULONG       count;          //Number of sample
    ULONG       SampleRate;     //Sampling rate
    USHORT*     GainList;       //Gain code list
    USHORT*     CondList;       //Trigger condition
    TRIGLEVEL*  LevelList;      //Trigger level
    PVOID       buffer0;        //Buffer pointer
    PVOID       buffer1;        //Buffer pointer (reserved)
    USHORT*     Pt1;            //Reserve parameter
    USHORT*     Pt2;            //Reserve Parameter
    USHORT*     Pt3;            //Reserve Parameter
    USHORT      typeID;
}PT_FAIDmaExStart32, *LPT_FAIDmaExStart32;
typedef PT_FAIDmaExStart32 PT_FAIDmaExStart;
typedef LPT_FAIDmaExStart32 LPT_FAIDmaExStart;

/**************************************************************************
    Function Declaration
***************************************************************************/

#if !defined(_WIN31)
   #define FEXPORT __declspec (dllexport)
   #define FTYPE  CALLBACK
#else
   #define FEXPORT extern
   #define FTYPE  FAR PASCAL
#endif


/**************************************************************************
    Function Declaration
***************************************************************************/

FEXPORT LRESULT FTYPE DeviceConfig (
   ULONG DeviceNum,
   DWORD BoardID,
   HWND owner );
FEXPORT LRESULT FTYPE DeviceOpen(ULONG DeviceNum, LONG_PTR far * DeviceHandle);
FEXPORT LRESULT FTYPE DeviceClose(LONG_PTR far * DeviceHandle);
FEXPORT LRESULT FTYPE DeviceGetFeatures(LONG_PTR DeviceHandle,
                     DEVFEATURES far * buffer, USHORT size);
FEXPORT LRESULT FTYPE AIConfig(LONG_PTR DeviceHandle,USHORT DasChan,
                     USHORT DasGain);
FEXPORT LRESULT FTYPE AIGetConfig(LONG_PTR DeviceHandle,LPDEVCONFIG_AI buffer,
                     USHORT size);
FEXPORT LRESULT FTYPE AIBinaryIn(LONG_PTR DeviceHandle,USHORT chan,
                     USHORT TrigMode,USHORT far * reading);
FEXPORT LRESULT FTYPE AIScale(USHORT reading,FLOAT MaxVolt,USHORT MaxCount,
                     USHORT offset,FLOAT far * voltage);
FEXPORT LRESULT FTYPE AIVoltageIn(LONG_PTR DeviceHandle,USHORT chan,
                     USHORT gain,USHORT TrigMode,FLOAT far * voltage);
FEXPORT LRESULT FTYPE AIVoltageInExp(LONG_PTR DeviceHandle,USHORT DasChan,
                     USHORT DasGain,USHORT ExpChan,FLOAT far * voltage);
FEXPORT LRESULT FTYPE MAIConfig(LONG_PTR DeviceHandle,USHORT NumChan,
                     USHORT StartChan,USHORT far * GainArray);
FEXPORT LRESULT FTYPE MAIBinaryIn(LONG_PTR DeviceHandle,USHORT NumChan,
                     USHORT StartChan,USHORT TrigMode,USHORT far * ReadingArray);
FEXPORT LRESULT FTYPE MAIVoltageIn(LONG_PTR DeviceHandle,USHORT NumChan,
                     USHORT StartChan,USHORT far * GainArray,
                     USHORT TrigMode,FLOAT far * VoltageArray);
FEXPORT LRESULT FTYPE MAIVoltageInExp(LONG_PTR DeviceHandle,USHORT NumChan,
                     USHORT far * DasChanArray,USHORT far * DasGainArray,
                     USHORT far * ExpChanArray,FLOAT far * VoltageArray);
FEXPORT LRESULT FTYPE TCMuxRead(LONG_PTR DeviceHandle,USHORT DasChan,
                     USHORT DasGain,USHORT ExpChan,USHORT TCType,
                     USHORT TempScale,FLOAT far * temp);
FEXPORT LRESULT FTYPE AOConfig(LONG_PTR DeviceHandle,USHORT chan,USHORT RefSrc,
                     FLOAT MaxValue,FLOAT MinValue);

FEXPORT LRESULT FTYPE AOBinaryOut(LONG_PTR DeviceHandle,USHORT chan,USHORT BinData);
FEXPORT LRESULT FTYPE AOVoltageOut(LONG_PTR DeviceHandle,USHORT chan,FLOAT OutputValue);
FEXPORT LRESULT FTYPE AOScale(LONG_PTR DeviceHandle,USHORT chan,FLOAT OutputValue,
                     USHORT far * BinData);
FEXPORT LRESULT FTYPE DioSetPortMode(LONG_PTR DeviceHandle,USHORT port,
                     USHORT dir);
FEXPORT LRESULT FTYPE DioGetConfig(LONG_PTR DeviceHandle,SHORT far * PortArray,
                     USHORT NumOfPorts);
FEXPORT LRESULT FTYPE DioReadPortByte(LONG_PTR DeviceHandle,USHORT port,
                     USHORT far * value);
FEXPORT LRESULT FTYPE DioWritePortByte(LONG_PTR DeviceHandle,USHORT port,
                     USHORT mask,USHORT state);
FEXPORT LRESULT FTYPE DioReadBit(LONG_PTR DeviceHandle,USHORT port,USHORT bit,
                     USHORT far * state);
FEXPORT LRESULT FTYPE DioWriteBit(LONG_PTR DeviceHandle,USHORT port,USHORT bit,
                     USHORT state);
FEXPORT LRESULT FTYPE DioGetCurrentDOByte(LONG_PTR DeviceHandle,USHORT port,
                     USHORT far * value);
FEXPORT LRESULT FTYPE DioGetCurrentDOBit(LONG_PTR DeviceHandle,USHORT port,
                     USHORT bit,USHORT far * state);
FEXPORT LRESULT FTYPE WritePortByte(LONG_PTR DeviceHandle,USHORT port,
                     USHORT ByteData);
FEXPORT LRESULT FTYPE WritePortWord(LONG_PTR DeviceHandle,USHORT port,
                     USHORT WordData);
//\\\\\\\\\\\\\\\\\ 2.0C ////////////////////
FEXPORT LRESULT FTYPE WritePortDword(LONG_PTR DeviceHandle,USHORT port,
                     ULONG DwordData);
////////////////// 2.0C /////////////////////

FEXPORT LRESULT FTYPE ReadPortByte(LONG_PTR DeviceHandle,USHORT port,
                     USHORT far * ByteData);
FEXPORT LRESULT FTYPE ReadPortWord(LONG_PTR DeviceHandle,USHORT port,
                     USHORT far * WordData);
//\\\\\\\\\\\\\\\\\ 2.0C ////////////////////
FEXPORT LRESULT FTYPE ReadPortDword(LONG_PTR DeviceHandle,USHORT port,
                     ULONG far * DwordData);
////////////////// 2.0C ////////////////////

FEXPORT LRESULT FTYPE CounterEventStart(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT GateMode);
FEXPORT LRESULT FTYPE CounterEventRead(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT far * overflow,ULONG far * count);
FEXPORT LRESULT FTYPE CounterFreqStart(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT GatePeriod,USHORT GateMode);
FEXPORT LRESULT FTYPE CounterFreqRead(LONG_PTR DeviceHandle,USHORT counter,
                     FLOAT far * freq);
FEXPORT LRESULT FTYPE CounterPulseStart(LONG_PTR DeviceHandle,USHORT counter,
                FLOAT period,FLOAT UpCycle,USHORT GateMode);
FEXPORT LRESULT FTYPE CounterReset(LONG_PTR DeviceHandle,USHORT counter);
FEXPORT LRESULT FTYPE QCounterConfig(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT LatchSrc,USHORT LatchOverflow,USHORT ResetOnLatch,
                     USHORT ResetValue);
FEXPORT LRESULT FTYPE QCounterConfigSys(LONG_PTR DeviceHandle,USHORT SysClock,
                     USHORT TimeBase, USHORT TimeDivider,USHORT CascadeMode);
FEXPORT LRESULT FTYPE QCounterStart(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT InputMode);
FEXPORT LRESULT FTYPE QCounterRead(LONG_PTR DeviceHandle,USHORT counter,
                     USHORT far * overflow,ULONG far * LoCount,
                     ULONG far * HiCount);
FEXPORT LRESULT FTYPE AlarmConfig(LONG_PTR DeviceHandle,USHORT chan,
                     FLOAT LoLimit,FLOAT HiLimit);
FEXPORT LRESULT FTYPE AlarmEnable(LONG_PTR DeviceHandle,USHORT chan,
                     USHORT LatchMode,USHORT enabled);
FEXPORT LRESULT FTYPE AlarmCheck(LONG_PTR DeviceHandle,USHORT chan,
                     USHORT far * LoState,USHORT far * HiState);
FEXPORT LRESULT FTYPE AlarmReset(LONG_PTR DeviceHandle,USHORT chan);
FEXPORT LRESULT FTYPE COMOpen(USHORT PortNum, LONG_PTR far * ComHandle,
                     LONG_PTR far * DeviceHandle);
FEXPORT LRESULT FTYPE COMClose(LONG_PTR far * DeviceHandle);
FEXPORT LRESULT FTYPE COMGetConfig(ULONG DeviceNum, LPDEVCONFIG_COM buffer);
FEXPORT LRESULT FTYPE COMSetConfig(LONG_PTR DeviceHandle, LPDEVCONFIG_COM buffer);
FEXPORT LRESULT FTYPE COMRead(LONG_PTR DeviceHandle, LPSTR buffer,
                     USHORT BufferSize, USHORT TimeOut, CHAR FinalChar,
                     USHORT far * ReadCount);
FEXPORT LRESULT FTYPE COMReadEx(LONG_PTR DeviceHandle, LPSTR buffer,
                     USHORT BufferSize, USHORT TimeOut, CHAR FinalChar,
                     USHORT far * ReadCount);                     
FEXPORT LRESULT FTYPE COMWrite(LONG_PTR DeviceHandle,LPSTR buffer,
                     USHORT DataLength);
FEXPORT LRESULT FTYPE COMWrite232(LONG_PTR DeviceHandle,LPSTR buffer,
                     USHORT DataLength);
FEXPORT LRESULT FTYPE COMWrite485(LONG_PTR DeviceHandle,LPSTR buffer,
                     USHORT DataLength);
FEXPORT LRESULT FTYPE COMWrite85(LONG_PTR DeviceHandle,LPSTR buffer,
                     USHORT DataLength);
// Add by Mely_Shi(2001-8-1)
FEXPORT LRESULT FTYPE COMClear(LONG_PTR DeviceHandle);   

FEXPORT LRESULT FTYPE COMEscape(LONG_PTR DeviceHandle, USHORT escape);
FEXPORT LRESULT FTYPE WDTEnable(LONG_PTR DeviceHandle,USHORT message,
                     HWND Destination);
FEXPORT LRESULT FTYPE WDTRefresh(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE WDTReset(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE TimerCountSetting(LONG_PTR DeviceHandle,USHORT counter,
                ULONG Count);
FEXPORT LRESULT FTYPE CounterPWMSetting(LONG_PTR DeviceHandle,USHORT counter,
                FLOAT period,FLOAT UpCycle,ULONG OutCount,USHORT GateMode);
FEXPORT LRESULT FTYPE CounterPWMEnable(LONG_PTR DeviceHandle,USHORT Port);
FEXPORT LRESULT FTYPE DioTimerSetting(LONG_PTR DeviceHandle,USHORT Port,USHORT TimeronEnable,
                             USHORT TimeroffEnable,USHORT far * OnDuration,
                             USHORT far * OffDuration);
FEXPORT LRESULT FTYPE DICounterReset(LONG_PTR DeviceHandle,USHORT counter);
FEXPORT LRESULT FTYPE EnableSyncAO(LONG_PTR DeviceHandle,USHORT Enable);
FEXPORT LRESULT FTYPE WriteSyncAO(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE AOCurrentOut(LONG_PTR DeviceHandle,USHORT chan,FLOAT OutputValue);
FEXPORT LRESULT FTYPE GetFIFOSize(LONG_PTR DeviceHandle,LONG far * lSize);
FEXPORT LRESULT FTYPE PWMStartRead(LONG_PTR DeviceHandle, USHORT usChan, FLOAT far *flHiperiod, FLOAT far *flLowperiod);

// Only for ADAM
FEXPORT LRESULT FTYPE AISetHWConfig(LONG DeviceHandle,USHORT InputRange, USHORT DataFormat, USHORT IntegrationTime);
FEXPORT LRESULT FTYPE AIGetHWConfig(LONG DeviceHandle,USHORT far * InputRange, USHORT far * DataFormat, USHORT far * IntegrationTime);
FEXPORT LRESULT FTYPE AOSetHWConfig(LONG DeviceHandle,USHORT Chan, USHORT OutputRange, USHORT DataFormat, USHORT SlewRate);
FEXPORT LRESULT FTYPE AOGetHWConfig(LONG DeviceHandle,USHORT Chan, USHORT far * OutputRange, USHORT far * DataFormat, USHORT far * SlewRate);
FEXPORT LRESULT FTYPE CounterSetHWConfig(LONG DeviceHandle,USHORT CounterMode, USHORT DataFormat,USHORT GateMode);
FEXPORT LRESULT FTYPE CounterGetHWConfig(LONG DeviceHandle,USHORT far * CounterMode, USHORT far * DataFormat,USHORT far * GateMode);

// High speed function declaration
FEXPORT LRESULT FTYPE FAIIntStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT chan,USHORT gain,
                     USHORT far * buffer, ULONG count,
                     USHORT cyclic, USHORT IntrCount);
FEXPORT LRESULT FTYPE FAIIntScanStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT NumChans,
                     USHORT StartChan,USHORT far * GainList,
                     USHORT far * buffer,ULONG count,USHORT cyclic,
                     USHORT IntrCount);
FEXPORT LRESULT FTYPE FAIDmaStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT chan,USHORT gain,
                     USHORT far * buffer, ULONG count);
FEXPORT LRESULT FTYPE FAIDmaScanStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT NumChans,
                     USHORT StartChan,USHORT far * GainList,
                     USHORT far * buffer,ULONG count);
FEXPORT LRESULT FTYPE FAIDualDmaStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT chan,USHORT gain,
                     USHORT far * BufferA, USHORT far * BufferB,
                     ULONG count);
FEXPORT LRESULT FTYPE FAIDualDmaScanStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT NumChans,
                     USHORT StartChan,USHORT far * GainList,
                     USHORT far * BufferA, USHORT far * BufferB,
                     ULONG count);
FEXPORT LRESULT FTYPE FAITransfer(LONG_PTR DeviceHandle,USHORT ActiveBuf,
                     LPVOID DataBuffer,USHORT DataType,ULONG start,
                     ULONG count,USHORT far *overrun);
FEXPORT LRESULT FTYPE FAICheck(LONG_PTR DeviceHandle,USHORT far * ActiveBuf,
                     USHORT far * stopped,ULONG  far * retrieved,
                     USHORT far * overrun,USHORT far * HalfReady);
FEXPORT LRESULT FTYPE FAIWatchdogConfig(LONG_PTR DeviceHandle,USHORT TrigMode,
                     USHORT NumChans,USHORT StartChan,USHORT far * GainList,
                     USHORT far * CondList, TRIGLEVEL far * LevelList);
FEXPORT LRESULT FTYPE FAIIntWatchdogStart(LONG_PTR DeviceHandle, USHORT TrigSrc,
                     DWORD SampleRate,USHORT far * buffer,
                     ULONG count, USHORT cyclic, USHORT IntrCount);
FEXPORT LRESULT FTYPE FAIDmaWatchdogStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT far * BufferA,
                     USHORT far * BufferB,ULONG count);
FEXPORT LRESULT FTYPE FAIWatchdogCheck(LONG_PTR DeviceHandle,USHORT DataType,
                     USHORT far * ActiveBuf,USHORT far * triggered,
                     USHORT far * TrigChan,ULONG far * TrigIndex,
                     LPVOID TrigData);
FEXPORT LRESULT FTYPE FAIStop(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE FAOIntStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT chan,LONG far * buffer,
                     ULONG count, USHORT cyclic);
FEXPORT LRESULT FTYPE FAODmaStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                     DWORD SampleRate,USHORT chan,USHORT far * buffer,
                     ULONG count);
FEXPORT LRESULT FTYPE FAODmaExStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                                    DWORD SampleRate,USHORT chan, USHORT chanCount,
                                    USHORT PacerSource, USHORT far * buffer, ULONG count, USHORT cyclic);
FEXPORT LRESULT FTYPE FAOScale(LONG_PTR DeviceHandle,USHORT chan,
                     ULONG count,FLOAT far * VoltArray,
                     USHORT far * BinArray);
FEXPORT LRESULT FTYPE FAOLoad(LONG_PTR DeviceHandle,USHORT ActiveBuf,
                     USHORT far * DataBuffer,ULONG start,ULONG count);
FEXPORT LRESULT FTYPE FAOCheck(LONG_PTR DeviceHandle,USHORT far * ActiveBuf,                               
                               USHORT far * stopped,ULONG far * CurrentCount,                               
                               USHORT far * overrun,USHORT far * HalfReady);
// For new unified FAO functions.
FEXPORT LRESULT FTYPE FAOCheckEx(
                         LONG_PTR DeviceHandle,
                         USHORT far * ActiveBuf,                                 
                         USHORT far * stopped,
                         USHORT far * HalfReady, 
                         ULONG far * Transfered,
                         USHORT far * Underrun );

FEXPORT LRESULT FTYPE FAOStop(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE ClearOverrun(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE EnableEvent(LONG_PTR DeviceHandle, USHORT EventType,
                     USHORT Enabled, USHORT Count);
FEXPORT LRESULT FTYPE CheckEvent(LONG_PTR DeviceHandle,USHORT far *EventType,
                     DWORD Milliseconds);
FEXPORT LRESULT FTYPE EnableCANEvent(LONG DeviceHandle,USHORT usEventType,
                USHORT usEnabled,CHAR far *EventName);
FEXPORT LRESULT FTYPE GetCANEventData(USHORT FAR * Port,USHORT FAR * MacID,
                 USHORT FAR * Type,CHAR FAR * Data);
FEXPORT LRESULT FTYPE AllocateDMABuffer(LONG_PTR DeviceHandle, USHORT CyclicMode,
                     ULONG RequestBufSize, ULONG far * ActualBufSize,
                     LONG_PTR far * buffer);
FEXPORT LRESULT FTYPE FreeDMABuffer(LONG_PTR DeviceHandle,LONG_PTR far * buffer);
FEXPORT LRESULT FTYPE EnableEventEx(LONG_PTR DeviceHandle, LPT_EnableEventEx  lpEnableEventEx);
FEXPORT LRESULT FTYPE FDITransfer(LONG_PTR DeviceHandle,USHORT usEventType, ULONG far * ulRetData);
FEXPORT LRESULT FTYPE FAIDmaExStart(LONG_PTR DeviceHandle, USHORT TrigSrc, USHORT TrigMode, USHORT ClockSrc, USHORT TrigEdge, 
           USHORT SRCType, FLOAT TrigVol, USHORT CyclicMode, USHORT NumChans, USHORT StartChan, ULONG ulDelayCnt,
           ULONG count, DWORD SampleRate, USHORT *GainList, USHORT *CondList, USHORT *LevelList, USHORT *buffer0,
           USHORT *buffer1, USHORT *Pt1, USHORT *Pt2, USHORT *Pt3);

FEXPORT LRESULT FTYPE FAOWaveFormStart(LONG_PTR DeviceHandle,USHORT TrigSrc,
                  DWORD SampleRate,ULONG WaveCount, ULONG count, 
                  USHORT far * Buffer,USHORT usEnabledChannel);

//\\\\\\\\\\\\\\\\\ 2.0C ////////////////////
FEXPORT LRESULT FTYPE FDIStart( LONG_PTR lDev, USHORT Cyclic, ULONG dwCount, PVOID pBuf); 
FEXPORT LRESULT FTYPE FDICheck( LONG_PTR lDev, PULONG pdwStatus, PULONG pdwRetrieved);
FEXPORT LRESULT FTYPE FDIStop( LONG_PTR lDev);
FEXPORT LRESULT FTYPE ClearFlag(LONG_PTR lDev, ULONG dwEventType);
FEXPORT LRESULT FTYPE FDOStart(LONG_PTR lDev, USHORT wCyclic, ULONG dwCount, PVOID pBuf); 
FEXPORT LRESULT FTYPE FDOCheck(LONG_PTR lDev, PULONG pdwStatus, PULONG pdwRetrieved);
FEXPORT LRESULT FTYPE FDOStop(LONG_PTR lDev);
////////////////// 2.0C \\\\\\\\\\\\\\\\\\\\\/
//\\\\\\\\\\\\\\\\ 2.2 ///////////////////////
FEXPORT LRESULT FTYPE WatchdogStart(LONG_PTR lDev); 
FEXPORT LRESULT FTYPE WatchdogFeed(LONG_PTR lDev);
FEXPORT LRESULT FTYPE WatchdogStop(LONG_PTR lDev);
///////////////////// V2.2 /////////////////////

//\\\\\\\\\\\\\\\\ 2.2C ///////////////////////
FEXPORT LRESULT FTYPE DioReadPortWord(LONG_PTR DeviceHandle,USHORT port,
                                      USHORT * ValidChannelMask,       // Xi'an added
                                      USHORT far * value);
FEXPORT LRESULT FTYPE DioWritePortWord(LONG_PTR DeviceHandle,USHORT port,
                                       USHORT mask,USHORT state);
FEXPORT LRESULT FTYPE DioReadPortDword(LONG_PTR DeviceHandle,USHORT port,
                                       ULONG * ValidChannelMask,       // Xi'an added
                                       ULONG far * value);
FEXPORT LRESULT FTYPE DioWritePortDword(LONG_PTR DeviceHandle,USHORT port,
                                        ULONG mask, ULONG state);												   
FEXPORT LRESULT FTYPE DioGetCurrentDOWord(LONG_PTR DeviceHandle,USHORT port,
                                          USHORT * ValidChannelMask,       // Xi'an added
                                          USHORT far * value);
FEXPORT LRESULT FTYPE DioGetCurrentDODword(LONG_PTR DeviceHandle,USHORT port,
                                           ULONG * ValidChannelMask,
                                           ULONG far * value);
FEXPORT LRESULT FTYPE FAITerminate(LONG_PTR DeviceHandle);
FEXPORT LRESULT FTYPE FAOTerminate(LONG_PTR DeviceHandle);
///////////////////// V2.2C /////////////////////

// Supporting new driver structure
///////////////////// V2.3a /////////////////////
FEXPORT LRESULT FTYPE DioEnableEventAndSpecifyDiPorts( 
                                              LONG_PTR  DriverHandle,
                                              ULONG dwEventID, 
                                              ULONG dwScanStart, 
                                              ULONG dwScanCount );

FEXPORT LRESULT FTYPE DioDisableEvent( 
                              LONG_PTR  DriverHandle,
                              ULONG dwEventID );

FEXPORT LRESULT FTYPE DioGetLatestEventDiPortsState( 
                                            LONG_PTR   DriverHandle,
                                            ULONG  dwEventID,
                                            LPBYTE pBuffer,
                                            ULONG  dwLength );

FEXPORT LRESULT FTYPE DioReadDiPorts(
                             LONG_PTR     DriverHandle,
                             ULONG    dwPortStart,
                             ULONG    dwPortCount,
                             LPBYTE   pBuffer);

FEXPORT LRESULT FTYPE DioWriteDoPorts(
                              LONG_PTR     DriverHandle,
                              ULONG    dwPortStart,
                              ULONG    dwPortCount,
                              LPBYTE   pBuffer);

FEXPORT LRESULT FTYPE DioGetCurrentDoPortsState(
                                        LONG_PTR     DriverHandle,
                                        ULONG    dwPortStart,
                                        ULONG    dwPortCount,
                                        LPBYTE   pBuffer);
// End of new drive structure


// CAN bus function declaration
FEXPORT LRESULT FTYPE CANPortOpen(WORD DevNum, WORD *wPort,
                      WORD *wHostID, WORD *wBaudRate);
FEXPORT LRESULT FTYPE CANPortClose(WORD wPort);
FEXPORT LRESULT FTYPE CANInit(WORD Port,WORD BTR0,WORD BTR1,UCHAR usMask);
FEXPORT LRESULT FTYPE CANReset(WORD Port);
FEXPORT LRESULT FTYPE CANInpb(WORD Port,WORD Offset,UCHAR FAR *Data);
FEXPORT LRESULT FTYPE CANOutpb(WORD Port,WORD Offset,UCHAR Value);
FEXPORT LRESULT FTYPE CANSetBaud(WORD Port,WORD BTR0,WORD BTR1);
FEXPORT LRESULT FTYPE CANGetBaudRate(WORD Port,WORD *wBaudRate);
FEXPORT LRESULT FTYPE CANSetAcp(WORD Port,WORD Acp,WORD Mask);
FEXPORT LRESULT FTYPE CANSetOutCtrl(WORD Port,WORD OutCtrl);
FEXPORT LRESULT FTYPE CANSetNormal(WORD Port);
FEXPORT LRESULT FTYPE CANHwReset(WORD Port);
FEXPORT LRESULT FTYPE CANSendMsg(WORD Port,UCHAR FAR *TxBuf,BOOL Wait);
FEXPORT LRESULT FTYPE CANQueryMsg(WORD Port,BOOL FAR *Ready,
                      UCHAR FAR *RcvBuf);
FEXPORT LRESULT FTYPE CANWaitForMsg(WORD Port,UCHAR FAR *RcvBuf,
                      ULONG uTimeValue);
FEXPORT LRESULT FTYPE CANQueryID(WORD Port,BOOL FAR *Ready,
                      UCHAR FAR *IDBuf);
FEXPORT LRESULT FTYPE CANWaitForID(WORD Port,UCHAR FAR *IDBuf,
                      ULONG uTimeValue);
FEXPORT LRESULT FTYPE CANEnableMessaging(WORD Port,WORD Type,
                      BOOL Enabled,HWND AppWnd,UCHAR FAR *RcvBuf);
FEXPORT LRESULT FTYPE CANGetEventName(WORD Port,CHAR *RcvBuf);
FEXPORT LRESULT FTYPE CANEnableEvent(USHORT Port, BOOL Enabled);
FEXPORT LRESULT FTYPE CANCheckEvent(USHORT Port, DWORD Milliseconds);
FEXPORT LRESULT FTYPE CANPortOpenX(WORD wPort, DWORD dwMemoryAddress, ULONG IRQ);

// Function Declaration for PCL-839
FEXPORT int FTYPE set_base(int address);
FEXPORT int FTYPE set_mode(int chan, int mode);
FEXPORT int FTYPE set_speed(int chan, int low_speed, int high_speed, int accelerate);
FEXPORT int FTYPE status(int chan);
FEXPORT int FTYPE m_stop(int chan);
FEXPORT int FTYPE slowdown(int chan);
FEXPORT int FTYPE sldn_stop(int chan);
FEXPORT int FTYPE waitrdy(int chan);
FEXPORT int FTYPE chkbusy(void);
FEXPORT int FTYPE out_port(int port_no, int value);
FEXPORT int FTYPE in_port(int port_no);
FEXPORT int FTYPE In_byte(int offset);
FEXPORT int FTYPE Out_byte(int offset , int value);
FEXPORT int FTYPE org(int chan, int dir1, int speed1, int dir2, int speed2 , int dir3, int speed3);
FEXPORT int FTYPE cmove(int chan, int dir1, int speed1, int dir2, int speed2, int dir3, int speed3);
FEXPORT int FTYPE pmove(int ch, int dir1, int speed1, long step1, int dir2, int speed2, long step2,
                        int dir3, int speed3, long step3);
//2003/4/18 \\\\\\\\\\\\\\\\\\\ 2.1 ///////////////////
FEXPORT int FTYPE arc(int plan_ch, int dirc, long x1, long y1, long x2, long y2);
FEXPORT int FTYPE line(int plan_ch, int dx, int dy);
FEXPORT int FTYPE line3D(int plan_ch, int dx, int dy, int dz);
//2003/4/18 /////////////////// 2.1 \\\\\\\\\\\\\\\\\\\/
                        

/**************************************************************************
    Function Declaration for ADSAPI32
***************************************************************************/

FEXPORT LRESULT FTYPE DRV_DeviceGetNumOfList(SHORT far *NumOfDevices);
FEXPORT LRESULT FTYPE DRV_DeviceGetList(DEVLIST far *DeviceList,
                       SHORT MaxEntries, SHORT far *OutEntries);
FEXPORT LRESULT FTYPE DRV_DeviceGetSubList(DWORD DeviceNum,
                       DEVLIST far *SubDevList, SHORT MaxEntries,
                       SHORT far *OutEntries);
                       
//Modified by Ann.He 03/02/21
#ifndef _WIN32_WCE
FEXPORT LRESULT FTYPE DRV_SelectDevice(HWND hCaller, BOOL GetModule,
                      ULONG *DeviceNum, UCHAR *Description);
#else
FEXPORT LRESULT FTYPE DRV_SelectDevice(HWND hCaller, BOOL GetModule,
                      ULONG *DeviceNum, TCHAR *Description);
#endif
//end

FEXPORT LRESULT FTYPE DRV_DeviceOpen(ULONG DeviceNum, LONG_PTR far * DriverHandle);
FEXPORT LRESULT FTYPE DRV_DeviceClose(LONG_PTR far * DriverHandle);
FEXPORT LRESULT FTYPE DRV_DeviceGetFeatures(LONG_PTR DriverHandle,
                       LPT_DeviceGetFeatures lpDevFeatures);
//\\\\\\\\\\\\\\\\\\\ 2.0C ///////////////////
FEXPORT LRESULT FTYPE DRV_DeviceSetProperty(LONG_PTR DriverHandle, USHORT nID, 
                       void* pBuffer, ULONG  dwLength);
FEXPORT LRESULT FTYPE DRV_DeviceGetProperty(LONG_PTR DriverHandle, USHORT nID, 
                       void* pBuffer, ULONG*  pLength);
///////////////////// 2.0C ///////////////////

FEXPORT LRESULT FTYPE DRV_BoardTypeMapBoardName(DWORD BoardID, LPSTR ExpName);

//Modified by Ann.He 03/02/21
#ifndef _WIN32_WCE
FEXPORT VOID    FTYPE DRV_GetErrorMessage(LRESULT lError,LPSTR lpszErrMsg);
#else
FEXPORT VOID    FTYPE DRV_GetErrorMessage(LRESULT lError,LPTSTR lpszErrMsg);
#endif
//end


FEXPORT LRESULT FTYPE DRV_AIConfig(LONG_PTR DriverHandle,
                      LPT_AIConfig lpAIConfig);
FEXPORT LRESULT FTYPE DRV_AIGetConfig(LONG_PTR DriverHandle,
                      LPT_AIGetConfig lpAIGetConfig);
// support 32-bit data structure
FEXPORT LRESULT FTYPE DRV_AIBinaryIn(LONG_PTR DriverHandle,
                      LPT_AIBinaryIn32 lpAIBinaryIn32);
FEXPORT LRESULT FTYPE DRV_AIScale(LONG_PTR DriverHandle,
                      LPT_AIScale lpAIScale);
FEXPORT LRESULT FTYPE DRV_AIVoltageIn(LONG_PTR DriverHandle,
                      LPT_AIVoltageIn lpAIVoltageIn);
FEXPORT LRESULT FTYPE DRV_AIVoltageInExp(LONG_PTR DriverHandle,
                      LPT_AIVoltageInExp lpAIVoltageInExp);
FEXPORT LRESULT FTYPE DRV_MAIConfig(LONG_PTR DriverHandle,
                      LPT_MAIConfig lpMAIConfig);
// support 32-bit data structure
FEXPORT LRESULT FTYPE DRV_MAIBinaryIn(LONG_PTR DriverHandle,
                      LPT_MAIBinaryIn32 lpMAIBinaryIn32);
FEXPORT LRESULT FTYPE DRV_MAIVoltageIn(LONG_PTR DriverHandle,
                      LPT_MAIVoltageIn lpMAIVoltageIn);
FEXPORT LRESULT FTYPE DRV_MAIVoltageInExp(LONG_PTR DriverHandle,
                      LPT_MAIVoltageInExp lpMAIVoltageInExp);
FEXPORT LRESULT FTYPE DRV_TCMuxRead(LONG_PTR DriverHandle,
                      LPT_TCMuxRead lpTCMuxRead);
FEXPORT LRESULT FTYPE DRV_AOConfig(LONG_PTR DriverHandle,
                      LPT_AOConfig lpAOConfig);
FEXPORT LRESULT FTYPE DRV_AOBinaryOut(LONG_PTR DriverHandle,
                      LPT_AOBinaryOut lpAOBinaryOut);
FEXPORT LRESULT FTYPE DRV_AOVoltageOut(LONG_PTR DriverHandle,
                      LPT_AOVoltageOut lpAOVoltageOut);
FEXPORT LRESULT FTYPE DRV_AOScale(LONG_PTR DriverHandle,
                      LPT_AOScale lpAOScale);
FEXPORT LRESULT FTYPE DRV_DioSetPortMode(LONG_PTR DriverHandle,
                      LPT_DioSetPortMode lpDioSetPortMode);
FEXPORT LRESULT FTYPE DRV_DioGetConfig(LONG_PTR DriverHandle,
                      LPT_DioGetConfig lpDioGetConfig);
FEXPORT LRESULT FTYPE DRV_DioReadPortByte(LONG_PTR DriverHandle,
                      LPT_DioReadPortByte lpDioReadPortByte);
FEXPORT LRESULT FTYPE DRV_DioWritePortByte(LONG_PTR DriverHandle,
                      LPT_DioWritePortByte lpDioWritePortByte);
FEXPORT LRESULT FTYPE DRV_DioReadBit(LONG_PTR DriverHandle,
                      LPT_DioReadBit lpDioReadBit);
FEXPORT LRESULT FTYPE DRV_DioWriteBit(LONG_PTR DriverHandle,
                      LPT_DioWriteBit lpDioWriteBit);
FEXPORT LRESULT FTYPE DRV_DioGetCurrentDOByte(LONG_PTR DriverHandle,
                      LPT_DioGetCurrentDOByte lpDioGetCurrentDOByte);
FEXPORT LRESULT FTYPE DRV_DioGetCurrentDOBit(LONG_PTR DriverHandle,
                      LPT_DioGetCurrentDOBit lpDioGetCurrentDOBit);
FEXPORT LRESULT FTYPE DRV_WritePortByte(LONG_PTR DriverHandle,
                      LPT_WritePortByte lpWritePortByte);
FEXPORT LRESULT FTYPE DRV_WritePortWord(LONG_PTR DriverHandle,
                      LPT_WritePortWord lpWritePortWord);
//\\\\\\\\\\\\\\\\\\\\\ 2.0C /////////////////////
FEXPORT LRESULT FTYPE DRV_WritePortDword(LONG_PTR DriverHandle,
                      LPT_WritePortDword lpWritePortDword);
/////////////////////// 2.0C /////////////////////

FEXPORT LRESULT FTYPE DRV_ReadPortByte(LONG_PTR DriverHandle,
                      LPT_ReadPortByte lpReadPortByte);
FEXPORT LRESULT FTYPE DRV_ReadPortWord(LONG_PTR DriverHandle,
                      LPT_ReadPortWord lpReadPortWord);
//\\\\\\\\\\\\\\\\\\\\\ 2.0C /////////////////////
FEXPORT LRESULT FTYPE DRV_ReadPortDword(LONG_PTR DriverHandle,
                      LPT_ReadPortDword lpReadPortDword);
/////////////////////// 2.0C /////////////////////
FEXPORT LRESULT FTYPE DRV_CounterEventStart(LONG_PTR DriverHandle,
                      LPT_CounterEventStart lpCounterEventStart);
FEXPORT LRESULT FTYPE DRV_CounterEventRead(LONG_PTR DriverHandle,
                      LPT_CounterEventRead lpCounterEventRead);
FEXPORT LRESULT FTYPE DRV_CounterFreqStart(LONG_PTR DriverHandle,
                      LPT_CounterFreqStart lpCounterFreqStart);
FEXPORT LRESULT FTYPE DRV_CounterFreqRead(LONG_PTR DriverHandle,
                      LPT_CounterFreqRead lpCounterFreqRead);
FEXPORT LRESULT FTYPE DRV_CounterPulseStart(LONG_PTR DriverHandle,
                      LPT_CounterPulseStart lpCounterPulseStart);
FEXPORT LRESULT FTYPE DRV_CounterReset(LONG_PTR DriverHandle,
                      LPARAM counter);
FEXPORT LRESULT FTYPE DRV_QCounterConfig(LONG_PTR DriverHandle,
                      LPT_QCounterConfig lpQCounterConfig);
FEXPORT LRESULT FTYPE DRV_QCounterConfigSys(LONG_PTR DriverHandle,
                      LPT_QCounterConfigSys lpQCounterConfigSys);
FEXPORT LRESULT FTYPE DRV_QCounterStart(LONG_PTR DriverHandle,
                      LPT_QCounterStart lpQCounterStart);
FEXPORT LRESULT FTYPE DRV_QCounterRead(LONG_PTR DriverHandle,
                      LPT_QCounterRead lpQCounterRead);
FEXPORT LRESULT FTYPE DRV_AlarmConfig(LONG_PTR DriverHandle,
                      LPT_AlarmConfig lpAlarmConfig);
FEXPORT LRESULT FTYPE DRV_AlarmEnable(LONG_PTR DriverHandle,
                      LPT_AlarmEnable lpAlarmEnable);
FEXPORT LRESULT FTYPE DRV_AlarmCheck(LONG_PTR DriverHandle,
                      LPT_AlarmCheck lpAlarmCheck);
FEXPORT LRESULT FTYPE DRV_AlarmReset(LONG_PTR DriverHandle,
                      LPARAM chan);
FEXPORT LRESULT FTYPE DRV_WDTEnable(LONG_PTR DriverHandle,
                      LPT_WDTEnable lpWDTEnable);
FEXPORT LRESULT FTYPE DRV_WDTRefresh(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_WDTReset(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_TimerCountSetting(LONG_PTR DriverHandle,
                 LPT_TimerCountSetting lpTimerCountSetting);
FEXPORT LRESULT FTYPE DRV_CounterPWMSetting(LONG_PTR DriverHandle,
                      LPT_CounterPWMSetting lpCounterPWMSetting);
FEXPORT LRESULT FTYPE DRV_CounterPWMEnable(LONG_PTR DriverHandle,
                      LPARAM Port);
FEXPORT LRESULT FTYPE DRV_DioTimerSetting(LONG_PTR DriverHandle,
                 LPT_DioTimerSetting lpDioTimerSetting);
FEXPORT LRESULT FTYPE DRV_DICounterReset(LONG_PTR DriverHandle,
                      LPARAM counter);
FEXPORT LRESULT FTYPE DRV_EnableSyncAO(LONG_PTR DriverHandle, LPARAM Enable);
FEXPORT LRESULT FTYPE DRV_WriteSyncAO(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_AOCurrentOut(LONG_PTR DriverHandle,
                      LPT_AOCurrentOut lpAOCurrentOut);
FEXPORT LRESULT FTYPE DRV_DeviceNumToDeviceName(DWORD BoardID, LPSTR ExpName);
FEXPORT LRESULT FTYPE DRV_GetFIFOSize(LONG_PTR DriverHandle, LONG far * lSize);
FEXPORT LRESULT FTYPE DRV_PWMStartRead(LONG_PTR DriverHandle, LPT_PWMStartRead lpPWMStartRead);

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
FEXPORT LRESULT FTYPE DRV_CounterConfig( LONG_PTR DriverHandle, LPT_CounterConfig lpCounterConfig );
FEXPORT LRESULT FTYPE DRV_FreqOutStart( LONG_PTR DriverHandle,  LPT_FreqOutStart lpFreqOutStart );
FEXPORT LRESULT FTYPE DRV_FreqOutReset( LONG_PTR DriverHandle, LPARAM  channel );
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

//Only for ADAM configuration
FEXPORT LRESULT FTYPE DRV_ADAMCounterSetHWConfig(LONG DriverHandle,
                      LPT_ADAMCounterSetHWConfig lpCounterSetHWConfig);
FEXPORT LRESULT FTYPE DRV_ADAMCounterGetHWConfig(LONG DriverHandle,
                      LPT_ADAMCounterGetHWConfig lpCounterGetHWConfig);
FEXPORT LRESULT FTYPE DRV_ADAMAISetHWConfig(LONG DriverHandle,
                      LPT_ADAMAISetHWConfig lpADAMAISetHWConfig);
FEXPORT LRESULT FTYPE DRV_ADAMAIGetHWConfig(LONG DriverHandle,
                      LPT_ADAMAIGetHWConfig lpADAMAIGetHWConfig);
FEXPORT LRESULT FTYPE DRV_ADAMAOSetHWConfig(LONG DriverHandle,
                      LPT_ADAMAOSetHWConfig lpADAMAOSetHWConfig);
FEXPORT LRESULT FTYPE DRV_ADAMAOGetHWConfig(LONG DriverHandle,
                      LPT_ADAMAOGetHWConfig lpADAMAOGetHWConfig);
// Direct IO Function Listing
FEXPORT LRESULT FTYPE DRV_outp(ULONG DeviceNum,
                      USHORT port, USHORT ByteData);
FEXPORT LRESULT FTYPE DRV_outpw(ULONG DeviceNum,
                      USHORT port, USHORT WordData);
FEXPORT LRESULT FTYPE DRV_inp(ULONG DeviceNum,
                      USHORT port, USHORT far * ByteData);
FEXPORT LRESULT FTYPE DRV_inpw(ULONG DeviceNum,
                      USHORT port, USHORT far * WordData);
//\\\\\\\\\\\\\\\\\\\\\ 2.2 /////////////////////
FEXPORT LRESULT FTYPE DRV_inpdw(ULONG DeviceNum,
                     USHORT port, ULONG far * DwordData);
FEXPORT LRESULT FTYPE DRV_outpdw(ULONG DeviceNum,
                     USHORT port, ULONG DwordData);
/////////////////////// 2.2 \\\\\\\\\\\\\\\\\\\\\\
// High speed function declaration
FEXPORT LRESULT FTYPE DRV_FAIWatchdogConfig(LONG_PTR DriverHandle,
                      LPT_FAIWatchdogConfig lpFAIWatchdogConfig);
// support 32-bit data structure
FEXPORT LRESULT FTYPE DRV_FAIIntStart(LONG_PTR DriverHandle,
                      LPT_FAIIntStart32 lpFAIIntStart32);
// support 32-bit data structure
FEXPORT LRESULT FTYPE DRV_FAIIntScanStart(LONG_PTR DriverHandle,
                      LPT_FAIIntScanStart32 lpFAIIntScanStart32);
FEXPORT LRESULT FTYPE DRV_FAIDmaStart(LONG_PTR DriverHandle,
                      LPT_FAIDmaStart lpFAIDmaStart);
FEXPORT LRESULT FTYPE DRV_FAIDmaScanStart(LONG_PTR DriverHandle,
                      LPT_FAIDmaScanStart lpFAIDmaScanStart);
FEXPORT LRESULT FTYPE DRV_FAIDualDmaStart(LONG_PTR DriverHandle,
                      LPT_FAIDualDmaStart lpFAIDualDmaStart);
FEXPORT LRESULT FTYPE DRV_FAIDualDmaScanStart(LONG_PTR DriverHandle,
                      LPT_FAIDualDmaScanStart lpFAIDualDmaScanStart);
FEXPORT LRESULT FTYPE DRV_FAIIntWatchdogStart(LONG_PTR DriverHandle,
                      LPT_FAIIntWatchdogStart lpFAIIntWatchdogStart);
FEXPORT LRESULT FTYPE DRV_FAIDmaWatchdogStart(LONG_PTR DriverHandle,
                      LPT_FAIDmaWatchdogStart lpFAIDmaWatchdogStart);
FEXPORT LRESULT FTYPE DRV_FAICheck(LONG_PTR DriverHandle,
                      LPT_FAICheck lpFAICheck);
FEXPORT LRESULT FTYPE DRV_FAIWatchdogCheck(LONG_PTR DriverHandle,
                      LPT_FAIWatchdogCheck lpFAIWatchdogCheck);
FEXPORT LRESULT FTYPE DRV_FAITransfer(LONG_PTR DriverHandle,
                      LPT_FAITransfer lpFAITransfer);
FEXPORT LRESULT FTYPE DRV_FAIStop(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_FAOIntStart(LONG_PTR DriverHandle,
                      LPT_FAOIntStart lpFAOIntStart);
FEXPORT LRESULT FTYPE DRV_FAODmaStart(LONG_PTR DriverHandle,
                      LPT_FAODmaStart lpFAODmaStart);
FEXPORT LRESULT FTYPE DRV_FAODmaExStart(LONG_PTR DriverHandle,
                      LPT_FAODmaExStart lpFAODmaExStart);
FEXPORT LRESULT FTYPE DRV_FAOScale(LONG_PTR DriverHandle,
                      LPT_FAOScale lpFAOScale);
FEXPORT LRESULT FTYPE DRV_FAOLoad(LONG_PTR DriverHandle,
                      LPT_FAOLoad lpFAOLoad);
FEXPORT LRESULT FTYPE DRV_FAOCheck(LONG_PTR DriverHandle,
                      LPT_FAOCheck lpFAOCheck);
// For new unified FAO functions.
FEXPORT LRESULT FTYPE DRV_FAOCheckEx(LONG_PTR DriverHandle,                                     
                      LPT_FAOCheckEx lpFAOCheckEx);
FEXPORT LRESULT FTYPE DRV_FAOStop(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_ClearOverrun(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_EnableEvent(LONG_PTR DriverHandle,
                      LPT_EnableEvent lpEnableEvent);
FEXPORT LRESULT FTYPE DRV_CheckEvent(LONG_PTR DriverHandle,
                      LPT_CheckEvent lpCheckEvent);
FEXPORT LRESULT FTYPE DRV_EnableCANEvent(LONG_PTR DriverHandle,
                      LPT_EnableCANEvent lpEnableCANEvent);
FEXPORT LRESULT FTYPE DRV_GetCANEventData(LONG_PTR DriverHandle,
                      LPT_GetCANEventData lpGetCANEventData);
FEXPORT LRESULT FTYPE DRV_AllocateDMABuffer(LONG_PTR DriverHandle,
                      LPT_AllocateDMABuffer lpAllocateDMABuffer);
FEXPORT LRESULT FTYPE DRV_FreeDMABuffer(LONG_PTR DriverHandle,
                      LPARAM buffer);
FEXPORT LRESULT FTYPE DRV_EnableEventEx(LONG_PTR DriverHandle,
                      LPT_EnableEventEx lpEnableEventEx);
FEXPORT LRESULT FTYPE DRV_FDITransfer(LONG_PTR DriverHandle,
                      LPT_FDITransfer lpFDITransfer);
// support 32-bit data structure
FEXPORT LRESULT FTYPE DRV_FAIDmaExStart(LONG_PTR DriverHandle,
                      LPT_FAIDmaExStart32 lpFAIDmaExStart32);

FEXPORT LRESULT FTYPE DRV_FAOWaveFormStart(LONG_PTR DeviceHandle,
                  LPT_FAOWaveFormStart lpFAOWaveFormStart);

//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
FEXPORT LRESULT FTYPE DRV_DeviceGetParam(
   LONG_PTR       DriverHandle,       // Device handle
   LPT_DeviceGetParam  lpDeviceGetParam );
///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
FEXPORT LRESULT FTYPE DRV_FDIStart(LONG_PTR lDev, USHORT wCyclic, ULONG dwCount, PVOID pBuf);
FEXPORT LRESULT FTYPE DRV_FDICheck(LONG_PTR lDev, PULONG pdwStatus, PULONG pdwRetrieved);
FEXPORT LRESULT FTYPE DRV_FDIStop(LONG_PTR lDev);
FEXPORT LRESULT FTYPE DRV_ClearFlag(LONG_PTR lDev, ULONG dwEventType);
FEXPORT LRESULT FTYPE DRV_FDOStart(LONG_PTR lDev, USHORT wCyclic, ULONG dwCount, PVOID pBuf); 
FEXPORT LRESULT FTYPE DRV_FDOCheck(LONG_PTR lDev, PULONG pdwStatus, PULONG pdwRetrieved);
FEXPORT LRESULT FTYPE DRV_FDOStop(LONG_PTR lDev);
///////////////////// V2.0C /////////////////////
//\\\\\\\\\\\\\\\\\\\ V2.2 //////////////////////
FEXPORT LRESULT FTYPE DRV_WatchdogStart(LONG_PTR lDev, LPT_WatchdogStart lpWatchdogStart); 
FEXPORT LRESULT FTYPE DRV_WatchdogFeed(LONG_PTR lDev);
FEXPORT LRESULT FTYPE DRV_WatchdogStop(LONG_PTR lDev);
///////////////////// V2.2 /////////////////////

//\\\\\\\\\\\\\\\\\\\ V2.2C //////////////////////
FEXPORT LRESULT FTYPE DRV_DioReadPortWord(LONG_PTR DriverHandle, 
                                          LPT_DioReadPortWord lpDioReadPortWord);
FEXPORT LRESULT FTYPE DRV_DioWritePortWord(LONG_PTR DriverHandle,
                                           LPT_DioWritePortWord lpDioWritePortWord);
FEXPORT LRESULT FTYPE DRV_DioReadPortDword(LONG_PTR DriverHandle,
                                           LPT_DioReadPortDword lpDioReadPortDword);
FEXPORT LRESULT FTYPE DRV_DioWritePortDword(LONG_PTR DriverHandle,
                                            LPT_DioWritePortDword lpDioWritePortDword);
FEXPORT LRESULT FTYPE DRV_DioGetCurrentDOWord(LONG_PTR DriverHandle,
                                              LPT_DioGetCurrentDOWord lpDioGetCurrentDOWord);
FEXPORT LRESULT FTYPE DRV_DioGetCurrentDODword(LONG_PTR DriverHandle,
                                               LPT_DioGetCurrentDODword lpDioGetCurrentDODword);
FEXPORT LRESULT FTYPE DRV_FAITerminate(LONG_PTR DriverHandle);
FEXPORT LRESULT FTYPE DRV_FAOTerminate(LONG_PTR DriverHandle);
///////////////////// V2.2C /////////////////////

// New driver structure.
//\\\\\\\\\\\\\\\\\\\ V2.3a //////////////////////
//=========================================================================
// Description:
//      Enable a specific DI event, and also specify a range of DI ports 
//      that will be scanned (read) when the specified event occurs.
//      
// Parameters:
// DriverHandle[in]:  Driver handle
// dwEventID[in]:     which DIO Event to enable. It can be one of    
//                    ADS_EVT_DI_INTERRUPT0~184, 
//                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
//                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
// dwScanStart[in]:   start port which will be scaned when the specified event occurs.
//                    this value must not exceed the max DI port the board supported.
// dwScanCount[in]:   port count to be scaned when the specified event occurs. The
//                    sum of this parameter plus the dwScanStart must not be bigger than
//                    the max DI port the board supported.
//                    
//---------------------------------------------------------------------------------
FEXPORT
LRESULT FTYPE AdxDioEnableEventAndSpecifyDiPorts( 
   LONG_PTR  DriverHandle,
   ULONG dwEventID, 
   ULONG dwScanStart, 
   ULONG dwScanCount );


FEXPORT
LRESULT FTYPE AdxDioEnableEventAndSpecifyEventCounter( 
												 LONG_PTR  DriverHandle,
												 ULONG dwEventID, 
												 ULONG dwScanStart, 
												 ULONG dwScanCount );
FEXPORT
LRESULT FTYPE AdxCntrEnableEventAndSpecifyEventCounter( 
												 LONG_PTR  DriverHandle,
												 ULONG dwEventID, 
												 ULONG dwScanStart, 
												 ULONG dwScanCount );
//=========================================================================
// Description:
//      Disable a specific enabled DI event. DI event can be enabled by 
//      the function AdcDioEventEnableAndSpecifyDiPorts.
//      When the DI event is disabled, the related DI ports will also be released
//      
// Parameters:
// DriverHandle[in]:  Driver handle
// dwEventID[in]:     which DI Interrupt Event to enable. It can be one of    
//                    ADS_EVT_DI_INTERRUPT0 ~184, 
//                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
//                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
//---------------------------------------------------------------------------------
FEXPORT 
LRESULT FTYPE AdxDioDisableEvent( 
   LONG_PTR  DriverHandle,
   ULONG dwEventID );

FEXPORT 
LRESULT FTYPE AdxCntrDisableEvent( 
								 LONG_PTR  DriverHandle,
								 ULONG dwEventID );
//=========================================================================
// Description:
//      Retrieve the stored input data of the specified DI event's most 
//      recent occurrence. The event is enabled and the input range is defined
//      by AdcDioEnableEventAndSpecifyDiPorts.
//      
// Parameters:
// DriverHandle[in]:  Driver handle
// dwEventID[in]:     DI Event ID which DI data will be retrieved. It can be one of    
//                    ADS_EVT_DI_INTERRUPT0 ~184, 
//                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,
//                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.
// pBuffer[out]:      pointer to the user buffer to receive the DI data.
// dwLength[in]:      length of the user buffer. IF the length is not enough to
//                    store all the DI ports data, only the 'dwLength' number will
//                    be stored.
//    
//---------------------------------------------------------------------------------
FEXPORT 
LRESULT FTYPE AdxDioGetLatestEventDiPortsState( 
   LONG_PTR   DriverHandle,
   ULONG  dwEventID,
   LPBYTE pBuffer,
   ULONG  dwLength );

FEXPORT 
LRESULT FTYPE AdxCntrGetLatestEventCounterValue( 
											   LONG_PTR   DriverHandle,
											   ULONG  dwEventID,
											   LPDWORD pBuffer,
											   ULONG  dwLength );
//=========================================================================
// Descriptions:
//      
//    read DI ports.   
//      
// Parameters:
// DriverHandle[in]:  Driver handle
// dwPortStart[in]:   start port to read. 
// dwPortCount[in]:   port count to read.                   
// pBuffer[out]:      pointer to user buffer. The buffer must be big enough
//                    to store all DI data retrieved. The buffer size is equal
//                    the number of dwPortCount in byte.
//---------------------------------------------------------------------------------
FEXPORT LRESULT FTYPE AdxDioReadDiPorts(
   LONG_PTR     DriverHandle,
   ULONG    dwPortStart,
   ULONG    dwPortCount,
   LPBYTE   pBuffer);

//=========================================================================
// Description:
//      
//    Write DO ports.
//      
// Parameters:
// DriverHandle[in]: Driver handle
// dwPortStart[in]:  start port to write.
// dwPortCount[in]:  port count to write.                   
// pBuffer[out]:     pointer to DO data buffer to output.
//---------------------------------------------------------------------------------
FEXPORT LRESULT FTYPE AdxDioWriteDoPorts(
   LONG_PTR     DriverHandle,
   ULONG    dwPortStart,
   ULONG    dwPortCount,
   LPBYTE   pBuffer);

//=========================================================================
// Description:
//      
//    Get current state of DO ports 
//      
// Parameters:
// DriverHandle[in]: Driver handle
// dwPortStart[in]:  start port to get. 
// dwPortCount[in]:  port count to get.
// pBuffer[out]:     pointer to user buffer. The buffer must be big enough
//                   to store all DO data retrieved. The buffer size is equal
//                   the number of dwPortCount in byte.
//---------------------------------------------------------------------------------
FEXPORT LRESULT FTYPE AdxDioGetCurrentDoPortsState(
   LONG_PTR     DriverHandle,
   ULONG    dwPortStart,
   ULONG    dwPortCount,
   LPBYTE   pBuffer);

//=========================================================================
// Description:
//      
//    Call dll driver's configuration dialog box to configure the board.
//      
// Parameters:
// DeviceNum[in]:  device number or fix number
// BoardID[in]:    board ID. It's a software defined board id, 
//                 for example: BD_PCI1753, BD_MIC3753...
//                 
// hCaller[in]:    parent window handle
// 
//---------------------------------------------------------------------------------
FEXPORT LRESULT FTYPE AdxDeviceConfig(
  ULONG DeviceNum,
  DWORD BoardID,
  HWND  hCaller );
///////////////////// V2.3a /////////////////////
// End of new driver structure


//=============================================================================
// Description:
//
// Read user customer data from flash or EEPROM 
//
// Parameters:
// DriverHandle[in]: Driver handle
// StartAddress[in]: start address (0 - 31)
// DataCount[in]: data read count
// pBuffer[out]: user data read
FEXPORT LRESULT FTYPE AdxPrivateHWRegionRead(
	LONG_PTR DriverHandle,
	LONG StartAddress,
	ULONG DataCount,
	LPBYTE pBuffer);
//-----------------------------------------------------------------------------
// Description:
//
// Write user customer data to flash or EEPROM
//
// Parameters:
// DriverHandle[in]: Driver handle
// StartAddress[in]: start address (0 - 31)
// DataCount[in]: data write count
// pBuffer[in]: user data write
FEXPORT LRESULT FTYPE AdxPrivateHWRegionWrite(
	LONG_PTR DriverHandle,
	LONG StartAddress,
	ULONG DataCount,
	LPBYTE pBuffer);

// For 32-bit data structure ********
FEXPORT 
LRESULT FTYPE AIBinaryIn32(
		LONG DeviceHandle,
		USHORT chan,
		USHORT TrigMode,
		ULONG* reading
        );

FEXPORT 
LRESULT FTYPE AIVoltageIn32(
		LONG DeviceHandle,
		USHORT chan,
		USHORT gain,
		USHORT TrigMode,
		FLOAT* voltage
		);

FEXPORT 
LRESULT FTYPE MAIBinaryIn32(
		LONG DeviceHandle,
		USHORT NumChan,
		USHORT StartChan,
		USHORT TrigMode,
		ULONG* ReadingArray
		);

FEXPORT 
LRESULT FTYPE MAIVoltageIn32(
		LONG DeviceHandle,
		USHORT NumChan,
		USHORT StartChan,
		USHORT* GainArray,
		USHORT TrigMode,
		FLOAT* VoltageArray
		);

FEXPORT 
LRESULT FTYPE FAIIntStart32(
        LONG    DeviceHandle,
        USHORT  TrigSrc,
        DWORD   SampleRate,
        USHORT  chan,
        USHORT  gain,
        PVOID   buffer,
        ULONG   count,
        USHORT  cyclic,
        USHORT  IntrCount
        );

FEXPORT 
LRESULT FTYPE FAIIntScanStart32(
        LONG    DeviceHandle,
        USHORT  TrigSrc,
        DWORD   SampleRate,
        USHORT  NumChans,
        USHORT  StartChan,
        USHORT* GainList,
        PVOID   buffer,
        ULONG   count,
        USHORT  cyclic,
        USHORT  IntrCount
        );

FEXPORT 
LRESULT FTYPE FAIDmaExStart32(
        LONG    DeviceHandle,
        USHORT  TrigSrc,
        USHORT  TrigMode,
        USHORT  ClockSrc,
        USHORT  TrigEdge,
        USHORT  SRCType,
        FLOAT   TrigVol,
        USHORT  CyclicMode,
        USHORT  NumChans,
        USHORT  StartChan,
        ULONG   ulDelayCnt,
        ULONG   count,
        DWORD   SampleRate,
        USHORT* GainList,
        USHORT* CondList,
        USHORT* LevelList,
        PVOID   buffer0,
        PVOID   buffer1,
        USHORT* Pt1,
        USHORT* Pt2,
        USHORT* Pt3
        );
// **********************************

#ifdef __cplusplus
}
#endif

#endif

#pragma pack(pop)
