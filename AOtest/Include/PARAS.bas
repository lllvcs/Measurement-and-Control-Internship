Attribute VB_Name = "Param"
'############################################################################
'****************************************************************************
'              Copyright (C) 2000-3, Advantech Automation Corp.
'      THIS IS AN UNPUBLISHED WORK CONTAINING CONFIDENTIAL AND PROPRIETARY
'         INFORMATION WHICH IS THE PROHERTY OF ADVANTECH AUTOMATION CORP.
'
'   ANY DISCLOSURE, USE, OR REPRODUCTION, WITHOUT WRITTEN AUTHORIZATION FROM
'             ADVANTECH AUTOMATION CORP., IS STRICTLY PROHIBITED
'****************************************************************************
'############################################################################

' File:        PARAS.H
' Created:     01/03/2003
' Description: Set/Get parameter definition headfile. IDs with CFG prefix can
'              be used by Drv_DeviceSetProperty and Drv_DeviceGetProperty
'              functions. Others are constant variable for user.
' ============================================================================
' VERSION HISTORY
' 01/03/2003  Create
' ============================================================================

' ============================================================================
' CFG Prefix Group
' ============================================================================

' Notes:
' 1. From 0x0000 to 0x0FFF : General definition
'
' 2. From 0x1000 to 0x1FFF : AI related
'
' 3. From 0x2000 to 0x2FFF : AO related
'
' 4. From 0x3000 to 0x3FFF : DI related
'
' 5. From 0x4000 to 0x4FFF : DO related
'
' 6. From 0x5000 to 0x5FFF : Counter/Timer related


'****************************************************************************
'    Constant Definition
'****************************************************************************
Global Const CFG_DeviceNumber = &H0
Global Const CFG_BoardID = &H1
Global Const CFG_SwitchID = &H2
Global Const CFG_BaseAddress = &H3
Global Const CFG_Interrupt = &H4
Global Const CFG_BusNumber = &H5
Global Const CFG_SlotNumber = &H6
Global Const CFG_OnSystem = &H7

' ==================================
' 0x1000 ~ 0x1fff for AI Group
' ----------------------------------
Global Const CFG_AiChanConfig = &H1000
Global Const CFG_AiPacerRate = &H1001
Global Const CFG_AiFifoSize = &H1002
Global Const CFG_BURNTEST = &H1003
Global Const CFG_CURRENT_4TO20MA_EXCEPTIONSETTING = &H1004

'AI scan clock
Global Const CFG_AiScanClockSource = &H1005
Global Const CFG_AiScanClockRate = &H1006
Global Const CFG_AiScanCount = &H1007

' ----------------------------------
' 0x2000 ~ 0x2fff for AO Group
' ----------------------------------
' sub group 0x2000 ~ 0x27ff for AO General ID
Global Const AO_RANGE_SETTING = &H2000
Global Const CFG_AoPacerRate = &H2001
Global Const CFG_AoFifoSize = &H2002
Global Const CFG_AoRangeList = &H2003    ' Get all supporting AO range list for the specified card
Global Const CFG_AoChanRange = &H2004    ' Get/Set AO range for the specified channel
Global Const CFG_AoPacerSource = &H2005
Global Const AO_RANGE_SETTINGL_NAME = "AO_RANGE_SETTING"

' sub group 0x2800 ~ 0x2fff for AO other ID


' ----------------------------------
' 0x3000 ~ 0x3fff for DI Group
' ----------------------------------
' sub group 0x3000 ~ 0x37ff for DI General ID
Global Const CFG_DioDirection = &H3000            ' each bit for one Auxiliary DIO channel for PCI-1755.
Global Const CFG_DioFdioDirection = &H3001        ' 32DI(0)/32DO(1)/ 16 DIO(2) / 8DIO(3) for PCI-1755
Global Const CFG_DioTerminator = &H3002           ' Bit 0: DI terminator (DI_TERM),ON (0) or OFF(1) for PCI-1755                                                      // Bit 1: DO terminator (DI_TERM) ON (0) or OFF(1) for PCI-1755
Global Const CFG_DiOperationMode = &H3003         ' normal mode (0), 8255 handshaking(1), Burst handshaking(2) for PCI-1755
Global Const CFG_DioPortDirection = &H3004        'for Port direction setting  0: IN, 1: OUT, 2: 8255 Mode 0 (Low IN, High
                                                  ' OUT),3:8255 Mode 0 (Low OUT, High IN)
                                                  
