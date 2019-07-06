using System;

public class ADSCONST
{

	/****************************************************************************
		Constant Definition
	***************************************************************************/
public const Int32     MaxDev                =255; // max. # of devices
public const Int32     MaxDevNameLen         =64;  // max lenght of device name
public const Int32     MaxGroup              =6;
public const Int32     MaxPort               =3;
public const Int32     MaxErrMsgLen          =80;
public const Int32     MAX_DEVICE_NAME_LEN   =64;
public const Int32     MAX_DRIVER_NAME_LEN   =16;
public const Int32     MAX_DAUGHTER_NUM      =16;    // V2.0 mod 8 to 16
public const Int32     MAX_DIO_PORT          =48;
public const Int32     MAX_AO_RANGE          =32;    // V2.0 mod 8 to 16

public const Int32     LOCAL                 =0;
public const Int32     REMOTE                =1;
public const Int32     REMOTE1               =REMOTE+1;      // For PCL-818L JP7 = 5V
public const Int32     REMOTE2               =REMOTE1+1;     // For PCL-818L JP7 = 10V
public const Int32     NONPROG               = LOCAL;
public const Int32     PROG                  = REMOTE;
public const Int32     INTERNAL              = 0;
public const Int32     EXTERNAL              = 1;
public const Int32     SINGLEENDED           = 0;
public const Int32     DIFFERENTIAL          = 1;
public const Int32     BIPOLAR               = 0;
public const Int32     UNIPOLAR              = 1;
public const Int32     PORTA                 = 0;
public const Int32     PORTB                 = 1;
public const Int32     PORTC                 = 2;
public const Int32     INPORT                = 0;
public const Int32     OUTPORT               = 1;

	/***************************************************************************
		Define board vendor ID
	**************************************************************************/
public const Int32    AAC      =0x0000;                     //Advantech
public const Int32    MB       =0x1000;                     //Keithley/MetraByte
public const Int32    BB       =0x2000;                     //Burr Brown
public const Int32    GRAYHILL =0x3000;                     //Grayhill
public const Int32    KGS      =0x4000;

	/****************************************************************************
		Define DAS I/O Board ID.
	****************************************************************************/
public const Int32      NONE           =0x00;              // not available
	
