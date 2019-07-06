#ifndef _INC_PARAS_H
#define _INC_PARAS_H
// ############################################################################
// ****************************************************************************
//              Copyright (C) 2000-3, Advantech Automation Corp.
//      THIS IS AN UNPUBLISHED WORK CONTAINING CONFIDENTIAL AND PROPRIETARY
//         INFORMATION WHICH IS THE PROHERTY OF ADVANTECH AUTOMATION CORP.
// 
//   ANY DISCLOSURE, USE, OR REPRODUCTION, WITHOUT WRITTEN AUTHORIZATION FROM
//             ADVANTECH AUTOMATION CORP., IS STRICTLY PROHIBITED
// ****************************************************************************
// ############################################################################
//
// File:        PARAS.H
// Created:     01/03/2003
// Description: Get parameter definition headfile.
// ============================================================================
// VERSION HISTORY
// 01/03/2003  Create
// Description: Set/Get parameter definition headfile. IDs with CFG prefix can
//              be used by Drv_DeviceSetProperty and Drv_DeviceGetProperty
//              functions. Others are constant variable for user.
// ============================================================================

// Notes:

// ============================================================================
// CFG Prefix Group
// ============================================================================

// 1. From 0x0000 to 0x0FFF : General definition
/**/
#define CFG_DeviceNumber                 0x0000
#define CFG_BoardID                      0x0001
#define CFG_SwitchID                     0x0002
#define CFG_BaseAddress                  0x0003
#define CFG_Interrupt                    0x0004
#define CFG_BusNumber                    0x0005
#define CFG_SlotNumber                   0x0006
#define CFG_OnSystem                     0x0007


#define     CFG_DeviceNumber_Name           "DeviceNumber"
#define     CFG_BoardID_Name                "BoardID"
#define     CFG_SwitchID_Name               "SwitchID"
#define     CFG_BaseAddress_Name            "BaseAddress"
#define     CFG_Interrupt_Name              "Interrupt"
#define     CFG_BusNumber_Name              "BusNumber"
#define     CFG_SlotNumber_Name             "SlotNumber"      // slot number
#define     CFG_OnSystem_Name               "OnSystem"        // This device on system or not



//
// 2. From 0x1000 to 0x1FFF : AI related 
//
// 3. From 0x2000 to 0x2FFF : AO related
//
// 4. From 0x3000 to 0x37FF : DIO Configuration related
//
// 5. From 0x3700 to 0x3FFF : DI related
//
// 6. From 0x4000 to 0x4FFF : DO related
//
// 7. From 0x5000 to 0x5FFF : Counter/Timer related
//
// 8. From 0x6000 to 0x6FFF : Other function related


// ==================================
// 0x1000 ~ 0x1fff for AI Group 
// ----------------------------------
#define CFG_AiChanConfig     0x1000     // Get/Set single/different end
#define CFG_AiPacerRate      0x1001     // Get/Set AI Pacer rate
#define CFG_AiFifoSize       0x1002     // Get Ai Fifo Size
#define CFG_BURNTEST         0x1003
#define CFG_CURRENT_4TO20MA_EXCEPTIONSETTING 0x1004     // 4~20mA Measurement Exception

//AI Scan Clock
#define CFG_AiScanClockSource  0x1005
#define CFG_AiScanClockRate    0x1006
#define CFG_AiScanCount        0x1007

// ----------------------------------
// 0x2000 ~ 0x2fff for AO Group 
// ----------------------------------
// sub group 0x2000 ~ 0x27ff for AO General ID
#define  AO_RANGE_SETTING                  0x2000
#define  CFG_AoPacerRate                   0x2001   // Get/Set AO Pacer rate
#define  CFG_AoFifoSize                    0x2002   // Get AO Fifo Size
#define  CFG_AoRangeList                   0x2003   // Get all supporting AO range list for the specified card
#define  CFG_AoChanRange                   0x2004   // Get/Set AO range for the specified channel
#define  CFG_AoPacerSource                 0x2005   
#define     AO_RANGE_SETTINGL_NAME		       "AO_RANGE_SETTING"
// sub group 0x2800 ~ 0x2fff for AO other ID


