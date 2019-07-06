{ *************************************************************************** }
{ Module Name: DRIVER.PAS                                                     }
{ Purpose: the declaration of functions, data structures, status codes,       }
{         constants, and messages                                             }
{ Version: 3.01                                                               }
{ Date: 04/16/1998                                                            }
{ Copyright (c) 1996 Advantech Corp. Ltd.                                     }
{ All rights reserved.                                                        }
{ *************************************************************************** }
unit Driver;
interface
uses windows, event, paras;  
const
{ ************************************************************************ }
{   Constant Definition                                                    }
{ ************************************************************************ }
  MaxDev             =  255;  {  max. # of devices }
  MaxDevNameLen      =  64;   {  max lenght of device name }
  MaxGroup           =  6;
  MaxPort            =  3;
  MaxErrMsgLen       =  80;
  MAX_DEVICE_NAME_LEN=  64;
  MAX_DRIVER_NAME_LEN=  16;
  MAX_DAUGHTER_NUM   =  16;
  MAX_DIO_PORT       =  48;
  MAX_AO_RANGE       =  16;

  REMOTE             =    1;
  REMOTE1            =    REMOTE+1;      {  For PCL-818L JP7 = 5V }
  REMOTE2            =    REMOTE1+1;     {  For PCL-818L JP7 =10V }
  NONPROG            =    0;
  PROG               =    REMOTE;
  INTERNAL           =    0;
  EXTERNAL           =    1;
  SINGLEENDED        =    0;
  DIFFERENTIAL       =    1;
  BIPOLAR            =    0;
  UNIPOLAR           =    1;
  PORTA              =    0;
  PORTB              =    1;
  PORTC              =    2;
  INPORT             =    0;
  OUTPORT            =    1;

{ ************************************************************************ }
{   Define board vendor ID                                                 }
{ ************************************************************************ }
  AAC      = $0000;                    { Advantech }
  MB       = $1000;                    { Keithley/MetraByte }
  BB       = $2000;                    { Burr Brown }
  GRAYHILL = $3000;                    { Grayhill }
  KGS      = $4000;

{ ************************************************************************ }
{    Define DAS I/O CardType ID.                                              }
{ ************************************************************************ }
  NONE         = $00;             { not available }

{ Advantech CardType ID }
   BD_DEMO      =  AAC Or $00;     {  demo board }
   BD_PCL711    =  AAC Or $01;     {  PCL-711 board }
   BD_PCL812    =  AAC Or $02;     {  PCL-812 board }
   BD_PCL812PG  =  AAC Or $03;     {  PCL-812PG board }
   BD_PCL718    =  AAC Or $04;     {  PCL-718 board }
   BD_PCL818    =  AAC Or $05;     {  PCL-818 board }
   BD_PCL814    =  AAC Or $06;     {  PCL-814 board }
   BD_PCL720    =  AAC Or $07;     {  PCL-722 board }
   BD_PCL722    =  AAC Or $08;     {  PCL-720 board }
   BD_PCL724    =  AAC Or $09;     {  PCL-724 board }
   BD_AD4011    =  AAC Or $0a;     {  ADAM 4011 Module }
   BD_AD4012    =  AAC Or $0b;     {  ADAM 4012 Module }
   BD_AD4013    =  AAC Or $0c;     {  ADAM 4013 Module }
   BD_AD4021    =  AAC Or $0d;     {  ADAM 4021 Module }
   BD_AD4050    =  AAC Or $0e;     {  ADAM 4050 Module }
   BD_AD4060    =  AAC Or $0f;     {  ADAM 4060 Module }
   BD_PCL711B   =  AAC Or $10;     {  PCL-711B }
   BD_PCL818H   =  AAC Or $11;     {  PCL-818H }
   BD_PCL814B   =  AAC Or $12;     {  PCL-814B }
   BD_PCL816    =  AAC Or $13;     {  PCL-816  }
   BD_814_DIO_1 =  AAC Or $14;     {  PCL-816/814B 8255 DIO module   }
   BD_814_DA_1  =  AAC Or $15;     {  PCL-816/814B 12 bit D/A module }
   BD_816_DA_1  =  AAC Or $16;     {  PCL-816/814B 16 bit D/A module }
   BD_PCL830    =  AAC Or $17;     {  PCL-830 9513A Counter Card }
   BD_PCL726    =  AAC Or $18;     {  PCL-726 D/A card }
   BD_PCL727    =  AAC Or $19;     {  PCL-727 D/A card }
   BD_PCL728    =  AAC Or $1a;     {  PCL-728 D/A card }
   BD_AD4052    =  AAC Or $1b;     {  ADAM 4052 Module }
   BD_AD4014D   =  AAC Or $1c;     {  ADAM 4014D Module }
   BD_AD4017    =  AAC Or $1d;     {  ADAM 4017 Module  }
   BD_AD4080D   =  AAC Or $1e;     {  ADAM 4080D Module }
   BD_PCL721    =  AAC Or $1f;     {  PCL-721 32-bit Digital in }
   BD_PCL723    =  AAC Or $20;     {  PCL-723 24-bit Digital in }
   BD_PCL818L   =  AAC Or $21;     {  PCL-818L  }
   BD_PCL818HG  =  AAC Or $22;     {  PCL-818HG }
   BD_PCL1800   =  AAC Or $23;     {  PCL-1800 }
   BD_PAD71A    =  AAC Or $24;     {  PCIA-71A }
   BD_PAD71B    =  AAC Or $25;     {  PCIA-71B }
   BD_PCR420    =  AAC Or $26;     {  PCR-420  }
   BD_PCL731    =  AAC Or $27;     {  PCL-731 48-bit Digital I/O card  }
   BD_PCL730    =  AAC Or $28;     {  PCL-730 board }
   BD_PCL813    =  AAC Or $29;     {  PCL-813 32-channel A/D card  }
   BD_PCL813B   =  AAC Or $2a;     {  PCL-813B 32-channel A/D card }
   BD_PCL818HD  =  AAC Or $2b;     {  PCL-818HD }
   BD_PCL725    =  AAC Or $2c;     {  PCL-725 digital I/O card }
   BD_PCL732    =  AAC Or $2d;     {  PCL-732 high speed DIO card }
   BD_AD4018    =  AAC Or $2e;     {  ADAM 4018 Module }
   BD_814_TC_1  =  AAC Or $2f;     {  PCL-816/814B 16 bit TC module }
   BD_PAD71C    =  AAC Or $30;     {  PCIA-71C }
   BD_AD4024    =  AAC Or $31;     {  ADAM 4024 }
   BD_AD5017    =  AAC Or $32;     {  ADAM 5017 }
   BD_AD5018    =  AAC Or $33;     {  ADAM 5018 }
   BD_AD5024    =  AAC Or $34;     {  ADAM 5024 }
   BD_AD5051    =  AAC Or $35;     {  ADAM 5051 }
   BD_AD5060    =  AAC Or $36;     {  ADAM 5060 }
   BD_PCM3718   =  AAC Or $37;     {  PCM-3718  }
   BD_PCM3724   =  AAC Or $38;     {  PCM-3724  }
   BD_MIC2718   =  AAC Or $39;     {  MIC-2718  }
   BD_MIC2728   =  AAC Or $3a;     {  MIC-2728  }
   BD_MIC2730   =  AAC Or $3b;     {  MIC-2730  }
   BD_MIC2732   =  AAC Or $3c;     {  MIC-2732  }
   BD_MIC2750   =  AAC Or $3d;     {  MIC-2750  }
   BD_MIC2752   =  AAC Or $3e;     {  MIC-2752  }
   BD_PCL733    =  AAC Or $3f;     {  PCL-733   }
   BD_PCL734    =  AAC Or $40;     {  PCL-734   }
   BD_PCL735    =  AAC Or $41;     {  PCL-735   }
   BD_AD4018M   =  AAC Or $42;     {  ADAM 4018M Module }
   BD_AD4080    =  AAC Or $43;     {  ADAM 4080 Module  }
   BD_PCL833    =  AAC Or $44;     {  PCL-833   }
   BD_PCA6157   =  AAC Or $45;     {  PCA-6157  }
   BD_PCA6149   =  AAC Or $46;     {  PCA-6149  }
   BD_PCA6147   =  AAC Or $47;     {  PCA-6147  }
   BD_PCA6137   =  AAC Or $48;     {  PCA-6137  }
   BD_PCA6145   =  AAC Or $49;     {  PCA-6145  }
   BD_PCA6144   =  AAC Or $4a;     {  PCA-6144  }
   BD_PCA6143   =  AAC Or $4b;     {  PCA-6143  }
   BD_PCA6134   =  AAC Or $4c;     {  PCA-6134  }
   BD_AD5056    =  AAC Or $4d;     {  ADAM 5056 }
   BD_DN5017    =  AAC Or $4e;     {  ADAM 5017 }
   BD_DN5018    =  AAC Or $4f;     {  ADAM 5018 }
   BD_DN5024    =  AAC Or $50;     {  ADAM 5024 }
   BD_DN5051    =  AAC Or $51;     {  ADAM 5051 }
   BD_DN5056    =  AAC Or $52;     {  ADAM 5056 }
   BD_DN5060    =  AAC Or $53;     {  ADAM 5060 }
   BD_PCL836    =  AAC Or $54;     {  PCL-836   }
   BD_PCL841    =  AAC Or $55;     {  PCL-841   }
   BD_DN5050    =  AAC Or $56;     {  ADAM 5050 }
   BD_DN5052    =  AAC Or $57;     {  ADAM 5052 }
   BD_AD5050    =  AAC Or $58;     { ADAM 5050 for RS-485 }
   BD_AD5052    =  AAC Or $59;     { ADAM 5052 for RS-485 }
   BD_PCM3730   =  AAC Or $5a;     { PCM-3730 }
   BD_AD4011D   =  AAC Or $5b;     { ADAM 4011D }
   BD_AD4016    =  AAC Or $5c;     { ADAM 4016 }
   BD_AD4053    =  AAC Or $5d;     { ADAM 4053 }
   BD_PCI1750   =  AAC Or $5e;     { PCI-1750 }
   BD_PCI1751   =  AAC Or $5f;     { PCI-1751 }
   BD_PCI1710   =  AAC Or $60;     { PCI-1710 }
   BD_PCI1712   =  AAC Or $61;     { PCI-1712 }
   BD_AD5068    =  AAC Or $5e;     {  ADAM 5068	}
   BD_AD5013    =  AAC Or $5f;     {  ADAM 5013	}
   BD_AD5017H   =  AAC Or $60;     {  ADAM 5017H(unavailable)	}
   BD_AD5080    =  AAC Or $61;     {  ADAM 5080(unavailable)	}
   BD_MIC2760   =  AAC Or $66;     { MIC-2760 }
   BD_PCI1710HG =  AAC Or $67;     { PCI-1710HG }
   BD_PCI1713   =  AAC Or $68;     { PCI-1713 }
   BD_PCI1753   =  AAC Or $69;     { PCI-1753 }
   BD_PCI1760   =  AAC Or $6a;     { PCI-1760 }
   BD_PCI1720   =	 AAC Or $6b;     { PCI-1720 }
   BD_PCL752    =	 AAC Or $6c;     { PCL-752  }
   BD_PCM3718H  =	 AAC Or $6d;     { PCM-3718H  }
   BD_PCM3718HG    =	 AAC Or $6e;     { PCL-3718HG }
   BD_DN5068    =  AAC Or $6f;     { ADAM 5068 for Device Net }
   BD_DN5013    =  AAC Or $70;     { ADAM 5013 for Device Net }
   BD_DN5017H   =  AAC Or $71;     { ADAM 5017H for Device Net }
   BD_DN5080    =  AAC Or $72;     { ADAM 5080(unavailable)  for Device Net }
   BD_PCI1711   =  AAC Or $73;     { PCI-1711 }
   {------------------- V2.0b -------------------}
   BD_PCI1711L  =  AAC Or $75;     { PCI-1711L }
   {------------------- V2.0b -------------------}
   BD_PCI1716   =  AAC Or $74;     { PCI-1716 }
   BD_PCI1731   =  AAC Or $75;     { PCI-1731 }
   BD_AD5051D	=  AAC Or $76;	   { ADAM 5051D }
   BD_AD5056D	=  AAC Or $77;	   { ADAM 5056D }
   BD_DN5051D	=  AAC Or $78;	   { ADAM 5051D for Device Net }
   BD_DN5056D	=  AAC Or $79;	   { ADAM 5056D for Device Net }
   BD_SIMULATE  =  AAC Or $7a;     { Simulate IO }
   BD_PCI1754   =  AAC Or $7b;     { PCI-1754 }
   BD_PCI1752   =  AAC Or $7c;     { PCI-1752 }
   BD_PCI1756   =  AAC Or $7d;     { PCI-1756 }
   BD_PCL839    =  AAC Or $7e;     { PCL-839  }
   BD_PCM3725   =  AAC Or $7f;     { PCM-3725 }
   BD_PCI1762   =  AAC Or $80;     { PCI-1762 }      
   BD_PCI1721   =  AAC Or $81;     { PCI-1721 }   
   BD_PCI1761   =  AAC Or $82;     { PCI-1761 }   
   BD_PCI1723   =  AAC Or $83;     { PCI-1723 }   
   BD_AD4019    =  AAC Or $84;     { ADAM 4019 }   
   BD_AD5055    =  AAC Or $85;     { ADAM 5055 }   
   BD_AD4015    =  AAC Or $86;     { ADAM 4015 }   
   BD_PCI1730   =  AAC Or $87;     { PCI-1730 }   
   BD_PCI1733   =  AAC Or $88;     { PCI-1733 }   
   BD_PCI1734   =  AAC Or $89;     { PCI-1734 }
   BD_MIC2750A  =  AAC Or $8A;     { MIC-2750A }
   BD_MIC2718A  =  AAC Or $8B;     { MIC-2718A }
   BD_AD4017P   =  AAC Or $8c;     { ADAM 4017P Module }
   BD_AD4051    =  AAC Or $8d;     { ADAM 4051 Module }
   BD_AD4055    =  AAC Or $8e;     { ADAM 4055 Module }
   BD_AD4018P   =  AAC Or $8f;     { ADAM 4018P Module }
   BD_PCI1710L  =  AAC Or $90;     { PCI-1710L }
   BD_PCI1710HGL=  AAC Or $91;     { PCI-1710HGL }
   BD_AD4068    =  AAC Or $92;     { ADAM 4068 }
   BD_PCM3712   =  AAC Or $93;     { PCM-3712 }
   BD_PCM3723   =  AAC Or $94;     { PCM-3723 }
   
   
   { --------------------------- V2.0b ----------------------------------- }
   BD_PCI1780   =  AAC Or $95;     { PCI-1780 }
   BD_CPCI3756  =  AAC Or $96;     { CPCI-3756 }
   { --------------------------- V2.0b ----------------------------------- }

   { --------------------------- V2.0c ----------------------------------- }
   BD_PCI1755   =  AAC Or $97;     { PCI-1755 }
   BD_PCI1714   =  AAC Or $98;     { PCI-1714 }
   { --------------------------- V2.0c ----------------------------------- }

   { --------------------------- V2.1 ----------------------------------- }
   BD_PCI1757   =  AAC Or $99;     { PCI-1757 }
   { --------------------------- V2.1 ----------------------------------- }

   { --------------------------- V2.1a ----------------------------------- }
   BD_MIC1716   =  AAC Or $9A;     { MIC-1716 }
   BD_MIC1761   =  AAC Or $9B;     { MIC-1761 }
   BD_MIC1753   =  AAC Or $9C;     { MIC-1753 }
   BD_MIC1780   =  AAC Or $9D;     { MIC-1780 }
   { --------------------------- V2.1a ----------------------------------- }
   
   BD_PCI1724   =  AAC Or $9E;     { PCI-1724 }   
   
   BD_AD4015T   =  AAC Or $9F;     { ADAM 4015T Module }
   BD_UNO2052   =  AAC Or $A0;     { UNO  2052 Module }
   BD_PCI1680   =  AAC Or $A1;     { PCI-1680 }

   { --------------------------- V2.2 ----------------------------------- }
   BD_PCL839P       =  AAC Or $A2;     { PCL-839+ }
   BD_PCI1758UDI    =  AAC Or $A3;     { PCI-1758UDI  }
   BD_PCI1758UDO    =  AAC Or $A4;     { PCI-1758UDO  }
   BD_PCI1747       =  AAC Or $A5;     { PCI-1747 }
   BD_PCM3780       =  AAC Or $A6;     { PCM-3780 }
   BD_MIC3747       =  AAC Or $A7;     { MIC-3747 }
   BD_PCI1758UDIO   =  AAC Or $A8;     { PCI-1758UDIO }
   BD_PCI1712L      =  AAC Or $A9;     { PCI-1712L }
   BD_AD4056S       =  AAC Or $AA;     { ADAM 4056S Module }
   BD_AD4056SO      =  AAC Or $AB;     { ADAM 4056SO Module }
   
   BD_PCI1763UP     =  AAC Or $AC;     { PCI-1763UP }
   BD_PCI1736UP     =  AAC Or $AD;     { PCI-1736UP }
   BD_PCI1714UL     =  AAC Or $AE;     { PCI-1714UL }
   BD_MIC3714       =  AAC Or $AF;     { MIC-3714 }
   BD_AD5069        =  AAC Or $B0;     { ADAM 5069 Module }
   BD_PCM3718HO     =  AAC Or $B1;     { PCM-3718HO }
   BD_PCI1741U      =  AAC Or $B3;     { PCI-1741U }
   BD_MIC3723       =  AAC Or $B4;     { MIC-3723 }
   BD_PCI1718HDU    =  AAC Or $B5;     { PCI-1718HDU }
   BD_MIC3758DIO    =  AAC Or $B6;     { MIC-3758DIO }
   BD_PCI1727U      =  AAC Or $B7;     { PCI-1727U }
   BD_PCI1718HGU    =  AAC Or $B8;     { PCI-1718HGU }
   { --------------------------- V2.2 ----------------------------------- }

   BD_PCI1715U      =  AAC Or $B9;     { PCI-1715U }
   BD_PCI1716L      =  AAC Or $BA;     { PCI-1716L }
   BD_PCI1735U      =  AAC Or $BB;     { PCI-1735U }
   
   BD_USB4711       =  AAC Or $BC;     { USB-4711 }
   
   BD_PCI1737U      =  AAC Or $BD;     { PCI-1737U }
   BD_PCI1739U      =  AAC Or $BE;     { PCI-1739U }
   BD_AD4069        =  AAC Or $BF;     { ADAM 4069 Module }
   BD_PCI1742U      =  AAC Or $C0;     { PCI-1742U }
   BD_AD4117        =  AAC Or $C1;     { ADAM 4117 }
   BD_AD4118        =  AAC Or $C2;     { ADAM 4118 }
   BD_AD4150        =  AAC Or $C3;     { ADAM 4150 }
   BD_AD4168        =  AAC Or $C4;     { ADAM 4168 }
   BD_AD4022T       =  AAC Or $C5;     { ADAM 4022T }
   BD_USB4718       =  AAC Or $C6;     { USB-4718 }
   BD_MIC3755       =  AAC Or $C7;     { MIC-3755 }  
   BD_USB4761       =  AAC Or $C8;     { USB-4761 }  
   BD_AD4019P       =  AAC Or $C9;     { ADAM 4019 Plus }
   BD_AD5056S       =  AAC Or $CA;     { ADAM 5056S }
   BD_AD5056SO      =  AAC Or $CB;     { ADAM 5056SO }
   BD_PCI1784       =  AAC Or $CC;     { PCI- 1784 }
   BD_USB4716       =  AAC Or $CD;     { USB-4716 }
   BD_PCI1752U      =  AAC Or $CE;     { PCI-1752U }
   BD_PCI1752USO    =  AAC Or $CF;     { PCI-1752USO }
   BD_USB4751       =  AAC Or $D0;     { USB4751 }
   BD_USB4751L      =  AAC Or $D1;     { USB4751L }
   BD_USB4750       =  AAC Or $D2;     { USB4750 }
   BD_MIC3713       =  AAC Or $D3;     { MIC-3713 }
   BD_USB4813       =  AAC Or $D4;     { USB4813 }
   BD_USB4823       =  AAC Or $D5;     { USB4823 }
   BD_USB4878       =  AAC Or $D6;     { USB4878 }
   BD_USB4879       =  AAC Or $D7;     { USB4879 }
   BD_USB4711A      =  AAC Or $D8;     {USB4711A}
   BD_PCM3753P      =  AAC Or $D9;     {PCM3753P}
   BD_PCM3784       =  AAC Or $DA;     {PCM3784}
   BD_PCM3761I      =  AAC Or $DB;     {PCM3761I}
   BD_MIC3751       =  AAC Or $DC;     {MIC3751}
   BD_PCM3730I      =  AAC Or $DD;     {PCM3730I}
   BD_PCM3813I      =  AAC Or $E0;     {PCM-3813I/P}
   BD_PCIE1744      =  AAC Or $E1;     {PCIE-1744}
   BD_PCI1730U      =  AAC Or $E2;     {PCI-1730U}
   BD_PCI1760U      =  AAC Or $E3;     {PCI-1760U}
   BD_MIC3720       =  AAC Or $E4;     {MIC-3720}
   BD_USB4913       =  AAC Or $E5;     {USB-4913}
   BD_USB4916       =  AAC Or $E6;     {USB-4916}
   BD_USB4919       =  AAC Or $E7;     {USB-4919}
   BD_USB4923       =  AAC Or $E8;     {USB-4923}
   
   BD_PCM3810I      =  AAC Or $E9;     {PCM-3810I}
   BD_USB4702       =  AAC Or $EA;     {USB-4702}
   BD_USB4704       =  AAC Or $EB;     {USB-4704}
   BD_PCM3810I_HG   =  AAC Or $EC;     {PCM-3810I_HG}
   BD_PCI1713U      =  AAC Or $ED;     { PCI-1713U }
      
   BD_MICRODAC =  GRAYHILL Or $1; {  Grayhill MicroDAC Board ID }
   BD_GIA10    =  KGS Or $01;     {  KGS GIA-10 module Board ID }

{ ************************************************************************ }
{   Define Expansion Board ID.                                             }
{ ************************************************************************ }
   AAC_EXP     =  AAC Or $00000100;  { Advantech expansion bits }

{ define Advantech expansion board ID.
   BD_PCLD780   = $00000000;         {  PCLD-780  }
   BD_PCLD789   = AAC_EXP Or $0;     {  PCLD-789  }
   BD_PCLD779   = AAC_EXP Or $1;     {  PCLD-779  }
   BD_PCLD787   = AAC_EXP Or $2;     {  PCLD-787  }
   BD_PCLD8115  = AAC_EXP Or $3;     {  PCLD-8115 }
   BD_PCLD770   = AAC_EXP Or $4;     {  PCLD-770  }
   BD_PCLD788   = AAC_EXP Or $5;     {  PCLD-788  }
   BD_PCLD8710  = AAC_EXP Or $6;     {  PCLD-8710 }

{ ************************************************************************ }
{   Define subsection identifier                                           }
{ ************************************************************************ }
  DAS_AISECTION     = $1;        {  A/D subsection                }
  DAS_AOSECTION     = $2;        {  D/A sbusection                }
  DAS_DISECTION     = $3;        {  Digital input subsection      }
  DAS_DOSECTION     = $4;        {  Digital output sbusection     }
  DAS_TEMPSECTION   = $5;        {  thermocouple section          }
  DAS_ECSECTION     = $6;        {  Event count subsection        }
  DAS_FMSECTION     = $7;        {  frequency measurement section }
  DAS_POSECTION     = $8;        {  pulse output section          }
  DAS_ALSECTION     = $9;        {  alarm section                 }
  MT_AISECTION      = $0a;       {  monitoring A/D subsection     }
  MT_DISECTION      = $0b;       {  monitoring D/I subsection     }

{ ************************************************************************ }
{   Define Transfer Mode                                                   }
{ ************************************************************************ }
  POLLED_MODE       =  $0;        {  software transfer  }
  DMA_MODE          =  $1;        {  DMA transfer       }
  INTERRUPT_MODE    =  $2;        {  Interrupt transfer }

{ ************************************************************************ }
{   Define Acquisition Mode                                                }
{ ************************************************************************ }
  FREE_RUN          =  0;
  PRE_TRIG          =  1;
  POST_TRIG         =  2;
  POSITION_TRIG     =  3;

{ ************************************************************************ }
{   Define Comparator's Condition                                          }
{ ************************************************************************ }
  NOCONDITION       =  0;
  LESS              =  1;
  BETWEEN           =  2;
  GREATER           =  3;
  OUTSIDE           =  4;

{ ************************************************************************ }
{   Define Status Code                                                     }
{ ************************************************************************ }
  SUCCESS               =  0;
  DrvErrorCode          =  1;
  KeErrorCode           =  100;
  DnetErrorCode         =  200;
  USBErrorCode          =  500;
  OPCErrorCode		=  1000;
  MemoryAllocateFailed  =  DrvErrorCode + 0;
  ConfigDataLost        =  DrvErrorCode + 1;
  InvalidDeviceHandle   =  DrvErrorCode + 2;
  AIConversionFailed    =  DrvErrorCode + 3;
  AIScaleFailed         =  DrvErrorCode + 4;
  SectionNotSupported   =  DrvErrorCode + 5;
  InvalidChannel        =  DrvErrorCode + 6;
  InvalidGain           =  DrvErrorCode + 7;
  DataNotReady          =  DrvErrorCode + 8;
  InvalidInputParam     =  DrvErrorCode + 9;
  NoExpansionBoardConfig=  DrvErrorCode + 10;
  InvalidAnalogOutValue =  DrvErrorCode + 11;
  ConfigIoPortFailed    =  DrvErrorCode + 12;
  CommOpenFailed        =  DrvErrorCode + 13;
  CommTransmitFailed    =  DrvErrorCode + 14;
  CommReadFailed        =  DrvErrorCode + 15;
  CommReceiveFailed     =  DrvErrorCode + 16;
  CommConfigFailed      =  DrvErrorCode + 17;
  CommChecksumError     =  DrvErrorCode + 18;
  InitError             =  DrvErrorCode + 19;
  DMABufAllocFailed     =  DrvErrorCode + 20;
  IllegalSpeed          =  DrvErrorCode + 21;
  ChanConflict          =  DrvErrorCode + 22;
  BoardIDNotSupported   =  DrvErrorCode + 23;
  FreqMeasurementFailed =  DrvErrorCode + 24;
  CreateFileFailed      =  DrvErrorCode + 25;
  FunctionNotSupported  =  DrvErrorCode + 26;
  LoadLibraryFailed     =  DrvErrorCode + 27;
  GetProcAddressFailed  =  DrvErrorCode + 28;
  InvalidDriverHandle   =  DrvErrorCode + 29;
  InvalidModuleType     =  DrvErrorCode + 30;
  InvalidInputRange     =  DrvErrorCode + 31;
  InvalidWindowsHandle  =  DrvErrorCode + 32;
  InvalidCountNumber    =  DrvErrorCode + 33;
  InvalidInterruptCount =  DrvErrorCode + 34;
  InvalidEventCount     =  DrvErrorCode + 35;
  OpenEventFailed       =  DrvErrorCode + 36;
  InterruptProcessFailed=  DrvErrorCode + 37;
  InvalidDOSetting      =  DrvErrorCode + 38;
  InvalidEventType      =  DrvErrorCode + 39;
  EventTimeOut          =  DrvErrorCode + 40;
  InvalidDmaChannel     =  DrvErrorCode + 41;
  IntDamChannelBusy     =  DrvErrorCode + 42;

  CheckRunTimeClassFailed= DrvErrorCode + 43;
  CreateDllLibFailed	=  DrvErrorCode + 44;
  ExceptionError		=  DrvErrorCode + 45;
  RemoveDeviceFailed	=  DrvErrorCode + 46;
  BuildDeviceListFailed	=  DrvErrorCode + 47;
  NoIOFunctionSupport	=  DrvErrorCode + 48;
  { ------------------ V2.0b ------------------- }
  ResourceConflict      =  DrvErrorCode + 49;
  { ------------------ V2.0b ------------------- }

  { ------------------ V2.1 ------------------- }
  InvalidClockSource	=  DrvErrorCode + 50;
  InvalidPacerRate	=  DrvErrorCode + 51;
  InvalidTriggerMode    =  DrvErrorCode + 52;
  InvalidTriggerEdge    =  DrvErrorCode + 53;
  InvalidTriggerSource  =  DrvErrorCode + 54;
  InvalidTriggerVoltage =  DrvErrorCode + 55;
  InvalidCyclicMode     =  DrvErrorCode + 56;
  InvalidDelayCount     =  DrvErrorCode + 57;
  InvalidBuffer         =  DrvErrorCode + 58;
  OverloadedPCIBus      =  DrvErrorCode + 59;
  OverloadedInterruptRequest =  DrvErrorCode + 60;
  { ------------------ V2.0c ------------------- }
  
  { ------------------ V2.0c ------------------- }
  ParamNameNotSupported  = DrvErrorCode + 61;
  { ------------------ V2.0c ------------------- }


  { ------------------ V2.2B ------------------- }
  CheckEventFailed       = DrvErrorCode + 62;
  { ------------------ V2.2B ------------------- }

  { ------------------ V2.2C ------------------- }
  InvalidPort            = DrvErrorCode + 63;
  DaShiftBusy            = DrvErrorCode + 64;
  { ------------------ V2.2C ------------------- }
  
  ThermoCoupleDisconnect = DrvErrorCode + 65;
  
  

  KeInvalidHandleValue =  KeErrorCode + 0;
  KeFileNotFound       =  KeErrorCode + 1;
  KeInvalidHandle      =  KeErrorCode + 2;
  KeTooManyCmds        =  KeErrorCode + 3;
  KeInvalidParameter   =  KeErrorCode + 4;
  KeNoAccess           =  KeErrorCode + 5;
  KeUnsuccessful         = KeErrorCode + 6;
  KeConInterruptFailure  = KeErrorCode + 7;
  KeCreateNoteFailure    = KeErrorCode + 8;
  KeInsufficientResources= KeErrorCode + 9;
  KeHalGetAdapterFailure = KeErrorCode +10;
  KeOpenEventFailure     = KeErrorCode +11;
  KeAllocCommBufFailure  = KeErrorCode +12;
  KeAllocMdlFailure      = KeErrorCode +13;
  KeBufferSizeTooSmall   = KeErrorCode +14;

  DNInitFailed          =   DnetErrorCode + 1;
  DNSendMsgFailed       =   DnetErrorCode + 2;
  DNRunOutOfMsgID       =   DnetErrorCode + 3;
  DNInvalidInputParam   =   DnetErrorCode + 4;
  DNErrorResponse       =   DnetErrorCode + 5;
  DNNoResponse          =   DnetErrorCode + 6;
  DNBusyOnNetwork       =   DnetErrorCode + 7;
  DNUnknownResponse     =   DnetErrorCode + 8;
  DNNotEnoughBuffer     =   DnetErrorCode + 9;
  DNFragResponseError   =   DnetErrorCode + 10;
  DNTooMuchDataAck      =   DnetErrorCode + 11;
  DNFragRequestError    =   DnetErrorCode + 12;
  DNEnableEventError      = DnetErrorCode + 13;
  DNCreateOrOpenEventError= DnetErrorCode + 14;
  DNIORequestError        = DnetErrorCode + 15;
  DNGetEventNameError     = DnetErrorCode + 16;
  DNTimeOutError          = DnetErrorCode + 17;
  DNOpenFailed            = DnetErrorCode + 18;
  DNCloseFailed           = DnetErrorCode + 19;
  DNResetFailed           = DnetErrorCode + 20;
  
  USBTransmitFailed       = USBErrorCode + 1;
  USBInvalidCtrlCode      = USBErrorCode + 2;		
  USBInvalidDataSize      = USBErrorCode + 3;
  USBAIChannelBusy        = USBErrorCode + 4;
  USBAIDataNotReady       = USBErrorCode + 5;

{  define Windows message     }
  WM_USER               =  $400;
{  define user window message }
  WM_ATODNOTIFY         =  WM_USER+200;
  WM_DTOANOTIFY         =  WM_USER+201;
  WM_DIGINNOTIFY        =  WM_USER+202;
  WM_DIGOUTNOTIFY       =  WM_USER+203;
  WM_MTNOTIFY           =  WM_USER+204;
  WM_CANTRANSMITCOMPLETE=  WM_USER+205;
  WM_CANMESSAGE         =  WM_USER+206;
  WM_CANERROR           =  WM_USER+207;

{  define the wParam in user window message }
  AD_NONE               =  0; { AD Section }
  AD_TERMINATE          =  1;
  AD_INT                =  2;
  AD_BUFFERCHANGE       =  3;
  AD_OVERRUN            =  4;
  AD_WATCHDOGACT        =  5;
  AD_TIMEOUT            =  6;
  DA_TERMINATE          =  0; {  DA Section }
  DA_DMATC              =  1;
  DA_INT                =  2;
  DA_BUFFERCHANGE       =  3;
  DA_OVERRUN            =  4;
  DI_TERMINATE          =  0; {  DI Section }
  DI_DMATC              =  1;
  DI_INT                =  2;
  DI_BUFFERCHANGE       =  3;
  DI_OVERRUN            =  4;
  DI_WATCHDOGACT        =  5;
  DO_TERMINATE          =  0; {  DO Section }
  DO_DMATC              =  1;
  DO_INT                =  2;
  DO_BUFFERCHANGE       =  3;
  DO_OVERRUN            =  4;
  MT_ATOD               =  0; {  MT Section }
  MT_DIGIN              =  1;

  CAN_TRANSFER          =  0; { CAN Section }
  CAN_RECEIVE           =  1;
  CAN_ERROR             =  2;

{ ************************************************************************ }
{   define thermocopule type J, K, S, T, B, R, E                           }
{ ************************************************************************ }
  BTC = 4;
  ETC = 6;
  JTC = 0;
  KTC = 1;
  RTC = 5;
  STC = 2;
  TTC = 3;

{ ************************************************************************ }
{   define  temperature scale                                              }
{ ************************************************************************ }
  C = 0;      { Celsius    }
  F = 1;      { Fahrenheit }
  R = 2;      {  Rankine   }
  K = 3;      {  Kelvin    }


{ ************************************************************************ }
{   define service type for COMEscape()                                    }
{ ************************************************************************ }
  EscapeFlushInput      = 1;
  EscapeFlushOutput     = 2;
  EscapeSetBreak        = 3;
  EscapeClearBreak      = 4;


{ ************************************************************************ }
{   define  gate mode                                                      }
{ ************************************************************************ }
  GATE_DISABLED     = 0;      {  no gating         }
  GATE_HIGHLEVEL    = 1;      {  active high level }
  GATE_LOWLEVEL     = 2;      {  active low level  }
  GATE_HIGHEDGE     = 3;      {  active high edge  }
  GATE_LOWEDGE      = 4;      {  active low edge   }


{ ************************************************************************ }
{   define input mode for PCL-833                                          }
{ ************************************************************************ }
  DISABLE           = 0;      {  disable mode         }
  ABPHASEX1         = 1;      {  Quadrature input X1  }
  ABPHASEX2         = 2;      {  Quadrature input X2  }
  ABPHASEX4         = 3;      {  Quadrature input X4  }
  TWOPULSEIN        = 4;      {  2 pulse input        }
  ONEPULSEIN        = 5;      {  1 pulse input        }

{ ************************************************************************ }
{   define latch source for PCL-833                                        }
{ ************************************************************************ }
  SWLATCH           = 0;      {  S/W read latch data }
  INDEXINLATCH      = 1;      {  Index-in latch data }
  DI0LATCH          = 2;      {  DI0 latch data      }
  DI1LATCH          = 3;      {  DI1 latch data      }
  TIMERLATCH        = 4;      {  Timer latch data    }
  DI2LATCH          = 5;      {  DI2 latch data      }
  DI3LATCH          = 6;      {  DI3 latch data      }

{ ************************************************************************ }
{   define timer base mode for PCL-833                                     }
{ ************************************************************************ }
  TPOINT1MS   = 0;      {     0.1 ms timer base }
  T1MS        = 1;      {     1   ms timer base }
  T10MS       = 2;      {    10   ms timer base }
  T100MS      = 3;      {   100   ms timer base }
  T1000MS     = 4;      {  1000   ms timer base }

{ ************************************************************************ }
{   define clock source for PCL-833                                        }
{ ************************************************************************ }
  SYS8MHZ     =    0;      {  8 MHZ system clock }
  SYS4MHZ     =    1;      {  4 MHZ system clock }
  SYS2MHZ     =    2;      {  2 MHZ system clock }
  SYS1MHZ     =    3;      {  1 MHZ system clock hailing}

{ ************************************************************************ }
{   define timer base mode for PCI 1784     hailing                        }
{ ************************************************************************ }
  T50KHZ     =    0;      {  50 KHZ system clock }
  T5KHZ      =    1;      {  5  KHZ system clock }
  T500HZ     =    2;      {  500 HZ system clock }
  T50HZ      =    3;      {  50  HZ system clock }
  T5HZ       =    4;      {  5   HZ system clock }

{ ************************************************************************ }
{   define counter lock type for PCI 1784     hailing                        }
{ ************************************************************************ }
  OVERFLOWLOCK       =    0;      {  overflow lock counter }
  UNDERFLOWLOCK      =    1;      {  underflow lock counter }
  OVERUNDERLOCK      =    2;      {  overflow and underflow lock counter }

{ ************************************************************************ }
{   define counter indicator type for PCI 1784     hailing                        }
{ ************************************************************************ }
  OVERCOMPLEVEL     =    $1;      {  over compare level indicator }
  OVERCOMPPULSE     =    $2;      {  over compare pulse indicator }
  UNDERCOMPLEVEL    =    $4;      {  under compare level indicator }
  UNDERCOMPPULSE    =    $8;      {  under compare pulse indicator }
{ ************************************************************************ }
{   define cascade mode for PCL-833                                        }
{ ************************************************************************ }
  NOCASCADE   =       0;      {  24-bit(no cascade) }
  CASCADE     =       1;      {  48-bit(CH1, CH2 cascade) }

{ --------------------------- V2.0b -------------------------------------- }
{ ************************************************************************ }
{   define parameters for PCI-1780                                         }
{ ************************************************************************ }
{ define the counter mode register parameter}
 PA_MODE_ACT_HIGH_TC_PULSE	   =	$0000;
 PA_MODE_ACT_LOW_TC_PULSE	   =	$0001;
 PA_MODE_TC_TOGGLE_FROM_LOW	   =	$0002;
 PA_MODE_TC_TOGGLE_FROM_HIGH       =    $0003;
 PA_MODE_ENABLE_OUTPUT	           =    $0004;
 PA_MODE_DISABLE_OUTPUT	           =	$0000;
 PA_MODE_COUNT_DOWN		   =	$0000;
 PA_MODE_COUNT_UP		   =	$0008;
 PA_MODE_COUNT_RISE_EDGE	   =	$0000;
 PA_MODE_COUNT_FALL_EDGE	   =	$0080;
 PA_MODE_COUNT_SRC_OUT_N_M1	   =	$0100; { N_M1 means n minus 1}
 PA_MODE_COUNT_SRC_CLK_N	   =	$0200;
 PA_MODE_COUNT_SRC_CLK_N_M1        =	$0300;
 PA_MODE_COUNT_SRC_FOUT_0	   =	$0400;
 PA_MODE_COUNT_SRC_FOUT_1	   =	$0500;
 PA_MODE_COUNT_SRC_FOUT_2	   =	$0600;
 PA_MODE_COUNT_SRC_FOUT_3	   =	$0700;
 PA_MODE_COUNT_SRC_GATE_N_M1       =  $0C00;
 PA_MODE_COUNT_SRC_GATE_N          =  $0C00;
 
 PA_MODE_COUNT_SRC_20MHz     = $0400;
 PA_MODE_COUNT_SRC_2MHz      = $0500;
 PA_MODE_COUNT_SRC_200KHz    = $0600;
 PA_MODE_COUNT_SRC_20KHz     = $0700;
 PA_MODE_COUNT_SRC_2KHz      = $0800;
 PA_MODE_COUNT_SRC_200Hz     = $0900;
 PA_MODE_COUNT_SRC_20Hz      = $0A00;
 PA_MODE_COUNT_SRC_2Hz       = $0B00;
 
 PA_MODE_GATE_SRC_GATE_NO	   =	$0000;
 PA_MODE_GATE_SRC_OUT_N_M1	   =	$1000;
 PA_MODE_GATE_SRC_GATE_N	   =	$2000;
 PA_MODE_GATE_SRC_GATE_N_M1	   =	$3000;
 PA_MODE_GATE_POSITIVE   	   =	$0000;
 PA_MODE_GATE_NEGATIVE	           =    $4000;

{ Counter Mode }
 MODE_A   =       $0000;
 MODE_B   =       $0000;
 MODE_C   =       $8000;
 MODE_D   =       $0010;
 MODE_E   =       $0010;
 MODE_F   =       $8010;
 MODE_G   =       $0020;
 MODE_H   =       $0020;
 MODE_I   =       $8020;
 MODE_J   =       $0030;
 MODE_K   =       $0030;
 MODE_L   =       $8030;
 MODE_O   =       $8040;
 MODE_R   =       $8050;
 MODE_U   =       $8060;
 MODE_X   =       $8070;
 
 MODE_M   =       $000C; {For PCM3810I}
 MODE_N   =       $000D; {For PCM3810I}

{ define the FOUT register parameter}
 PA_FOUT_SRC_EXTER_CLK	=    $0000;
 PA_FOUT_SRC_CLK_N	=    $0100;
 PA_FOUT_SRC_FOUT_N_M1	=    $0200;
 PA_FOUT_SRC_CLK_10MHZ	=    $0300;
 PA_FOUT_SRC_CLK_1MHZ	=    $0400;
 PA_FOUT_SRC_CLK_100KHZ	=    $0500;
 PA_FOUT_SRC_CLK_10KHZ	=    $0600;
 PA_FOUT_SRC_CLK_1KHZ	=    $0700;
 {define for USB4751 FOUT}
 PA_FOUT_SRC_CLK_20MHZ	=    $0800;
 PA_FOUT_SRC_CLK_5MHZ	=    $0900;
{ --------------------------- V2.0b -------------------------------------- }

{ ************************************************************************ }
{   define event type for interrupt and DMA transfer                       }
{ ************************************************************************ }
  ADS_EVT_INTERRUPT  =  $01;   { interrupt }
  ADS_EVT_BUFCHANGE  =  $02;   { buffer change }
  ADS_EVT_TERMINATED =  $04;   { termination }
  ADS_EVT_OVERRUN    =  $08;   { overrun }
  ADS_EVT_WATCHDOG   =  $10;   { watchdog actived }
  ADS_EVT_CHGSTATE   =  $20;   { change state event }
  ADS_EVT_ALARM      =  $40;   { alarm event }
  ADS_EVT_PORT0      =  $80;   { port 0 event }
  ADS_EVT_PORT1      = $100;   { port 1 event }
  ADS_EVT_PORT2      = $800;   { port 2 event }
  ADS_EVT_PATTERNMATCH    = $200;  { Pattern Match for DI }
  ADS_EVT_COUNTER    = $201;   { Persudo event for COUNTERMATCH and COUNTEROVERFLOW }
  ADS_EVT_COUNTERMATCH    = $202;  { Counter Match setting NO. for DI }
  ADS_EVT_COUNTEROVERFLOW = $203;  { Counter Overflow for DI }
  ADS_EVT_STATUSCHANGE    = $204;  { Status Change for DI }
  ADS_EVT_FILTER     = $205;   { Filter Event }
{ --------------------------- V2.2 -------------------------------------- }
  ADS_EVT_WATCHDOG_OVERRUN = $206;   { Watchdong Event }
{ --------------------------- V2.2 -------------------------------------- }

  ADS_EVT_DEVREMOVED = $400;  { for USB device }

{ ************************************************************************ }
{    define event name by device number                                    }
{ ************************************************************************ }
  ADS_EVT_INTERRUPT_NAME  = 'ADS_EVT_INTERRUPT';
  ADS_EVT_BUFCHANGE_NAME  = 'ADS_EVT_BUFCHANGE';
  ADS_EVT_TERMINATED_NAME = 'ADS_EVT_TERMINATED';
  ADS_EVT_OVERRUN_NAME    = 'ADS_EVT_OVERRUN';
  ADS_EVT_WATCHDOG_NAME   = 'ADS_EVT_WATCHDOG';
  ADS_EVT_CHGSTATE_NAME   = 'ADS_EVT_CHGSTATE';
  ADS_EVT_ALARM_NAME      = 'ADS_EVT_ALARM';
  ADS_EVT_PATTERNMATCH_NAME    = 'ADS_EVT_PATTERNMATCH';
  ADS_EVT_COUNTERMATCH_NAME    = 'ADS_EVT_COUNTERMATCH';
  ADS_EVT_COUNTEROVERFLOW_NAME = 'ADS_EVT_COUNTEROVERFLOW';
  ADS_EVT_STATUSCHANGE_NAME    = 'ADS_EVT_STATUSCHANGE';
{ --------------------------- V2.2 -------------------------------------- }
 ADS_EVT_WATCHDOG_OVERRUN_NAME    = 'ADS_EVT_WATCHDOG_OVERRUN';
{ --------------------------- V2.2 -------------------------------------- }

{ ************************************************************************ }
{    define FIFO size                                                      }
{ ************************************************************************ }
  FIFO_SIZE         =  512;     { 1K FIFO size (512* 2byte/each data) }

{ ************************************************************************ }
{    define Data Type ID                                                   }
{ ************************************************************************ }
  AI_BUFFER_DATATYPE32        =  $32b;

{ ************************************************************************ }
{   Function ID Definition                                                 }
{ ************************************************************************ }
  FID_DeviceOpen              =   0;
  FID_DeviceClose             =   1;
  FID_DeviceGetFeatures       =   2;
  FID_AIConfig                =   3;
  FID_AIGetConfig             =   4;
  FID_AIBinaryIn              =   5;
  FID_AIScale                 =   6;
  FID_AIVoltageIn             =   7;
  FID_AIVoltageInExp          =   8;
  FID_MAIConfig               =   9;
  FID_MAIBinaryIn             =  10;
  FID_MAIVoltageIn            =  11;
  FID_MAIVoltageInExp         =  12;
  FID_TCMuxRead               =  13;
  FID_AOConfig                =  14;
  FID_AOBinaryOut             =  15;
  FID_AOVoltageOut            =  16;
  FID_AOScale                 =  17;
  FID_DioSetPortMode          =  18;
  FID_DioGetConfig            =  19;
  FID_DioReadPortByte         =  20;
  FID_DioWritePortByte        =  21;
  FID_DioReadBit              =  22;
  FID_DioWriteBit             =  23;
  FID_DioGetCurrentDOByte     =  24;
  FID_DioGetCurrentDOBit      =  25;
  FID_WritePortByte           =  26;
  FID_WritePortWord           =  27;
  FID_ReadPortByte            =  28;
  FID_ReadPortWord            =  29;
  FID_CounterEventStart       =  30;
  FID_CounterEventRead        =  31;
  FID_CounterFreqStart        =  32;
  FID_CounterFreqRead         =  33;
  FID_CounterPulseStart       =  34;
  FID_CounterReset            =  35;
  FID_QCounterConfig          =  36;
  FID_QCounterConfigSys       =  37;
  FID_QCounterStart           =  38;
  FID_QCounterRead            =  39;
  FID_AlarmConfig             =  40;
  FID_AlarmEnable             =  41;
  FID_AlarmCheck              =  42;
  FID_AlarmReset              =  43;
  FID_COMOpen                 =  44;
  FID_COMConfig               =  45;
  FID_COMClose                =  46;
  FID_COMRead                 =  47;
  FID_COMWrite232             =  48;
  FID_COMWrite485             =  49;
  FID_COMWrite85              =  50;
  FID_COMInit                 =  51;
  FID_COMLock                 =  52;
  FID_COMUnlock               =  53;
  FID_WDTEnable               =  54;
  FID_WDTRefresh              =  55;
  FID_WDTReset                =  56;
  FID_FAIIntStart             =  57;
  FID_FAIIntScanStart         =  58;
  FID_FAIDmaStart             =  59;
  FID_FAIDmaScanStart         =  60;
  FID_FAIDualDmaStart         =  61;
  FID_FAIDualDmaScanStart     =  62;
  FID_FAICheck                =  63;
  FID_FAITransfer             =  64;
  FID_FAIStop                 =  65;
  FID_FAIWatchdogConfig       =  66;
  FID_FAIIntWatchdogStart     =  67;
  FID_FAIDmaWatchdogStart     =  68;
  FID_FAIWatchdogCheck        =  69;
  FID_FAOIntStart             =  70;
  FID_FAODmaStart             =  71;
  FID_FAOScale                =  72;
  FID_FAOLoad                 =  73;
  FID_FAOCheck                =  74;
  FID_FAOStop                 =  75;
  FID_ClearOverrun            =  76;
  FID_EnableEvent             =  77;
  FID_CheckEvent              =  78;
  FID_AllocateDMABuffer       =  79;
  FID_FreeDMABuffer           =  80;
  FID_EnableCANEvent          =  81;
  FID_GetCANEventData         =  82;
  FID_TimerCountSetting       =  83;
  FID_CounterPWMSetting       =  84;
  FID_CounterPWMEnable        =  85;
  FID_DioTimerSetting         =  86;
  FID_EnableEventEx           =  87;
  FID_DICounterReset          =  88;
  FID_FDITransfer             =  89;
  FID_EnableSyncAO            =  90;
  FID_WriteSyncAO             =  91;
  FID_AOCurrentOut            =  92;
  FID_ADAMCounterSetHWConfig  =  93;
  FID_ADAMCounterGetHWConfig  =  94;
  FID_ADAMAISetHWConfig	      =  95;	
  FID_ADAMAIGetHWConfig	      =  96;
  FID_ADAMAOSetHWConfig	      =  97;
  FID_ADAMAOGetHWConfig	      =  98;
  FID_GetFIFOSize             =  99;
  FID_PWMStartRead	      =  100;
  FID_FAIDmaExStart           =  101;
  FID_FAOWaveFormStart	      =  102; 	
  
  { --------------------------- V2.0b -------------------------------- }
  FID_FreqOutStart            =  104;
  FID_FreqOutReset            =  105;
  FID_CounterConfig           =  106;
  FID_DeviceGetParam          =  107;
  { --------------------------- V2.0b -------------------------------- }

  { --------------------------- V2.0c -------------------------------- }
  FID_DeviceSetProperty = 108;   {PCI-1755}
  FID_DeviceGetProperty = 109;   {PCI-1755}
  FID_WritePortDword    = 110;   {PCI-1755}
  FID_ReadPortDword     = 111;   {PCI-1755}
  FID_FDIStart          = 112;   {PCI-1755}
  FID_FDICheck          = 113;   {PCI-1755}
  FID_FDIStop           = 114;   {PCI-1755}
  FID_FDOStart          = 115;   {PCI-1755}
  FID_FDOCheck          = 116;   {PCI-1755}
  FID_FDOStop           = 117;   {PCI-1755}
  FID_ClearFlag         = 118;   {PCI-1755}
  { --------------------------- V2.0c -------------------------------- }
  { --------------------------- V2.2 -------------------------------- }
  FID_WatchdogStart     = 119;    {PCI-1758}
  FID_WatchdogFeed      = 120;    {PCI-1758}
  FID_WatchdogStop      = 121;    {PCI-1758}
  { --------------------------- V2.2 -------------------------------- }

  { --------------------------- V2.2C -------------------------------- }
  FID_DioReadPortWord   = 122;    
  FID_DioWritePortWord  = 123;    
  FID_DioReadPortDword  = 124;    
  FID_DioWritePortDword = 125;    
  FID_DioGetCurrentDOWord  = 126; 
  FID_DioGetCurrentDODword = 127; 
  FID_FAODmaExStart        = 128;
  FID_FAITerminate = 129;
  FID_FAOTerminate = 130;
  { --------------------------- V2.2C -------------------------------- }
  
  FID_DioEnableEventAndSpecifyDiPorts = 131;
  FID_DioDisableEvent                 = 132;
  FID_DioGetLatestEventDiPortsState   = 133;
  FID_DioReadDiPorts                  = 134;
  FID_DioWriteDoPorts                 = 135;
  FID_DioGetCurrentDoPortsState       = 136;

  FID_FAOCheckEx                      = 137;

  FID_DioEnableEventAndSpecifyEventCounter  = 138;
  FID_CntrEnableEventAndSpecifyEventCounter = 139;
  FID_CntrGetLatestEventCounterValue        = 140;
  FID_CntrDisableEvent                      = 141;

  FID_CustomerDataRead                      = 142;
  FID_CustomerDataWrite                     = 143;
  {//For 32-bit Data structure}
  FID_AIBinaryIn32               = 144;
  FID_AIVoltageIn32              = 145;
  FID_MAIBinaryIn32              = 146;
  FID_MAIVoltageIn32             = 147;
  FID_FAIIntStart32              = 148;
  FID_FAIIntScanStart32          = 149;
  FID_FAIDmaExStart32            = 150;
Type
{ ************************************************************************ }
{   define gain listing                                                    }
{ ************************************************************************ }
 GAINLIST = Record
  usGainCde   : Smallint;
  fMaxGainVal : Single;
  fMinGainVal : Single;
  szGainStr   : array [0..15] of char;
 End;

{ ************************************************************************ }
{   Define hardware board(device) features.                                }
{                                                                          }
{   Note: definition for dwPermutaion member                               }
{                                                                          }
{          Bit 0: Software AI                                              }
{          Bit 1: DMA AI                                                   }
{          Bit 2: Interrupt AI                                             }
{          Bit 3: Condition AI                                             }
{          Bit 4: Software AO                                              }
{          Bit 5: DMA AO                                                   }
{          Bit 6: Interrupt AO                                             }
{          Bit 7: Condition AO                                             }
{          Bit 8: Software DI                                              }
{          Bit 9: DMA DI                                                   }
{          Bit 10: Interrupt DI                                            }
{          Bit 11: Condition DI                                            }
{          Bit 12: Software DO                                             }
{          Bit 13: DMA DO                                                  }
{          Bit 14: Interrupt DO                                            }
{          Bit 15: Condition DO                                            }
{          Bit 16: High Gain                                               }
{          Bit 17: Auto Channel Scan                                       }
{          Bit 18: Pacer Trigger                                           }
{          Bit 19: External Trigger                                        }
{          Bit 20: Down Counter                                            }
{          Bit 21: Dual DMA                                                }
{          Bit 22: Monitoring                                              }
{          Bit 23: QCounter                                                }
{                                                                          }
{ ************************************************************************ }
 DEVFEATURES= Record
    szDriverVer : array[0..7] of char;                      { device driver version }
    szDriverName: array[0..MAX_DRIVER_NAME_LEN-1] of char;  { device driver name    }
    dwBoardID      : Longint;    { board ID                              }
    usMaxAIDiffChl : Smallint;    { Max. number of differential channel   }
    usMaxAISiglChl : Smallint;    { Max. number of single-end channel     }
    usMaxAOChl     : Smallint;    { Max. number of D/A channel            }
    usMaxDOChl     : Smallint;    { Max. number of digital out channel    }
    usMaxDIChl     : Smallint;    { Max. number of digital input channel  }
    usDIOPort      : Smallint;    { specifies if programmable or not      }
    usMaxTimerChl  : Smallint;    { Max. number of Counter/Timer channel  }
    usMaxAlarmChl  : Smallint;    { Max number of  alram channel          }
    usNumADBit     : Smallint;    { number of bits for A/D converter      }
    usNumADByte    : Smallint;    { A/D channel width in bytes.           }
    usNumDABit     : Smallint;    { number of bits for D/A converter.     }
    usNumDAByte    : Smallint;    { D/A channel width in bytes.           }
    usNumGain      : Smallint;    { Max. number of gain code              }
    glGainList    : array[0..15] of GAINLIST;   { Gain listing }
    dwPermutation : array [0..3] of Longint;    { Permutation }
 End;

{ ************************************************************************ }
{    AOSET Definition                                                      }
{ ************************************************************************ }
 AOSET = Record
    usAOSource : Smallint;     { 0-internal, 1-external }
    fAOMaxVol  : Single;      { maximum output voltage }
    fAOMinVol  : Single;      { minimum output voltage }
    fAOMaxCur  : Single;      { maximum output voltage } 
    fAOMinCur  : Single;      { minimum output voltage }
    
 End;

 AORANGESET = Record
    usGainCount: Smallint;
    usAOSource : Smallint;     { 0-internal, 1-external }
    usAOType   : Smallint;     { 0-voltage, 1-current   }
    usChan     : Smallint;     
    fAOMax     : Single;       { maximum output } 
    fAOMin     : Single;       { minimum output }    
 End;


 {-----------------------2.0B--------------------------}
 { 2.0c mask, declare it later
 PT_DeviceGetParam = Record
    nID        : Smallint;
    nSize      : ^Longint;
    pBuffer    : ^Longint;
 End;
 }
 {-----------------------2.0B--------------------------}

 
{ ************************************************************************ }
{    DaughterSet Definition                                                }
{ ************************************************************************ }
 DAUGHTERSET = Record
    dwBoardID : Longint;              { expansion board ID }
    usNum     : Smallint;              { available expansion channels }
    fGain     : Single;               { gain for expansion channel }
    usCards   : Smallint;              { number of expansion cards }
 End;

{ ************************************************************************ }
{    Analog Input Configuration Definition                                 }
{ ************************************************************************ }
 DEVCONFIG_AI = Record
    dwBoardID     : Longint;     { board ID code                         }
    ulChanConfig  : Longint;     { 0-single ended, 1-differential        }
    usGainCtrMode : Smallint;     { 1-by jumper, 0-programmable           }
    usPolarity    : Smallint;     { 0-bipolar, 1-unipolar                 }
    usDasGain     : Smallint;     { not used if GainCtrMode = 1           }
    usNumExpChan  : Smallint;     { DAS channels attached expansion board }
    usCjcChannel  : Smallint;     { cold junction channel                 }
    Daughter: array [0..MAX_DAUGHTER_NUM-1] of DAUGHTERSET ;  { expansion board settings }
    ulChanConfigEx: array [0..3] of Longint; { Extension the channel configuration, so we can max support 128 AI channels' setting. }

 End;

{ ************************************************************************ }
{    DEVCONFIG_COM Definition                                              }
{ ************************************************************************ }
 DEVCONFIG_COM = Record
    usCommPort    : Smallint;                { serial port  }
    dwBaudRate    : Longint;                 { baud rate    }
    usParity      : Smallint;                { parity check }
    usDataBits    : Smallint;                { data bits    }
    usStopBits    : Smallint;                { stop bits    }
    usTxMode      : Smallint;                { transmission mode }
    usPortAddress : Smallint;                { communication port address }
 End;

{ ************************************************************************ }
{    TRIGLEVEL Definition                                                  }
{ ************************************************************************ }
 TRIGLEVEL = Record
  fLow  : Single;
  fHigh : Single;
 End;


 PT_DEVLIST = Record
    dwDeviceNum      : Longint;
    szDeviceName     : array [0..49] of char;
    nNumOfSubdevices : Smallint;
 End;

 PT_DeviceGetFeatures  = Record
    buffer : Pointer;        { LPDEVFEATURES }
    size   : Smallint;
 End;

 PT_AIConfig  = Record
    DasChan : Smallint;
    DasGain : Smallint;
 End;

 PT_AIGetConfig  = Record
    buffer : Pointer;        { LPDEVCONFIG_AI }
    size   : Smallint;
 End;

 PT_AIScale  = Record
    reading  : Smallint;
    MaxVolt  : Single;
    MaxCount : Smallint;
    offset   : Smallint;
    voltage  : ^Single;      { Float far *Voltage }
 End;

 PT_AIVoltageIn  = Record
    chan : Smallint;
    gain : Smallint;
    TrigMode : Smallint;
    voltage  : ^Single;      { Float far *Voltage }
 End;

 PT_AIVoltageInExp  = Record
    DasChan : Smallint;
    DasGain : Smallint;
    ExpChan : Smallint;
    voltage : ^Single;      { Float far *Voltage }
 End;

 PT_MAIConfig  = Record
    NumChan   : Smallint;
    StartChan : Smallint;
    GainArray : ^Smallint;  { USHORT far *Reading }
 End;

 PT_MAIVoltageIn  = Record
    NumChan   : Smallint;
    StartChan : Smallint;
    GainArray : ^Smallint;  { Float far *VoltageArray }
    TrigMode  : Smallint;
    VoltageArray : ^Single;  { Float far *VoltageArray }
 End;

 PT_MAIVoltageInExp  = Record
    NumChan : Smallint;
    DasChanArray : ^Smallint;  { USHORT far *DasChanArray }
    DasGainArray : ^Smallint;  { USHORT far *DasGainArray }
    ExpChanArray : ^Smallint;  { USHORT far *ExpChanArray }
    VoltageArray : ^Single;    { Float  far *VoltageArray }
 End;

 PT_TCMuxRead  = Record
    DasChan   : Smallint;
    DasGain   : Smallint;
    ExpChan   : Smallint;
    TCType    : Smallint;
    TempScale : Smallint;
    temp      : ^Single;       { FLOAT far *temp }
 End;

 PT_AOConfig  = Record
    chan : Smallint;
    RefSrc : Smallint;
    MaxValue : Single;
    MinValue : Single;
 End;

 PT_AOBinaryOut  = Record
    chan : Smallint;
    BinData : Smallint;
 End;

 PT_AOVoltageOut  = Record
    chan : Smallint;
    OutputValue : Single;
 End;

 PT_AOScale  = Record
    chan        : Smallint;
    OutputValue : Single;
    BinData     : ^Smallint;   { USHORT far *BinData }
 End;

 PT_DioSetPortMode  = Record
    port : Smallint;
    dir  : Smallint;
 End;

 PT_DioGetConfig  = Record
    PortArray : ^Smallint;     { SHORT far *PortArray }
    NumOfPorts : Smallint;
 End;

 PT_DioReadPortByte  = Record
    port : Smallint;
    value: ^Smallint;          { USHORT far *value }
 End;

 PT_DioWritePortByte  = Record
    port : Smallint;
    mask : Smallint;
    state : Smallint;
 End;

 PT_DioReadBit  = Record
    port  : Smallint;
    bit   : Smallint;
    state : ^Smallint;
 End;

 PT_DioWriteBit  = Record
    port  : Smallint;
    bit   : Smallint;
    state : Smallint;
 End;

 PT_DioGetCurrentDOByte  = Record
    port : Smallint;
    value: ^Smallint;    { USHORT far *state }
 End;

 PT_DioGetCurrentDOBit   = Record
    port  : Smallint;
    bit   : Smallint;
    state : ^Smallint;   { USHORT far *state }
 End;

 PT_WritePortByte  = Record
    port     : Smallint;
    ByteData : Smallint;
 End;

 PT_WritePortWord  = Record
    port     : Smallint;
    WordData : Smallint;
 End;

 {-------------- 2.0C ---------------}
 PT_WritePortDword  = Record
    port     : Smallint;
    WordData : Longint;
 End;
 {-------------- 2.0C ---------------}

 PT_ReadPortByte   = Record
    port     : Smallint;
    ByteData : ^Longint;
 End;

 PT_ReadPortWord  = Record
    port     : Smallint;
    WordData : ^Longint;
 End;

 {-------------- 2.0C ---------------}
 PT_ReadPortDword  = Record
    port     : Smallint;
    WordData : ^Longint;
 End;
 {-------------- 2.0C ---------------}

 PT_CounterEventStart  = Record
    counter  : Smallint;
    GateMode : Smallint;
 End;

 PT_CounterEventRead  = Record
    counter  : Smallint;
    overflow : ^Smallint;       { USHORT far *overflow }
    count    : ^Longint;      { ULONG far *count }
 End;

 PT_CounterFreqStart  = Record
    counter    : Smallint;
    GatePeriod : Smallint;
    GateMode   : Smallint;
 End;

 PT_CounterFreqRead  = Record
    counter : Smallint;
    freq    : ^Single;       { FLOAT far *freq }
 End;

 PT_CounterPulseStart  = Record
    counter  : Smallint;
    period   : Single;
    UpCycle  : Single;
    GateMode : Smallint;
 End;

 PT_QCounterConfig  = Record
    counter       : Smallint;
    LatchSrc      : Smallint;
    LatchOverflow : Smallint;
    ResetOnLatch  : Smallint;
    ResetValue    : Smallint;
 End;

 PT_QCounterConfigSys  = Record
    SysClock    : Smallint;
    TimeBase    : Smallint;
    TimeDivider : Smallint;
    CascadeMode : Smallint;
 End;

 PT_QCounterStart  = Record
    counter   : Smallint;
    InputMode : Smallint;
 End;

 PT_QCounterRead   = Record
    counter  : Smallint;
    overflow : ^Smallint;      { USHORT far * }
    LoCount  : ^Longint;       { ULONG far * }
    HiCount  : ^Longint;       { ULONG far * }
 End;

 PT_AlarmConfig  = Record
    chan    : Smallint;
    LoLimit : Single;
    HiLimit : Single;
 End;

 PT_AlarmEnable  = Record
    chan      : Smallint;
    LatchMode : Smallint;
    enabled   : Smallint;
 End;

 PT_AlarmCheck   = Record
    chan    : Smallint;
    LoState : ^Smallint;       { USHORT far * }
    HiState : ^Smallint;       { USHORT far * }
 End;

 PT_WDTEnable  = Record
    message     : Smallint;
    Destination : Longint;     { HWND }
 End;

 PT_FAIDmaStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    chan        : Smallint;
    gain        : Smallint;
    buffer      : Pointer;
    count       : Longint;
 End;

 PT_FAIDmaScanStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    NumChans    : Smallint;
    StartChan   : Smallint;
    GainList    : ^Smallint;
    buffer      : Pointer;
    count       : Longint;
 End;

 PT_FAIDualDmaStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    chan        : Smallint;
    gain        : Smallint;
    BufferA     : ^Smallint;
    BufferB     : ^Smallint;
    count       : Longint;
    cyclic      : Smallint;
 End;

 PT_FAIDualDmaScanStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    NumChans    : Smallint;
    StartChan   : Smallint;
    GainList    : ^Smallint;
    BufferA     : ^Smallint;
    BufferB     : ^Smallint;
    count       : Longint;
    cyclic      : Smallint;
 End;

 PT_FAITransfer = Record
    ActiveBuf   : Smallint;
    DataBuffer  : Pointer;
    DataType    : Smallint;
    start       : Longint;
    count       : Longint;
    overrun     : ^Smallint;
 End;

 PT_FAICheck = Record
    ActiveBuf  : ^Smallint;
    stopped    : ^Smallint;
    retrieved  : ^Longint;
    overrun    : ^Smallint;
    HalfReady  : ^Smallint;
 End;

 PT_FAIWatchdogConfig = Record
    TrigMode    : Smallint;
    NumChans    : Smallint;
    StartChan   : Smallint;
    GainList    : ^Smallint;
    CondList    : ^Smallint;
    LevelList   : ^TRIGLEVEL;
 End;

 PT_FAIIntWatchdogStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    buffer      : ^Smallint;
    count       : Longint;
    cyclic      : Smallint;
    IntrCount   : Smallint;
 End;

 PT_FAIDmaWatchdogStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    BufferA     : ^Smallint;
    BufferB     : ^Smallint;
    count       : Longint;
 End;

 PT_FAIWatchdogCheck = Record
    DataType   : Smallint;
    ActiveBuf  : ^Smallint;
    triggered  : ^Smallint;
    TrigChan   : ^Smallint;
    TrigIndex  : ^Longint;
    TrigData   : Pointer;
 End;

 PT_FAOIntStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    chan        : Smallint;
    buffer      : ^Longint;
    count       : Longint;
    cyclic      : Smallint;
 End;

 PT_FAODmaStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    chan        : Smallint;
    buffer      : ^Longint;
    count       : Longint;
 End;

 PT_FAODmaExStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    StartChan   : Smallint;
    NumChans    : Smallint;
    buffer      : ^Longint;
    count       : Longint; 
    CyclicMode  : Smallint;
    PacerSource : Smallint;
    Reserved    : array [0..3] of Longint;
    pReserved   : array [0..3] of Pointer;
 End;

 PT_FAOScale = Record
    chan        : Smallint;
    count       : Longint;
    VoltArray   : ^Single;
    BinArray    : ^Smallint;
 End;

 PT_FAOLoad  = Record
    ActiveBuf   : Smallint;
    DataBuffer  : ^Smallint;
    start       : Smallint;
    count       : Longint;
 End;

 PT_FAOCheck = Record
    ActiveBuf     : ^Smallint;
    stopped       : ^Smallint;
    CurrentCount  : ^Longint;
    overrun       : ^Smallint;
    HalfReady     : ^Smallint;
 End;

 PT_FAOCheckEx = Record
    ActiveBuf     : ^Smallint;
    stopped       : ^Smallint;
    Transfered    : ^Longint;
    Underrun      : ^Smallint;
    HalfReady     : ^Smallint;
 End;

 PT_EnableEvent = Record
    EventType   : Smallint;
    Enabled     : Smallint;
    Count       : Smallint;
 End;

PT_CheckEvent = Record
    EventType    : ^Smallint;
    Milliseconds : LongInt;
End;

 PT_AllocateDMABuffer = Record
    CyclicMode      : Smallint;
    RequestBufSize  : Longint;
    ActualBufSize   : ^Longint;
    buffer          : ^Longint;
 End;

PT_TimerCountSetting = Record
    counter         : Smallint;
    Count           : LongInt;
End;

{  **********  PCI-1760 ***************  }
PT_DIFilter = Record
    EventType       : Smallint;
    EventEnabled    : Smallint;
    Count           : Smallint;
    EnableMask      : Smallint;    { Filter enable data }
    HiValue         : ^Smallint;   { USHORT far* HiValue , Filter value array pointer }
    LowValue        : ^Smallint;
End;

PT_DIPattern = Record
    EventType       : Smallint;
    EventEnabled    : Smallint;
    Count           : Smallint;
    EnableMask      : Smallint;     { Pattern Match enable data }
    PatternValue    : Smallint;     { Pattern Match pre_setting value }
End;

PT_DICounter = Record
    EventType       : Smallint;
    EventEnabled    : Smallint;
    Count           : Smallint;
    EnableMask      : Smallint;    { Counter enable data }
    TrigEdge        : Smallint;    { Counter Trigger edge 0: Rising edge 1: Falling edge }
    PresetValue     : ^Smallint;   { USHORT far *usPreset ; // counter pre_setting value }
    MatchEnableMask : Smallint;    { Counter match enable data }
    MatchValue      : ^Smallint;   { USHORT far *usValue }
    OverflowEnableMask : Smallint; { Counter overflow data }
    Direction       : Smallint;    { Up/Down counter direction }
End;

PT_DIStatus = Record
    EventType       : Smallint;
    EventEnabled    : Smallint;
    Count           : Smallint;
    EnableMask      : Smallint;    { Status change enable data }
    RisingEdge      : Smallint;    { Record Rising edge trigger type }
    FallingEdge     : Smallint;    { Record Falling edge trigger type }
End;

PT_EnableEventEx = Record
    Case Integer of
        0 : (Filter  : PT_DIFilter);
        1 : (Pattern : PT_DIPattern);
        2 : (Counter : PT_DICounter);
        3 : (Status  : PT_DIStatus);
End;

PT_FDITransfer = Record
    EventType       : Smallint;
    RetData         : ^Smallint;
End;

PT_CounterPWMSetting = Record
   Port             : Smallint;		{ Counter port }
   Period           : Single;			{ Period unit -> 0.1ms }
   HiPeriod         : Single;       { UpCycle period unit -> 0.1 ms }
   OutCount         : Longint;      { Stop count }
   GateMode         : Smallint;
End;

PT_AOCurrentOut = Record
    Chan            : Smallint;
    OutputValue     : Single;
End;

PT_ADAMCounterSetHWConfig = Record
	CounterMode		:Smallint;
	DataFormat		:Smallint;	{ Only for adam5080 }
	GateTime		:Smallint;	{ Only for adam4080,4080D }
End;

PT_ADAMCounterGetHWConfig = Record
	CounterMode		:^Smallint;
	DataFormat		:^Smallint;  { Only for adam5080 }
	GateTime		:^Smallint;	{ Only for adam4080,4080D }
End;

PT_ADAMAISetHWConfig = Record
	InputRange		:Smallint;
	DataFormat		:Smallint;
	IntegrationTime :Smallint;
End;

PT_ADAMAIGetHWConfig = Record
	InputRange		:^Smallint;
	DataFormat		:^Smallint;
	IntegrationTime :^Smallint;
End;

PT_ADAMAOSetHWConfig = Record
	Chan			:Smallint;
	OutputRange		:Smallint;
	DataFormat		:Smallint;
	SlewRate		:Smallint;
End;

PT_ADAMAOGetHWConfig = Record
	Chan			:Smallint;
	OutputRange		:^Smallint;
	DataFormat		:^Smallint;
	SlewRate		:^Smallint;
End;

PT_PWMStartRead = Record
    usChan			:Smallint;
    flHiperiod    		:^Single;       { FLOAT far *flHiperiod }
    flLowperiod    		:^Single;       { FLOAT far * flLowperiod}
End;

 PT_FAOWaveFormStart = Record
    TrigSrc     	: Smallint;
    SampleRate  	: Longint;
    WaveCount   	: Longint;
    count       	: Longint;        
    
    Buffer   		: ^Longint;
    EnabledChannel	: Longint;        
 End;
 
{------------------- V2.0b ------------------------}
 PT_CounterConfig = Record
   usCounter          : Smallint;
   usInitValue        : Smallint;
   usCountMode        : Smallint; 
   usCountDirect      : Smallint;
   usCountEdge        : Smallint;
   usOutputEnable     : Smallint;
   usOutputMode       : Smallint;
   usClkSrc           : Smallint;
   usGateSrc          : Smallint;
   usGatePolarity     : Smallint;
End;

PT_FreqOutStart = Record
   usChannel    :Smallint;
   usDivider    :Smallint;
   usFoutSrc    :Smallint;
End;
{------------------- V2.0b ------------------------}

{------------------- V2.0c ------------------------}
PT_DeviceSetParam = Record       {PCI-1755}
  nID :Smallint;         {IN, Paramarter name ID}
  Length :Longint;       {IN: buffer length}
  pData  :Longint;       {IN, buffer for trandsferring in.}
End;

PT_DeviceGetParam = Record       {PCI-1755}
  nID :Smallint;         {IN, Paramarter name ID}
  Length :^Longint;       {IN: buffer length, out data length required.}
  pData : ^Longint;      {OUT, data return buffer.}
End;
{------------------- V2.0c ------------------------}
{------------------- V2.2 ------------------------}
PT_WatchdogStart = Record    {PCI-1758}
  Reserved0 : Longint;        
  Reserved1 : Longint;      
End;
{------------------- V2.2 ------------------------}

{------------------- V2.2C ------------------------}
PT_DioReadPortWord  = Record
    port : Smallint;
    value: ^Smallint;          { USHORT far *value }
    ValidChannelMask: ^Smallint;  {xi'an added}
End;

PT_DioWritePortWord  = Record
    port : Smallint;
    mask : Smallint;
    state : Smallint;
End;

PT_DioReadPortDword  = Record
    port : Smallint;
    value: ^Longint;          { ULONG far *value }
    ValidChannelMask: ^Longint;  {xi'an added}
End;

PT_DioWritePortDword  = Record
    port : Smallint;
    mask : Longint;
    state : Longint;
End;

PT_DioGetCurrentDOWord  = Record
    port : Smallint;
    value: ^Smallint;    { USHORT far *state }
    ValidChannelMask: ^Smallint;  {xi'an added}
End;

PT_DioGetCurrentDODword  = Record
    port : Smallint;
    value: ^Longint;    { ULong far *state }
    ValidChannelMask: ^Longint;  {xi'an added}
End;
{------------------- V2.2C ------------------------}

{ For 32-bit Data Structure ***********************}
 PT_AIBinaryIn  = Record
    chan     : Smallint;
    TrigMode : Smallint;
    reading  : Pointer;      { PVOID reading }
    typeID   : Smallint;
 End;

 PT_MAIBinaryIn  = Record
    NumChan      : Smallint;
    StartChan    : Smallint;
    TrigMode     : Smallint;
    ReadingArray : Pointer;  { PVOID Reading }
    typeID       : Smallint;
 End; 

 PT_FAIIntStart = Record
    TrigSrc    : Smallint;
    SampleRate : Longint;
    chan       : Smallint;
    gain       : Smallint;
    buffer     : Pointer;    { PVOID buffer }
    count      : Longint;
    cyclic     : Smallint;
    IntrCount  : Smallint;
    typeID     : Smallint;
 End;

PT_FAIDmaExStart = Record
    TrigSrc     : Smallint;
    TrigMode	: Smallint;
    ClockSrc	: Smallint;
    TrigEdge	: Smallint;
    SRCType	: Smallint;
    TrigVol	: Single;
    CyclicMode	: Smallint;
    NumChans	: Smallint;
    StartChan	: Smallint;
    ulDelayCnt	: Longint;
    count	: Longint;
    SampleRate  : Longint;
    GainList    : ^Smallint;
    CondList    : ^Smallint;
    LevelList   : ^TRIGLEVEL;
    buffer0     : Pointer;  { PVOID buffer0 }
    buffer1     : Pointer;  { PVOID buffer1 }
    pPt1	: ^Smallint;
    pPt2	: ^Smallint;
    pPt3	: ^Smallint;
    typeID      : Smallint;
End;

 PT_FAIIntScanStart = Record
    TrigSrc     : Smallint;
    SampleRate  : Longint;
    NumChans    : Smallint;
    StartChan   : Smallint;
    GainList    : ^Smallint;
    buffer      : Pointer;   { PVOID buffer }
    count       : Longint;
    cyclic      : Smallint;
    IntrCount   : Smallint;
    typeID      : Smallint;
 End;


 
{ ************************************************************************ }
{    Function Declaration for ADSAPI32                                      }
{ ************************************************************************ }

Function DRV_DeviceGetNumOfList(Var NumOfDevices : Smallint) : Longint; stdcall;
Function DRV_DeviceGetList(Var DeviceList : PT_DEVLIST;
             MaxEntries : Smallint; Var OutEntries : Smallint) : Longint; stdcall;
Function DRV_DeviceGetSubList(DeviceNum : Longint;
             Var SubDevList : PT_DEVLIST; MaxEntries : Smallint;
             Var OutEntries : Smallint) : Longint; stdcall;
Function DRV_SelectDevice( hCaller : HWND; wGetModule : Boolean;
             Var lDeviceNum : Longint;  szDescription : Pchar) : Longint; stdcall;
Function DRV_DeviceOpen(DeviceNum : Longint;
             Var DriverHandle : Longint) : Longint; stdcall;
Function DRV_DeviceClose(Var DriverHandle : Longint) : Longint; stdcall;
Function DRV_DeviceGetFeatures(DriverHandle : Longint;
              Var lpDeviceGetFeatures : PT_DeviceGetFeatures) : Longint; stdcall;
{------------------- V2.0C --------------------}
Function DRV_DeviceSetProperty(DriverHandle : Longint; nID : Smallint;
                       pBuffer : Pointer; dwLength : Longint ) : Longint; stdcall;
Function DRV_DeviceGetProperty(DriverHandle : Longint; nID : Smallint;
                       pBuffer : Pointer; Var pLength : Longint) : Longint; stdcall;
{------------------- V2.0C --------------------}
Function DRV_BoardTypeMapBoardName(BoardID : Longint; ExpName : Pointer) : Longint; stdcall;
Procedure DRV_GetErrorMessage(lError : Longint; lpszErrMsg : Pointer); stdcall;
Function DRV_AIConfig(DriverHandle : Longint;
             Var lpAIConfig : PT_AIConfig) : Longint; stdcall;
Function DRV_AIGetConfig(DriverHandle : Longint;
             Var lpAIGetConfig : PT_AIGetConfig) : Longint; stdcall;
{//support 32-bit data structure}
Function DRV_AIBinaryIn(DriverHandle : Longint;
             Var lpAIBinaryIn : PT_AIBinaryIn) : Longint; stdcall;
Function DRV_AIScale(DriverHandle : Longint;
             Var lpAIScale : PT_AIScale) : Longint; stdcall;
Function DRV_AIVoltageIn(DriverHandle : Longint;
             Var lpAIVoltageIn : PT_AIVoltageIn) : Longint; stdcall;
Function DRV_AIVoltageInExp(DriverHandle : Longint;
             Var lpAIVoltageInExp : PT_AIVoltageInExp) : Longint; stdcall;
Function DRV_MAIConfig(DriverHandle : Longint;
             Var lpMAIConfig : PT_MAIConfig) : Longint; stdcall;
{//support 32-bit data structure}
Function DRV_MAIBinaryIn(DriverHandle : Longint;
             Var lpMAIBinaryIn : PT_MAIBinaryIn) : Longint; stdcall;
Function DRV_MAIVoltageIn(DriverHandle : Longint;
             Var lpMAIVoltageIn : PT_MAIVoltageIn) : Longint; stdcall;
Function DRV_MAIVoltageInExp(DriverHandle : Longint;
             Var lpMAIVoltageInExp : PT_MAIVoltageInExp) : Longint; stdcall;
Function DRV_TCMuxRead(DriverHandle : Longint;
             Var lpTCMuxRead : PT_TCMuxRead) : Longint; stdcall;
Function DRV_AOConfig(DriverHandle : Longint;
             Var lpAOConfig : PT_AOConfig) : Longint; stdcall;
Function DRV_AOBinaryOut(DriverHandle : Longint;
             Var lpAOBinaryOut : PT_AOBinaryOut) : Longint; stdcall;
Function DRV_AOVoltageOut(DriverHandle : Longint;
             Var lpAOVoltageOut : PT_AOVoltageOut) : Longint; stdcall;
Function DRV_AOScale(DriverHandle : Longint;
             Var lpAOScale : PT_AOScale) : Longint; stdcall;
Function DRV_DioSetPortMode(DriverHandle : Longint;
             Var lpDioSetPortMode : PT_DioSetPortMode) : Longint; stdcall;
Function DRV_DioGetConfig(DriverHandle : Longint;
             Var lpDioGetConfig : PT_DioGetConfig) : Longint; stdcall;
Function DRV_DioReadPortByte(DriverHandle : Longint;
             Var lpDioReadPortByte : PT_DioReadPortByte) : Longint; stdcall;
Function DRV_DioWritePortByte(DriverHandle : Longint;
             Var lpDioWritePortByte : PT_DioWritePortByte) : Longint; stdcall;
Function DRV_DioReadBit(DriverHandle : Longint;
             Var lpDioReadBit : PT_DioReadBit) : Longint; stdcall;
Function DRV_DioWriteBit(DriverHandle : Longint;
             Var lpDioWriteBit : PT_DioWriteBit) : Longint; stdcall;
Function DRV_DioGetCurrentDOByte(DriverHandle : Longint;
             Var lpDioGetCurrentDOByte : PT_DioGetCurrentDOByte) : Longint; stdcall;
Function DRV_DioGetCurrentDOBit(DriverHandle : Longint;
             Var lpDioGetCurrentDOBit : PT_DioGetCurrentDOBit) : Longint; stdcall;
Function DRV_WritePortByte(DriverHandle : Longint;
             Var lpWritePortByte : PT_WritePortByte) : Longint; stdcall;
Function DRV_WritePortWord(DriverHandle : Longint;
             Var lpWritePortWord : PT_WritePortWord) : Longint; stdcall;
{------------------- V2.0c ------------------------}
Function DRV_WritePortDword(DriverHandle : Longint;
             Var lpWritePortDword : PT_WritePortDword) : Longint; stdcall;
{------------------- V2.0c ------------------------}
Function DRV_ReadPortByte(DriverHandle : Longint;
             Var lpReadPortByte : PT_ReadPortByte) : Longint; stdcall;
Function DRV_ReadPortWord(DriverHandle : Longint;
             Var lpReadPortWord : PT_ReadPortWord) : Longint; stdcall;
{------------------- V2.0c ------------------------}
Function DRV_ReadPortDword(DriverHandle : Longint;
             Var lpReadPortDword : PT_ReadPortDword) : Longint; stdcall;
{------------------- V2.0c ------------------------}
Function DRV_CounterEventStart(DriverHandle : Longint;
             Var lpCounterEventStart : PT_CounterEventStart) : Longint; stdcall;
Function DRV_CounterEventRead(DriverHandle : Longint;
             Var lpCounterEventRead : PT_CounterEventRead) : Longint; stdcall;
Function DRV_CounterFreqStart(DriverHandle : Longint;
             Var lpCounterFreqStart : PT_CounterFreqStart) : Longint; stdcall;
Function DRV_CounterFreqRead(DriverHandle : Longint;
             Var lpCounterFreqRead : PT_CounterFreqRead) : Longint; stdcall;
Function DRV_CounterPulseStart(DriverHandle : Longint;
             Var lpCounterPulseStart : PT_CounterPulseStart) : Longint; stdcall;
Function DRV_CounterReset(DriverHandle : Longint;
             counter : Smallint) : Longint; stdcall;
Function DRV_QCounterConfig(DriverHandle : Longint;
             Var lpQCounterConfig : PT_QCounterConfig) : Longint; stdcall;
Function DRV_QCounterConfigSys(DriverHandle : Longint;
             Var lpQCounterConfigSys : PT_QCounterConfigSys) : Longint; stdcall;
Function DRV_QCounterStart(DriverHandle : Longint;
             Var lpQCounterStart : PT_QCounterStart) : Longint; stdcall;
Function DRV_QCounterRead(DriverHandle : Longint;
             Var lpQCounterRead : PT_QCounterRead) : Longint; stdcall;
Function DRV_AlarmConfig(DriverHandle : Longint;
             Var lpAlarmConfig : PT_AlarmConfig) : Longint; stdcall;
Function DRV_AlarmEnable(DriverHandle : Longint;
             Var lpAlarmEnable : PT_AlarmEnable) : Longint; stdcall;
Function DRV_AlarmCheck(DriverHandle : Longint;
             Var lpAlarmCheck : PT_AlarmCheck) : Longint; stdcall;
Function DRV_AlarmReset(DriverHandle : Longint;
             Var chan : Smallint) : Longint; stdcall;
Function DRV_WDTEnable(DriverHandle : Longint;
             Var lpWDTEnable : PT_WDTEnable) : Longint; stdcall;
Function DRV_WDTRefresh(DriverHandle : Longint) : Longint; stdcall;
Function DRV_WDTReset(DriverHandle : Longint) : Longint; stdcall;
Function DRV_TimerCountSetting(DriverHandle : Longint;
	     Var lpTimerCountSetting : PT_TimerCountSetting) : Longint; stdcall;
Function DRV_CounterPWMSetting(DriverHandle: Longint;
				var lpCounterPWMSetting: PT_CounterPWMSetting) : Longint; stdcall;
Function DRV_DICounterReset(DriverHandle: Longint; counter: Smallint) : Longint; stdcall;
Function DRV_CounterPWMEnable(DriverHandle: Longint; Port: Smallint) : Longint; stdcall;
Function DRV_EnableSyncAO(DriverHandle: Longint; Enableas: Smallint) : Longint; stdcall;
Function DRV_WriteSyncAO(DriverHandle: Longint) : Longint; stdcall;
Function DRV_AOCurrentOut(DriverHandle: Longint; var lpAOCurrentOut: PT_AOCurrentOut) : Longint; stdcall;
Procedure DRV_DeviceNumToDeviceName(DeviceNum: Longint; DeviceName: Pointer); stdcall;
Function DRV_GetFIFOSize(DriverHandle: Longint; var lSize: Longint) : Longint; stdcall;
Function DRV_PWMStartRead(DriverHandle: Longint; var lpPWMStartRead : PT_PWMStartRead): Longint; stdcall;

{ ADAM Configuration Function Declaration }
Function DRV_ADAMCounterSetHWConfig (DriverHandle: Longint; var lpADAMCounterSetHWConfig: PT_ADAMCounterSetHWConfig) : Longint; stdcall;
Function DRV_ADAMCounterGetHWConfig (DriverHandle: Longint; var lpADAMCounterGetHWConfig: PT_ADAMCounterGetHWConfig) : Longint; stdcall;
Function DRV_ADAMAISetHWConfig (DriverHandle: Longint; var lpADAMAISetHWConfig: PT_ADAMAISetHWConfig) : Longint; stdcall;
Function DRV_ADAMAIGetHWConfig (DriverHandle: Longint; var lpADAMAIGetHWConfig: PT_ADAMAIGetHWConfig) : Longint; stdcall;
Function DRV_ADAMAOSetHWConfig (DriverHandle: Longint; var lpADAMAOSetHWConfig: PT_ADAMAOSetHWConfig) : Longint; stdcall;
Function DRV_ADAMAOGetHWConfig (DriverHandle: Longint; var lpADAMAOGetHWConfig: PT_ADAMAOGetHWConfig) : Longint; stdcall;


{ Direct I/O Functions List }
Function DRV_outp(DeviceNum : Longint; port : Word; ByteData : Word) : Longint; stdcall;
Function DRV_outpw(DeviceNum : Longint; port : Word; ByteData : Word) : Longint; stdcall;
Function DRV_inp(DeviceNum : Longint; port : Word; var ByteData : Word) : Longint; stdcall;
Function DRV_inpw(DeviceNum : Longint; port : Word; var ByteData : Word) : Longint; stdcall;
{ --------------------- V2.2 ---------------------------- }
Function DRV_outpdw(DeviceNum : Longint; port : Word; DwordData : Longint) : Longint; stdcall;
Function DRV_inpdw(DeviceNum : Longint; port : Word; var DwordData : Longint) : Longint; stdcall;
{ --------------------- V2.2 ---------------------------- }

{ High speed function declaration }
Function DRV_FAIWatchdogConfig(DriverHandle : Longint;
                      Var lpFAIWatchdogConfig : PT_FAIWatchdogConfig) : Longint ; stdcall;
{//support 32-bit data structure}
Function DRV_FAIIntStart(DriverHandle : Longint;
                      Var lpFAIIntStart : PT_FAIIntStart) : Longint ; stdcall;
{//support 32-bit data structure}
Function DRV_FAIIntScanStart(DriverHandle : Longint;
                      Var lpFAIIntScanStart : PT_FAIIntScanStart) : Longint ; stdcall;
Function DRV_FAIDmaStart(DriverHandle : Longint;
                      Var lpFAIDmaStart : PT_FAIDmaStart) : Longint ; stdcall;
Function DRV_FAIDmaScanStart(DriverHandle : Longint;
                      Var lpFAIDmaScanStart : PT_FAIDmaScanStart) : Longint ; stdcall;
Function DRV_FAIDualDmaStart(DriverHandle : Longint;
                      Var lpFAIDualDmaStart : PT_FAIDualDmaStart) : Longint ; stdcall;
Function DRV_FAIDualDmaScanStart(DriverHandle : Longint;
                      Var lpFAIDualDmaScanStart : PT_FAIDualDmaScanStart) : Longint ; stdcall;
Function DRV_FAIIntWatchdogStart(DriverHandle : Longint;
                      Var lpFAIIntWatchdogStart : PT_FAIIntWatchdogStart) : Longint ; stdcall;
Function DRV_FAIDmaWatchdogStart(DriverHandle : Longint;
                      Var lpFAIDmaWatchdogStart : PT_FAIDmaWatchdogStart) : Longint ; stdcall;
Function DRV_FAICheck(DriverHandle : Longint;
                      Var lpFAICheck : PT_FAICheck) : Longint ; stdcall;
Function DRV_FAIWatchdogCheck(DriverHandle : Longint;
                      Var lpFAIWatchdogCheck : PT_FAIWatchdogCheck) : Longint ; stdcall;
Function DRV_FAITransfer(DriverHandle : Longint;
                      Var lpFAITransfer : PT_FAITransfer) : Longint ; stdcall;
Function DRV_FAIStop(DriverHandle : Longint) : Longint ; stdcall;
Function DRV_FAOIntStart(DriverHandle : Longint;
                      Var lpFAOIntStart : PT_FAOIntStart) : Longint ; stdcall;
Function DRV_FAODmaStart(DriverHandle : Longint;
                      Var lpFAODmaStart : PT_FAODmaStart) : Longint ; stdcall;
Function DRV_FAODmaExStart(DriverHandle : Longint;
                      Var lpFAODmaExStart : PT_FAODmaExStart) : Longint ; stdcall;
Function DRV_FAOScale(DriverHandle : Longint;
                      Var lpFAOScale : PT_FAOScale) : Longint ; stdcall;
Function DRV_FAOLoad(DriverHandle : Longint;
                      Var lpFAOLoad : PT_FAOLoad) : Longint ; stdcall;
Function DRV_FAOCheck(DriverHandle : Longint;
                      Var lpFAOCheck : PT_FAOCheck) : Longint ; stdcall;
Function DRV_FAOCheckEx(DriverHandle : Longint;
                      Var lpFAOCheckEx : PT_FAOCheckEx) : Longint ; stdcall;
Function DRV_FAOStop(DriverHandle : Longint) : Longint ; stdcall;
Function DRV_ClearOverrun(DriverHandle : Longint) : Longint ; stdcall;
Function DRV_EnableEvent(DriverHandle : Longint;
                      Var lpEnableEvent : PT_EnableEvent) : Longint ; stdcall;
Function DRV_CheckEvent(DriverHandle : Longint;
                      Var lpCheckEvent : PT_CheckEvent) : Longint ; stdcall;
Function DRV_AllocateDMABuffer(DriverHandle : Longint;
                      Var lpAllocateDMABuffer : PT_AllocateDMABuffer) : Longint ; stdcall;
Function DRV_FreeDMABuffer( DriverHandle : longint;
                      buffer : Pointer) : Longint; stdcall;
Function DRV_EnableEventEx( DriverHandle : Longint;
		      lpEnableEventEx: Pointer) : Longint; stdcall;
Function DRV_FDITransfer( DriverHandle: Longint;
		      var lpFDITransfer: PT_FDITransfer ): Longint; stdcall;
{//support 32-bit data structure}
Function DRV_FAIDmaExStart(DriverHandle : Longint;
                      Var lpFAIDmaExStart : PT_FAIDmaExStart) : Longint ; stdcall;
Function DRV_FAOWaveFormStart(DriverHandle : Longint;
                      Var lpFAOWaveFormStart : PT_FAOWaveFormStart) : Longint ; stdcall;

{ ---------------------------- V2.0B ------------------------- }
Function DRV_CounterConfig( DriverHandle : Longint;
                            var lpCounterConfig : PT_CounterConfig ) : Longint; stdcall;
                            
Function DRV_FreqOutStart( DriverHandle : Longint;
                           var lpFreqOutStart : PT_FreqOutStart ) : Longint; stdcall;
                           
Function DRV_FreqOutReset( DriverHandle : Longint;
                           channel : Longint) : Longint; stdcall;
                           
Function DRV_DeviceGetParam( DriverHandle : Longint;      
                             Var lpDeviceGetParam : PT_DeviceGetParam  ) : Longint; stdcall;
{ ---------------------------- V2.0B ------------------------- }

{ --------------------- V2.0c ---------------------------- }
Function DRV_FDIStart(  DriverHandle : Longint;
			wCyclic : Smallint; 
			dwCount : Longint; 
			pBuf : Pointer ) : Longint; stdcall;
Function DRV_FDICheck( DriverHandle : Longint;
		       pdwStatus : Pointer;
		       pdwRetrieved : Pointer ) : Longint; stdcall;
Function DRV_FDIStop(  DriverHandle : Longint ) : Longint; stdcall;
Function DRV_ClearFlag( DriverHandle : Longint;
                        dwEventType : Longint) : Longint; stdcall;
Function DRV_FDOStart(  DriverHandle : Longint;
                        wCyclic : Smallint;
                        dwCount : Longint;
                        pBuf : Pointer ) : Longint; stdcall;
Function DRV_FDOCheck(  DriverHandle : Longint;
                        pdwStatus : Pointer;
                        pdwRetrieved : Pointer ) : Longint; stdcall;
Function DRV_FDOStop(  DriverHandle : Longint ) : Longint; stdcall;
{ --------------------- V2.0c ---------------------------- }
{ --------------------- V2.2 ---------------------------- }
Function DRV_WatchdogStart(  DriverHandle : Longint ;
			     Var lpWatchdogStart : PT_WatchdogStart) : Longint; stdcall;
Function DRV_WatchdogFeed(  DriverHandle : Longint ) : Longint; stdcall;
Function DRV_WatchdogStop(  DriverHandle : Longint ) : Longint; stdcall;

{ --------------------- V2.2 ---------------------------- }

{ --------------------- V2.2C ---------------------------- }
Function DRV_DioReadPortWord(DriverHandle : Longint;
             Var lpDioReadPortWord : PT_DioReadPortWord) : Longint; stdcall;
Function DRV_DioWritePortWord(DriverHandle : Longint;
             Var lpDioWritePortWord : PT_DioWritePortWord) : Longint; stdcall;
Function DRV_DioReadPortDword(DriverHandle : Longint;
             Var lpDioReadPortDword : PT_DioReadPortDword) : Longint; stdcall;
Function DRV_DioWritePortDword(DriverHandle : Longint;
             Var lpDioWritePortDword : PT_DioWritePortDword) : Longint; stdcall;
Function DRV_DioGetCurrentDOWord(DriverHandle : Longint;
             Var lpDioGetCurrentDOWord : PT_DioGetCurrentDOWord) : Longint; stdcall;
Function DRV_DioGetCurrentDODword(DriverHandle : Longint;
             Var lpDioGetCurrentDODword : PT_DioGetCurrentDODword) : Longint; stdcall;
Function DRV_FAITerminate(DriverHandle : Longint) : Longint ; stdcall;
Function DRV_FAOTerminate(DriverHandle : Longint) : Longint ; stdcall;
{ --------------------- V2.2C ---------------------------- }

{=======================================================================================}
{ Description:								  		}
{      Enable a specific DI event, and also specify a range of DI ports   		}
{      that will be scanned (read) when the specified event occurs.	  		}
{      									  		}
{ Parameters:								  		}
{ DriverHandle[in]:  Driver handle					  		}
{ dwEventID[in]:     which DIO Event to enable. It can be one of    	  		}
{                    ADS_EVT_DI_INTERRUPT0~184, 			  		}
{                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,			  		}
{                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.			  		}
{ dwScanStart[in]:   start port which will be scaned when the specified event occurs.	}
{                    this value must not exceed the max DI port the board supported. 	}
{ dwScanCount[in]:   port count to be scaned when the specified event occurs. The    	}
{                    sum of this parameter plus the dwScanStart must not be bigger than }
{                    the max DI port the board supported.				}
{                    									}
{---------------------------------------------------------------------------------------}
Function AdxDioEnableEventAndSpecifyDiPorts( DriverHandle : Longint;
             dwEventID : Longint; 
             dwScanStart : Longint;
             dwScanCount : Longint ) : Longint; stdcall;
             
             
{=================================================================================}
{ Description:                                                                    }
{      Disable a specific enabled DI event. DI event can be enabled by            }
{      the function AdcDioEventEnableAndSpecifyDiPorts.                           }
{      When the DI event is disabled, the related DI ports will also be released  }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]:  Driver handle                                                }
{ dwEventID[in]:     which DI Interrupt Event to enable. It can be one of         }
{                    ADS_EVT_DI_INTERRUPT0 ~184,                                  }
{                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,                            }
{                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.                            }
{---------------------------------------------------------------------------------}
Function AdxDioDisableEvent( DriverHandle : Longint;
             dwEventID : Longint ) : Longint; stdcall;


{=================================================================================}
{ Description:                                                                    }
{      Retrieve the stored input data of the specified DI event{s most            }
{      recent occurrence. The event is enabled and the input range is defined     }
{      by AdcDioEnableEventAndSpecifyDiPorts.                                     }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]:  Driver handle                                                }
{ dwEventID[in]:     DI Event ID which DI data will be retrieved. It can be one of}   
{                    ADS_EVT_DI_INTERRUPT0 ~184,                                  }
{                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,                            }
{                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.                            }
{ pBuffer[out]:      pointer to the user buffer to receive the DI data.           }
{ dwLength[in]:      length of the user buffer. IF the length is not enough to    }
{                    store all the DI ports data, only the {dwLength{ number will }
{                    be stored.                                                   }
{                                                                                 }
{---------------------------------------------------------------------------------}
Function AdxDioGetLatestEventDiPortsState( DriverHandle : Longint;
             dwEventID : Longint; 
             Var pBuffer   : Byte;
             dwLength  : Longint ) : Longint; stdcall;
             
             
{=================================================================================}
{ Descriptions:                                                                   }
{                                                                                 }
{    read DI ports.                                                               }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]:  Driver handle                                                }
{ dwPortStart[in]:   start port to read.                                          }
{ dwPortCount[in]:   port count to read.                                          }
{ pBuffer[out]:      pointer to user buffer. The buffer must be big enough        }
{                    to store all DI data retrieved. The buffer size is equal     }
{                    the number of dwPortCount in byte.                           }
{---------------------------------------------------------------------------------}
Function AdxDioReadDiPorts( DriverHandle : Longint;
             dwPortStart : Longint; 
             dwPortCount : Longint;
             Var pBuffer   : Byte ) : Longint; stdcall;
             
             
{=================================================================================}
{ Description:                                                                    }
{                                                                                 }
{    Write DO ports.                                                              }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]: Driver handle                                                 }
{ dwPortStart[in]:  start port to write.                                          }
{ dwPortCount[in]:  port count to write.                                          }
{ pBuffer[out]:     pointer to DO data buffer to output.                          }
{---------------------------------------------------------------------------------}
Function AdxDioWriteDoPorts( DriverHandle : Longint;
             dwPortStart : Longint; 
             dwPortCount : Longint;
             Var pBuffer   : Byte ) : Longint; stdcall;


{=================================================================================}
{ Description:                                                                    }
{                                                                                 }
{    Get current state of DO ports                                                }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]: Driver handle                                                 }
{ dwPortStart[in]:  start port to get.                                            }
{ dwPortCount[in]:  port count to get.                                            }
{ pBuffer[out]:     pointer to user buffer. The buffer must be big enough         }
{                   to store all DO data retrieved. The buffer size is equal      }
{                   the number of dwPortCount in byte.                            }
{---------------------------------------------------------------------------------}
Function AdxDioGetCurrentDoPortsState( DriverHandle : Longint;
             dwPortStart : Longint; 
             dwPortCount : Longint;
             Var pBuffer   : Byte  ) : Longint; stdcall;
             
             
{================================================================================}
{ Description:                                                                   }
{                                                                                }
{    Call dll driver{s configuration dialog box to configure the board.          }
{                                                                                }
{ Parameters:                                                                    }
{ DeviceNum[in]:  device number or fix number                                    }
{ BoardID[in]:    board ID. It{s a software defined board id,                    }
{                 for example: BD_PCI1753, BD_MIC3753...                         }
{                                                                                }
{ hCaller[in]:    parent window handle                                           }
{                                                                                }
{--------------------------------------------------------------------------------}
Function AdxDeviceConfig( DeviceNum : Longint;
             BoardID : Longint; 
             hCaller : Longint ) : Longint; stdcall;

{=======================================================================================}
{ Description:								  		}
{      Enable a specific DI event, and also specify a range of counter   		}
{      that will be scanned (read) when the specified event occurs.	  		}
{      									  		}
{ Parameters:								  		}
{ DriverHandle[in]:  Driver handle					  		}
{ dwEventID[in]:     which DIO Event to enable. It can be one of    	  		}
{                    ADS_EVT_DI_INTERRUPT0~184, 			  		}
{ dwScanStart[in]:   start port which will be scaned when the specified event occurs.	}
{                    this value must not exceed the max DI port the board supported. 	}
{ dwScanCount[in]:   port count to be scaned when the specified event occurs. The    	}
{                    sum of this parameter plus the dwScanStart must not be bigger than }
{                    the max DI port the board supported.				}
{                    									}
{---------------------------------------------------------------------------------------}
Function AdxDioEnableEventAndSpecifyEventCounter( DriverHandle : Longint;
             dwEventID : Longint; 
             dwScanStart : Longint;
             dwScanCount : Longint ) : Longint; stdcall;
             
{=======================================================================================}
{ Description:								  		}
{      Enable a specific counter event, and also specify a range of counter   		}
{      that will be scanned (read) when the specified event occurs.	  		}
{      									  		}
{ Parameters:								  		}
{ DriverHandle[in]:  Driver handle					  		}
{ dwEventID[in]:     which counter Event to enable. It can be one of    	  		}
{                    ...., 			  		}
{ dwScanStart[in]:   start port which will be scaned when the specified event occurs.	}
{                    this value must not exceed the max DI port the board supported. 	}
{ dwScanCount[in]:   port count to be scaned when the specified event occurs. The    	}
{                    sum of this parameter plus the dwScanStart must not be bigger than }
{                    the max DI port the board supported.				}
{                    									}
{---------------------------------------------------------------------------------------}
Function AdxCntrEnableEventAndSpecifyEventCounter( DriverHandle : Longint;
             dwEventID : Longint;
             dwScanStart : Longint;
             dwScanCount : Longint ) : Longint; stdcall;
{=================================================================================}
{ Description:                                                                    }
{      Disable a specific enabled counter event. DI event can be enabled by            }
{      the function AdcDioEventEnableAndSpecifyDiPorts.                           }
{      When the DI event is disabled, the related DI ports will also be released  }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]:  Driver handle                                                }
{ dwEventID[in]:     which counter Interrupt Event to enable. It can be one of         }
{                    ADS_EVT_DI_INTERRUPT0 ~184,                                  }
{                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,                            }
{                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.                            }
{---------------------------------------------------------------------------------}
Function AdxCntrDisableEvent( DriverHandle : Longint;
             dwEventID : Longint ) : Longint; stdcall;


{=================================================================================}
{ Description:                                                                    }
{      Retrieve the stored input data of the specified DI event{s most            }
{      recent occurrence. The event is enabled and the input range is defined     }
{      by AdcDioEnableEventAndSpecifyDiPorts.                                     }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]:  Driver handle                                                }
{ dwEventID[in]:     DI Event ID which DI data will be retrieved. It can be one of}   
{                    ADS_EVT_DI_INTERRUPT0 ~184,                                  }
{                    ADS_EVT_DI_PATTERNMATCH_PORT0~31,                            }
{                    ADS_EVT_DI_STATUSCHANGE_PORT0~31.                            }
{ pBuffer[out]:      pointer to the user buffer to receive the DI data.           }
{ dwLength[in]:      length of the user buffer. IF the length is not enough to    }
{                    store all the DI ports data, only the {dwLength{ number will }
{                    be stored.                                                   }
{                                                                                 }
{---------------------------------------------------------------------------------}
Function AdxCntrGetLatestEventCounterValue( DriverHandle : Longint;
             dwEventID : Longint; 
             Var pBuffer   : Longint;
             dwLength  : Longint ) : Longint; stdcall;

{=================================================================================}
{ Description:                                                                    }
{                                                                                 }
{ Read user customer data from flash or EEPROM                                    }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]: Driver handle                                                 }
{ StartAddress[in]: start address (0 - 31)                                        }
{ DataCount[in]: data read count                                                  }
{ pBuffer[out]: user data read                                                    }
Function AdxPrivateHWRegionRead( DriverHandle : Longint;
             StartAddress : Longint;
             DataCount:     Longint;
             Var pBuffer:   Byte ) : Longint; stdcall;
{---------------------------------------------------------------------------------}
{=================================================================================}
{ Description:                                                                    }
{                                                                                 }
{ Write user customer data from flash or EEPROM                                    }
{                                                                                 }
{ Parameters:                                                                     }
{ DriverHandle[in]: Driver handle                                                 }
{ StartAddress[in]: start address (0 - 31)                                        }
{ DataCount[in]: data write count                                                  }
{ pBuffer[out]: user data write                                                    }
Function AdxPrivateHWRegionWrite( DriverHandle : Longint;
             StartAddress : Longint;
             DataCount:     Longint;
             Var pBuffer:   Byte ) : Longint; stdcall;
{---------------------------------------------------------------------------------}

{ ************************************************************************ }
{ CAN bus function declaration                                             }
{ ************************************************************************ }
Function CANPortOpen( DevNum: Word; var Port, HostID, BaudRate: Word): Longint; stdcall;
Function CANPortClose( Port: Word ): Longint; stdcall;
Function CANInit( Port: Word; BTR0, BTR1: Word; Mask: Byte ): Longint; stdcall;
Function CANReset( Port: Word): Longint; stdcall;
Function CANInpb( Port: Word; Offset: Word; var Data: Byte ): Longint; stdcall;
Function CANOutpb( Port: Word; Offset: Word; Value: Byte ): Longint; stdcall;
Function CANSetBaud( Port: Word; BTR0, BTR1: Word ): Longint; stdcall;
Function CANGetBaudRate( Port: Word; var wBaudRate: Word ): Longint; stdcall;
Function CANSetAcp( Port: Word; Acp, Mask: Word ): Longint; stdcall;
Function CANSetOutCtrl( Port: Word; OutCtrl: Word ): Longint; stdcall;
Function CANSetNormal( Port: Word ): Longint; stdcall;
Function CANHwReset( Port: Word ): Longint; stdcall;
Function CANSendMsg( Port: Word; TxBuf: PChar; Wait: Boolean ): Longint; stdcall;
Function CANQueryMsg( Port: Word;var Ready: LongBool; RcvBuf: PChar ): Longint; stdcall;
Function CANWaitForMsg( Port: Word; RcvBuf: PChar; TimeValue: Longint ): Longint; stdcall;
Function CANQueryID( Port: Word;var Ready: LongBool; IDBuf: PChar ): Longint; stdcall;
Function CANWaitForID( Port: Word; IDBuf: PChar; TimeValue: Longint ): Longint; stdcall;
Function CANEnableMessaging( Port: Word; Type1: Word; Enabled: Boolean;
              AppWnd: THandle; RcvBuf: PChar ): Longint; stdcall;
Function CANGetEventName( Port: Word; RcvBuf: PChar ): Longint; stdcall;
Function CANEnableEvent( Port: Word; Enabled: Smallint ): Longint; stdcall;
Function CANCheckEvent( Port: Word; Milliseconds: Longint ): Longint; stdcall;
Function CANPortOpenX( wPort: Word; dwMemoryAddress: Longint; IRQ: Longint ): Longint; stdcall;

{ ************************************************************************ }
{ PCL-839 function declaration                                             }
{ ************************************************************************ }
Function set_base( address: Longint ): Longint; stdcall;
Function set_mode( chan: Longint; mode: Longint ): Longint; stdcall;
Function set_speed( chan: Longint; low_speed: Longint; high_speed: Longint; accelerate: Longint ): Longint; stdcall;
Function status( chan: Longint ): Longint; stdcall;
Function m_stop( chan: Longint ): Longint; stdcall;
Function slowdown( chan: Longint ): Longint; stdcall;
Function sldn_stop( chan: Longint ): Longint; stdcall;
Function waitrdy( chan: Longint ): Longint; stdcall;
Function chkbusy(): Longint; stdcall;
Function out_port( port_no: Longint; value: Longint ): Longint; stdcall;
Function in_port( port_no: Longint ): Longint; stdcall;
Function In_byte( offset: Longint ): Longint; stdcall;
Function Out_byte( offset: Longint; value: Longint ): Longint; stdcall;
Function org( chan: Longint; dir1: Longint; speed1: Longint; dir2: Longint; speed2: Longint; dir3: Longint; speed3: Longint ): Longint; stdcall;
Function cmove( chan: Longint; dir1: Longint; speed1: Longint; dir2: Longint; speed2: Longint; dir3: Longint; speed3: Longint ): Longint; stdcall;
Function pmove( chan: Longint; dir1: Longint; speed1: Longint; step1: Longint; dir2: Longint; speed2: Longint; step2: Longint; dir3: Longint; speed3: Longint; step3: Longint ): Longint; stdcall;
Function arc(plan_ch: Longint; dirc: Longint; x1: Longint; y1: Longint; x2: Longint; y2: Longint): Longint; stdcall;
Function line(plan_ch: Longint; dx: Longint; dy: Longint): Longint; stdcall;
Function line3D(plan_ch: Longint; dx: Longint; dy: Longint; dz: Longint): Longint; stdcall;

{ ************************************************************************ }
{  DLL Function Declarations - ADSAPI32.DLL in windows dir                  }
{ ************************************************************************ }
implementation

Function DRV_DeviceGetNumOfList;    external 'adsapi32.dll';
Function DRV_DeviceGetList;         external 'adsapi32.dll';
Function DRV_DeviceGetSubList;      external 'adsapi32.dll';
Function DRV_SelectDevice;          external 'adsapi32.dll';
Function DRV_DeviceOpen;            external 'adsapi32.dll';
Function DRV_DeviceClose;           external 'adsapi32.dll';
Function DRV_DeviceGetFeatures;     external 'adsapi32.dll';
Function DRV_BoardTypeMapBoardName; external 'adsapi32.dll';
Procedure DRV_GetErrorMessage;      external 'adsapi32.dll';
Function DRV_AIConfig;              external 'adsapi32.dll';
Function DRV_AIGetConfig;           external 'adsapi32.dll';
Function DRV_AIBinaryIn;            external 'adsapi32.dll';
Function DRV_AIScale;               external 'adsapi32.dll';
Function DRV_AIVoltageIn;           external 'adsapi32.dll';
Function DRV_AIVoltageInExp;        external 'adsapi32.dll';
Function DRV_MAIConfig;             external 'adsapi32.dll';
Function DRV_MAIBinaryIn;           external 'adsapi32.dll';
Function DRV_MAIVoltageIn;          external 'adsapi32.dll';
Function DRV_MAIVoltageInExp;       external 'adsapi32.dll';
Function DRV_TCMuxRead;             external 'adsapi32.dll';
Function DRV_AOConfig;              external 'adsapi32.dll';
Function DRV_AOBinaryOut;           external 'adsapi32.dll';
Function DRV_AOVoltageOut;          external 'adsapi32.dll';
Function DRV_AOScale;               external 'adsapi32.dll';
Function DRV_DioSetPortMode;        external 'adsapi32.dll';
Function DRV_DioGetConfig;          external 'adsapi32.dll';
Function DRV_DioReadPortByte;       external 'adsapi32.dll';
Function DRV_DioWritePortByte;      external 'adsapi32.dll';
Function DRV_DioReadBit;            external 'adsapi32.dll';
Function DRV_DioWriteBit;           external 'adsapi32.dll';
Function DRV_DioGetCurrentDOByte;   external 'adsapi32.dll';
Function DRV_DioGetCurrentDOBit;    external 'adsapi32.dll';
Function DRV_WritePortByte;         external 'adsapi32.dll';
Function DRV_WritePortWord;         external 'adsapi32.dll';
{ --------------------- V2.0c ---------------------------- }
Function DRV_WritePortDword;        external 'adsapi32.dll';
{ --------------------- V2.0c ---------------------------- }
Function DRV_ReadPortByte;          external 'adsapi32.dll';
Function DRV_ReadPortWord;          external 'adsapi32.dll';
{ --------------------- V2.0c ---------------------------- }
Function DRV_ReadPortDword;         external 'adsapi32.dll';
{ --------------------- V2.0c ---------------------------- }
Function DRV_CounterEventStart;     external 'adsapi32.dll';
Function DRV_CounterEventRead;      external 'adsapi32.dll';
Function DRV_CounterFreqStart;      external 'adsapi32.dll';
Function DRV_CounterFreqRead;       external 'adsapi32.dll';
Function DRV_CounterPulseStart;     external 'adsapi32.dll';
Function DRV_CounterReset;          external 'adsapi32.dll';
{ --------------------- V2.0b ---------------------------- }
Function DRV_CounterConfig;         external 'adsapi32.dll';
Function DRV_FreqOutStart;          external 'adsapi32.dll';
Function DRV_FreqOutReset;          external 'adsapi32.dll';
{ --------------------- V2.0b ---------------------------- }
Function DRV_QCounterConfig;        external 'adsapi32.dll';
Function DRV_QCounterConfigSys;     external 'adsapi32.dll';
Function DRV_QCounterStart;         external 'adsapi32.dll';
Function DRV_QCounterRead;          external 'adsapi32.dll';
Function DRV_AlarmConfig;           external 'adsapi32.dll';
Function DRV_AlarmEnable;           external 'adsapi32.dll';
Function DRV_AlarmCheck;            external 'adsapi32.dll';
Function DRV_AlarmReset;            external 'adsapi32.dll';
Function DRV_WDTEnable;             external 'adsapi32.dll';
Function DRV_WDTRefresh;            external 'adsapi32.dll';
Function DRV_WDTReset;              external 'adsapi32.dll';
Function DRV_outp;                  external 'adsapi32.dll';
Function DRV_outpw;                 external 'adsapi32.dll';
Function DRV_inp;                   external 'adsapi32.dll';
Function DRV_inpw;                  external 'adsapi32.dll';
Function DRV_FAIWatchdogConfig;     external 'adsapi32.dll';
Function DRV_FAIIntStart;           external 'adsapi32.dll';
Function DRV_FAIIntScanStart;       external 'adsapi32.dll';
Function DRV_FAIDmaStart;           external 'adsapi32.dll';
Function DRV_FAIDmaScanStart;       external 'adsapi32.dll';
Function DRV_FAIDualDmaStart;       external 'adsapi32.dll';
Function DRV_FAIDualDmaScanStart;   external 'adsapi32.dll';
Function DRV_FAIIntWatchdogStart;   external 'adsapi32.dll';
Function DRV_FAIDmaWatchdogStart;   external 'adsapi32.dll';
Function DRV_FAICheck;              external 'adsapi32.dll';
Function DRV_FAIWatchdogCheck;      external 'adsapi32.dll';
Function DRV_FAITransfer;           external 'adsapi32.dll';
Function DRV_FAIStop;               external 'adsapi32.dll';
Function DRV_FAOIntStart;           external 'adsapi32.dll';
Function DRV_FAODmaStart;           external 'adsapi32.dll';
Function DRV_FAODmaExStart;         external 'adsapi32.dll';
Function DRV_FAOScale;              external 'adsapi32.dll';
Function DRV_FAOLoad;               external 'adsapi32.dll';
Function DRV_FAOCheck;              external 'adsapi32.dll';
Function DRV_FAOCheckEx;            external 'adsapi32.dll';
Function DRV_FAOStop;               external 'adsapi32.dll';
Function DRV_ClearOverrun;          external 'adsapi32.dll';
Function DRV_EnableEvent;           external 'adsapi32.dll';
Function DRV_CheckEvent;            external 'adsapi32.dll';
Function DRV_AllocateDMABuffer;     external 'adsapi32.dll';
Function DRV_FreeDMABuffer;         external 'adsapi32.dll';
Function DRV_TimerCountSetting;     external 'adsapi32.dll';
Function DRV_EnableEventEx;         external 'adsapi32.dll';
Function DRV_FDITransfer;           external 'adsapi32.dll';
Function DRV_CounterPWMSetting;     external 'adsapi32.dll';
Function DRV_CounterPWMEnable;      external 'adsapi32.dll';
Function DRV_DICounterReset;        external 'adsapi32.dll';
Function DRV_EnableSyncAO;          external 'adsapi32.dll';
Function DRV_WriteSyncAO;           external 'adsapi32.dll';
Function DRV_AOCurrentOut;          external 'adsapi32.dll';
Function DRV_ADAMCounterSetHWConfig; external 'adsapi32.dll';
Function DRV_ADAMCounterGetHWConfig; external 'adsapi32.dll';
Function DRV_ADAMAISetHWConfig;		external 'adsapi32.dll';
Function DRV_ADAMAIGetHWConfig;		external 'adsapi32.dll';
Function DRV_ADAMAOSetHWConfig;		external 'adsapi32.dll';
Function DRV_ADAMAOGetHWConfig;		external 'adsapi32.dll';
Procedure DRV_DeviceNumToDeviceName;     external 'adsapi32.dll';
Function DRV_GetFIFOSize;           external 'adsapi32.dll';
Function DRV_PWMStartRead;          external 'adsapi32.dll';
Function DRV_FAIDmaExStart;         external 'adsapi32.dll';
Function DRV_FAOWaveFormStart;	    external 'adsapi32.dll';
{ --------------------- V2.0b ---------------------------- }
Function DRV_DeviceGetParam;	    external 'adsapi32.dll';
{ --------------------- V2.0b ---------------------------- }
{ --------------------- V2.0c ---------------------------- }
Function DRV_DeviceSetProperty;     external 'adsapi32.dll';
Function DRV_DeviceGetProperty;     external 'adsapi32.dll';
Function DRV_FDIStart;              external 'adsapi32.dll';
Function DRV_FDICheck;              external 'adsapi32.dll';
Function DRV_FDIStop;               external 'adsapi32.dll';
Function DRV_ClearFlag;             external 'adsapi32.dll';
Function DRV_FDOStart;              external 'adsapi32.dll';
Function DRV_FDOCheck;              external 'adsapi32.dll';
Function DRV_FDOStop;               external 'adsapi32.dll';
{ --------------------- V2.0c ---------------------------- }
{ --------------------- V2.2 ---------------------------- }
Function DRV_WatchdogStart;         external 'adsapi32.dll';
Function DRV_WatchdogFeed;          external 'adsapi32.dll';
Function DRV_WatchdogStop;          external 'adsapi32.dll';
Function DRV_inpdw;                 external 'adsapi32.dll';
Function DRV_outpdw;                external 'adsapi32.dll';
{ --------------------- V2.2 ---------------------------- }

{ --------------------- V2.2c ---------------------------- }
Function DRV_DioReadPortWord;       external 'adsapi32.dll';
Function DRV_DioWritePortWord;      external 'adsapi32.dll';
Function DRV_DioReadPortDword;      external 'adsapi32.dll';
Function DRV_DioWritePortDword;     external 'adsapi32.dll';
Function DRV_DioGetCurrentDOWord;   external 'adsapi32.dll';
Function DRV_DioGetCurrentDODword;  external 'adsapi32.dll';
Function DRV_FAITerminate;          external 'adsapi32.dll';
Function DRV_FAOTerminate;          external 'adsapi32.dll';
{ --------------------- V2.2c ---------------------------- }

Function AdxDioEnableEventAndSpecifyDiPorts;       external 'adsapi32.dll';
Function AdxDioDisableEvent;                       external 'adsapi32.dll';
Function AdxDioGetLatestEventDiPortsState;         external 'adsapi32.dll';
Function AdxDioReadDiPorts;                        external 'adsapi32.dll';
Function AdxDioWriteDoPorts;                       external 'adsapi32.dll';
Function AdxDioGetCurrentDoPortsState;             external 'adsapi32.dll';
Function AdxDeviceConfig;                          external 'adsapi32.dll';

Function AdxDioEnableEventAndSpecifyEventCounter;  external 'adsapi32.dll';
Function AdxCntrEnableEventAndSpecifyEventCounter; external 'adsapi32.dll';
Function AdxCntrDisableEvent;                      external 'adsapi32.dll';
Function AdxCntrGetLatestEventCounterValue;        external 'adsapi32.dll';
Function AdxPrivateHWRegionRead;                   external 'adsapi32.dll';    
Function AdxPrivateHWRegionWrite;                  external 'adsapi32.dll';    


{ ************************************************************************ }
{  DLL Function Declarations - ADS841.dll in windows dir                   }
{ ************************************************************************ }

Function CANPortOpen;           external 'ADS841.dll';
Function CANPortClose;          external 'ADS841.dll';
Function CANInit;               external 'ADS841.dll';
Function CANReset;              external 'ADS841.dll';
Function CANInpb;               external 'ADS841.dll';
Function CANOutpb;              external 'ADS841.dll';
Function CANSetBaud;            external 'ADS841.dll';
Function CANGetBaudRate;        external 'ADS841.dll';
Function CANSetAcp;             external 'ADS841.dll';
Function CANSetOutCtrl;         external 'ADS841.dll';
Function CANSetNormal;          external 'ADS841.dll';
Function CANHwReset;            external 'ADS841.dll';
Function CANSendMsg;            external 'ADS841.dll';
Function CANQueryMsg;           external 'ADS841.dll';
Function CANWaitForMsg;         external 'ADS841.dll';
Function CANQueryID;            external 'ADS841.dll';
Function CANWaitForID;          external 'ADS841.dll';
Function CANEnableMessaging;    external 'ADS841.dll';
Function CANGetEventName;       external 'ADS841.dll';
Function CANEnableEvent;        external 'ADS841.dll';
Function CANCheckEvent;         external 'ADS841.dll';
Function CANPortOpenX;          external 'ADS841.dll';

{ ************************************************************************ }
{  DLL Function Declarations - ADS839.dll in windows dir                   }
{ ************************************************************************ }

Function set_base; 				external 'ADS839.dll';
Function set_mode;				external 'ADS839.dll';
Function set_speed;				external 'ADS839.dll';
Function status;				external 'ADS839.dll';
Function m_stop;				external 'ADS839.dll';
Function slowdown;				external 'ADS839.dll';
Function sldn_stop;				external 'ADS839.dll';
Function waitrdy;				external 'ADS839.dll';
Function chkbusy;				external 'ADS839.dll';
Function out_port;				external 'ADS839.dll';
Function in_port;				external 'ADS839.dll';
Function Out_byte;				external 'ADS839.dll';
Function In_byte;				external 'ADS839.dll';
Function org;					external 'ADS839.dll';
Function cmove;					external 'ADS839.dll';
Function pmove;					external 'ADS839.dll';
Function arc;					external 'ADS839.dll';
Function line;					external 'ADS839.dll';
Function line3D;				external 'ADS839.dll';


End.