Global Const CFG_DioPortType = &H3005             'Get Port type.
                                                  '*  Data type: BYTE Array.
                                                  '*    Each byte indicates a port type,
                                                  '*    from port 0 to port n.
                                                  
Global Const CFG_DioChannelDirection = &H3006     '*  Get/Set DIO Channel Direction ( IN / OUT ).
                                                  '*  Data type: DWORD Array.
                                                  '*    Each element indicates a port setting.
                                                  '*    See the following for all available setting.
Global Const CFG_DioPresetChanDir = &H3007        '*  Get/Set DIO Channel Direction ( IN / OUT ). on Power-On
                                                  
' sub group 0x3800 ~ 0x3fff for DI General ID
Global Const CFG_DiStartMethod = &H3800         ' Software(1), External trigger(2), Pattern match(3)
Global Const CFG_DiStopMethod = &H3801          ' Software(1), External trigger(2), Pattern match(3)
Global Const CFG_DiPacerSource = &H3802         ' 30MHz(1), 15Mhz(2), 10MHz(3), Counter 0 OUT (4), External (5).
Global Const CFG_DiControlSignals = &H3803      ' Bit 0: External DI start signal control (STRRF), 0 rising edge, 1 falling edge.
                                                ' Bit 1: External DI stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                                ' Bit 2: DI request signal control (REQRF), 0 rising edge, 1 falling edge.
                                                ' Bit 3: DI acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                                ' Bit 4: DI sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
Global Const CFG_DiPatternMatchValue = &H3804

'////////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\
Global Const CFG_DiTriggerEnableRisingPort0 = &H3805
Global Const CFG_DiTriggerEnableRisingPort1 = &H3806
Global Const CFG_DiTriggerEnableRisingPort2 = &H3807
Global Const CFG_DiTriggerEnableRisingPort3 = &H3808
Global Const CFG_DiTriggerEnableRisingPort4 = &H3809
Global Const CFG_DiTriggerEnableRisingPort5 = &H380A
Global Const CFG_DiTriggerEnableRisingPort6 = &H380B
Global Const CFG_DiTriggerEnableRisingPort7 = &H380C
Global Const CFG_DiTriggerEnableRisingPort8 = &H380D
Global Const CFG_DiTriggerEnableRisingPort9 = &H380E
Global Const CFG_DiTriggerEnableRisingPort10 = &H380F
Global Const CFG_DiTriggerEnableRisingPort11 = &H3810
Global Const CFG_DiTriggerEnableRisingPort12 = &H3811
Global Const CFG_DiTriggerEnableRisingPort13 = &H3812
Global Const CFG_DiTriggerEnableRisingPort14 = &H3813
Global Const CFG_DiTriggerEnableRisingPort15 = &H3814
Global Const CFG_DiTriggerEnableRisingForAll = &H3815

Global Const CFG_DiTriggerEnableFallingPort0 = &H3816
Global Const CFG_DiTriggerEnableFallingPort1 = &H3817
Global Const CFG_DiTriggerEnableFallingPort2 = &H3818
Global Const CFG_DiTriggerEnableFallingPort3 = &H3819
Global Const CFG_DiTriggerEnableFallingPort4 = &H381A
Global Const CFG_DiTriggerEnableFallingPort5 = &H381B
Global Const CFG_DiTriggerEnableFallingPort6 = &H381C
Global Const CFG_DiTriggerEnableFallingPort7 = &H381D
Global Const CFG_DiTriggerEnableFallingPort8 = &H381E
Global Const CFG_DiTriggerEnableFallingPort9 = &H381F
Global Const CFG_DiTriggerEnableFallingPort10 = &H3820
Global Const CFG_DiTriggerEnableFallingPort11 = &H3821
Global Const CFG_DiTriggerEnableFallingPort12 = &H3822
Global Const CFG_DiTriggerEnableFallingPort13 = &H3823
Global Const CFG_DiTriggerEnableFallingPort14 = &H3824
Global Const CFG_DiTriggerEnableFallingPort15 = &H3825
Global Const CFG_DiTriggerEnableFallingForAll = &H3826