// ----------------------------------
// 0x3000 ~ 0x37ff for DIO Configuration Group 
// ----------------------------------
// sub group 0x3000 ~ 0x37ff for DIO Configuration ID
#define  CFG_DioDirection                  0x3000     // each bit for one Auxiliary DIO channel for PCI-1755.
#define  CFG_DioFdioDirection              0x3001     // 32DI(0)/32DO(1)/ 16 DIO(2) / 8DIO(3) for PCI-1755
#define  CFG_DioTerminator                 0x3002     // Bit 0: DI terminator (DI_TERM),ON (0) or OFF(1) for PCI-1755
                                                      // Bit 1: DO terminator (DI_TERM) ON (0) or OFF(1) for PCI-1755
#define  CFG_DiOperationMode               0x3003     // normal mode (0), 8255 handshaking(1), Burst handshaking(2) for PCI-1755
#define  CFG_DioPortDirection              0x3004     // for Port direction setting  0: IN, 1: OUT, 2: 8255 Mode 0 (Low IN, High 
                                                      // OUT),3:8255 Mode 0 (Low OUT, High IN)
#define CFG_DioPortType                    0x3005     // Get Port type. Find the used value from Variable Group.
                                                      // Data type: BYTE Array.
                                                      //    Each byte indicates a port type,
                                                      //    from port 0 to port n.   

#define CFG_DioChannelDirection            0x3006     // Get/Set DIO Channel Direction ( IN / OUT ). Find the used value from Variable Group.
                                                      // Data type: DWORD Array. 
                                                      //    Each element indicates a port setting.
#define CFG_DioPresetChanDir            0x3007 
                                                      

#define CFG_DioDirection_Name      "DioDirection"      // each bit for one Auxiliary DIO channel.
#define CFG_DioFdioDirection_Name  "DioFdioDirection"  // 32DI(0)/32DO(1)/ 16 DIO(2) / 8DIO(3)
#define CFG_DioTerminator_Name     "DioTerminator"     // Bit 0: DI terminator (DI_TERM),ON (0) or OFF(1)
                                                  // Bit 1: DO terminator (DI_TERM) ON (0) or OFF(1)
#define  CFG_DioPortDirection_Name      "DioPortDirection"

// Fast DI functions
#define CFG_DiOperationMode_Name   "DiOperationMode"   // normal mode (0), 8255 handshaking(1), Burst handshaking(2)


// sub group 0x3800 ~ 0x3fff for DI General and others ID
#define CFG_DiStartMethod     0x3800     // Software(1), External trigger(2), Pattern match(3)
#define CFG_DiStopMethod      0x3801     // Software(1), External trigger(2), Pattern match(3)
#define CFG_DiPacerSource     0x3802     // 30MHz(1), 15Mhz(2), 10MHz(3), Counter 0 OUT (4), External (5).
#define CFG_DiControlSignals  0x3803     // Bit 0: External DI start signal control (STRRF), 0 rising edge, 1 falling edge. 
                                         // Bit 1: External DI stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                         // Bit 2: DI request signal control (REQRF), 0 rising edge, 1 falling edge.
                                         // Bit 3: DI acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                         // Bit 4: DI sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
#define CFG_DiPatternMatchValue 0x3804

#define    CFG_DiStartMethod_Name        "DiStartMethod"
#define    CFG_DiStopMethod_Name         "DiStopMethod"      
#define    CFG_DiPacerSource_Name        "DiPacerSource"  
#define    CFG_DiControlSignals_Name     "DiControlSignals" 
#define    CFG_DiPatternMatchValue_Name  "DiPatternMatchValue"  
//\\\\\\\\\\\\\\\\\\\\2.2///////////////////////////////////
#define CFG_DiTriggerEnableRisingPort0          0x3805
#define CFG_DiTriggerEnableRisingPort1          0x3806
#define CFG_DiTriggerEnableRisingPort2          0x3807
#define CFG_DiTriggerEnableRisingPort3          0x3808
#define CFG_DiTriggerEnableRisingPort4          0x3809
#define CFG_DiTriggerEnableRisingPort5          0x380a
#define CFG_DiTriggerEnableRisingPort6          0x380b
#define CFG_DiTriggerEnableRisingPort7          0x380c
#define CFG_DiTriggerEnableRisingPort8          0x380d
#define CFG_DiTriggerEnableRisingPort9          0x380e
#define CFG_DiTriggerEnableRisingPort10         0x380f
#define CFG_DiTriggerEnableRisingPort11         0x3810
#define CFG_DiTriggerEnableRisingPort12         0x3811
#define CFG_DiTriggerEnableRisingPort13         0x3812
#define CFG_DiTriggerEnableRisingPort14         0x3813
#define CFG_DiTriggerEnableRisingPort15         0x3814
#define CFG_DiTriggerEnableRisingForAll         0x3815