	//\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
	// Notes:
	// change the software defined ID from Board ID to Product ID.
	// Board ID is especially used as the term of hardware dip-switch ID.
	//
	//Advantech Product ID
	///////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/
	//Advantech board ID
public const Int32      BD_DEMO        =(AAC | 0x00);     // demo board
public const Int32      BD_PCL711      =(AAC | 0x01);     // PCL-711 board
public const Int32      BD_PCL812      =(AAC | 0x02);     // PCL-812 board
public const Int32      BD_PCL812PG    =(AAC | 0x03);     // PCL-812PG board
public const Int32      BD_PCL718      =(AAC | 0x04);     // PCL-718 board
public const Int32      BD_PCL818      =(AAC | 0x05);     // PCL-818 board
public const Int32      BD_PCL814      =(AAC | 0x06);     // PCL-814 board
public const Int32      BD_PCL720      =(AAC | 0x07);     // PCL-722 board
public const Int32      BD_PCL722      =(AAC | 0x08);     // PCL-720 board
public const Int32      BD_PCL724      =(AAC | 0x09);     // PCL-724 board
public const Int32      BD_AD4011      =(AAC | 0x0a);     // ADAM 4011 Module
public const Int32      BD_AD4012      =(AAC | 0x0b);     // ADAM 4012 Module
public const Int32      BD_AD4013      =(AAC | 0x0c);     // ADAM 4013 Module
public const Int32      BD_AD4021      =(AAC | 0x0d);     // ADAM 4021 Module
public const Int32      BD_AD4050      =(AAC | 0x0e);     // ADAM 4050 Module
public const Int32      BD_AD4060      =(AAC | 0x0f);     // ADAM 4060 Module
public const Int32      BD_PCL711B     =(AAC | 0x10);     // PCL-711B
public const Int32      BD_PCL818H     =(AAC | 0x11);     // PCL-818H
public const Int32      BD_PCL814B     =(AAC | 0x12);     // PCL-814B
public const Int32      BD_PCL816      =(AAC | 0x13);     // PCL-816
public const Int32      BD_814_DIO_1   =(AAC | 0x14);     // PCL-816/814B 8255 DIO module
public const Int32      BD_814_DA_1    =(AAC | 0x15);     // PCL-816/814B 12 bit D/A module
public const Int32      BD_816_DA_1    =(AAC | 0x16);     // PCL-816/814B 16 bit D/A module
public const Int32      BD_PCL830      =(AAC | 0x17);     // PCL-830 9513A Counter Card
public const Int32      BD_PCL726      =(AAC | 0x18);     // PCL-726 D/A card
public const Int32      BD_PCL727      =(AAC | 0x19);     // PCL-727 D/A card
public const Int32      BD_PCL728      =(AAC | 0x1a);     // PCL-728 D/A card
public const Int32      BD_AD4052      =(AAC | 0x1b);     // ADAM 4052 Module
public const Int32      BD_AD4014D     =(AAC | 0x1c);     // ADAM 4014D Module
public const Int32      BD_AD4017      =(AAC | 0x1d);     // ADAM 4017 Module
public const Int32      BD_AD4080D     =(AAC | 0x1e);     // ADAM 4080D Module
public const Int32      BD_PCL721      =(AAC | 0x1f);     // PCL-721 32-bit Digital in
public const Int32      BD_PCL723      =(AAC | 0x20);     // PCL-723 24-bit Digital in
public const Int32      BD_PCL818L     =(AAC | 0x21);     // PCL-818L
public const Int32      BD_PCL818HG    =(AAC | 0x22);     // PCL-818HG
public const Int32      BD_PCL1800     =(AAC | 0x23);     // PCL-1800
public const Int32      BD_PAD71A      =(AAC | 0x24);     // PCIA-71A
public const Int32      BD_PAD71B      =(AAC | 0x25);     // PCIA-71B
public const Int32      BD_PCR420      =(AAC | 0x26);     // PCR-420
public const Int32      BD_PCL731      =(AAC | 0x27);     // PCL-731 48-bit Digital I/O card
public const Int32      BD_PCL730      =(AAC | 0x28);     // PCL-730 board
public const Int32      BD_PCL813      =(AAC | 0x29);     // PCL-813 32-channel A/D card
public const Int32      BD_PCL813B     =(AAC | 0x2a);     // PCL-813B 32-channel A/D card
public const Int32      BD_PCL818HD    =(AAC | 0x2b);     // PCL-818HD
public const Int32      BD_PCL725      =(AAC | 0x2c);     // PCL-725 digital I/O card
public const Int32      BD_PCL732      =(AAC | 0x2d);     // PCL-732 high speed DIO card
public const Int32      BD_AD4018      =(AAC | 0x2e);     // ADAM 4018 Module
public const Int32      BD_814_TC_1    =(AAC | 0x2f);     // PCL-816/814B 16 bit TC module
public const Int32      BD_PAD71C      =(AAC | 0x30);     // PCIA-71C
public const Int32      BD_AD4024      =(AAC | 0x31);     // ADAM 4024
public const Int32      BD_AD5017      =(AAC | 0x32);     // ADAM 5017
public const Int32      BD_AD5018      =(AAC | 0x33);     // ADAM 5018
public const Int32      BD_AD5024      =(AAC | 0x34);     // ADAM 5024
public const Int32      BD_AD5051      =(AAC | 0x35);     // ADAM 5051
public const Int32      BD_AD5060      =(AAC | 0x36);     // ADAM 5060
public const Int32      BD_PCM3718     =(AAC | 0x37);     // PCM-3718
public const Int32      BD_PCM3724     =(AAC | 0x38);     // PCM-3724
public const Int32      BD_MIC2718     =(AAC | 0x39);     // MIC-2718
public const Int32      BD_MIC2728     =(AAC | 0x3a);     // MIC-2728
public const Int32      BD_MIC2730     =(AAC | 0x3b);     // MIC-2730
public const Int32      BD_MIC2732     =(AAC | 0x3c);     // MIC-2732
public const Int32      BD_MIC2750     =(AAC | 0x3d);     // MIC-2750
public const Int32      BD_MIC2752     =(AAC | 0x3e);     // MIC-2752
public const Int32      BD_PCL733      =(AAC | 0x3f);     // PCL-733
public const Int32      BD_PCL734      =(AAC | 0x40);     // PCL-734
public const Int32      BD_PCL735      =(AAC | 0x41);     // PCL-735
public const Int32      BD_AD4018M     =(AAC | 0x42);     // ADAM 4018M Module
public const Int32      BD_AD4080      =(AAC | 0x43);     // ADAM 4080 Module
public const Int32      BD_PCL833      =(AAC | 0x44);     // PCL-833
public const Int32      BD_PCA6157     =(AAC | 0x45);     // PCA-6157
public const Int32      BD_PCA6149     =(AAC | 0x46);     // PCA-6149
public const Int32      BD_PCA6147     =(AAC | 0x47);     // PCA-6147
public const Int32      BD_PCA6137     =(AAC | 0x48);     // PCA-6137
public const Int32      BD_PCA6145     =(AAC | 0x49);     // PCA-6145
public const Int32      BD_PCA6144     =(AAC | 0x4a);     // PCA-6144
public const Int32      BD_PCA6143     =(AAC | 0x4b);     // PCA-6143
public const Int32      BD_PCA6134     =(AAC | 0x4c);     // PCA-6134
public const Int32      BD_AD5056      =(AAC | 0x4d);     // ADAM 5056 for Device Net
public const Int32      BD_DN5017      =(AAC | 0x4e);     // ADAM 5017 for Device Net
public const Int32      BD_DN5018      =(AAC | 0x4f);     // ADAM 5018 for Device Net
public const Int32      BD_DN5024      =(AAC | 0x50);     // ADAM 5024 for Device Net
public const Int32      BD_DN5051      =(AAC | 0x51);     // ADAM 5051 for Device Net
public const Int32      BD_DN5056      =(AAC | 0x52);     // ADAM 5056 for Device Net
public const Int32      BD_DN5060      =(AAC | 0x53);     // ADAM 5060 for Device Net
public const Int32      BD_PCL836      =(AAC | 0x54);     // PCL-836
public const Int32      BD_PCL841      =(AAC | 0x55);     // PCL-841
public const Int32      BD_DN5050      =(AAC | 0x56);     // ADAM 5050 for DeviceNet
public const Int32      BD_DN5052      =(AAC | 0x57);     // ADAM 5052 for DeviceNet
public const Int32      BD_AD5050      =(AAC | 0x58);     // ADAM 5050 for RS-485
public const Int32      BD_AD5052      =(AAC | 0x59);     // ADAM 5052 for RS-485
public const Int32      BD_PCM3730     =(AAC | 0x5a);     // PCM-3730
public const Int32      BD_AD4011D     =(AAC | 0x5b);     // ADAM 4011D
public const Int32      BD_AD4016      =(AAC | 0x5c);     // ADAM 4016
public const Int32      BD_AD4053      =(AAC | 0x5d);     // ADAM 4053
public const Int32      BD_PCI1750     =(AAC | 0x5e);     // PCI-1750
public const Int32      BD_PCI1751     =(AAC | 0x5f);     // PCI-1751
public const Int32      BD_PCI1710     =(AAC | 0x60);     // PCI-1710
public const Int32      BD_PCI1712     =(AAC | 0x61);     // PCI-1712
public const Int32      BD_AD5068      =(AAC | 0x62);     // ADAM 5068
public const Int32      BD_AD5013      =(AAC | 0x63);     // ADAM 5013
public const Int32      BD_AD5017H     =(AAC | 0x64);     // ADAM 5017H
public const Int32      BD_AD5080      =(AAC | 0x65);     // ADAM 5080 
public const Int32      BD_MIC2760     =(AAC | 0x66);     // MIC-2760
public const Int32      BD_PCI1710HG   =(AAC | 0x67);     // PCI-1710HG
public const Int32      BD_PCI1713     =(AAC | 0x68);     // PCI-1713
public const Int32      BD_PCI1753     =(AAC | 0x69);     // PCI-1753
public const Int32      BD_PCI1760     =(AAC | 0x6a);     // PCI-1760
public const Int32      BD_PCI1720     =(AAC | 0x6b);     // PCI-1720
public const Int32      BD_PCL752      =(AAC | 0x6c);     // PCL-772
public const Int32      BD_PCM3718H    =(AAC | 0x6d);     // PCM-3718H
public const Int32      BD_PCM3718HG   =(AAC | 0x6e);     // PCM-3718HG
public const Int32      BD_DN5068      =(AAC | 0x6f);     // ADAM 5068 for Device Net
public const Int32      BD_DN5013      =(AAC | 0x70);     // ADAM 5013 for Device Net
public const Int32      BD_DN5017H     =(AAC | 0x71);     // ADAM 5017H for Device Net
public const Int32      BD_DN5080      =(AAC | 0x72);     // ADAM 5080 for Device Net =(unavailable);
public const Int32      BD_PCI1711     =(AAC | 0x73);     // PCI-1711
public const Int32      BD_PCI1711L    =(AAC | 0x75);     // PCI-1711
public const Int32      BD_PCI1716     =(AAC | 0x74);     // PCI-1716
public const Int32      BD_PCI1731     =(AAC | 0x75);     // PCI-1731
public const Int32      BD_AD5051D     =(AAC | 0x76);     // ADAM 5051D 
public const Int32      BD_AD5056D     =(AAC | 0x77);     // ADAM 5056D 
public const Int32      BD_DN5051D     =(AAC | 0x78);     // ADAM 5051D for Device Net
public const Int32      BD_DN5056D     =(AAC | 0x79);     // ADAM 5056D for Device Net
public const Int32      BD_SIMULATE    =(AAC | 0x7a);     // Simulate IO
public const Int32      BD_PCI1754     =(AAC | 0x7b);     // PCI-1754
public const Int32      BD_PCI1752     =(AAC | 0x7c);     // PCI-1752
public const Int32      BD_PCI1756     =(AAC | 0x7d);     // PCI-1756
public const Int32      BD_PCL839      =(AAC | 0x7e);     // PCL-839
public const Int32      BD_PCM3725     =(AAC | 0x7f);     // PCM-3725
public const Int32      BD_PCI1762     =(AAC | 0x80);     // PCI-1762
public const Int32      BD_PCI1721     =(AAC | 0x81);     // PCI-1721
public const Int32      BD_PCI1761     =(AAC | 0x82);     // PCI-1761
public const Int32      BD_PCI1723     =(AAC | 0x83);     // PCI-1723
public const Int32      BD_AD4019      =(AAC | 0X84);     // ADAM 4019 Module
public const Int32      BD_AD5055      =(AAC | 0X85);     // ADAM 5055 Module
public const Int32      BD_AD4015      =(AAC | 0X86);     // ADAM 4015 Module
public const Int32      BD_PCI1730     =(AAC | 0x87);     // PCI-1730
public const Int32      BD_PCI1733     =(AAC | 0x88);     // PCI-1733
public const Int32      BD_PCI1734     =(AAC | 0x89);     // PCI-1734
public const Int32      BD_MIC2750A    =(AAC | 0x8A);     // MIC-2750A
public const Int32      BD_MIC2718A    =(AAC | 0x8B);     // MIC-2718A
public const Int32      BD_AD4017P     =(AAC | 0X8c);     // ADAM 4017P Module
public const Int32      BD_AD4051      =(AAC | 0X8d);     // ADAM 4051 Module
public const Int32      BD_AD4055      =(AAC | 0X8e);     // ADAM 4055 Module
public const Int32      BD_AD4018P     =(AAC | 0x8f);     // ADAM 4018P Module
public const Int32      BD_PCI1710L    =(AAC | 0x90);     // PCI-1710L
public const Int32      BD_PCI1710HGL  =(AAC | 0x91);     // PCI-1710HGL
public const Int32      BD_AD4068      =(AAC | 0x92);     // ADAM-4068
public const Int32      BD_PCM3712     =(AAC | 0x93);     // PCM-3712
public const Int32      BD_PCM3723     =(AAC | 0x94);     // PCM-3723

//#ifdef _WIN32_WCE
	//Add by Ann.He 03/02/21
public const Int32      BD_DATALGR_KR1     =(AAC | 0x81);     // PCM-KR1
	//end
//#endif

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
public const Int32      BD_PCI1780     =(AAC | 0x95);     // PCI-1780
public const Int32      BD_CPCI3756    =(AAC | 0x96);     // CPCI-3756
	///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