Global Const CFG_DiFilterEnablePort0 = &H3827
Global Const CFG_DiFilterEnablePort1 = &H3828
Global Const CFG_DiFilterEnablePort2 = &H3829
Global Const CFG_DiFilterEnablePort3 = &H382A
Global Const CFG_DiFilterEnablePort4 = &H382B
Global Const CFG_DiFilterEnablePort5 = &H382C
Global Const CFG_DiFilterEnablePort6 = &H382D
Global Const CFG_DiFilterEnablePort7 = &H382E
Global Const CFG_DiFilterEnablePort8 = &H382F
Global Const CFG_DiFilterEnablePort9 = &H3830
Global Const CFG_DiFilterEnablePort10 = &H3831
Global Const CFG_DiFilterEnablePort11 = &H3832
Global Const CFG_DiFilterEnablePort12 = &H3833
Global Const CFG_DiFilterEnablePort13 = &H3834
Global Const CFG_DiFilterEnablePort14 = &H3835
Global Const CFG_DiFilterEnablePort15 = &H3836
Global Const CFG_DiFilterEnableForAll = &H3837

Global Const CFG_DiFilterIntervalCounter = &H3838

Global Const CFG_IDiTriggerEnableRisingChannel0 = &H3A00
Global Const CFG_IDiTriggerEnableRisingChannel1 = &H3A01
Global Const CFG_IDiTriggerEnableFallingChannel0 = &H3A80
Global Const CFG_IDiTriggerEnableFallingChannel1 = &H3A81

Global Const CFG_DiTriggerEnableRisingChannel0 = &H3C00
Global Const CFG_DiTriggerEnableRisingChannel1 = &H3C01
Global Const CFG_DiTriggerEnableFallingChannel0 = &H3C80
Global Const CFG_DiTriggerEnableFallingChannel1 = &H3C81
'////////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\

Global Const CFG_DiDataWidth = &H3C82           'Get DI data width. The optimized data width when Reading.
Global Const CFG_DiChannelCount = &H3C83        'Get DI Channel Count. Max available DI channel count on the card.
Global Const CFG_DiPortCount = &H3C84           'Get DI Port Count. Max available DI Port count on the card.
Global Const CFG_DiInterruptSupportedChannel = &H3C85        ' Get DI Interrupt supported channel.
Global Const CFG_DiInterruptTriggerOnRisingEdge = &H3C86     'Get / Set DI channels which issue interrupt on RISING Edge.
                                                             'Note: whether this property can be set or not depends on device feature.
Global Const CFG_DiInterruptTriggerOnFallingEdge = &H3C87    'Get / Set DI channels which issue interrupt on FALLING Edge.
                                                             ' Note: whether this property can be set or not depends on device feature.
Global Const CFG_DiStatusChangeSupportedChannel = &H3C88     'Get DI channels which support Status Change interrupt.
Global Const CFG_DiStatusChangeEnabledChannel = &H3C89       'Get/Set DI channels which "Status Changed interrupt" function is enabled.
Global Const CFG_DiPatternMatchSupportedChannel = &H3C8A     'Get DI channels which support pattern match interrupt.
Global Const CFG_DiPatternMatchEnabledChannel = &H3C8B       'Get/Set DI channels which "pattern match interrupt" function is enabled.

Global Const CFG_DiInterruptSupportedTriggerMode = &H3C8C     'Get DI Interrupt supported trigger mode.

' Get DI Pattern Match capability:
'     Wether the mask of this port can be set individually.
' Data Type:
'     BYTE Array.
'     One byte for a port. If the byte is 1, then the mask
'     of this port can be set individually, otherwise it
'     can't be done.
'     Note: if this property is not supported, it means that
'     the mask can be set individually too.
Global Const CFG_DiPatternMatchMaskSupportedPort = &H3C8D
 
' Get DI Status Change capability:
'     Wether the mask of this port can be set individually.
' Data Type:
'     BYTE Array.
'     One byte for a port. If the byte is 1, then the mask
'     of this port can be set individually, otherwise it
'     can't be done.
'     Note: if this property is not supported, it means that
'     the mask can be set individually too.
Global Const CFG_DiStatusChangeMaskSupportedPort = &H3C8E