#define CFG_DiTriggerEnableFallingPort0         0x3816
#define CFG_DiTriggerEnableFallingPort1         0x3817
#define CFG_DiTriggerEnableFallingPort2         0x3818
#define CFG_DiTriggerEnableFallingPort3         0x3819
#define CFG_DiTriggerEnableFallingPort4         0x381a
#define CFG_DiTriggerEnableFallingPort5         0x381b
#define CFG_DiTriggerEnableFallingPort6         0x381c
#define CFG_DiTriggerEnableFallingPort7         0x381d
#define CFG_DiTriggerEnableFallingPort8         0x381e
#define CFG_DiTriggerEnableFallingPort9         0x381f
#define CFG_DiTriggerEnableFallingPort10        0x3820
#define CFG_DiTriggerEnableFallingPort11        0x3821
#define CFG_DiTriggerEnableFallingPort12        0x3822
#define CFG_DiTriggerEnableFallingPort13        0x3823
#define CFG_DiTriggerEnableFallingPort14        0x3824
#define CFG_DiTriggerEnableFallingPort15        0x3825
#define CFG_DiTriggerEnableFallingForAll        0x3826

#define CFG_DiFilterEnablePort0                 0x3827
#define CFG_DiFilterEnablePort1                 0x3828
#define CFG_DiFilterEnablePort2                 0x3829
#define CFG_DiFilterEnablePort3                 0x382a
#define CFG_DiFilterEnablePort4                 0x382b
#define CFG_DiFilterEnablePort5                 0x382c
#define CFG_DiFilterEnablePort6                 0x382d
#define CFG_DiFilterEnablePort7                 0x382e
#define CFG_DiFilterEnablePort8                 0x382f
#define CFG_DiFilterEnablePort9                 0x3830
#define CFG_DiFilterEnablePort10                0x3831
#define CFG_DiFilterEnablePort11                0x3832
#define CFG_DiFilterEnablePort12                0x3833
#define CFG_DiFilterEnablePort13                0x3834
#define CFG_DiFilterEnablePort14                0x3835
#define CFG_DiFilterEnablePort15                0x3836
#define CFG_DiFilterEnableForAll                0x3837

#define CFG_DiFilterIntervalCounter             0x3838

#define CFG_DiTriggerEnableRisingPort0_Name     "DiTriggerEnableRisingPort0"
#define CFG_DiTriggerEnableRisingPort1_Name     "DiTriggerEnableRisingPort1"
#define CFG_DiTriggerEnableRisingPort2_Name     "DiTriggerEnableRisingPort2"
#define CFG_DiTriggerEnableRisingPort3_Name     "DiTriggerEnableRisingPort3"
#define CFG_DiTriggerEnableRisingPort4_Name     "DiTriggerEnableRisingPort4"
#define CFG_DiTriggerEnableRisingPort5_Name     "DiTriggerEnableRisingPort5"
#define CFG_DiTriggerEnableRisingPort6_Name     "DiTriggerEnableRisingPort6"
#define CFG_DiTriggerEnableRisingPort7_Name     "DiTriggerEnableRisingPort7"
#define CFG_DiTriggerEnableRisingPort8_Name     "DiTriggerEnableRisingPort8"
#define CFG_DiTriggerEnableRisingPort9_Name     "DiTriggerEnableRisingPort9"
#define CFG_DiTriggerEnableRisingPort10_Name    "DiTriggerEnableRisingPort10"
#define CFG_DiTriggerEnableRisingPort11_Name    "DiTriggerEnableRisingPort11"
#define CFG_DiTriggerEnableRisingPort12_Name    "DiTriggerEnableRisingPort12"
#define CFG_DiTriggerEnableRisingPort13_Name    "DiTriggerEnableRisingPort13"
#define CFG_DiTriggerEnableRisingPort14_Name    "DiTriggerEnableRisingPort14"
#define CFG_DiTriggerEnableRisingPort15_Name    "DiTriggerEnableRisingPort15"
#define CFG_DiTriggerEnableRisingForAll_Name    "DiTriggerEnableRisingForAll"