	//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
public const Int32      BD_PCI1755     =(AAC | 0x97);     // PCI-1755
public const Int32      BD_PCI1714     =(AAC | 0x98);     // PCI-1714
	///////////////////// V2.0B ////////////////////

	//\\\\\\\\\\\\\\\\\\\ V2.1 /////////////////////
public const Int32      BD_PCI1757     =(AAC | 0x99);     // PCI-1757
	///////////////////// V2.1 ////////////////////

	//\\\\\\\\\\\\\\\\\\\ V2.1a /////////////////////
public const Int32      BD_MIC3716    =(AAC | 0x9A);     // MIC-3716
public const Int32      BD_MIC3761    =(AAC | 0x9B);     // MIC-3761
public const Int32      BD_MIC3753    =(AAC | 0x9C);     // MIC-3753
public const Int32      BD_MIC3780    =(AAC | 0x9D);     // MIC-3780
	///////////////////// V2.1a ////////////////////

public const Int32      BD_PCI1724    =(AAC | 0x9E);     // PCI-1724
public const Int32      BD_AD4015T    =(AAC | 0x9F);     // ADAM 4015T Module
public const Int32      BD_UNO2052    =(AAC | 0xA0);     // UNO  2052 Module
public const Int32      BD_PCI1680    =(AAC | 0xA1);     // PCI-1680


public const Int32      BD_MICRODAC    =(GRAYHILL | 0x1); // Grayhill MicroDAC Board ID
public const Int32      BD_GIA10       =(KGS | 0x01);     // KGS GIA-10 module Board ID

	/*****************************************************************************
		Define Expansion Board ID.
	*****************************************************************************/
public const Int32 AAC_EXP            =(AAC | 0x00000100);   //Advantech expansion bits