' Get / set DI Transfer Request mode, 0: slave mode, 1 master mode
Global Const CFG_DiTransferRequestMode = &H3C8F

' Get Or Set DI Interrupt Mode:
' Data Type:
'     BYTE Array.
'     One byte for a port. The Interrupt mode's explanation varies
'     with different card

Global Const CFG_DiInterruptMode = &H3C90



' ----------------------------------
' 0x4000 ~ 0x4fff for DO Group
' ----------------------------------
' sub group 0x4000 ~ 0x47ff for DO General ID

' sub group 0x4800 ~ 0x4fff for DO others ID
Global Const CFG_DoOperationMode = &H4800       ' Normal (0), Handahaking (1), Burst handshaking(2)
Global Const CFG_DoStartMethod = &H4801         ' Software(1), External signal(2)
Global Const CFG_DoStopMethod = &H4802          ' Software(1), External signal(2)
Global Const CFG_DoPacerSource = &H4803         ' 30, 15, 10 Mhz, Counter1, External signal (value range 1-5)
Global Const CFG_DoControlSignals = &H4804      ' Control signals
                                         '   Bit 0: External DO start signal control (STRRF), 0 rising edge, 1 falling edge.
                                         '   Bit 1: External DO stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                         '   Bit 2: DO request signal control (REQRF), 0 rising edge, 1 falling edge.
                                         '   Bit 3: DO acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                         '   Bit 4: DO sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
Global Const CFG_DoPresetValue = &H4805         ' DO status before transfering.
Global Const CFG_DoDataWidth = &H4806           'Get DO data width. The optimized data width when writing.
Global Const CFG_DoChannelCount = &H4807        'Get DO Channel Count. Max available DO channel count on the card.
Global Const CFG_DoPortCount = &H4808           'Get Do Port Count. Max available DO Port count on the card.
Global Const CFG_DoTransferRequestMode = &H4809 ' Get / set DO Transfer Request mode, 0: slave mode, 1 master mode


' ---------------------------------------
' 0x5000 ~ 0x5fff for Counter/Timer
' ---------------------------------------
' sub group 0x5000 ~ 0x57ff for Counter/Timer general ID
Global Const CFG_CounterCountValue = &H5000   ' 82C54 Counter 0-2 value

'Get Counter channels' capability.
'
'Data type: Long Array.
'    One 'Long' for one channel, each bit of the long indicates
'a specified function whether is available or not and the
'following function has been defined.
'
Global Const CFG_CntrChannelCapability = &H5001

' Get supported gate of the counter.
'
' Data type: Long.
'     Each bit for a specified gate mode and the
' following mode has been defined.
'
Global Const CFG_CntrSupportedGateMode = &H5002

' Get supported counting edge of the counter.
'
' Data type: Long.
'     Each bit for a specified counting edge and the
' following bit has been defined.
'
Global Const CFG_CntrSupportedCountEdge = &H5003
 

' Get supported output mode of the counter when terminal count reached.
'
' Data type: Long.
'     Each bit for a specified output mode and the
' following mode has been defined.
'
Global Const CFG_CntrSupportedOutMode = &H5004

' Get available special api of the counter
'
' Data type: Long.
'     Each bit for a specified api and the
' following has been defined.
'
Global Const CFG_CntrAvailableAPI = &H5005

' Get event id of the channel which can issue event.
'
' Data type: USHORT Array.
'     One 'USHORT' for one channel, 0 indicates the channel can't
' issue event.
Global Const CFG_CntrChannelEventID = &H5006

' Get the internal clock frequence device used for pulse out,
' PWModulation or timer interrupt, etc...
'
' Data type: float array.
'     Each element of array is a clock frequence value the device
' supported and the frequence should be sorted from lower to higher.
'
Global Const CFG_CntrInternalClockFreq = &H5007


' Get the validate range of period and HiPeriod of PWModulation function.
' data type: float array
'      the data order in array:
'      [min_period][max_period][min_hiperiod][max_hiperiod]
'
Global Const CFG_CntrPWModulateValidRange = &H5008


' Get the counter channel count
' data type: LONG
Global Const CFG_CntrChannelCount = &H5009