#define CFG_DiTriggerEnableFallingPort0_Name    "DiTriggerEnableFallingPort0"
#define CFG_DiTriggerEnableFallingPort1_Name    "DiTriggerEnableFallingPort1"
#define CFG_DiTriggerEnableFallingPort2_Name    "DiTriggerEnableFallingPort2"
#define CFG_DiTriggerEnableFallingPort3_Name    "DiTriggerEnableFallingPort3"
#define CFG_DiTriggerEnableFallingPort4_Name    "DiTriggerEnableFallingPort4"
#define CFG_DiTriggerEnableFallingPort5_Name    "DiTriggerEnableFallingPort5"
#define CFG_DiTriggerEnableFallingPort6_Name    "DiTriggerEnableFallingPort6"
#define CFG_DiTriggerEnableFallingPort7_Name    "DiTriggerEnableFallingPort7"
#define CFG_DiTriggerEnableFallingPort8_Name    "DiTriggerEnableFallingPort8"
#define CFG_DiTriggerEnableFallingPort9_Name    "DiTriggerEnableFallingPort9"
#define CFG_DiTriggerEnableFallingPort10_Name   "DiTriggerEnableFallingPort10"
#define CFG_DiTriggerEnableFallingPort11_Name   "DiTriggerEnableFallingPort11"
#define CFG_DiTriggerEnableFallingPort12_Name   "DiTriggerEnableFallingPort12"
#define CFG_DiTriggerEnableFallingPort13_Name   "DiTriggerEnableFallingPort13"
#define CFG_DiTriggerEnableFallingPort14_Name   "DiTriggerEnableFallingPort14"
#define CFG_DiTriggerEnableFallingPort15_Name   "DiTriggerEnableFallingPort15"
#define CFG_DiTriggerEnableFallingForAll_Name   "DiTriggerEnableFallingForAll"

#define CFG_DiFilterEnablePort0_Name            "DiFilterEnablePort0"
#define CFG_DiFilterEnablePort1_Name            "DiFilterEnablePort1"
#define CFG_DiFilterEnablePort2_Name            "DiFilterEnablePort2"
#define CFG_DiFilterEnablePort3_Name            "DiFilterEnablePort3"
#define CFG_DiFilterEnablePort4_Name            "DiFilterEnablePort4"
#define CFG_DiFilterEnablePort5_Name            "DiFilterEnablePort5"
#define CFG_DiFilterEnablePort6_Name            "DiFilterEnablePort6"
#define CFG_DiFilterEnablePort7_Name            "DiFilterEnablePort7"
#define CFG_DiFilterEnablePort8_Name            "DiFilterEnablePort8"
#define CFG_DiFilterEnablePort9_Name            "DiFilterEnablePort9"
#define CFG_DiFilterEnablePort10_Name           "DiFilterEnablePort10"
#define CFG_DiFilterEnablePort11_Name           "DiFilterEnablePort11"
#define CFG_DiFilterEnablePort12_Name           "DiFilterEnablePort12"
#define CFG_DiFilterEnablePort13_Name           "DiFilterEnablePort13"
#define CFG_DiFilterEnablePort14_Name           "DiFilterEnablePort14"
#define CFG_DiFilterEnablePort15_Name           "DiFilterEnablePort15"
#define CFG_DiFilterEnableForAll_Name           "DiFilterEnableForAll"

#define CFG_DiFilterIntervalCounter_Name        "DiFilterIntervalCounter"

#define CFG_IDiTriggerEnableRisingChannel0      0x3A00
#define CFG_IDiTriggerEnableRisingChannel1      0x3A01
#define CFG_IDiTriggerEnableFallingChannel0     0x3A80
#define CFG_IDiTriggerEnableFallingChannel1     0x3A81

#define CFG_IDiTriggerEnableRisingChannel0_Name           "CFG_IDiTriggerEnableRisingChannel0"
#define CFG_IDiTriggerEnableRisingChannel1_Name           "CFG_IDiTriggerEnableRisingChannel1"
#define CFG_IDiTriggerEnableFallingChannel0_Name          "CFG_IDiTriggerEnableFallingChannel0"
#define CFG_IDiTriggerEnableFallingChannel1_Name          "CFG_IDiTriggerEnableFallingChannel1"