	//define Advantech expansion board ID.
public const Int32      BD_PCLD780     =0x00000000;          // PCLD-780
public const Int32      BD_PCLD789     =(AAC_EXP | 0x0);     // PCLD-789
public const Int32      BD_PCLD779     =(AAC_EXP | 0x1);     // PCLD-779
public const Int32      BD_PCLD787     =(AAC_EXP | 0x2);     // PCLD-787
public const Int32      BD_PCLD8115    =(AAC_EXP | 0x3);     // PCLD-8115
public const Int32      BD_PCLD770     =(AAC_EXP | 0x4);     // PCLD-770
public const Int32      BD_PCLD788     =(AAC_EXP | 0x5);     // PCLD-788
public const Int32      BD_PCLD8710    =(AAC_EXP | 0x6);     // PCLD-8710
public const Int32      BD_PCLD8712    =(AAC_EXP | 0x7);     // PCLD-8712

	/****************************************************************************
		Define subsection identifier
	****************************************************************************/
public const Int32     DAS_AISECTION       =0x1;         // A/D subsection
public const Int32     DAS_AOSECTION       =0x2;         // D/A sbusection
public const Int32     DAS_DISECTION       =0x3;        // Digital input subsection
public const Int32     DAS_DOSECTION       =0x4;         // Digital output sbusection
public const Int32     DAS_TEMPSECTION     =0x5;        // thermocouple section
public const Int32     DAS_ECSECTION       =0x6;         // Event count subsection
public const Int32     DAS_FMSECTION       =0x7;         // frequency measurement section
public const Int32     DAS_POSECTION       =0x8;         // pulse output section
public const Int32     DAS_ALSECTION       =0x9;         // alarm section
public const Int32     MT_AISECTION        =0x0a;        // monitoring A/D subsection
public const Int32     MT_DISECTION        =0x0b;        // monitoring D/I subsection

	/***************************************************************************
		Define Transfer Mode
	****************************************************************************/
public const Int32     POLLED_MODE          =0x0;         // software transfer
public const Int32     DMA_MODE             =0x1;         // DMA transfer
public const Int32     INTERRUPT_MODE       =0x2;         // Interrupt transfer

	/***************************************************************************
		Define Acquisition Mode
	****************************************************************************/
public const Int32     FREE_RUN             =0;
public const Int32     PRE_TRIG             =1;
public const Int32     POST_TRIG            =2;
public const Int32     POSITION_TRIG        =3;

	/***************************************************************************
		Define Comparator's Condition
	****************************************************************************/
public const Int32     NOCONDITION          =0;
public const Int32     LESS                 =1;
public const Int32     BETWEEN              =2;
public const Int32     GREATER              =3;
public const Int32     OUTSIDE              =4;

	/***************************************************************************
		Define Channel
	****************************************************************************/
public const Int32      ADV_CHANNEL0      =0x01;
public const Int32      ADV_CHANNEL1      =0x02;
public const Int32      ADV_CHANNEL2      =0x04;
public const Int32      ADV_CHANNEL3      =0x08;
public const Int32      ADV_CHANNEL4      =0x10;
public const Int32      ADV_CHANNEL5      =0x20;
public const Int32      ADV_CHANNEL6      =0x40;
public const Int32      ADV_CHANNEL7      =0x80;

	/**************************************************************************
		Define Status Code
	***************************************************************************/
public const Int32 SUCCESS                  =0;
public const Int32 DrvErrorCode             =1;
public const Int32 KeErrorCode              =100;
public const Int32 DnetErrorCode            =200;
public const Int32 GeniDrvErrorCode         =300;
public const Int32 OPCErrorCode             =1000;
public const Int32 MemoryAllocateFailed     =(DrvErrorCode + 0);
public const Int32 ConfigDataLost           =(DrvErrorCode + 1);
public const Int32 InvalidDeviceHandle      =(DrvErrorCode + 2);
public const Int32 AIConversionFailed       =(DrvErrorCode + 3);
public const Int32 AIScaleFailed            =(DrvErrorCode + 4);
public const Int32 SectionNotSupported      =(DrvErrorCode + 5);
public const Int32 InvalidChannel           =(DrvErrorCode + 6);
public const Int32 InvalidGain              =(DrvErrorCode + 7);
public const Int32 DataNotReady             =(DrvErrorCode + 8);
public const Int32 InvalidInputParam        =(DrvErrorCode + 9);
public const Int32 NoExpansionBoardConfig   =(DrvErrorCode + 10);
public const Int32 InvalidAnalogOutValue    =(DrvErrorCode + 11);
public const Int32 ConfigIoPortFailed       =(DrvErrorCode + 12);
public const Int32 CommOpenFailed           =(DrvErrorCode + 13);
public const Int32 CommTransmitFailed       =(DrvErrorCode + 14);
public const Int32 CommReadFailed           =(DrvErrorCode + 15);
public const Int32 CommReceiveFailed        =(DrvErrorCode + 16);
public const Int32 CommConfigFailed         =(DrvErrorCode + 17);
public const Int32 CommChecksumError        =(DrvErrorCode + 18);
public const Int32 InitError                =(DrvErrorCode + 19);
public const Int32 DMABufAllocFailed        =(DrvErrorCode + 20);
public const Int32 IllegalSpeed             =(DrvErrorCode + 21);
public const Int32 ChanConflict             =(DrvErrorCode + 22);
public const Int32 BoardIDNotSupported      =(DrvErrorCode + 23);
public const Int32 FreqMeasurementFailed    =(DrvErrorCode + 24);
public const Int32 CreateFileFailed         =(DrvErrorCode + 25);
public const Int32 FunctionNotSupported     =(DrvErrorCode + 26);
public const Int32 LoadLibraryFailed        =(DrvErrorCode + 27);
public const Int32 GetProcAddressFailed     =(DrvErrorCode + 28);
public const Int32 InvalidDriverHandle      =(DrvErrorCode + 29);
public const Int32 InvalidModuleType        =(DrvErrorCode + 30);
public const Int32 InvalidInputRange        =(DrvErrorCode + 31);
public const Int32 InvalidWindowsHandle     =(DrvErrorCode + 32);
public const Int32 InvalidCountNumber       =(DrvErrorCode + 33);
public const Int32 InvalidInterruptCount    =(DrvErrorCode + 34);
public const Int32 InvalidEventCount        =(DrvErrorCode + 35);
public const Int32 OpenEventFailed          =(DrvErrorCode + 36);
public const Int32 InterruptProcessFailed   =(DrvErrorCode + 37);
public const Int32 InvalidDOSetting         =(DrvErrorCode + 38);
public const Int32 InvalidEventType         =(DrvErrorCode + 39);
public const Int32 EventTimeOut             =(DrvErrorCode + 40);
public const Int32 InvalidDmaChannel        =(DrvErrorCode + 41);
public const Int32 IntDamChannelBusy        =(DrvErrorCode + 42);
	//
public const Int32 CheckRunTimeClassFailed  =(DrvErrorCode + 43);
public const Int32 CreateDllLibFailed       =(DrvErrorCode + 44);
public const Int32 ExceptionError           =(DrvErrorCode + 45);
public const Int32 RemoveDeviceFailed       =(DrvErrorCode + 46);
public const Int32 BuildDeviceListFailed    =(DrvErrorCode + 47);
public const Int32 NoIOFunctionSupport      =(DrvErrorCode + 48);

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
public const Int32 ResourceConflict        =(DrvErrorCode + 49);
	///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

