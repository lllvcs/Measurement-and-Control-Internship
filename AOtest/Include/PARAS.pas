{ *************************************************************************** }
{ Module Name: Paras.PAS                                                      }
{ Purpose: the declaration of functions, data structures, status codes,       }
{         constants, and messages                                             }
{ Version: 3.01                                                               }
{ Date: 01/08/2003                                                            }
{ Copyright (c) 1996-2003 Advantech Corp. Ltd.                                }
{ All rights reserved.                                                        }
{ *************************************************************************** }
{ Description: Set/Get parameter definition headfile. IDs with CFG prefix can }
{              be used by Drv_DeviceSetProperty and Drv_DeviceGetProperty     }
{              functions. Others are constant variable for user.              }   

{ =========================================================================== }
{ CFG Prefix Group                                                            }
{ =========================================================================== }

{ Notes:                                                                      }
{ 1. From 0x0000 to 0x0FFF : General definition
{ 2. From 0x1000 to 0x1FFF : AI related                                       }
{ 3. From 0x2000 to 0x2FFF : AO related                                       }
{ 4. From 0x3000 to 0x3FFF : DI related                                       }
{ 5. From 0x4000 to 0x4FFF : DO related                                       }
{ 6. From 0x5000 to 0x5FFF : Counter/Timer related                            }

unit PARAS;
interface
const
{ ************************************************************************ }
{   Constant Definition                                                    }
{ ************************************************************************ }
   CFG_DeviceNumber    = $0000;
   CFG_BoardID         = $0001;
   CFG_SwitchID        = $0002;
   CFG_BaseAddress     = $0003;
   CFG_Interrupt       = $0004;
   CFG_BusNumber       = $0005;
   CFG_SlotNumber      = $0006;
   CFG_OnSystem        = $0007;


{   ==================================                                     }
{ 0x1000 ~ 0x1fff for AI Group                                             }
{   ----------------------------------                                     }
     CFG_AiChanConfig = $1000;
     CFG_AiPacerRate  = $1001;
     CFG_AiFifoSize   = $1002;
     CFG_BURNTEST     = $1003;     
     CFG_CURRENT_4TO20MA_EXCEPTIONSETTING = $1004;
     CFG_AiScanClockSource = $1005;
     CFG_AiScanClockRate   = $1006;
     CFG_AiScanCount       = $1007;
{ ----------------------------------                                       }
{ 0x2000 ~ 0x2fff for AO Group                                             }
{ ----------------------------------                                       }
{ sub group 0x2000 ~ 0x27ff for AO General ID                              }
     AO_RANGE_SETTING = $2000;
     CFG_AoPacerRate  = $2001;
     CFG_AoFifoSize   = $2002;
     CFG_AoRangeList  = $2003;   { Get all supporting AO range list for the specified card }
     CFG_AoChanRange  = $2004;   { Get/Set AO range for the specified channel }
     CFG_AoPacerSource= $2005;

         AO_RANGE_SETTINGL_NAME = 'AO_RANGE_SETTING';

{ sub group 0x2800 ~ 0x2fff for AO other ID                                }


{ ----------------------------------                                       }
{ 0x3000 ~ 0x3fff for DI Group                                             }
{ ----------------------------------                                       }
{ sub group 0x3000 ~ 0x37ff for DI General ID                              }
  CFG_DioDirection       = $3000;     { each bit for one Auxiliary DIO channel for PCI-1755.}
  CFG_DioFdioDirection   = $3001;     { 32DI(0)/32DO(1)/ 16 DIO(2) / 8DIO(3) for PCI-1755}
  CFG_DioTerminator      = $3002;     { Bit 0: DI terminator (DI_TERM),ON (0) or OFF(1) for PCI-1755                                                      { Bit 1: DO terminator (DI_TERM) ON (0) or OFF(1) for PCI-1755}
  CFG_DiOperationMode    = $3003;     { normal mode (0), 8255 handshaking(1), Burst handshaking(2) for PCI-1755}
  CFG_DioPortDirection   = $3004;     {for Port direction setting  0: IN, 1: OUT, 2: 8255 Mode 0 (Low IN, High OUT),3:8255 Mode 0 (Low OUT, High IN) }
  
  {  Get Port type. 							 }
  {                                                                      }
  {  Data type: BYTE Array.						 }
  {    Each byte indicates a port type,					 }
  {    from port 0 to port n.   					 }
  {  Find the used value from Variable Group.                            }
  CFG_DioPortType           =  $3005;
  
  
  { Get/Set DIO Channel Direction ( IN / OUT ).				}
  {  									}
  {  Data type: DWORD Array. 						}
  {    Each element indicates a port setting.				}
  {    See the following for all available setting.			}
  {  Find the used value from Variable Group.                           }
  CFG_DioChannelDirection    = $3006;
  {Get/Set DIO Channel Direction ( IN / OUT ). on Power-On}
	CFG_DioPresetChanDir = $3007;

{ sub group 0x3800 ~ 0x3fff for DI General ID                             }
  CFG_DiStartMethod     = $3800;     { Software(1), External trigger(2), Pattern match(3)}
  CFG_DiStopMethod      = $3801;     { Software(1), External trigger(2), Pattern match(3)}
  CFG_DiPacerSource     = $3802;     { 30MHz(1), 15Mhz(2), 10MHz(3), Counter 0 OUT (4), External (5).}
  CFG_DiControlSignals  = $3803;     { Bit 0: External DI start signal control (STRRF), 0 rising edge, 1 falling edge. }
                                    { Bit 1: External DI stop signal control (STPRF), 0 rising edge, 1 falling edge.}
                                    { Bit 2: DI request signal control (REQRF), 0 rising edge, 1 falling edge.}
                                    { Bit 3: DI acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.}
                                    { Bit 4: DI sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge}
  CFG_DiPatternMatchValue = $3804;
 {-----------------------2.2------------------------}
  CFG_DiTriggerEnableRisingPort0 = $3805;
  CFG_DiTriggerEnableRisingPort1 = $3806;
  CFG_DiTriggerEnableRisingPort2 = $3807;
  CFG_DiTriggerEnableRisingPort3 = $3808;
  CFG_DiTriggerEnableRisingPort4 = $3809;
  CFG_DiTriggerEnableRisingPort5 = $380a;
  CFG_DiTriggerEnableRisingPort6 = $380b;
  CFG_DiTriggerEnableRisingPort7 = $380c;
  CFG_DiTriggerEnableRisingPort8 = $380d;
  CFG_DiTriggerEnableRisingPort9 = $380e;
  CFG_DiTriggerEnableRisingPort10 = $380f;
  CFG_DiTriggerEnableRisingPort11 = $3810;
  CFG_DiTriggerEnableRisingPort12 = $3811;
  CFG_DiTriggerEnableRisingPort13 = $3812;
  CFG_DiTriggerEnableRisingPort14 = $3813;
  CFG_DiTriggerEnableRisingPort15 = $3814;
  CFG_DiTriggerEnableRisingForAll = $3815;

  CFG_DiTriggerEnableFallingPort0 = $3816;
  CFG_DiTriggerEnableFallingPort1 = $3817;
  CFG_DiTriggerEnableFallingPort2 = $3818;
  CFG_DiTriggerEnableFallingPort3 = $3819;
  CFG_DiTriggerEnableFallingPort4 = $381a;
  CFG_DiTriggerEnableFallingPort5 = $381b;
  CFG_DiTriggerEnableFallingPort6 = $381c;
  CFG_DiTriggerEnableFallingPort7 = $381d;
  CFG_DiTriggerEnableFallingPort8 = $381e;
  CFG_DiTriggerEnableFallingPort9 = $381f;
  CFG_DiTriggerEnableFallingPort10 = $3820;
  CFG_DiTriggerEnableFallingPort11 = $3821;
  CFG_DiTriggerEnableFallingPort12 = $3822;
  CFG_DiTriggerEnableFallingPort13 = $3823;
  CFG_DiTriggerEnableFallingPort14 = $3824;
  CFG_DiTriggerEnableFallingPort15 = $3825;
  CFG_DiTriggerEnableFallingForAll = $3826;

  CFG_DiFilterEnablePort0 = $3827;
  CFG_DiFilterEnablePort1 = $3828;
  CFG_DiFilterEnablePort2 = $3829;
  CFG_DiFilterEnablePort3 = $382a;
  CFG_DiFilterEnablePort4 = $382b;
  CFG_DiFilterEnablePort5 = $382c;
  CFG_DiFilterEnablePort6 = $382d;
  CFG_DiFilterEnablePort7 = $382e;
  CFG_DiFilterEnablePort8 = $382f;
  CFG_DiFilterEnablePort9 = $3830;
  CFG_DiFilterEnablePort10 = $3831;
  CFG_DiFilterEnablePort11 = $3832;
  CFG_DiFilterEnablePort12 = $3833;
  CFG_DiFilterEnablePort13 = $3834;
  CFG_DiFilterEnablePort14 = $3835;
  CFG_DiFilterEnablePort15 = $3836;
  CFG_DiFilterEnableForAll = $3837;

  CFG_DiFilterIntervalCounter = $3838; {DI filter counter}


  CFG_IDiTriggerEnableRisingChannel0 = $3A00;
  CFG_IDiTriggerEnableRisingChannel1 = $3A01;
  CFG_IDiTriggerEnableFallingChannel0 = $3A80;
  CFG_IDiTriggerEnableFallingChannel1 = $3A81;

  CFG_DiTriggerEnableRisingChannel0 = $3C00; 
  CFG_DiTriggerEnableRisingChannel1 = $3C01;
  CFG_DiTriggerEnableFallingChannel0 = $3C80;
  CFG_DiTriggerEnableFallingChannel1 = $3C81;
  
  { Get DI data width. The optimized data width when Reading.		}
  {  									}
  { Data type: LONG. 							}
  { Find the used value from Variable Group.      			}
  CFG_DiDataWidth	     = $3C82;
  
  { Get DI Channel Count. Max available DI channel count on the card.   }
  {                                                                     }
  { Data type: LONG.                                                    }
  CFG_DiChannelCount          = $3C83;	        

  { Get DI Port Count. Max available DI Port count on the card.         }
  {                                                                     }
  { Data type: LONG.                                                    }
  CFG_DiPortCount             = $3C84;

  { Get DI Interrupt supported channel.                                 }
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel can issue interrupt.                                 }
  CFG_DiInterruptSupportedChannel = $3C85;
													
  { Get / Set DI channels which issue interrupt on RISING Edge.         }
  {     Note: whether this property can be set or not depends on device feature.}
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel will issue interrupt on rising edge.                 }
  CFG_DiInterruptTriggerOnRisingEdge  = $3C86;
													
  { Get / Set DI channels which issue interrupt on FALLING Edge.        }
  {     Note: whether this property can be set or not depends on device feature.}
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel will issue interrupt on falling edge.                }
  CFG_DiInterruptTriggerOnFallingEdge  = $3C87;


  { Get DI channels which support Status Change interrupt.              }
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel can issue interrupt when status changed.             }
  CFG_DiStatusChangeSupportedChannel   = $3C88;

  { Get/Set DI channels which "Status Changed interrupt" function is enabled.}
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel will issue interrupt when status changed.            }
  CFG_DiStatusChangeEnabledChannel     = $3C89;

  { Get DI channels which support pattern match interrupt.              }
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel can issue interrupt when pattern matched.            }
  CFG_DiPatternMatchSupportedChannel   = $3C8A;

  { Get/Set DI channels which "pattern match interrupt" function is enabled.}
  {                                                                     }
  { Data type: BYTE Array.                                              }
  {    One bit for one channel. If a bit is 1,                          }
  {    the channel will issue interrupt when pattern matched.           }
  CFG_DiPatternMatchEnabledChannel      = $3C8B;
  
  { Get DI Interrupt supported trigger mode.                            }
  { Data type: LONG.                                                    }  
  CFG_DiInterruptSupportedTriggerMode   =  $3C8C;
  
  { Get DI Pattern Match capability:                                      }
  {     Wether the mask of this port can be set individually.             }
  { Data Type:                                                            }
  {     BYTE Array.                                                       }
  {     One byte for a port. If the byte is 1, then the mask              }
  {     of this port can be set individually, otherwise it                }
  {     can't be done.                                                    }
  {     Note: if this property is not supported, it means that            }
  {     the mask can be set individually too.                             }
  CFG_DiPatternMatchMaskSupportedPort = $3C8D;               
 
  { Get DI Status Change capability:                                      }
  {     Wether the mask of this port can be set individually.             }
  { Data Type:                                                            }
  {     BYTE Array.                                                       }
  {     One byte for a port. If the byte is 1, then the mask              }
  {     of this port can be set individually, otherwise it                }
  {     can't be done.                                                    }
  {     Note: if this property is not supported, it means that            }
  {     the mask can be set individually too.                             }
  CFG_DiStatusChangeMaskSupportedPort  = $3C8E;
  
  { Get / set DI Transfer Request mode                                    }
  { Data type: ULONG                                                      }
  {     0: slave mode, 1 master mode                                      }
  CFG_DiTransferRequestMode             = $3C8F;

	{ Get Or Set DI Interrupt Mode:                                         }
	{ Data Type:                                                            }
	{     BYTE Array.                                                       }
	{     One byte for a port. The Interrupt mode's explanation varies      }
	{     with different card                                               }
	CFG_DiInterruptMode                   = $3C90;
{-----------------------2.2------------------------}
{ ----------------------------------                                       }
{ 0x4000 ~ 0x4fff for DO Group                                             }
{ ----------------------------------                                       }
{ sub group 0x4000 ~ 0x47ff for DO General ID                              }

{ sub group 0x4800 ~ 0x4fff for DO others ID                               }
  CFG_DoOperationMode   = $4800;     { Normal (0), Handahaking (1), Burst handshaking(2)}
  CFG_DoStartMethod     = $4801;     { Software(1), External signal(2)}
  CFG_DoStopMethod      = $4802;     { Software(1), External signal(2)}
  CFG_DoPacerSource     = $4803;     { 30, 15, 10 Mhz, Counter1, External signal (value range 1-5)}
  CFG_DoControlSignals  = $4804;     { Control signals }
                                         {   Bit 0: External DO start signal control (STRRF), 0 rising edge, 1 falling edge. }
                                         {   Bit 1: External DO stop signal control (STPRF), 0 rising edge, 1 falling edge.}
                                         {   Bit 2: DO request signal control (REQRF), 0 rising edge, 1 falling edge.}
                                         {   Bit 3: DO acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.}
                                         {   Bit 4: DO sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge}
  CFG_DoPresetValue     = $4805;     { DO status before transfering.}
  
  { Get DO data width. The optimized data width when writing.           }
  {                                                                     }
  { Data type: LONG.                                                    }
  { Find the used value from Variable Group.                            }
  CFG_DoDataWidth	   =  $4806;	

  {  Get DO Channel Count. Max available DO channel count on the card.   }
  {                                                                      }
  {  Data type: LONG.                                                    }
  CFG_DoChannelCount        =  $4807;	   

  { Get Do Port Count. Max available DO Port count on the card.         }
  {                                                                     }
  { Data type: LONG.                                                    }
  CFG_DoPortCount           =  $4808;
  
  { Get / set DO Transfer Request mode                                    }
  { Data type: ULONG                                                      }
  {     0: slave mode, 1 master mode                                      }
  CFG_DoTransferRequestMode = $4809;


{ ---------------------------------------                                  }
{ 0x5000 ~ 0x5fff for Counter/Timer                                        }
{ ---------------------------------------                                  }
{ sub group 0x5000 ~ 0x57ff for Counter/Timer general ID                   }

  CFG_CounterCountValue = $5000;   { 82C54 Counter 0-2 value}

  
{Get Counter channels' capability.                              }
{                                                               }
{Data type: Long Array.                                         }
{    One 'Long' for one channel, each bit of the long indicates }
{a specified function whether is available or not and the       }
{following function has been defined.                           }
CFG_CntrChannelCapability = $5001;

{ Get supported gate of the counter.              }
{                                                 }
{ Data type: Long.                                }
{     Each bit for a specified gate mode and the  }
{ following mode has been defined.                }
 CFG_CntrSupportedGateMode = $5002;

{ Get supported counting edge of the counter.         }
{                                                     }
{ Data type: Long.                                    }
{     Each bit for a specified counting edge and the  }
{ following bit has been defined.                     }
 CFG_CntrSupportedCountEdge = $5003;

{ Get supported output mode of the counter when terminal count reached. }
{                                                                       }
{ Data type: Long.                                                      }
{     Each bit for a specified output mode and the                      }
{ following mode has been defined.                                      }
 CFG_CntrSupportedOutMode = $5004;

{ Get available special api of the counter     }
{                                              }
{ Data type: Long.                             }
{     Each bit for a specified api and the     }
{ following has been defined.                  }
 CFG_CntrAvailableAPI = $5005;

{ Get event id of the channel which can issue event. }
{                                                    }
{ Data type: USHORT Array.                           }
{     One 'USHORT' for one channel, 0 indicates the channel can't }
{ issue event.                                                    }
 CFG_CntrChannelEventID = $5006;

{ Get the internal clock frequence device used for pulse out,     }
{ PWModulation or timer interrupt, etc...                         }
{                                                                 }
{ Data type: float array.                                         }
{     Each element of array is a clock frequence value the device }
{ supported and the frequence should be sorted from lower to higher.}
 CFG_CntrInternalClockFreq = $5007;

{ Get the validate range of period and HiPeriod of PWModulation function. }
{ data type: float array                                                  }
{      the data order in array:                                           }
{      [min_period][max_period][min_hiperiod][max_hiperiod]               }
 CFG_CntrPWModulateValidRange = $5008;

{ sub group 0x5800 ~ 0x5fff for counter/Timer general ID                   }

{Get the counter channel count}
{data type: LONG}
CFG_CntrChannelCount = $5009;

{Get the counter resolution}
{data type: LONG array}
CFG_CntrResolution = $5010;

{Get or set the counter reset value}
{data type: ULONG array}
CFG_CntrResetValue = $5011;

{Get the counter supported event type}
{data type: LONG array}
{           One 'LONG' for one event type}
CFG_Cntr0SupportedEventType = $5012;
CFG_Cntr1SupportedEventType = $5013;
CFG_Cntr2SupportedEventType = $5014;
CFG_Cntr3SupportedEventType = $5015;
CFG_Cntr4SupportedEventType = $5016;

{Get the counter supported lock type}
{data type: LONG array }
CFG_CntrSupportedCounterLock = $5017;

{Get or set the counter lock}
{data type: LONG array}
CFG_CntrCounterLockControl   = $5018;

{Get the counter supported indicator type}
{data type: LONG array}
CFG_CntrSupportedIndicator   = $5019;

{Get or set the counter indicator status}
{data type: LONG array}
CFG_CntrIndicatorControl     = $5020;

{Get the counter supported clock frequency}
{data type: LONG array}
CFG_Cntr0SupportedClockFrequency = $5021;
CFG_Cntr1SupportedClockFrequency = $5022;
CFG_Cntr2SupportedClockFrequency = $5023;
CFG_Cntr3SupportedClockFrequency = $5024;
CFG_Cntr4SupportedClockFrequency = $5025;

{Get or set the current counter clock frequency}
{data type: LONG array}
CFG_CntrClockFrequency           = $5026;

{Get the counter supported input mode}
{data type: LONG array}
CFG_Cntr0SupportedInputMode      = $5027;
CFG_Cntr1SupportedInputMode      = $5028;
CFG_Cntr2SupportedInputMode      = $5029;
CFG_Cntr3SupportedInputMode      = $5030;

{Get or set the current counter input mode}
{data type: LONG array}
CFG_CntrInputModeControl         = $5031;

{Get or set counter compare data}
{data type: ULONG array}
CFG_CntrCompareData              = $5032;

{Enable or Disable counter digital filter}
{data type: LONG array}
CFG_CntrDigitalFilter            = $5033;

{Enable or Disable Index Reset}
{data type: LONG}
{Each bit represent one counter channel}
CFG_CntrIndexReset               = $5034;

{For Frequency measure of PCM3810I}
CFG_CntrFreqMeasGateSrc          = $5035;

{ Other ID }
  CFG_IrqDiChangeStatusChannel  = $6000;       { Change status channel number.           }
  CFG_IrqDiTriggerSignals       = $6001;       { Each bit for each Auxiliary DIO channel }
  CFG_LoopBackTest              = $6002;       { Loop back test for MIC-3755             }
 {-----------------------2.2------------------------}
  CFG_WatchdogCounter = $7000;       { Watchdog counter. }
  CFG_DoWatchdogValue = $7001;       {Do status when watchdog overflow}
  
  CFG_EEPROM_RWBYTE = $8000;       {Read/Write a word to the EEPROM}
  CFG_PrivateHWRegionSize = $8001; {Customer private region size 32 bytes}
 {-----------------------2.2------------------------} 
 
{ ============================================================================ }
{ Constant Variable Group                                                      }
{ ============================================================================ }
 { Used by CFG_DioPortType ID }
 DIO_PortType_DI           =  $0;   { input port }
 DIO_PortType_DO           =  $1;   { output port }
 DIO_PortType_SeperateDIO  =  $2;   { bi-direction port }
 DIO_PortType_8255_PortA   =  $3;   { 8255 mode 0 port A type }
 DIO_PortType_8255_PortC   =  $4;   { 8255 mode 0 port C type }
 DIO_PortType_Individual   =  $5;   { each channel can be set individually }
 
 { Used by CFG_DioChannelDirection ID }
 DIO_ChannelDir_DI          = $0;
 DIO_ChannelDir_DO          = $000000ff;
 DIO_ChannelDir_LowHalf_DO  = $0000000f;
 DIO_ChannelDir_HighHalf_DO = $000000f0;
 DIO_ChannelDir_Invalid     = $ffffffff;
 DIO_ChannelDir_SeperateDIO = $0000ff00;     
 
 { Used by CFG_DiDataWidth ID }
 DI_DataWidth_Byte           = $0;
 DI_DataWidth_Word           = $1;
 DI_DataWidth_DWORD          = $2;
 
 { Used by CFG_DoDataWidth ID }
 DO_DataWidth_Byte         =  $0;
 DO_DataWidth_Word         =  $1;
 DO_DataWidth_Dword        =  $2;
 
 { Used by CFG_DiInterruptSupportedTriggerMode ID                                   }
  DI_Int_SingleEdgeTrigger           =  $0;      { trigger on rising or falling edge.}
  DI_Int_DualEdgeTrigger             =  $1;      { trigger on rising or falling or both edge.}
 
 { used by CFG_CntrChannelCapability }
 CNTR_ChlCap_EventCounting = $1;
 CNTR_ChlCap_FreqMeasurement = $2;
 CNTR_ChlCap_PulseWidthMeasurement = $4;
 CNTR_ChlCap_TimerInterrupt = $8;
 CNTR_ChlCap_CounterInterrupt = $10;
 CNTR_ChlCap_PulseWidthModulation = $20;
 CNTR_ChlCap_PulseOut = $40;
 CNTR_ChlCap_FreqOut = $80;
 CNTR_ChlCap_WatchDogTimer = $100;
 CNTR_ChlCap_CascadeWithNext = $200;
 CNTR_ChlCap_CascadeWithPrev = $400;

 { used by CFG_CntrSupportedGateMode }
 CNTR_GateMode_NoGate = $1;            { no gate signal( the gate will be set by software internally).}
 CNTR_GateMode_HighLevel = $2;         { High level active     }
 CNTR_GateMode_LowLevel = $4;          { Low  level active     }
 CNTR_GateMode_RisingEdge = $8;        { Rising edge active    }
 CNTR_GateMode_FallingEdge = $10;      { Falling edge active   }

 { used by CFG_CntrSupportedCountEdge}
 CNTR_CountEdge_RisingEdge = $1;       { Rising edge counting  }
 CNTR_CountEdge_FallingEdge = $2;      { Falling edge counting  }

 { used by CFG_CntrSupportedOutMode  }
 CNTR_OutMode_HighPulse = $1;          { Pin OUT_N outputs high pulse when the terminal count reached. }
 CNTR_OutMode_LowPulse = $2;           { Pin OUT_N outputs low pulse when the terminal count reached.  }
 CNTR_OutMode_LowToHigh = $4;          { Pin OUT_N toggles from low to high when the terminal count reached.}
 CNTR_OutMode_HighToLow = $8;          { Pin OUT_N toggles from high to low when the terminal count reached.}

 { used by CFG_CntrAvailableAPI }
 CNTR_API_CounterConfig = $1;
 CNTR_API_DICounterReset = $2;
 CNTR_API_QCounterAPI = $4;

 SCAN_CLOCK_NOT_USE =$0;
 SCAN_CLOCK_INTERNAL =$1;
 SCAN_CLOCK_EXTERNAL =$2;



implementation

end.