#define CFG_DiTriggerEnableRisingChannel0       0x3C00 
#define CFG_DiTriggerEnableRisingChannel1       0x3C01
#define CFG_DiTriggerEnableFallingChannel0      0x3C80
#define CFG_DiTriggerEnableFallingChannel1      0x3C81
#define CFG_DiDataWidth      			            0x3C82	  // Get DI data width. The optimized data width when Reading.
                                                           // Find the used value from Variable Group.
                                                           // Data type: LONG.   

#define CFG_DiChannelCount                      0x3C83     // Get DI Channel Count. Max available DI channel count on the card.
                                                           // Data type: LONG. 

#define CFG_DiPortCount                         0x3C84     // Get DI Port Count. Max available DI Port count on the card. 
                                                           // Data type: LONG.


// Get DI Interrupt supported channel.
// 
// Data type: BYTE Array. 
//     One bit for one channel. If a bit is 1, 
//     the channel can issue interrupt.
#define CFG_DiInterruptSupportedChannel		   0x3C85
													

// Get / Set DI channels which issue interrupt on RISING Edge.
//      Note: whether this property can be set or not depends on device feature.
//
// Data type: BYTE Array. 
//     One bit for one channel. If a bit is 1, 
//     the channel will issue interrupt on rising edge.
#define CFG_DiInterruptTriggerOnRisingEdge	   0x3C86
													

// Get / Set DI channels which issue interrupt on FALLING Edge.
//      Note: whether this property can be set or not depends on device feature.
//
// Data type: BYTE Array. 
//     One bit for one channel. If a bit is 1, 
//     the channel will issue interrupt on falling edge.
#define CFG_DiInterruptTriggerOnFallingEdge	   0x3C87



// Get DI channels which support Status Change interrupt.
//  
// Data type: BYTE Array. 
//     One bit for one channel. If a bit is 1, 
//     the channel can issue interrupt when status changed.
#define CFG_DiStatusChangeSupportedChannel	   0x3C88


// Get/Set DI channels which "Status Changed interrupt" function is enabled.
// 
// Data type: BYTE Array. 
//    One bit for one channel. If a bit is 1, 
//    the channel will issue interrupt when status changed.
#define CFG_DiStatusChangeEnabledChannel	      0x3C89


// Get DI channels which support pattern match interrupt.
//  
// Data type: BYTE Array. 
//     One bit for one channel. If a bit is 1, 
//     the channel can issue interrupt when pattern matched.
#define CFG_DiPatternMatchSupportedChannel	   0x3C8A


// Get/Set DI channels which "pattern match interrupt" function is enabled.
// 
// Data type: BYTE Array. 
//    One bit for one channel. If a bit is 1, 
//    the channel will issue interrupt when pattern matched.
#define CFG_DiPatternMatchEnabledChannel	      0x3C8B

// Get DI Interrupt supported trigger mode.
// 
// Data type: LONG. 
//     which trigger mode was supported.
#define CFG_DiInterruptSupportedTriggerMode     0x3C8C

// Get DI Pattern Match capability:
//     Wether the mask of this port can be set individually.
// Data Type: 
//     BYTE Array.
//     One byte for a port. If the byte is 1, then the mask
//     of this port can be set individually, otherwise it
//     can't be done. 
//     Note: if this property is not supported, it means that
//     the mask can be set individually too.
#define CFG_DiPatternMatchMaskSupportedPort     0x3C8D

// Get DI Status Change capability:
//     Wether the mask of this port can be set individually.
// Data Type: 
//     BYTE Array.
//     One byte for a port. If the byte is 1, then the mask
//     of this port can be set individually, otherwise it
//     can't be done. 
//     Note: if this property is not supported, it means that
//     the mask can be set individually too.
#define CFG_DiStatusChangeMaskSupportedPort      0x3C8E


#define CFG_DiTriggerEnableRisingChannel0_Name           "CFG_DiTriggerEnableRisingChannel0"
#define CFG_DiTriggerEnableRisingChannel1_Name           "CFG_DiTriggerEnableRisingChannel1"
#define CFG_DiTriggerEnableFallingChannel0_Name          "CFG_DiTriggerEnableFallingChannel0"
#define CFG_DiTriggerEnableFallingChannel1_Name          "CFG_DiTriggerEnableFallingChannel1"