	//\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
public const Int32 InvalidClockSource		 =(DrvErrorCode + 50);
public const Int32 InvalidPacerRate		 =(DrvErrorCode + 51);
public const Int32 InvalidTriggerMode     =(DrvErrorCode + 52);
public const Int32 InvalidTriggerEdge     =(DrvErrorCode + 53);
public const Int32 InvalidTriggerSource   =(DrvErrorCode + 54);
public const Int32 InvalidTriggerVoltage  =(DrvErrorCode + 55);
public const Int32 InvalidCyclicMode      =(DrvErrorCode + 56);
public const Int32 InvalidDelayCount      =(DrvErrorCode + 57);
public const Int32 InvalidBuffer          =(DrvErrorCode + 58);
public const Int32 OverloadedPCIBus       =(DrvErrorCode + 59);
public const Int32 OverloadedInterruptRequest =(DrvErrorCode + 60);
	///////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/

	//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
public const Int32 ParamNameNotSupported      =(DrvErrorCode + 61);
	///////////////////// V2.0C /////////////////////
public const Int32 NoSerialFunctionSupported  =(GeniDrvErrorCode + 5);
public const Int32 NoAiFunctionSupported      =(GeniDrvErrorCode + 6);
public const Int32 NoAoFunctionSupported      =(GeniDrvErrorCode + 7);
public const Int32 NoDiFunctionSupported      =(GeniDrvErrorCode + 8);
public const Int32 NoDoFunctionSupported      =(GeniDrvErrorCode + 9);
public const Int32 NoAlarmFunctionSupported   =(GeniDrvErrorCode + 10);
public const Int32 NoCounterFunctionSupported =(GeniDrvErrorCode + 11);
public const Int32 NoTempFunctionSupported    =(GeniDrvErrorCode + 12);
public const Int32 NoIOFunctionSupported      =(GeniDrvErrorCode + 13);

public const Int32 KeInvalidHandleValue     =(KeErrorCode + 0);
public const Int32 KeFileNotFound           =(KeErrorCode + 1);
public const Int32 KeInvalidHandle          =(KeErrorCode + 2);
public const Int32 KeTooManyCmds            =(KeErrorCode + 3);
public const Int32 KeInvalidParameter       =(KeErrorCode + 4);
public const Int32 KeNoAccess               =(KeErrorCode + 5);
public const Int32 KeUnsuccessful           =(KeErrorCode + 6);
public const Int32 KeConInterruptFailure    =(KeErrorCode + 7);
public const Int32 KeCreateNoteFailure      =(KeErrorCode + 8);
public const Int32 KeInsufficientResources  =(KeErrorCode + 9);
public const Int32 KeHalGetAdapterFailure   =(KeErrorCode +10);
public const Int32 KeOpenEventFailure       =(KeErrorCode +11);
public const Int32 KeAllocCommBufFailure    =(KeErrorCode +12);
public const Int32 KeAllocMdlFailure        =(KeErrorCode +13);
public const Int32 KeBufferSizeTooSmall     =(KeErrorCode +14);

public const Int32 DNInitFailed              =(DnetErrorCode + 1);
public const Int32 DNSendMsgFailed           =(DnetErrorCode + 2);
public const Int32 DNRunOutOfMsgID           =(DnetErrorCode + 3);
public const Int32 DNInvalidInputParam       =(DnetErrorCode + 4);
public const Int32 DNErrorResponse           =(DnetErrorCode + 5);
public const Int32 DNNoResponse              =(DnetErrorCode + 6);
public const Int32 DNBusyOnNetwork           =(DnetErrorCode + 7);
public const Int32 DNUnknownResponse         =(DnetErrorCode + 8);
public const Int32 DNNotEnoughBuffer         =(DnetErrorCode + 9);
public const Int32 DNFragResponseError       =(DnetErrorCode + 10);
public const Int32 DNTooMuchDataAck          =(DnetErrorCode + 11);
public const Int32 DNFragRequestError        =(DnetErrorCode + 12);
public const Int32 DNEnableEventError        =(DnetErrorCode + 13);
public const Int32 DNCreateOrOpenEventError  =(DnetErrorCode + 14);
public const Int32 DNIORequestError          =(DnetErrorCode + 15);
public const Int32 DNGetEventNameError       =(DnetErrorCode + 16);
public const Int32 DNTimeOutError            =(DnetErrorCode + 17);
public const Int32 DNOpenFailed              =(DnetErrorCode + 18);
public const Int32 DNCloseFailed             =(DnetErrorCode + 19);
public const Int32 DNResetFailed             =(DnetErrorCode + 20);

public const Int32 WM_USER                  = 0x400;
public const Int32 WM_ATODNOTIFY            =(WM_USER+200);
public const Int32 WM_DTOANOTIFY            =(WM_USER+201);
public const Int32 WM_DIGINNOTIFY           =(WM_USER+202);
public const Int32 WM_DIGOUTNOTIFY          =(WM_USER+203);
public const Int32 WM_MTNOTIFY              =(WM_USER+204);
public const Int32 WM_CANTRANSMITCOMPLETE   =(WM_USER+205);
public const Int32 WM_CANMESSAGE            =(WM_USER+206);
public const Int32 WM_CANERROR              =(WM_USER+207);