'Get the counter resolution
'data type: LONG array
Global Const CFG_CntrResolution = &H5010

'Get or set the counter reset value
'data type: ULONG array
Global Const CFG_CntrResetValue = &H5011

'Get the counter supported event type
'data type: LONG array
'           One 'LONG' for one event type
Global Const CFG_Cntr0SupportedEventType = &H5012
Global Const CFG_Cntr1SupportedEventType = &H5013
Global Const CFG_Cntr2SupportedEventType = &H5014
Global Const CFG_Cntr3SupportedEventType = &H5015
Global Const CFG_Cntr4SupportedEventType = &H5016

'Get the counter supported lock type
'data type: LONG array
Global Const CFG_CntrSupportedCounterLock = &H5017

'Get or set the counter lock
'data type: LONG array
Global Const CFG_CntrCounterLockControl = &H5018

'Get the counter supported indicator type
'data type: LONG array
Global Const CFG_CntrSupportedIndicator = &H5019

'Get or set the counter indicator status
'data type: LONG array
Global Const CFG_CntrIndicatorControl = &H5020

'Get the counter supported clock frequency
'data type: LONG array
Global Const CFG_Cntr0SupportedClockFrequency = &H5021
Global Const CFG_Cntr1SupportedClockFrequency = &H5022
Global Const CFG_Cntr2SupportedClockFrequency = &H5023
Global Const CFG_Cntr3SupportedClockFrequency = &H5024
Global Const CFG_Cntr4SupportedClockFrequency = &H5025

'Get or set the current counter clock frequency
'data type: LONG array
Global Const CFG_CntrClockFrequency = &H5026

'Get the counter supported input mode
'data type: LONG array
Global Const CFG_Cntr0SupportedInputMode = &H5027
Global Const CFG_Cntr1SupportedInputMode = &H5028
Global Const CFG_Cntr2SupportedInputMode = &H5029
Global Const CFG_Cntr3SupportedInputMode = &H5030

'Get or set the current counter input mode
'data type: LONG array
Global Const CFG_CntrInputModeControl = &H5031

'Get or set counter compare data
'data type: ULONG array
Global Const CFG_CntrCompareData = &H5032

'Enable or Disable counter digital filter
'data type: LONG array
Global Const CFG_CntrDigitalFilter = &H5033

'Enable or Diable Index reset
'data type: LONG
'Each bit represent one counter channel
Global Const CFG_CntrIndexReset = &H5034

'For Frequency measure of PCM3810I
Global Const CFG_CntrFreqMeasGateSrc = &H5035

' sub group 0x5800 ~ 0x5fff for counter/Timer general ID

' Other ID
Global Const CFG_IrqDiChangeStatusChannel = &H6000        ' Change status channel number.
Global Const CFG_IrqDiTriggerSignals = &H6001             ' Each bit for each Auxiliary DIO channel
Global Const CFG_LoopBackTest = &H6002                    ' Loop back test for MIC-3755
'////////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\
Global Const CFG_WatchdogCounter = &H7000       ' Watchdog counter.
Global Const CFG_DoWatchdogValue = &H7001       'Do status when watchdog overflow.

Global Const CFG_EEPROM_RWBYTE = &H8000        'Read/Write a word to the EEPROM.
Global Const CFG_PrivateHWRegionSize = &H8001   'Customer private region size 32 bytes
'////////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\


' ============================================================================
' Constant Variable Group
' ============================================================================


'*  Get Port type.
'*
'*  Data type: BYTE Array.
'*    Each byte indicates a port type,
'*    from port 0 to port n.
'*  Return by CFG_DioPortType ID
Global Const DIO_PortType_DI = &H0            ' input port
Global Const DIO_PortType_DO = &H1            ' output port
Global Const DIO_PortType_SeperateDIO = &H2   ' DI-direction port
Global Const DIO_PortType_8255_PortA = &H3    ' 8255 mode 0 port A type
Global Const DIO_PortType_8255_PortC = &H4    ' 8255 mode 0 port C type
Global Const DIO_PortType_Individual = &H5    ' each channel can be set individually