// Get / set DI Transfer Request mode
//
// Data type: ULONG
//     0: slave mode, 1 master mode
#define CFG_DiTransferRequestMode                  0x3C8F

// Get Or Set DI Interrupt Mode:
//
// Data type: BYTE ARRAY
//     One byte for a port. The Interrupt mode's explanation varies  with different card
#define CFG_DiInterruptMode                   0x3C90


///////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// ----------------------------------
// 0x4000 ~ 0x4fff for DO Group 
// ----------------------------------
// sub group 0x4000 ~ 0x47ff for DO General ID

// sub group 0x4800 ~ 0x4fff for DO others ID
// Fast DO functions paramaters
#define CFG_DoOperationMode   0x4800     // Normal (0), Handahaking (1), Burst handshaking(2)
#define CFG_DoStartMethod     0x4801     // Software(1), External signal(2)
#define CFG_DoStopMethod      0x4802     // Software(1), External signal(2)
#define CFG_DoPacerSource     0x4803     // 30, 15, 10 Mhz, Counter1, External signal (value range 1-5)
#define CFG_DoControlSignals  0x4804     // Control signals 
                                         //   Bit 0: External DO start signal control (STRRF), 0 rising edge, 1 falling edge. 
                                         //   Bit 1: External DO stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                         //   Bit 2: DO request signal control (REQRF), 0 rising edge, 1 falling edge.
                                         //   Bit 3: DO acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                         //   Bit 4: DO sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
#define CFG_DoPresetValue     0x4805     // DO status before transfering. 


// Get DO data width. The optimized data width when writing.
//  
// Data type: LONG. 
//     See the following for all available setting.
#define CFG_DoDataWidth       0x4806	

// Get DO Channel Count. Max available DO channel count on the card.
//  
// Data type: LONG. 
#define CFG_DoChannelCount    0x4807	   


// Get Do Port Count. Max available DO Port count on the card. 
// 
// Data type: LONG.
#define CFG_DoPortCount       0x4808


#define CFG_DoOperationMode_Name   "DoOperationMode"  
#define CFG_DoStartMethod_Name     "DoStartMethod"     
#define CFG_DoStopMethod_Name      "DoStopMethod"      
#define CFG_DoPacerSource_Name     "DoPacerSource"     
#define CFG_DoControlSignals_Name  "DoControlSignals"
#define CFG_DoPresetValue_Name     "DoPresetValue"    


// Get / set DO Transfer Request mode
//
// Data type: ULONG
//     0: slave mode, 1 master mode
#define CFG_DoTransferRequestMode   0x4809

// ---------------------------------------
// 0x5000 ~ 0x5fff for Counter/Timer  
// ---------------------------------------
// sub group 0x5000 ~ 0x57ff for Counter/Timer general ID
// Counter functions
#define CFG_CounterCountValue 0x5000 // 82C54 Counter 0-2 value

#define    CFG_CounterCountValue_Name "CounterCountValue" 

// ji.dong added for counter control. 2005-06-01..........................

// Get Counter channels' capability.
//  
// Data type: Long Array. 
//     One 'Long' for one channel, each bit of the long indicates
// a specified function whether is available or not and the
// following function has been defined. 
//     
#define CFG_CntrChannelCapability         0x5001

// Get supported gate of the counter.
//  
// Data type: Long. 
//     Each bit for a specified gate mode and the
// following mode has been defined. 
//     
#define CFG_CntrSupportedGateMode      0x5002


// Get supported counting edge of the counter.
//  
// Data type: Long. 
//     Each bit for a specified counting edge and the
// following bit has been defined. 
//     
#define CFG_CntrSupportedCountEdge     0x5003

// Get supported output mode of the counter when terminal count reached.
//  
// Data type: Long. 
//     Each bit for a specified output mode and the
// following mode has been defined. 
//     
#define CFG_CntrSupportedOutMode       0x5004

// Get available special api of the counter
//  
// Data type: Long. 
//     Each bit for a specified api and the
// following has been defined. 
//     
#define CFG_CntrAvailableAPI          0x5005

// Get event id of the channel which can issue event.
//  
// Data type: USHORT Array. 
//     One 'USHORT' for one channel, 0 indicates the channel can't
// issue event.
#define CFG_CntrChannelEventID        0x5006