	// define the wParam in user window message
public const Int32 AD_NONE                  =0;  //AD Section
public const Int32 AD_TERMINATE             =1;
public const Int32 AD_INT                   =2;
public const Int32 AD_BUFFERCHANGE          =3;
public const Int32 AD_OVERRUN               =4;
public const Int32 AD_WATCHDOGACT           =5;
public const Int32 AD_TIMEOUT               =6;
public const Int32 DA_TERMINATE             =0; // DA Section
public const Int32 DA_DMATC                 =1;
public const Int32 DA_INT                   =2;
public const Int32 DA_BUFFERCHANGE          =3;
public const Int32 DA_OVERRUN               =4;
public const Int32 DI_TERMINATE             =0;  // DI Section
public const Int32 DI_DMATC                 =1;
public const Int32 DI_INT                   =2;
public const Int32 DI_BUFFERCHANGE          =3;
public const Int32 DI_OVERRUN               =4;
public const Int32 DI_WATCHDOGACT           =5;
public const Int32 DO_TERMINATE             =0;  // DO Section
public const Int32 DO_DMATC                 =1;
public const Int32 DO_INT                   =2;
public const Int32 DO_BUFFERCHANGE          =3;
public const Int32 DO_OVERRUN               =4;
public const Int32 MT_ATOD                  =0;  // MT Section
public const Int32 MT_DIGIN                 =1;

public const Int32 CAN_TRANSFER             =0;  // CAN Section
public const Int32 CAN_RECEIVE              =1;
public const Int32 CAN_ERROR                =2;

	/****************************************************************************
		define thermocopule type J, K, S, T, B, R, E
	*****************************************************************************/
public const Int32 BTC  =4;
public const Int32 ETC  =6;
public const Int32 JTC  =0;
public const Int32 KTC  =1;
public const Int32 RTC  =5;
public const Int32 STC  =2;
public const Int32 TTC  =3;

	/****************************************************************************
		define  temperature scale
	*****************************************************************************/
public const Int32     C  =0;       //Celsius
public const Int32     F  =1;       //Fahrenheit
public const Int32     R  =2;       // Rankine
public const Int32     K  =3;       // Kelvin


	/****************************************************************************
		define service type for COMEscape=();
	*****************************************************************************/
public const Int32     EscapeFlushInput        =1;
public const Int32     EscapeFlushOutput       =2;
public const Int32     EscapeSetBreak          =3;
public const Int32     EscapeClearBreak        =4;


	/****************************************************************************
		define  gate mode
	*****************************************************************************/
public const Int32     GATE_DISABLED       =0;       // no gating
public const Int32     GATE_HIGHLEVEL      =1;       // active high level
public const Int32     GATE_LOWLEVEL       =2;       // active low level
public const Int32     GATE_HIGHEDGE       =3;       // active high edge
public const Int32     GATE_LOWEDGE        =4;       // active low edge


	/****************************************************************************
		define input mode for PCL-833
	*****************************************************************************/
public const Int32     DISABLE             =0;       // disable mode
public const Int32     ABPHASEX1           =1;       // Quadrature input X1
public const Int32     ABPHASEX2           =2;       // Quadrature input X2
public const Int32     ABPHASEX4           =3;       // Quadrature input X4
public const Int32     TWOPULSEIN          =4;       // 2 pulse input
public const Int32     ONEPULSEIN          =5;       // 1 pulse input

	/****************************************************************************
		define latch source for PCL-833
	*****************************************************************************/
public const Int32     SWLATCH             =0;       // S/W read latch data
public const Int32     INDEXINLATCH        =1;       // Index-in latch data
public const Int32     DI0LATCH            =2;       // DI0 latch data
public const Int32     DI1LATCH            =3;       // DI1 latch data
public const Int32     TIMERLATCH          =4;       // Timer latch data

	/****************************************************************************
		define timer base mode for PCL-833
	*****************************************************************************/
public const Int32     TPOINT1MS     =0;       //    0.1 ms timer base
public const Int32     T1MS          =1;       //    1   ms timer base
public const Int32     T10MS         =2;       //   10   ms timer base
public const Int32     T100MS        =3;       //  100   ms timer base
public const Int32     T1000MS       =4;       // 1000   ms timer base

	/****************************************************************************
		define clock source for PCL-833
	*****************************************************************************/
public const Int32     SYS8MHZ          =0;       // 8 MHZ system clock
public const Int32     SYS4MHZ          =1;       // 4 MHZ system clock
public const Int32     SYS2MHZ          =2;       // 2 MHZ system clock

	/****************************************************************************
		define cascade mode for PCL-833
	*****************************************************************************/
public const Int32     NOCASCADE           =0;       // 24-bit=(no cascade);
public const Int32     CASCADE             =1;       // 48-bit=(CH1, CH2 cascade);

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
	// ----------------------------------------------------------------------------
	// define parameter for PCI1780
	// ----------------------------------------------------------------------------
	// define the counter mode register parameter
	// CM0~CM1
public const Int32		PA_MODE_ACT_HIGH_TC_PULSE		=0x0000; // default value
public const Int32		PA_MODE_ACT_LOW_TC_PULSE		=0x0001;
public const Int32		PA_MODE_TC_TOGGLE_FROM_LOW		=0x0002;
public const Int32		PA_MODE_TC_TOGGLE_FROM_HIGH	    =0x0003;
	// CM2
public const Int32		PA_MODE_ENABLE_OUTPUT			=0x0004; // default value
public const Int32		PA_MODE_DISABLE_OUTPUT			=0x0000;
	// CM3~CM6
public const Int32		PA_MODE_COUNT_DOWN			    =0x0000; // default value
public const Int32		PA_MODE_COUNT_UP			    =0x0008;
	// CM7
public const Int32		PA_MODE_COUNT_RISE_EDGE			=0x0000; // default value
public const Int32		PA_MODE_COUNT_FALL_EDGE			=0x0080;
	// CM8~CM11
public const Int32		PA_MODE_COUNT_SRC_OUT_N_M1		=0x0100; // N_M1 means n minus 1
public const Int32		PA_MODE_COUNT_SRC_CLK_N			=0x0200;
public const Int32		PA_MODE_COUNT_SRC_CLK_N_M1		=0x0300;
public const Int32		PA_MODE_COUNT_SRC_FOUT_0		=0x0400;
public const Int32		PA_MODE_COUNT_SRC_FOUT_1		=0x0500;
public const Int32		PA_MODE_COUNT_SRC_FOUT_2		=0x0600;
public const Int32		PA_MODE_COUNT_SRC_FOUT_3		=0x0700;
public const Int32     PA_MODE_COUNT_SRC_GATE_N_M1      =0x0C00;