'*  Get/Set DIO Channel Direction ( IN / OUT ).
'*
'*  Data type: DWORD Array.
'*    Each element indicates a port setting.
'*    See the following for all available setting.
'*  Return by CFG_DioChannelDirection ID
Global Const DIO_ChannelDir_DI = &H0
Global Const DIO_ChannelDir_DO = &HFF
Global Const DIO_ChannelDir_LowHalf_DO = &HF
Global Const DIO_ChannelDir_HighHalf_DO = &HF0
Global Const DIO_ChannelDir_Invalid = &HFFFFFFFF
Global Const DIO_ChannelDir_SeperateDIO = &HFF00

'*  Get DI data width. The optimized data width when Reading.
'*
'*  Data type: LONG.
'*     See the following for all available setting.
'*  Return by CFG_DiDataWidth ID
Global Const DI_DataWidth_Byte = &H0
Global Const DI_DataWidth_Word = &H1
Global Const DI_DataWidth_DWORD = &H2

'*  Get DO data width. The optimized data width when writing.
'*
'*  Data type: LONG.
'*     See the following for all available setting.
'*  Return by CFG_DoDataWidth ID
Global Const DO_DataWidth_Byte = &H0
Global Const DO_DataWidth_Word = &H1
Global Const DO_DataWidth_Dword = &H2

'*Data type: LONG.
'*which trigger mode was supported.
'*  Return by CFG_DiInterruptSupportedTriggerMode ID
Global Const DI_Int_SingleEdgeTrigger = &H0      'trigger on rising or falling edge.
Global Const DI_Int_DualEdgeTrigger = &H1        'trigger on rising or falling or both edge.

 

'used by CFG_CntrChannelCapability
Global Const CNTR_ChlCap_EventCounting = &H1              'bit 0
Global Const CNTR_ChlCap_FreqMeasurement = &H2            'bit 1
Global Const CNTR_ChlCap_PulseWidthMeasurement = &H4      'bit 2
Global Const CNTR_ChlCap_TimerInterrupt = &H8             'bit 3
Global Const CNTR_ChlCap_CounterInterrupt = &H10          'bit 4
Global Const CNTR_ChlCap_PulseWidthModulation = &H20      'bit 5
Global Const CNTR_ChlCap_PulseOut = &H40                  'bit 6
Global Const CNTR_ChlCap_FreqOut = &H80                   'bit 7
Global Const CNTR_ChlCap_WatchDogTimer = &H100            'bit 8
Global Const CNTR_ChlCap_CascadeWithNext = &H200          'bit 9
Global Const CNTR_ChlCap_CascadeWithPrev = &H400          'bit 10

'used by CFG_CntrSupportedGateMode
Global Const CNTR_GateMode_NoGate = &H1            ' no gate signal( the gate will be set by software internally).
Global Const CNTR_GateMode_HighLevel = &H2         ' High level active
Global Const CNTR_GateMode_LowLevel = &H4          ' Low  level active
Global Const CNTR_GateMode_RisingEdge = &H8        ' Rising edge active
Global Const CNTR_GateMode_FallingEdge = &H10      ' Falling edge active

'used by CFG_CntrSupportedCountEdge
Global Const CNTR_CountEdge_RisingEdge = &H1       ' Rising edge counting
Global Const CNTR_CountEdge_FallingEdge = &H2      ' Falling edge counting

'used by CFG_CntrSupportedOutMode
Global Const CNTR_OutMode_HighPulse = &H1          ' Pin OUT_N outputs high pulse when the terminal count reached.
Global Const CNTR_OutMode_LowPulse = &H2           ' Pin OUT_N outputs low pulse when the terminal count reached.
Global Const CNTR_OutMode_LowToHigh = &H4          ' Pin OUT_N toggles from low to high when the terminal count reached.
Global Const CNTR_OutMode_HighToLow = &H8          ' Pin OUT_N toggles from high to low when the terminal count reached.

'used by CFG_CntrAvailableAPI
Global Const CNTR_API_CounterConfig = &H1          'DRV_CounterConfig exists.
Global Const CNTR_API_DICounterReset = &H2         'DRV_DICounterReset exists.
Global Const CNTR_API_QCounterAPI = &H4            'DRV_QCounterAPI exists.

Global Const SCAN_CLOCK_NOT_USE = &H0
Global Const SCAN_CLOCK_INTERNAL = &H1
Global Const SCAN_CLOCK_EXTERNAL = &H2