// Get the internal clock frequence device used for pulse out, 
// PWModulation or timer interrupt, etc...
//
// Data type: float array. 
//     Each element of array is a clock frequence value the device 
// supported and the frequence should be sorted from lower to higher.
//
#define CFG_CntrInternalClockFreq     0x5007

// Get the validate range of period and HiPeriod of PWModulation function.
// data type: float array
//      the data order in array: 
//      [min_period][max_period][min_hiperiod][max_hiperiod]
//
#define CFG_CntrPWModulateValidRange  0x5008

// Get the counter channel count
// data type: LONG
#define CFG_CntrChannelCount          0x5009

// Get the counter resolution
// data type: LONG array
#define CFG_CntrResolution            0x5010

// Get the counter initialization value or write the counter as timer divider 
// data type: ULONG array
//            One 'ULONG' for one counter channel
/*
#define CFG_CounterCountValue         0x5011
*/

// Get or set the counter reset value
// data type: ULONG array
#define CFG_CntrResetValue            0x5011

// Get the counter supported event type
// data type: LONG array
//            One 'LONG' for one event type
#define CFG_Cntr0SupportedEventType   0x5012
#define CFG_Cntr1SupportedEventType   0x5013
#define CFG_Cntr2SupportedEventType   0x5014
#define CFG_Cntr3SupportedEventType   0x5015
#define CFG_Cntr4SupportedEventType   0x5016

// Get the counter supported lock type
// data type: LONG array 
#define CFG_CntrSupportedCounterLock 0x5017

// Get or set the counter lock 
// data type: LONG array
#define CFG_CntrCounterLockControl   0x5018

// Get the counter supported indicator type
// data type: LONG array
#define CFG_CntrSupportedIndicator   0x5019

// Get or set the counter indicator status 
// data type: LONG array
#define CFG_CntrIndicatorControl     0x5020

// Get the counter supported clock frequency
// data type: LONG array
#define CFG_Cntr0SupportedClockFrequency 0x5021
#define CFG_Cntr1SupportedClockFrequency 0x5022
#define CFG_Cntr2SupportedClockFrequency 0x5023
#define CFG_Cntr3SupportedClockFrequency 0x5024
#define CFG_Cntr4SupportedClockFrequency 0x5025

// Get or set the current counter clock frequency
// data type: LONG array
#define CFG_CntrClockFrequency        0x5026  

// Get the counter supported input mode
// data type: LONG array
#define CFG_Cntr0SupportedInputMode   0x5027
#define CFG_Cntr1SupportedInputMode   0x5028
#define CFG_Cntr2SupportedInputMode   0x5029
#define CFG_Cntr3SupportedInputMode   0x5030

// Get or set the current counter input mode
// data type: LONG array
#define CFG_CntrInputModeControl      0x5031

// Get or set counter compare data
// data type: ULONG array
#define CFG_CntrCompareData           0x5032

// Enable or Disable counter digital filter 
// data type: LONG array
#define CFG_CntrDigitalFilter         0x5033

// Enable or Disable
// data type: LONG
#define CFG_CntrIndexReset            0x5034

//For Frequency measure of PCM3810I
#define CFG_CntrFreqMeasGateSrc       0x5035

// sub group 0x5800 ~ 0x5fff for counter/Timer general ID

// ---------------------------------------
// 0x6000 ~ 0x6fff for Other function related
// ---------------------------------------
// sub group 0x6000 ~ 0x6fff for Other function related ID
// Interrupt functions
#define CFG_IrqDiChangeStatusChannel  0x6000       // Change status channel number.
#define CFG_IrqDiTriggerSignals       0x6001       // Each bit for each Auxiliary DIO channel

#define CFG_IrqDiChangeStatusChannel_Name  "IrqDiChangeStatusChannel"  
#define CFG_IrqDiTriggerSignals_Name       "IrqDiTriggerSignals"       
#define CFG_LoopBackTest              0x6002       // Loop back test for MIC-3755
//\\\\\\\\\\\\\\\\\\\\\\\\\\\\2.2//////////////////////////////////////
#define CFG_WatchdogCounter  0x7000       // Watchdog counter.
#define CFG_DoWatchdogValue  0x7001       //Do status when watchdog overflow.
#define CFG_WatchdogCounter_Name  "WatchdogCounter"  
#define CFG_DoWatchdogValue_Name  "DoWatchdogValue"
#define CFG_EEPROM_RWBYTE    0x8000       // Read/Write a word to the EEPROM
#define CFG_PrivateHWRegionSize 0x8001    // Customer private region size 32 bytes
//////////////////////////////2.2\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