	// CM12~CM13
public const Int32		PA_MODE_GATE_SRC_GATE_NO		=0x0000; // default value
public const Int32		PA_MODE_GATE_SRC_OUT_N_M1		=0x1000;
public const Int32		PA_MODE_GATE_SRC_GATE_N			=0x2000;
public const Int32		PA_MODE_GATE_SRC_GATE_N_M1		=0x3000;
	// CM14~CM15
public const Int32		PA_MODE_GATE_POSITIVE   		=0x0000; // default value
public const Int32		PA_MODE_GATE_NEGATIVE		    =0x4000;

	// Counter Mode
public const Int32 MODE_A          =0x0000;
public const Int32 MODE_B          =0x0000;
public const Int32 MODE_C          =0x8000;

public const Int32 MODE_D          =0x0010;
public const Int32 MODE_E          =0x0010;
public const Int32 MODE_F          =0x8010;

public const Int32 MODE_G          =0x0020;  
public const Int32 MODE_H          =0x0020;
public const Int32 MODE_I          =0x8020;

public const Int32 MODE_J          =0x0030;
public const Int32 MODE_K          =0x0030;
public const Int32 MODE_L          =0x8030;

public const Int32 MODE_O          =0x8040;
public const Int32 MODE_R          =0x8050;
public const Int32 MODE_U          =0x8060;
public const Int32 MODE_X          =0x8070;

	// ----------------------------------------------------------------------------
	// define the FOUT register parameter
public const Int32		PA_FOUT_SRC_EXTER_CLK		     =0x0000; // default value
public const Int32		PA_FOUT_SRC_CLK_N		         =0x0100;
public const Int32		PA_FOUT_SRC_FOUT_N_M1		     =0x0200;
public const Int32		PA_FOUT_SRC_CLK_10MHZ		     =0x0300;
public const Int32		PA_FOUT_SRC_CLK_1MHZ		     =0x0400;
public const Int32		PA_FOUT_SRC_CLK_100KHZ		     =0x0500;
public const Int32		PA_FOUT_SRC_CLK_10KHZ		     =0x0600;
public const Int32		PA_FOUT_SRC_CLK_1KHZ		     =0x0700;
	// PCI1780 parameters defined 
	///////////////////// V2.0B ///////////////////

	/****************************************************************************
		define event type for interrupt and DMA transfer
	*****************************************************************************/
public const Int32     ADS_EVT_INTERRUPT           =0x1;     // interrupt
public const Int32     ADS_EVT_BUFCHANGE           =0x2;     // buffer change
public const Int32     ADS_EVT_TERMINATED          =0x4;     // termination
public const Int32     ADS_EVT_OVERRUN             =0x8;     // overrun
public const Int32     ADS_EVT_WATCHDOG            =0x10;    // watchdog actived
public const Int32     ADS_EVT_CHGSTATE            =0x20;    // change state event
public const Int32     ADS_EVT_ALARM               =0x40;    // alarm event
public const Int32     ADS_EVT_PORT0               =0x80;   // port 0 event
public const Int32     ADS_EVT_PORT1               =0x100;   // port 1 event
public const Int32     ADS_EVT_PATTERNMATCH        =0x200;   // Pattern Match for DI
public const Int32     ADS_EVT_COUNTER             =0x201;   // Persudo event for COUNTERMATCH and COUNTEROVERFLOW
public const Int32     ADS_EVT_COUNTERMATCH        =0x202;   // Counter Match setting NO. for DI
public const Int32     ADS_EVT_COUNTEROVERFLOW     =0x203;   // Counter Overflow for DI
public const Int32     ADS_EVT_STATUSCHANGE        =0x204;   // Status Change for DI
public const Int32     ADS_EVT_FILTER              =0x205;   // Filter Event

	//Modified by Ann.He
//#ifdef _WIN32_WCE
public const Int32		ADS_EVT_3724INTERRUPT		=0x300;	  // for PCM-3724 port 2 int
//#endif
	//end

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
	///////////////////// V2.0B ///////////////////////

	/****************************************************************************
		define event name by device number
	*****************************************************************************/
public const string     ADS_EVT_INTERRUPT_NAME               ="ADS_EVT_INTERRUPT";
public const string     ADS_EVT_PORT0_NAME                   ="ADS_EVT_PORT0";
public const string     ADS_EVT_PORT1_NAME                   ="ADS_EVT_PORT1";
public const string     ADS_EVT_BUFCHANGE_NAME               ="ADS_EVT_BUFCHANGE";
public const string     ADS_EVT_TERMINATED_NAME              ="ADS_EVT_TERMINATED";
public const string     ADS_EVT_OVERRUN_NAME                 ="ADS_EVT_OVERRUN";
public const string     ADS_EVT_WATCHDOG_NAME                ="ADS_EVT_WATCHDOG";
public const string     ADS_EVT_CHGSTATE_NAME                ="ADS_EVT_CHGSTATE";
public const string     ADS_EVT_ALARM_NAME                   ="ADS_EVT_ALARM";
public const string     ADS_EVT_PATTERNMATCH_NAME            ="ADS_EVT_PATTERNMATCH";   
public const string     ADS_EVT_COUNTERMATCH_NAME            ="ADS_EVT_COUNTERMATCH";
public const string     ADS_EVT_COUNTEROVERFLOW_NAME         ="ADS_EVT_COUNTEROVERFLOW";
public const string     ADS_EVT_STATUSCHANGE_NAME            ="ADS_EVT_STATUSCHANGE";

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
	
	///////////////////// V2.0B ///////////////////////

	/****************************************************************************
		define FIFO size
	*****************************************************************************/
public const Int32     FIFO_SIZE           =512;     // 1K FIFO size =(512* 2byte/each data);
public const Int32     FIFO_SIZE4          =2048;    // 4K FIFO size =(2048* 2byte/each data);

	/****************************************************************************
		Function ID Definition
	*****************************************************************************/
public const Int32 FID_DeviceOpen                  =0;
public const Int32 FID_DeviceClose                 =1;
public const Int32 FID_DeviceGetFeatures           =2;
public const Int32 FID_AIConfig                    =3;
public const Int32 FID_AIGetConfig                 =4;
public const Int32 FID_AIBinaryIn                  =5;
public const Int32 FID_AIScale                     =6;
public const Int32 FID_AIVoltageIn                 =7;
public const Int32 FID_AIVoltageInExp              =8;
public const Int32 FID_MAIConfig                   =9;
public const Int32 FID_MAIBinaryIn                =10;
public const Int32 FID_MAIVoltageIn               =11;
public const Int32 FID_MAIVoltageInExp            =12;
public const Int32 FID_TCMuxRead                  =13;
public const Int32 FID_AOConfig                   =14;
public const Int32 FID_AOBinaryOut                =15;
public const Int32 FID_AOVoltageOut               =16;
public const Int32 FID_AOScale                    =17;
public const Int32 FID_DioSetPortMode             =18;
public const Int32 FID_DioGetConfig               =19;
public const Int32 FID_DioReadPortByte            =20;
public const Int32 FID_DioWritePortByte           =21;
public const Int32 FID_DioReadBit                 =22;
public const Int32 FID_DioWriteBit                =23;
public const Int32 FID_DioGetCurrentDOByte        =24;
public const Int32 FID_DioGetCurrentDOBit         =25;
public const Int32 FID_WritePortByte              =26;
public const Int32 FID_WritePortWord              =27;
public const Int32 FID_ReadPortByte               =28;
public const Int32 FID_ReadPortWord               =29;
public const Int32 FID_CounterEventStart          =30;
public const Int32 FID_CounterEventRead           =31;
public const Int32 FID_CounterFreqStart           =32;
public const Int32 FID_CounterFreqRead            =33;
public const Int32 FID_CounterPulseStart          =34;
public const Int32 FID_CounterReset               =35;
public const Int32 FID_QCounterConfig             =36;
public const Int32 FID_QCounterConfigSys          =37;
public const Int32 FID_QCounterStart              =38;
public const Int32 FID_QCounterRead               =39;
public const Int32 FID_AlarmConfig                =40;
public const Int32 FID_AlarmEnable                =41;
public const Int32 FID_AlarmCheck                 =42;
public const Int32 FID_AlarmReset                 =43;
public const Int32 FID_COMOpen                    =44;
public const Int32 FID_COMConfig                  =45;
public const Int32 FID_COMClose                   =46;
public const Int32 FID_COMRead                    =47;
public const Int32 FID_COMWrite232                =48;
public const Int32 FID_COMWrite485                =49;
public const Int32 FID_COMWrite85                 =50;
public const Int32 FID_COMInit                    =51;
public const Int32 FID_COMLock                    =52;
public const Int32 FID_COMUnlock                  =53;
public const Int32 FID_WDTEnable                  =54;
public const Int32 FID_WDTRefresh                 =55;
public const Int32 FID_WDTReset                   =56;
public const Int32 FID_FAIIntStart                =57;
public const Int32 FID_FAIIntScanStart            =58;
public const Int32 FID_FAIDmaStart                =59;
public const Int32 FID_FAIDmaScanStart            =60;
public const Int32 FID_FAIDualDmaStart            =61;
public const Int32 FID_FAIDualDmaScanStart        =62;
public const Int32 FID_FAICheck                   =63;
public const Int32 FID_FAITransfer                =64;
public const Int32 FID_FAIStop                    =65;
public const Int32 FID_FAIWatchdogConfig          =66;
public const Int32 FID_FAIIntWatchdogStart        =67;
public const Int32 FID_FAIDmaWatchdogStart        =68;
public const Int32 FID_FAIWatchdogCheck           =69;
public const Int32 FID_FAOIntStart                =70;
public const Int32 FID_FAODmaStart                =71;
public const Int32 FID_FAOScale                   =72;
public const Int32 FID_FAOLoad                    =73;
public const Int32 FID_FAOCheck                   =74;
public const Int32 FID_FAOStop                    =75;
public const Int32 FID_ClearOverrun               =76;
public const Int32 FID_EnableEvent                =77;
public const Int32 FID_CheckEvent                 =78;
public const Int32 FID_AllocateDMABuffer          =79;
public const Int32 FID_FreeDMABuffer              =80;
public const Int32 FID_EnableCANEvent             =81;
public const Int32 FID_GetCANEventData            =82;
public const Int32 FID_TimerCountSetting          =83;
public const Int32 FID_CounterPWMSetting          =84;
public const Int32 FID_CounterPWMEnable           =85;
public const Int32 FID_DioTimerSetting            =86;
public const Int32 FID_EnableEventEx              =87;
public const Int32 FID_DICounterReset             =88;
public const Int32 FID_FDITransfer                =89;
public const Int32 FID_EnableSyncAO               =90;
public const Int32 FID_WriteSyncAO                =91;
public const Int32 FID_AOCurrentOut               =92;
public const Int32 FID_ADAMCounterSetHWConfig     =93 ;  
public const Int32 FID_ADAMCounterGetHWConfig     =94;
public const Int32 FID_ADAMAISetHWConfig          =95 ;  
public const Int32 FID_ADAMAIGetHWConfig          =96;
public const Int32 FID_ADAMAOSetHWConfig          =97 ;  
public const Int32 FID_ADAMAOGetHWConfig          =98;
public const Int32 FID_GetFIFOSize                =99;
public const Int32 FID_PWMStartRead               =100;
public const Int32 FID_FAIDmaExStart              =101;
public const Int32 FID_FAOWaveFormStart           =102 ;   

	//\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
public const Int32 FID_FreqOutStart              =104;
public const Int32 FID_FreqOutReset              =105;
public const Int32 FID_CounterConfig             =106;
public const Int32 FID_DeviceGetParam            =107;
	///////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\/

	//\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
public const Int32 FID_DeviceSetProperty	     =108;	
public const Int32 FID_DeviceGetProperty         =109;
public const Int32 FID_WritePortDword            =110;
public const Int32 FID_ReadPortDword             =111;
public const Int32 FID_FDIStart                  =112;
public const Int32 FID_FDICheck                  =113;
public const Int32 FID_FDIStop                   =114;
public const Int32 FID_FDOStart                  =115;
public const Int32 FID_FDOCheck                  =116;
public const Int32 FID_FDOStop                   =117;
public const Int32 FID_ClearFlag                 =118;


}