// ============================================================================
// Constant Variable Group
// ============================================================================

// Used by CFG_DioPortType ID
#define DIO_PortType_DI             0x0   // input port
#define DIO_PortType_DO             0x1   // output port
#define DIO_PortType_SeperateDIO    0x2   // di-direction port
#define DIO_PortType_8255_PortA     0x3   // 8255 mode 0 port A type
#define DIO_PortType_8255_PortC     0x4   // 8255 mode 0 port C type
#define DIO_PortType_Individual     0x5   // each channel can be set individually

// Used by CFG_DioChannelDirection ID
#define DIO_ChannelDir_DI           ((DWORD)0)
#define DIO_ChannelDir_DO           ((DWORD)0x000000ff)
#define DIO_ChannelDir_LowHalf_DO   ((DWORD)0x0000000f)
#define DIO_ChannelDir_HighHalf_DO  ((DWORD)0x000000f0)
#define DIO_ChannelDir_Invalid      ((DWORD)0xffffffff)
#define DIO_ChannelDir_SeperateDIO  ((DWORD)0x0000ff00)

// Used by CFG_DiDataWidth ID
#define DI_DataWidth_Byte           0x0
#define DI_DataWidth_Word           0x1
#define DI_DataWidth_DWORD          0x2

// used by CFG_DoDataWidth ID
#define DO_DataWidth_Byte           0x0
#define DO_DataWidth_Word           0x1
#define DO_DataWidth_Dword          0x2

// used by CFG_DiInterruptSupportedTriggerMode ID
#define DI_Int_SingleEdgeTrigger    0x0      // trigger on rising or falling edge.
#define DI_Int_DualEdgeTrigger      0x1      // trigger on rising or falling or both edge.


// used by CFG_CntrChannelCapability
#define CNTR_ChlCap_EventCounting         0x1        //bit 0
#define CNTR_ChlCap_FreqMeasurement       0x2        //bit 1
#define CNTR_ChlCap_PulseWidthMeasurement 0x4        //bit 2
#define CNTR_ChlCap_TimerInterrupt        0x8        //bit 3
#define CNTR_ChlCap_CounterInterrupt      0x10       //bit 4
#define CNTR_ChlCap_PulseWidthModulation  0x20       //bit 5
#define CNTR_ChlCap_PulseOut              0x40       //bit 6
#define CNTR_ChlCap_FreqOut               0x80       //bit 7
#define CNTR_ChlCap_WatchDogTimer         0x100      //bit 8
#define CNTR_ChlCap_CascadeWithNext       0x200      //bit 9
#define CNTR_ChlCap_CascadeWithPrev       0x400      //bit 10

// used by CFG_CntrSupportedGateMode
#define CNTR_GateMode_NoGate           0x1  // no gate signal( the gate will be set by software internally).
#define CNTR_GateMode_HighLevel        0x2  // High level active
#define CNTR_GateMode_LowLevel         0x4  // Low  level active

// used by CFG_CntrSupportedCountEdge
#define CNTR_CountEdge_RisingEdge      0x1  // Rising edge counting
#define CNTR_CountEdge_FallingEdge     0x2  // Falling edge counting

// used by CFG_CntrSupportedOutMode
#define CNTR_OutMode_HighPulse         0x1  // Pin OUT_N outputs high pulse when the terminal count reached.
#define CNTR_OutMode_LowPulse          0x2  // Pin OUT_N outputs low pulse when the terminal count reached.
#define CNTR_OutMode_LowToHigh         0x4  // Pin OUT_N toggles from low to high when the terminal count reached.
#define CNTR_OutMode_HighToLow         0x8  // Pin OUT_N toggles from high to low when the terminal count reached.

// used by CFG_CntrAvailableAPI
#define CNTR_API_CounterConfig        0x1   // DRV_CounterConfig exists
#define CNTR_API_DICounterReset       0x2   // DRV_DICounterReset exists
#define CNTR_API_QCounterAPI          0x4   // DRV_QCounterXXX exists

#define SCAN_CLOCK_NOT_USE            0x0
#define SCAN_CLOCK_INTERNAL           0x1
#define SCAN_CLOCK_EXTERNAL           0x2

#endif
