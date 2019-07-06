Module ADSNETVB

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

    ' File:        ADSNET.VB
    ' Created:     11/10/2003
    ' Description: Event type and parameters definition module file for vb.net.
    ' ============================================================================
    ' VERSION HISTORY
    ' 01/08/2003  Create
    ' ============================================================================
    ' Notes:
    ' 1. Bit-mapped ID:
    '    From 0x0001 to 0x0200 : defined at Driver.h, BIT-mapped Event ID.
    '    From 0x0201 to 0x0205 : defined at Driver.h  ID-mapped Event ID.
    '    From 0x0206 to 0x0fff : not used
    '    From 0x1000 to 0xffff : defined at Event.h   ID-mapped Event ID.
    '
    ' 2. Version 2.0A and before don't use Event.h.
    '
    ' 3. EventID = 0x0000 is reserved for non event or error.
    '    EventID = 0xffff is reserved for time out.
    '
    ' 4. The sub event naming standard from 0x1000 to 0x6fff:
    '      0x1000 ~ 0x1fff    for AI Event Group
    '         0x1000 ~ 0x17ff for General AI Event ID
    '         0x1800 ~ 0x18ff for AI others Event ID
    '      0x2000 ~ 0x2fff    for AO Event Group
    '         0x2000 ~ 0x27ff for General AO Event ID
    '         0x2800 ~ 0x28ff for AO others Event ID
    '      0x3000 ~ 0x3fff    for DI Event Group
    '         0x3000 ~ 0x30ff for General DI Event ID
    '         0x3400 ~ 0x34ff for General IDI Event ID
    '         0x3800 ~ 0x3fff for others Event ID
    '      0x4000 ~ 0x4fff for DO Event Group
    '         0x4000 ~ 0x47ff for DO Gernal Event ID
    '         0x4800 ~ 0x48ff for DO others Event ID
    '      0x5000 ~ 0x5fff for Counter/Timer Event Group
    '         0x5000 ~ 0x50ff for Counter TC Event ID
    '         0x5100 ~ 0x51ff for counter OverFlow Event ID
    '         0x5200 ~ 0x52ff for counter UnderFlow Event ID
    '         0x5300 ~ 0x53ff for counter OverCompare Event ID
    '         0x5400 ~ 0x54ff for counter UnderCompare Event ID
    '         0x5500 ~ 0x55ff for General Timer Event ID
    '         0x5800 ~ 0x58ff for Counter/Timer others Event ID
    '      0x6000 ~ 0x6fff not used at Version 2.0B

   '****************************************************************************************************
   
    ' Event
   
    '****************************************************************************
    '   define event type for interrupt and DMA transfer
    '****************************************************************************
    Public Const ADS_EVT_INTERRUPT As Short = &H1S ' interrupt
    Public Const ADS_EVT_BUFCHANGE As Short = &H2S ' buffer change
    Public Const ADS_EVT_TERMINATED As Short = &H4S ' termination
    Public Const ADS_EVT_OVERRUN As Short = &H8S ' overrun
    Public Const ADS_EVT_WATCHDOG As Short = &H10S ' watchdog actived
    Public Const ADS_EVT_CHGSTATE As Short = &H20S ' change state event
    Public Const ADS_EVT_ALARM As Short = &H40S ' alarm event
    Public Const ADS_EVT_PORT0 As Short = &H80S ' port 0 event
    Public Const ADS_EVT_PORT1 As Short = &H100S ' port 1 event
    Public Const ADS_EVT_PATTERNMATCH As Short = &H200S ' Pattern Match for DI
    Public Const ADS_EVT_COUNTER As Short = &H201S ' Persudo event for COUNTERMATCH and COUNTEROVERFLOW
    Public Const ADS_EVT_COUNTERMATCH As Short = &H202S ' Counter Match setting NO. for DI
    Public Const ADS_EVT_COUNTEROVERFLOW As Short = &H203S ' Counter Overflow for DI
    Public Const ADS_EVT_STATUSCHANGE As Short = &H204S ' Status Change for DI
    Public Const ADS_EVT_FILTER As Short = &H205S ' Filter Event

    '****************************************************************************
    '    define event name by device number
    '****************************************************************************
    Public Const ADS_EVT_INTERRUPT_NAME As String = "ADS_EVT_INTERRUPT"
    Public Const ADS_EVT_BUFCHANGE_NAME As String = "ADS_EVT_BUFCHANGE"
    Public Const ADS_EVT_TERMINATED_NAME As String = "ADS_EVT_TERMINATED"
    Public Const ADS_EVT_OVERRUN_NAME As String = "ADS_EVT_OVERRUN"
    Public Const ADS_EVT_WATCHDOG_NAME As String = "ADS_EVT_WATCHDOG"
    Public Const ADS_EVT_CHGSTATE_NAME As String = "ADS_EVT_CHGSTATE"
    Public Const ADS_EVT_ALARM_NAME As String = "ADS_EVT_ALARM"
    Public Const ADS_EVT_PATTERNMATCH_NAME As String = "ADS_EVT_PATTERNMATCH"
    Public Const ADS_EVT_COUNTERMATCH_NAME As String = "ADS_EVT_COUNTERMATCH"
    Public Const ADS_EVT_COUNTEROVERFLOW_NAME As String = "ADS_EVT_COUNTEROVERFLOW"
    Public Const ADS_EVT_STATUSCHANGE_NAME As String = "ADS_EVT_STATUSCHANGE"


 ' ==================================
    ' 0x0000 and 0xffff
    ' ----------------------------------
    Public Const ADS_EVT_NO_EVENT = &H0
    Public Const ADS_EVT_TIME_OUT = &HFFFF

    ' ==================================
    ' 0x1000 ~ 0x1fff for AI Group
    ' ----------------------------------
    'sub group 0x1800 ~ 0x18ff for AI others Event ID
    Public Const ADS_EVT_AI_BUFFER1_FULL = &H1800
    Public Const ADS_EVT_AI_BUFFER2_FULL = &H1801

    Public Const ADS_EVT_AI_BUFFER1_FULL_NAME = "ADS_EVT_AI_BUFFER1_FULL"
    Public Const ADS_EVT_AI_BUFFER2_FULL_NAME = "ADS_EVT_AI_BUFFER2_FULL"

    ' ----------------------------------
    ' 0x2000 ~ 0x2fff for AO Group
    ' ----------------------------------
    ' sub group 0x2000 ~ 0x27ff for AO General ID

    ' sub group 0x2800 ~ 0x28ff for AO oters Event ID
    Public Const ADS_EVT_AO_BUFFER1_EMPTY = &H2800
    Public Const ADS_EVT_AO_BUFFER2_EMPTY = &H2801

    Public Const ADS_EVT_AO_BUFFER1_FULL_NAME = "ADS_EVT_AO_BUFFER1_FULL"
    Public Const ADS_EVT_AO_BUFFER2_FULL_NAME = "ADS_EVT_AO_BUFFER2_FULL"

    ' ----------------------------------
    ' 0x3000 ~ 0x3fff for DI Group
    ' ----------------------------------
    ' sub group 0x3000 ~ 0x30ff for DI General ID
    Public Const ADS_EVT_INTERRUPT_DI0 = &H3000
    Public Const ADS_EVT_INTERRUPT_DI1 = (ADS_EVT_INTERRUPT_DI0 + 1)
    Public Const ADS_EVT_INTERRUPT_DI2 = (ADS_EVT_INTERRUPT_DI0 + 2)
    Public Const ADS_EVT_INTERRUPT_DI3 = (ADS_EVT_INTERRUPT_DI0 + 3)
    Public Const ADS_EVT_INTERRUPT_DI4 = (ADS_EVT_INTERRUPT_DI0 + 4)
    Public Const ADS_EVT_INTERRUPT_DI5 = (ADS_EVT_INTERRUPT_DI0 + 5)
    Public Const ADS_EVT_INTERRUPT_DI6 = (ADS_EVT_INTERRUPT_DI0 + 6)
    Public Const ADS_EVT_INTERRUPT_DI7 = (ADS_EVT_INTERRUPT_DI0 + 7)

    Public Const ADS_EVT_INTERRUPT_DI0_NAME = "ADS_EVT_INTERRUPT_DI0"
    Public Const ADS_EVT_INTERRUPT_DI1_NAME = "ADS_EVT_INTERRUPT_DI1"
    Public Const ADS_EVT_INTERRUPT_DI2_NAME = "ADS_EVT_INTERRUPT_DI2"
    Public Const ADS_EVT_INTERRUPT_DI3_NAME = "ADS_EVT_INTERRUPT_DI3"
    Public Const ADS_EVT_INTERRUPT_DI4_NAME = "ADS_EVT_INTERRUPT_DI4"
    Public Const ADS_EVT_INTERRUPT_DI5_NAME = "ADS_EVT_INTERRUPT_DI5"
    Public Const ADS_EVT_INTERRUPT_DI6_NAME = "ADS_EVT_INTERRUPT_DI6"
    Public Const ADS_EVT_INTERRUPT_DI7_NAME = "ADS_EVT_INTERRUPT_DI7"

    ' sub group 0x3400 ~ 0x37ff for General IDI Event ID
    Public Const ADS_EVT_INTERRUPT_IDI0 = &H3400
    Public Const ADS_EVT_INTERRUPT_IDI1 = (ADS_EVT_INTERRUPT_IDI0 + 1)
    Public Const ADS_EVT_INTERRUPT_IDI2 = (ADS_EVT_INTERRUPT_IDI0 + 2)
    Public Const ADS_EVT_INTERRUPT_IDI3 = (ADS_EVT_INTERRUPT_IDI0 + 3)
    Public Const ADS_EVT_INTERRUPT_IDI4 = (ADS_EVT_INTERRUPT_IDI0 + 4)
    Public Const ADS_EVT_INTERRUPT_IDI5 = (ADS_EVT_INTERRUPT_IDI0 + 5)
    Public Const ADS_EVT_INTERRUPT_IDI6 = (ADS_EVT_INTERRUPT_IDI0 + 6)
    Public Const ADS_EVT_INTERRUPT_IDI7 = (ADS_EVT_INTERRUPT_IDI0 + 7)
    Public Const ADS_EVT_INTERRUPT_IDI16 = (ADS_EVT_INTERRUPT_IDI0 + 16)
    Public Const ADS_EVT_INTERRUPT_IDI17 = (ADS_EVT_INTERRUPT_IDI0 + 17)

    Public Const ADS_EVT_INTERRUPT_IDI0_NAME = "ADS_EVT_INTERRUPT_IDI0"
    Public Const ADS_EVT_INTERRUPT_IDI1_NAME = "ADS_EVT_INTERRUPT_IDI1"
    Public Const ADS_EVT_INTERRUPT_IDI2_NAME = "ADS_EVT_INTERRUPT_IDI2"
    Public Const ADS_EVT_INTERRUPT_IDI3_NAME = "ADS_EVT_INTERRUPT_IDI3"
    Public Const ADS_EVT_INTERRUPT_IDI4_NAME = "ADS_EVT_INTERRUPT_IDI4"
    Public Const ADS_EVT_INTERRUPT_IDI5_NAME = "ADS_EVT_INTERRUPT_IDI5"
    Public Const ADS_EVT_INTERRUPT_IDI6_NAME = "ADS_EVT_INTERRUPT_IDI6"
    Public Const ADS_EVT_INTERRUPT_IDI7_NAME = "ADS_EVT_INTERRUPT_IDI7"
    Public Const ADS_EVT_INTERRUPT_IDI16_NAME = "ADS_EVT_INTERRUPT_IDI16"
    Public Const ADS_EVT_INTERRUPT_IDI17_NAME = "ADS_EVT_INTERRUPT_IDI17"

    ' sub group 0x38000 ~ 0x3fff for DI General ID
    Public Const ADS_EVT_FIFO_OVERFLOW_DI = &H3800
    Public Const ADS_EVT_FIFO_UNDERFLOW_DI = &H3801
    Public Const ADS_EVT_BUFFER1_FULL_DI = &H3802
    Public Const ADS_EVT_BUFFER2_FULL_DI = &H3803
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\
    Public Const ADS_EVT_DI_LOBUFREADY = &H3804
    Public Const ADS_EVT_DI_HIBUFREADY = &H3805
    Public Const ADS_EVT_DI_TERMINATED = &H3810
    Public Const ADS_EVT_DI_OVERRUN = &H3811
    Public Const ADS_EVT_DI_PATTERNMATCH = &H3812
    Public Const ADS_EVT_DI_STATUSCHANGE = &H3813
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\

    Public Const ADS_EVT_FIFO_OVERFLOW_DI_NAME = "ADS_EVT_FIFO_OVERFLOW_DI"
    Public Const ADS_EVT_FIFO_UNDERFLOW_DI_NAME = "ADS_EVT_FIFO_UNDERFLOW_DI"
    Public Const ADS_EVT_BUFFER1_FULL_DI_NAME = "ADS_EVT_BUFFER1_FULL_DI"
    Public Const ADS_EVT_BUFFER2_FULL_DI_NAME = "ADS_EVT_BUFFER2_FULL_DI"
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\
    Public Const ADS_EVT_DI_LOBUFREADY_NAME = "ADS_EVT_DI_LOBUFREADY"
    Public Const ADS_EVT_DI_HIBUFREADY_NAME = "ADS_EVT_DI_HIBUFREADY"
    Public Const ADS_EVT_DI_TERMINATED_NAME = "ADS_EVT_DI_TERMINATED"
    Public Const ADS_EVT_DI_OVERRUN_NAME = "ADS_EVT_DI_OVERRUN"
    Public Const ADS_EVT_DI_PATTERNMATCH_NAME = "ADS_EVT_DI_PATTERNMATCH"
    Public Const ADS_EVT_DI_STATUSCHANGE_NAME = "ADS_EVT_DI_STATUSCHANGE"
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\

    ' ----------------------------------
    ' 0x4000 ~ 0x4fff for DO Group
    ' ----------------------------------
    ' sub group 0x4000 ~ 0x47ff for DO General ID

    ' sub group 0x4800 ~ 0x4fff for DO others ID
    Public Const ADS_EVT_FIFO_OVERFLOW_DO = &H4800
    Public Const ADS_EVT_FIFO_UNDERFLOW_DO = &H4801
    Public Const ADS_EVT_BUFFER1_EMPTY_DO = &H4802
    Public Const ADS_EVT_BUFFER2_EMPTY_DO = &H4803
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\
    Public Const ADS_EVT_DO_LOBUFTRANS = &H4804
    Public Const ADS_EVT_DO_HIBUFTRANS = &H4805
    Public Const ADS_EVT_DO_TERMINATED = &H4810
    Public Const ADS_EVT_DO_UNDERRUN = &H4811
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\

    Public Const ADS_EVT_FIFO_OVERFLOW_DO_NAME = "ADS_EVT_FIFO_OVERFLOW_DO"
    Public Const ADS_EVT_FIFO_UNDERFLOW_DO_NAME = "ADS_EVT_FIFO_UNDERFLOW_DO"
    Public Const ADS_EVT_BUFFER1_EMPTY_DO_NAME = "ADS_EVT_BUFFER1_EMPTY_DO"
    Public Const ADS_EVT_BUFFER2_EMPTY_DO_NAME = "ADS_EVT_BUFFER2_EMPTY_DO"
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\
    Public Const ADS_EVT_DO_LOBUFTRANS_NAME = "ADS_EVT_DO_LOBUFTRANS"
    Public Const ADS_EVT_DO_HIBUFTRANS_NAME = "ADS_EVT_DO_HIBUFTRANS"
    Public Const ADS_EVT_DO_TERMINATED_NAME = "ADS_EVT_DO_TERMINATED"
    Public Const ADS_EVT_DO_UNDERRUN_NAME = "ADS_EVT_DO_UNDERRUN"
    '/////////////////// V2.0C \\\\\\\\\\\\\\\\\


    ' ---------------------------------------
    ' 0x5000 ~ 0x5fff for Counter/Timer
    ' ---------------------------------------
    ' sub group 0x5000 ~ 0x57ff for Counter/Timer genral ID
    Public Const ADS_EVT_TERMINATE_CNT0 = &H5000
    Public Const ADS_EVT_TERMINATE_CNT1 = (ADS_EVT_TERMINATE_CNT0 + 1)
    Public Const ADS_EVT_TERMINATE_CNT2 = (ADS_EVT_TERMINATE_CNT0 + 2)
    Public Const ADS_EVT_TERMINATE_CNT3 = (ADS_EVT_TERMINATE_CNT0 + 3)
    Public Const ADS_EVT_TERMINATE_CNT4 = (ADS_EVT_TERMINATE_CNT0 + 4)
    Public Const ADS_EVT_TERMINATE_CNT5 = (ADS_EVT_TERMINATE_CNT0 + 5)
    Public Const ADS_EVT_TERMINATE_CNT6 = (ADS_EVT_TERMINATE_CNT0 + 6)
    Public Const ADS_EVT_TERMINATE_CNT7 = (ADS_EVT_TERMINATE_CNT0 + 7)

    Public Const ADS_EVT_TERMINATE_CNT0_NAME = "ADS_EVT_TERMINATE_CNT0"
    Public Const ADS_EVT_TERMINATE_CNT1_NAME = "ADS_EVT_TERMINATE_CNT1"
    Public Const ADS_EVT_TERMINATE_CNT2_NAME = "ADS_EVT_TERMINATE_CNT2"
    Public Const ADS_EVT_TERMINATE_CNT3_NAME = "ADS_EVT_TERMINATE_CNT3"
    Public Const ADS_EVT_TERMINATE_CNT4_NAME = "ADS_EVT_TERMINATE_CNT4"
    Public Const ADS_EVT_TERMINATE_CNT5_NAME = "ADS_EVT_TERMINATE_CNT5"
    Public Const ADS_EVT_TERMINATE_CNT6_NAME = "ADS_EVT_TERMINATE_CNT6"
    Public Const ADS_EVT_TERMINATE_CNT7_NAME = "ADS_EVT_TERMINATE_CNT7"

    ' sub group 0x5100 ~ 0x51ff for counter overflow Event ID
    Public Const ADS_EVT_OVERFLOW_CNT0 = &H5100
    Public Const ADS_EVT_OVERFLOW_CNT1 = (ADS_EVT_OVERFLOW_CNT0 + 1)
    Public Const ADS_EVT_OVERFLOW_CNT2 = (ADS_EVT_OVERFLOW_CNT0 + 2)
    Public Const ADS_EVT_OVERFLOW_CNT3 = (ADS_EVT_OVERFLOW_CNT0 + 3)
    Public Const ADS_EVT_OVERFLOW_CNT4 = (ADS_EVT_OVERFLOW_CNT0 + 4)
    Public Const ADS_EVT_OVERFLOW_CNT5 = (ADS_EVT_OVERFLOW_CNT0 + 5)
    Public Const ADS_EVT_OVERFLOW_CNT6 = (ADS_EVT_OVERFLOW_CNT0 + 6)
    Public Const ADS_EVT_OVERFLOW_CNT7 = (ADS_EVT_OVERFLOW_CNT0 + 7)

    Public Const ADS_EVT_OVERFLOW_CNT0_NAME = "ADS_EVT_OVERFLOW_CNT0"
    Public Const ADS_EVT_OVERFLOW_CNT1_NAME = "ADS_EVT_OVERFLOW_CNT1"
    Public Const ADS_EVT_OVERFLOW_CNT2_NAME = "ADS_EVT_OVERFLOW_CNT2"
    Public Const ADS_EVT_OVERFLOW_CNT3_NAME = "ADS_EVT_OVERFLOW_CNT3"
    Public Const ADS_EVT_OVERFLOW_CNT4_NAME = "ADS_EVT_OVERFLOW_CNT4"
    Public Const ADS_EVT_OVERFLOW_CNT5_NAME = "ADS_EVT_OVERFLOW_CNT5"
    Public Const ADS_EVT_OVERFLOW_CNT6_NAME = "ADS_EVT_OVERFLOW_CNT6"
    Public Const ADS_EVT_OVERFLOW_CNT7_NAME = "ADS_EVT_OVERFLOW_CNT7"

    ' sub group 0x5200 ~ 0x52ff for counter underflow Event ID
    Public Const ADS_EVT_UNDERFLOW_CNT0 = &H5200
    Public Const ADS_EVT_UNDERFLOW_CNT1 = (ADS_EVT_UNDERFLOW_CNT0 + 1)
    Public Const ADS_EVT_UNDERFLOW_CNT2 = (ADS_EVT_UNDERFLOW_CNT0 + 2)
    Public Const ADS_EVT_UNDERFLOW_CNT3 = (ADS_EVT_UNDERFLOW_CNT0 + 3)
    Public Const ADS_EVT_UNDERFLOW_CNT4 = (ADS_EVT_UNDERFLOW_CNT0 + 4)
    Public Const ADS_EVT_UNDERFLOW_CNT5 = (ADS_EVT_UNDERFLOW_CNT0 + 5)
    Public Const ADS_EVT_UNDERFLOW_CNT6 = (ADS_EVT_UNDERFLOW_CNT0 + 6)
    Public Const ADS_EVT_UNDERFLOW_CNT7 = (ADS_EVT_UNDERFLOW_CNT0 + 7)

    Public Const ADS_EVT_UNDERFLOW_CNT0_NAME = "ADS_EVT_UNDERFLOW_CNT0"
    Public Const ADS_EVT_UNDERFLOW_CNT1_NAME = "ADS_EVT_UNDERFLOW_CNT1"
    Public Const ADS_EVT_UNDERFLOW_CNT2_NAME = "ADS_EVT_UNDERFLOW_CNT2"
    Public Const ADS_EVT_UNDERFLOW_CNT3_NAME = "ADS_EVT_UNDERFLOW_CNT3"
    Public Const ADS_EVT_UNDERFLOW_CNT4_NAME = "ADS_EVT_UNDERFLOW_CNT4"
    Public Const ADS_EVT_UNDERFLOW_CNT5_NAME = "ADS_EVT_UNDERFLOW_CNT5"
    Public Const ADS_EVT_UNDERFLOW_CNT6_NAME = "ADS_EVT_UNDERFLOW_CNT6"
    Public Const ADS_EVT_UNDERFLOW_CNT7_NAME = "ADS_EVT_UNDERFLOW_CNT7"

    ' sub group 0x5300 ~ 0x53ff for counter OVER COMPARE Event ID

    ' sub group 0x5400 ~ 0x54ff for counter UNDER COMPARE Event ID

    ' sub group 0x5500 ~ 0x55ff for GENERAL TIMER Event ID
    Public Const ADS_EVT_INTERRUPT_TIMER0 = &H5500
    Public Const ADS_EVT_INTERRUPT_TIMER1 = (ADS_EVT_INTERRUPT_TIMER0 + 1)
    Public Const ADS_EVT_INTERRUPT_TIMER2 = (ADS_EVT_INTERRUPT_TIMER0 + 2)
    Public Const ADS_EVT_INTERRUPT_TIMER3 = (ADS_EVT_INTERRUPT_TIMER0 + 3)
    Public Const ADS_EVT_INTERRUPT_TIMER4 = (ADS_EVT_INTERRUPT_TIMER0 + 4)
    Public Const ADS_EVT_INTERRUPT_TIMER5 = (ADS_EVT_INTERRUPT_TIMER0 + 5)
    Public Const ADS_EVT_INTERRUPT_TIMER6 = (ADS_EVT_INTERRUPT_TIMER0 + 6)
    Public Const ADS_EVT_INTERRUPT_TIMER7 = (ADS_EVT_INTERRUPT_TIMER0 + 7)

    Public Const ADS_EVT_TC_TIMER = &H5200

    Public Const ADS_EVT_INTERRUPT_TIMER0_NAME = "ADS_EVT_INTERRUPT_TIMER0"
    Public Const ADS_EVT_INTERRUPT_TIMER1_NAME = "ADS_EVT_INTERRUPT_TIMER1"
    Public Const ADS_EVT_INTERRUPT_TIMER2_NAME = "ADS_EVT_INTERRUPT_TIMER2"
    Public Const ADS_EVT_INTERRUPT_TIMER3_NAME = "ADS_EVT_INTERRUPT_TIMER3"
    Public Const ADS_EVT_INTERRUPT_TIMER4_NAME = "ADS_EVT_INTERRUPT_TIMER4"
    Public Const ADS_EVT_INTERRUPT_TIMER5_NAME = "ADS_EVT_INTERRUPT_TIMER5"
    Public Const ADS_EVT_INTERRUPT_TIMER6_NAME = "ADS_EVT_INTERRUPT_TIMER6"
    Public Const ADS_EVT_INTERRUPT_TIMER7_NAME = "ADS_EVT_INTERRUPT_TIMER7"

    Public Const ADS_EVT_TC_TIMER_NAME = "ADS_EVT_TC_TIMER"

'****************************************************************************************************


'Parameter Definition

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
    Public Const CFG_DeviceNumber = &H0
    Public Const CFG_BoardID = &H1
    Public Const CFG_SwitchID = &H2
    Public Const CFG_BaseAddress = &H3
    Public Const CFG_Interrupt = &H4
    Public Const CFG_BusNumber = &H5
    Public Const CFG_SlotNumber = &H6
    Public Const CFG_OnSystem = &H7

    ' ==================================
    ' 0x1000 ~ 0x1fff for AI Group
    ' ----------------------------------

    ' ----------------------------------
    ' 0x2000 ~ 0x2fff for AO Group
    ' ----------------------------------
    ' sub group 0x2000 ~ 0x27ff for AO General ID
    Public Const AO_RANGE_SETTING = &H2000

    Public Const AO_RANGE_SETTINGL_NAME = "AO_RANGE_SETTING"

    ' sub group 0x2800 ~ 0x2fff for AO other ID


    ' ----------------------------------
    ' 0x3000 ~ 0x3fff for DI Group
    ' ----------------------------------
    ' sub group 0x3000 ~ 0x37ff for DI General ID
    Public Const CFG_DioDirection = &H3000            ' each bit for one Auxiliary DIO channel for PCI-1755.
    Public Const CFG_DioFdioDirection = &H3001        ' 32DI(0)/32DO(1)/ 16 DIO(2) / 8DIO(3) for PCI-1755
    Public Const CFG_DioTerminator = &H3002           ' Bit 0: DI terminator (DI_TERM),ON (0) or OFF(1) for PCI-1755                                                      // Bit 1: DO terminator (DI_TERM) ON (0) or OFF(1) for PCI-1755
    Public Const CFG_DiOperationMode = &H3003         ' normal mode (0), 8255 handshaking(1), Burst handshaking(2) for PCI-1755


    ' sub group 0x3800 ~ 0x3fff for DI General ID
    Public Const CFG_DiStartMethod = &H3800         ' Software(1), External trigger(2), Pattern match(3)
    Public Const CFG_DiStopMethod = &H3801          ' Software(1), External trigger(2), Pattern match(3)
    Public Const CFG_DiPacerSource = &H3802         ' 30MHz(1), 15Mhz(2), 10MHz(3), Counter 0 OUT (4), External (5).
    Public Const CFG_DiControlSignals = &H3803      ' Bit 0: External DI start signal control (STRRF), 0 rising edge, 1 falling edge.
                                                    ' Bit 1: External DI stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                                    ' Bit 2: DI request signal control (REQRF), 0 rising edge, 1 falling edge.
                                                    ' Bit 3: DI acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                                    ' Bit 4: DI sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
    Public Const CFG_DiPatternMatchValue = &H3804


    ' ----------------------------------
    ' 0x4000 ~ 0x4fff for DO Group
    ' ----------------------------------
    ' sub group 0x4000 ~ 0x47ff for DO General ID

    ' sub group 0x4800 ~ 0x4fff for DO others ID
    Public Const CFG_DoOperationMode = &H4800       ' Normal (0), Handahaking (1), Burst handshaking(2)
    Public Const CFG_DoStartMethod = &H4801         ' Software(1), External signal(2)
    Public Const CFG_DoStopMethod = &H4802          ' Software(1), External signal(2)
    Public Const CFG_DoPacerSource = &H4803         ' 30, 15, 10 Mhz, Counter1, External signal (value range 1-5)
    Public Const CFG_DoControlSignals = &H4804      ' Control signals
                                            '   Bit 0: External DO start signal control (STRRF), 0 rising edge, 1 falling edge.
                                            '   Bit 1: External DO stop signal control (STPRF), 0 rising edge, 1 falling edge.
                                            '   Bit 2: DO request signal control (REQRF), 0 rising edge, 1 falling edge.
                                            '   Bit 3: DO acknowledge signal control (ACKRF), 0 rising edge, 1 falling edge.
                                            '   Bit 4: DO sampling clock signal control (CLKRF), 0 rising edge, 1 falling edge
    Public Const CFG_DoPresetValue = &H4805         ' DO status before transfering.

    ' ---------------------------------------
    ' 0x5000 ~ 0x5fff for Counter/Timer
    ' ---------------------------------------
    ' sub group 0x5000 ~ 0x57ff for Counter/Timer general ID
    Public Const CFG_CounterCountValue = &H5000   ' 82C54 Counter 0-2 value

    ' sub group 0x5800 ~ 0x5fff for counter/Timer general ID

    ' Other ID
    Public Const CFG_IrqDiChangeStatusChannel = &H6000        ' Change status channel number.
    Public Const CFG_IrqDiTriggerSignals = &H6001             ' Each bit for each Auxiliary DIO channel

    'Parameter definition end.

    '***************************************************************************************************************


    '****************************************************************************
    '    Constant Definition
    '****************************************************************************
    Public Const MaxDev As Short = 255 ' max. # of devices
    Public Const MaxDevNameLen As Short = 49 ' original is 64; max lenght of device name
    Public Const MaxGroup As Short = 6
    Public Const MaxPort As Short = 3
    Public Const MaxszErrMsgLen As Short = 80
    Public Const MAX_DEVICE_NAME_LEN As Short = 64
    Public Const MAX_DRIVER_NAME_LEN As Short = 16
    Public Const MAX_DAUGHTER_NUM As Short = 16
    Public Const MAX_DIO_PORT As Short = 48
    Public Const MAX_AO_RANGE As Short = 16

    Public Const REMOTE As Short = 1
    Public Const REMOTE1 As Integer = REMOTE + 1 ' For PCL-818L JP7 = 5V
    Public Const REMOTE2 As Integer = REMOTE1 + 1 ' For PCL-818L JP7 =10V
    Public Const NONPROG As Short = 0
    Public Const PROG As Short = REMOTE
    Public Const INTERNAL As Short = 0
    Public Const EXTERNAL As Short = 1
    Public Const SINGLEENDD As Short = 0
    Public Const DIFFERENTIAL As Short = 1
    Public Const BIPOLAR As Short = 0
    Public Const UNIPOLAR As Short = 1
    Public Const PORTA As Short = 0
    Public Const PORTB As Short = 1
    Public Const PORTC As Short = 2
    Public Const INPORT As Short = 0
    Public Const OUTPORT As Short = 1

    '***************************************************************************
    '    Define board vendor ID
    '***************************************************************************
    Public Const AAC As Short = &H0S 'Advantech
    Public Const MB As Short = &H1000S 'Keithley/MetraByte
    Public Const BB As Short = &H2000S 'Burr Brown
    Public Const GRAYHILL As Short = &H3000S 'Grayhill
    Public Const KGS As Short = &H4000S

    '****************************************************************************
    '    Define DAS I/O Board ID.
    '****************************************************************************
    Public Const NONE As Short = &H0S ' not available

    'Advantech board ID
    Public Const BD_DEMO As Boolean = AAC Or &H0S ' demo board
    Public Const BD_PCL711 As Boolean = AAC Or &H1S ' PCL-711 board
    Public Const BD_PCL812 As Boolean = AAC Or &H2S ' PCL-812 board
    Public Const BD_PCL812PG As Boolean = AAC Or &H3S ' PCL-812PG board
    Public Const BD_PCL718 As Boolean = AAC Or &H4S ' PCL-718 board
    Public Const BD_PCL818 As Boolean = AAC Or &H5S ' PCL-818 board
    Public Const BD_PCL814 As Boolean = AAC Or &H6S ' PCL-814 board
    Public Const BD_PCL720 As Boolean = AAC Or &H7S ' PCL-722 board
    Public Const BD_PCL722 As Boolean = AAC Or &H8S ' PCL-720 board
    Public Const BD_PCL724 As Boolean = AAC Or &H9S ' PCL-724 board
    Public Const BD_AD4011 As Boolean = AAC Or &HAS ' ADAM 4011 Module
    Public Const BD_AD4012 As Boolean = AAC Or &HBS ' ADAM 4012 Module
    Public Const BD_AD4013 As Boolean = AAC Or &HCS ' ADAM 4013 Module
    Public Const BD_AD4021 As Boolean = AAC Or &HDS ' ADAM 4021 Module
    Public Const BD_AD4050 As Boolean = AAC Or &HES ' ADAM 4050 Module
    Public Const BD_AD4060 As Boolean = AAC Or &HFS ' ADAM 4060 Module
    Public Const BD_PCL711B As Boolean = AAC Or &H10S ' PCL-711B
    Public Const BD_PCL818H As Boolean = AAC Or &H11S ' PCL-818H
    Public Const BD_PCL814B As Boolean = AAC Or &H12S ' PCL-814B
    Public Const BD_PCL816 As Boolean = AAC Or &H13S ' PCL-816
    Public Const BD_814_DIO_1 As Boolean = AAC Or &H14S ' PCL-816/814B 8255 DIO module
    Public Const BD_814_DA_1 As Boolean = AAC Or &H15S ' PCL-816/814B 12 bit D/A module
    Public Const BD_816_DA_1 As Boolean = AAC Or &H16S ' PCL-816/814B 16 bit D/A module
    Public Const BD_PCL830 As Boolean = AAC Or &H17S ' PCL-830 9513A Counter Card
    Public Const BD_PCL726 As Boolean = AAC Or &H18S ' PCL-726 D/A card
    Public Const BD_PCL727 As Boolean = AAC Or &H19S ' PCL-727 D/A card
    Public Const BD_PCL728 As Boolean = AAC Or &H1AS ' PCL-728 D/A card
    Public Const BD_AD4052 As Boolean = AAC Or &H1BS ' ADAM 4052 Module
    Public Const BD_AD4014D As Boolean = AAC Or &H1CS ' ADAM 4014D Module
    Public Const BD_AD4017 As Boolean = AAC Or &H1DS ' ADAM 4017 Module
    Public Const BD_AD4080D As Boolean = AAC Or &H1ES ' ADAM 4080D Module
    Public Const BD_PCL721 As Boolean = AAC Or &H1FS ' PCL-721 32-bit Digital in
    Public Const BD_PCL723 As Boolean = AAC Or &H20S ' PCL-723 24-bit Digital in
    Public Const BD_PCL818L As Boolean = AAC Or &H21S ' PCL-818L
    Public Const BD_PCL818HG As Boolean = AAC Or &H22S ' PCL-818HG
    Public Const BD_PCL1800 As Boolean = AAC Or &H23S ' PCL-1800
    Public Const BD_PAD71A As Boolean = AAC Or &H24S ' PCIA-71A
    Public Const BD_PAD71B As Boolean = AAC Or &H25S ' PCIA-71B
    Public Const BD_PCR420 As Boolean = AAC Or &H26S ' PCR-420
    Public Const BD_PCL731 As Boolean = AAC Or &H27S ' PCL-731 48-bit Digital I/O card
    Public Const BD_PCL730 As Boolean = AAC Or &H28S ' PCL-730 board
    Public Const BD_PCL813 As Boolean = AAC Or &H29S ' PCL-813 32-channel A/D card
    Public Const BD_PCL813B As Boolean = AAC Or &H2AS ' PCL-813B 32-channel A/D card
    Public Const BD_PCL818HD As Boolean = AAC Or &H2BS ' PCL-818HD
    Public Const BD_PCL725 As Boolean = AAC Or &H2CS ' PCL-725 digital I/O card
    Public Const BD_PCL732 As Boolean = AAC Or &H2DS ' PCL-732 high speed DIO card
    Public Const BD_AD4018 As Boolean = AAC Or &H2ES ' ADAM 4018 Module
    Public Const BD_814_TC_1 As Boolean = AAC Or &H2FS ' PCL-816/814B 16 bit TC module
    Public Const BD_PAD71C As Boolean = AAC Or &H30S ' PCIA-71C
    Public Const BD_AD4024 As Boolean = AAC Or &H31S ' ADAM 4024
    Public Const BD_AD5017 As Boolean = AAC Or &H32S ' ADAM 5017
    Public Const BD_AD5018 As Boolean = AAC Or &H33S ' ADAM 5018
    Public Const BD_AD5024 As Boolean = AAC Or &H34S ' ADAM 5024
    Public Const BD_AD5051 As Boolean = AAC Or &H35S ' ADAM 5051
    Public Const BD_AD5060 As Boolean = AAC Or &H36S ' ADAM 5060
    Public Const BD_PCM3718 As Boolean = AAC Or &H37S ' PCM-3718
    Public Const BD_PCM3724 As Boolean = AAC Or &H38S ' PCM-3724
    Public Const BD_MIC2718 As Boolean = AAC Or &H39S ' MIC-2718
    Public Const BD_MIC2728 As Boolean = AAC Or &H3AS ' MIC-2728
    Public Const BD_MIC2730 As Boolean = AAC Or &H3BS ' MIC-2730
    Public Const BD_MIC2732 As Boolean = AAC Or &H3CS ' MIC-2732
    Public Const BD_MIC2750 As Boolean = AAC Or &H3DS ' MIC-2750
    Public Const BD_MIC2752 As Boolean = AAC Or &H3ES ' MIC-2752
    Public Const BD_PCL733 As Boolean = AAC Or &H3FS ' PCL-733
    Public Const BD_PCL734 As Boolean = AAC Or &H40S ' PCL-734
    Public Const BD_PCL735 As Boolean = AAC Or &H41S ' PCL-735
    Public Const BD_AD4018M As Boolean = AAC Or &H42S ' ADAM 4018M Module
    Public Const BD_AD4080 As Boolean = AAC Or &H43S ' ADAM 4080 Module
    Public Const BD_PCL833 As Boolean = AAC Or &H44S ' PCL-833
    Public Const BD_PCA6157 As Boolean = AAC Or &H45S ' PCA-6157
    Public Const BD_PCA6149 As Boolean = AAC Or &H46S ' PCA-6149
    Public Const BD_PCA6147 As Boolean = AAC Or &H47S ' PCA-6147
    Public Const BD_PCA6137 As Boolean = AAC Or &H48S ' PCA-6137
    Public Const BD_PCA6145 As Boolean = AAC Or &H49S ' PCA-6145
    Public Const BD_PCA6144 As Boolean = AAC Or &H4AS ' PCA-6144
    Public Const BD_PCA6143 As Boolean = AAC Or &H4BS ' PCA-6143
    Public Const BD_PCA6134 As Boolean = AAC Or &H4CS ' PCA-6134
    Public Const BD_AD5056 As Boolean = AAC Or &H4DS ' ADAM 5056
    Public Const BD_DN5017 As Boolean = AAC Or &H4ES ' ADAM 5017
    Public Const BD_DN5018 As Boolean = AAC Or &H4FS ' ADAM 5018
    Public Const BD_DN5024 As Boolean = AAC Or &H50S ' ADAM 5024
    Public Const BD_DN5051 As Boolean = AAC Or &H51S ' ADAM 5051
    Public Const BD_DN5056 As Boolean = AAC Or &H52S ' ADAM 5056
    Public Const BD_DN5060 As Boolean = AAC Or &H53S ' ADAM 5060
    Public Const BD_PCL836 As Boolean = AAC Or &H54S ' PCL-836
    Public Const BD_PCL841 As Boolean = AAC Or &H55S ' PCL-841
    Public Const BD_DN5050 As Boolean = AAC Or &H56S ' ADAM 5050
    Public Const BD_DN5052 As Boolean = AAC Or &H57S ' ADAM 5052
    Public Const BD_AD5050 As Boolean = AAC Or &H58S ' ADAM 5050 for RS-485
    Public Const BD_AD5052 As Boolean = AAC Or &H59S ' ADAM 5052 for RS-485
    Public Const BD_PCM3730 As Boolean = AAC Or &H5AS ' PCM-3730
    Public Const BD_AD4011D As Boolean = AAC Or &H5BS ' ADAM 4011D
    Public Const BD_AD4016 As Boolean = AAC Or &H5CS ' ADAM 4016
    Public Const BD_AD4053 As Boolean = AAC Or &H5DS ' ADAM 4053
    Public Const BD_PCI1750 As Boolean = AAC Or &H5ES ' PCI-1750
    Public Const BD_PCI1751 As Boolean = AAC Or &H5FS ' PCI-1751
    Public Const BD_PCI1710 As Boolean = AAC Or &H60S ' PCI-1710
    Public Const BD_PCI1712 As Boolean = AAC Or &H61S ' PCI-1712
    Public Const BD_AD5068 As Boolean = AAC Or &H62S ' ADAM 5068
    Public Const BD_AD5013 As Boolean = AAC Or &H63S ' ADAM 5013
    Public Const BD_AD5017H As Boolean = AAC Or &H64S ' ADAM 5017H
    Public Const BD_AD5080 As Boolean = AAC Or &H65S ' ADAM 5080
    Public Const BD_MIC2760 As Boolean = AAC Or &H66S ' MIC-2760
    Public Const BD_PCI1710HG As Boolean = AAC Or &H67S ' PCI-1710HG
    Public Const BD_PCI1713 As Boolean = AAC Or &H68S ' PCI-1713
    Public Const BD_PCI1753 As Boolean = AAC Or &H69S ' PCI-1753
    Public Const BD_PCI1760 As Boolean = AAC Or &H6AS ' PCI-1760
    Public Const BD_PCI1720 As Boolean = AAC Or &H6BS ' PCI-1720
    Public Const BD_PCL752 As Boolean = AAC Or &H6CS ' PCL-752
    Public Const BD_PCM3718H As Boolean = AAC Or &H6DS ' PCM-3718H
    Public Const BD_PCM3718HG As Boolean = AAC Or &H6ES ' PCM-3718HG
    Public Const BD_DN5068 As Boolean = AAC Or &H6FS ' ADAM 5068 for Device Net
    Public Const BD_DN5013 As Boolean = AAC Or &H70S ' ADAM 5013 for Device Net
    Public Const BD_DN5017H As Boolean = AAC Or &H71S ' ADAM 5017H for Device Net
    Public Const BD_DN5080 As Boolean = AAC Or &H72S ' ADAM 5080(unavailable)  for Device Net
    Public Const BD_PCI1711 As Boolean = AAC Or &H73S ' PCI-1711
    '\\\\\\\\\\\\\\\\\\\\\\\\\\ V2.0b //////////////////////////////
    Public Const BD_PCI1711L As Boolean = AAC Or &H75S ' PCI-1711
    '////////////////////////// V2.0b //////////////////////////////
    Public Const BD_PCI1716 As Boolean = AAC Or &H74S ' PCI-1716
    Public Const BD_PCI1731 As Boolean = AAC Or &H75S ' PCI-1731
    Public Const BD_AD5051D As Boolean = AAC Or &H76S ' ADAM 5051D
    Public Const BD_AD5056D As Boolean = AAC Or &H77S ' ADAM 5056D
    Public Const BD_DN5051D As Boolean = AAC Or &H78S ' ADAM 5051D for Device Net
    Public Const BD_DN5056D As Boolean = AAC Or &H79S ' ADAM 5056D for Device Net
    Public Const BD_SIMULATE As Boolean = AAC Or &H7AS ' Simulate IO
    Public Const BD_PCI1754 As Boolean = AAC Or &H7BS ' PCI-1754
    Public Const BD_PCI1752 As Boolean = AAC Or &H7CS ' PCI-1754
    Public Const BD_PCI1756 As Boolean = AAC Or &H7DS ' PCI-1754
    Public Const BD_PCL839 As Boolean = AAC Or &H7ES ' PCL-839
    Public Const BD_PCM3725 As Boolean = AAC Or &H7FS ' PCM-3725
    Public Const BD_PCI1762 As Boolean = AAC Or &H80S ' PCI-1762
    Public Const BD_PCI1721 As Boolean = AAC Or &H81S ' PCI-1721
    Public Const BD_PCI1761 As Boolean = AAC Or &H82S ' PCI-1761
    Public Const BD_PCI1723 As Boolean = AAC Or &H83S ' PCI-1723
    Public Const BD_AD4019 As Boolean = AAC Or &H84S ' ADAM 4019 Module
    Public Const BD_AD5055 As Boolean = AAC Or &H85S ' ADAM 5055 Module
    Public Const BD_AD4015 As Boolean = AAC Or &H86S ' ADAM 4015 Module
    Public Const BD_PCI1730 As Boolean = AAC Or &H87S ' PCI-1730
    Public Const BD_PCI1733 As Boolean = AAC Or &H88S ' PCI-1733
    Public Const BD_PCI1734 As Boolean = AAC Or &H89S ' PCI-1734
    Public Const BD_MIC2750A As Boolean = AAC Or &H8AS ' MIC-2750A
    Public Const BD_MIC2718A As Boolean = AAC Or &H8BS ' MIC-2718A
    Public Const BD_AD4017P As Boolean = AAC Or &H8CS ' ADAM 4017P Module
    Public Const BD_AD4051 As Boolean = AAC Or &H8DS ' ADAM 4051 Module
    Public Const BD_AD4055 As Boolean = AAC Or &H8ES ' ADAM 4055 Module
    Public Const BD_AD4018P As Boolean = AAC Or &H8FS ' ADAM 4018P Module
    Public Const BD_PCI1710L As Boolean = AAC Or &H90S ' PCI-1710L
    Public Const BD_PCI1710HGL As Boolean = AAC Or &H91S ' PCI-1710HGL
    Public Const BD_AD4068 As Boolean = AAC Or &H92S ' ADAM 4068
    Public Const BD_PCM3712 As Boolean = AAC Or &H93S ' PCM-3712
    Public Const BD_PCM3723 As Boolean = AAC Or &H94S ' PCM-3723

    '\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
    Public Const BD_PCI1780 As Boolean = AAC Or &H95S ' PCI-1780
    Public Const BD_CPCI3756 As Boolean = AAC Or &H96S ' CPCI-3756
    '//////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\
    '\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////
    Public Const BD_PCI1755 As Boolean = AAC Or &H97S ' PCI-1755
    Public Const BD_PCI1714 As Boolean = AAC Or &H98S ' PCI-1714
    '\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////

    '\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////
    Public Const BD_PCI1757 As Boolean = AAC Or &H99S ' PCI-1757
    '\\\\\\\\\\\\\\\\\\\ V2.0C ////////////////////

    '\\\\\\\\\\\\\\\\\\\ V2.1a /////////////////////
    Public Const BD_MIC3716 As Boolean = AAC Or &H9AS ' MIC-3716
    Public Const BD_MIC3761 As Boolean = AAC Or &H9BS ' MIC-3761
    Public Const BD_MIC3753 As Boolean = AAC Or &H9CS ' MIC-3753
    Public Const BD_MIC3780 As Boolean = AAC Or &H9DS ' MIC-3780
    '///////////////////// V2.1a ////////////////////

    Public Const BD_PCI1724 As Boolean = AAC Or &H9ES ' PCI-1724

    Public Const BD_MICRODAC As Boolean = GRAYHILL Or &H1S ' Grayhill MicroDAC Board ID
    Public Const BD_GIA10 As Boolean = KGS Or &H1S ' KGS GIA-10 module Board ID

    '*****************************************************************************
    '    Define Expansion Board ID.
    '*****************************************************************************
    Public Const AAC_EXP As Boolean = AAC Or &H100S 'Advantech expansion bits

    'define Advantech expansion board ID.
    Public Const BD_PCLD780 As Short = &H0S ' PCLD-780
    Public Const BD_PCLD789 As Boolean = AAC_EXP Or &H0S ' PCLD-789
    Public Const BD_PCLD779 As Boolean = AAC_EXP Or &H1S ' PCLD-779
    Public Const BD_PCLD787 As Boolean = AAC_EXP Or &H2S ' PCLD-787
    Public Const BD_PCLD8115 As Boolean = AAC_EXP Or &H3S ' PCLD-8115
    Public Const BD_PCLD770 As Boolean = AAC_EXP Or &H4S ' PCLD-770
    Public Const BD_PCLD788 As Boolean = AAC_EXP Or &H5S ' PCLD-788
    Public Const BD_PCLD8710 As Boolean = AAC_EXP Or &H6S ' PCLD-8710

    '****************************************************************************
    '    Define subsection identifier
    '****************************************************************************
    Public Const DAS_AISECTION As Short = &H1S ' A/D subsection
    Public Const DAS_AOSECTION As Short = &H2S ' D/A sbusection
    Public Const DAS_DISECTION As Short = &H3S ' Digital input subsection
    Public Const DAS_DOSECTION As Short = &H4S ' Digital output sbusection
    Public Const DAS_TEMPSECTION As Short = &H5S ' thermocouple section
    Public Const DAS_ECSECTION As Short = &H6S ' Event count subsection
    Public Const DAS_FMSECTION As Short = &H7S ' frequency measurement section
    Public Const DAS_POSECTION As Short = &H8S ' pulse output section
    Public Const DAS_ALSECTION As Short = &H9S ' alarm section
    Public Const MT_AISECTION As Short = &HAS ' monitoring A/D subsection
    Public Const MT_DISECTION As Short = &HBS ' monitoring D/I subsection

    '***************************************************************************
    '    Define Transfer Mode
    '***************************************************************************
    Public Const POLLED_MODE As Short = &H0S ' software transfer
    Public Const DMA_MODE As Short = &H1S ' DMA transfer
    Public Const INTERRUPT_MODE As Short = &H2S ' Interrupt transfer

    '***************************************************************************
    '    Define Acquisition Mode
    '***************************************************************************
    Public Const FREE_RUN As Short = 0
    Public Const PRE_TRIG As Short = 1
    Public Const POST_TRIG As Short = 2
    Public Const POSITION_TRIG As Short = 3

    '***************************************************************************
    '    Define Comparator's Condition
    '***************************************************************************
    Public Const NOCONDITION As Short = 0
    Public Const LESS As Short = 1
    Public Const BETWEEN As Short = 2
    Public Const GREATER As Short = 3
    Public Const OUTSIDE As Short = 4

    '**************************************************************************
    '    Define Status Code
    '**************************************************************************
    Public Const SUCCESS As Short = 0
    Public Const DrvErrorCode As Short = 1
    Public Const KeErrorCode As Short = 100
    Public Const DnetErrorCode As Short = 200
    Public Const OPCErrorCode As Short = 1000
    Public Const MemoryAllocateFailed As Integer = (DrvErrorCode + 0)
    Public Const ConfigDataLost As Integer = (DrvErrorCode + 1)
    Public Const InvalidDeviceHandle As Integer = (DrvErrorCode + 2)
    Public Const AIConversionFailed As Integer = (DrvErrorCode + 3)
    Public Const AIScaleFailed As Integer = (DrvErrorCode + 4)
    Public Const SectionNotSupported As Integer = (DrvErrorCode + 5)
    Public Const InvalidChannel As Integer = (DrvErrorCode + 6)
    Public Const InvalidGain As Integer = (DrvErrorCode + 7)
    Public Const DataNotReady As Integer = (DrvErrorCode + 8)
    Public Const InvalidInputParam As Integer = (DrvErrorCode + 9)
    Public Const NoExpansionBoardConfig As Integer = (DrvErrorCode + 10)
    Public Const InvalidAnalogOutValue As Integer = (DrvErrorCode + 11)
    Public Const ConfigIoPortFailed As Integer = (DrvErrorCode + 12)
    Public Const CommOpenFailed As Integer = (DrvErrorCode + 13)
    Public Const CommTransmitFailed As Integer = (DrvErrorCode + 14)
    Public Const CommReadFailed As Integer = (DrvErrorCode + 15)
    Public Const CommReceiveFailed As Integer = (DrvErrorCode + 16)
    Public Const CommConfigFailed As Integer = (DrvErrorCode + 17)
    Public Const CommChecksumError As Integer = (DrvErrorCode + 18)
    Public Const InitError As Integer = (DrvErrorCode + 19)
    Public Const DMABufAllocFailed As Integer = (DrvErrorCode + 20)
    Public Const IllegalSpeed As Integer = (DrvErrorCode + 21)
    Public Const ChanConflict As Integer = (DrvErrorCode + 22)
    Public Const BoardIDNotSupported As Integer = (DrvErrorCode + 23)
    Public Const FreqMeasurementFailed As Integer = (DrvErrorCode + 24)
    Public Const CreateFileFailed As Integer = (DrvErrorCode + 25)
    Public Const FunctionNotSupported As Integer = (DrvErrorCode + 26)
    Public Const LoadLibraryFailed As Integer = (DrvErrorCode + 27)
    Public Const GetProcAddressFailed As Integer = (DrvErrorCode + 28)
    Public Const InvalidDriverHandle As Integer = (DrvErrorCode + 29)
    Public Const InvalidModuleType As Integer = (DrvErrorCode + 30)
    Public Const InvalidInputRange As Integer = (DrvErrorCode + 31)
    Public Const InvalidWindowsHandle As Integer = (DrvErrorCode + 32)
    Public Const InvalidCountNumber As Integer = (DrvErrorCode + 33)
    Public Const InvalidInterruptCount As Integer = (DrvErrorCode + 34)
    Public Const InvalidEventCount As Integer = (DrvErrorCode + 35)
    Public Const OpenEventFailed As Integer = (DrvErrorCode + 36)
    Public Const InterruptProcessFailed As Integer = (DrvErrorCode + 37)
    Public Const InvalidDOSetting As Integer = (DrvErrorCode + 38)
    Public Const InvalidEventType As Integer = (DrvErrorCode + 39)
    Public Const EventTimeOut As Integer = (DrvErrorCode + 40)
    Public Const InvalidDmaChannel As Integer = (DrvErrorCode + 41)
    Public Const IntDamChannelBusy As Integer = (DrvErrorCode + 42)

    Public Const CheckRunTimeClassFailed As Integer = (DrvErrorCode + 43)
    Public Const CreateDllLibFailed As Integer = (DrvErrorCode + 44)
    Public Const ExceptionError As Integer = (DrvErrorCode + 45)
    Public Const RemoveDeviceFailed As Integer = (DrvErrorCode + 46)
    Public Const BuildDeviceListFailed As Integer = (DrvErrorCode + 47)
    Public Const NoIOFunctionSupport As Integer = (DrvErrorCode + 48)
    '/\\\\\\\\\\\\\\\\\\\ V2.0B /////////////////////
    Public Const ResourceConflict As Integer = (DrvErrorCode + 49)
    '//////////////////// V2.0B \\\\\\\\\\\\\\\\\\\\\

    '\\\\\\\\\\\\\\\\\\\ V2.1 //////////////////////
    Public Const InvalidClockSource As Integer = (DrvErrorCode + 50)
    Public Const InvalidPacerRate As Integer = (DrvErrorCode + 51)
    Public Const InvalidTriggerMode As Integer = (DrvErrorCode + 52)
    Public Const InvalidTriggerEdge As Integer = (DrvErrorCode + 53)
    Public Const InvalidTriggerSource As Integer = (DrvErrorCode + 54)
    Public Const InvalidTriggerVoltage As Integer = (DrvErrorCode + 55)
    Public Const InvalidCyclicMode As Integer = (DrvErrorCode + 56)
    Public Const InvalidDelayCount As Integer = (DrvErrorCode + 57)
    Public Const InvalidBuffer As Integer = (DrvErrorCode + 58)
    Public Const OverloadedPCIBus As Integer = (DrvErrorCode + 59)
    Public Const OverloadedInterruptRequest As Integer = (DrvErrorCode + 60)
    '/////////////////// V2.1 \\\\\\\\\\\\\\\\\\\\\\/
    '/\\\\\\\\\\\\\\\\\\\ V2.0C /////////////////////
    Public Const ParamNameNotSupported As Integer = (DrvErrorCode + 61)
    '//////////////////// V2.0C \\\\\\\\\\\\\\\\\\\\\

    Public Const KeInvalidHandleValue As Integer = (KeErrorCode + 0)
    Public Const KeFileNotFound As Integer = (KeErrorCode + 1)
    Public Const KeInvalidHandle As Integer = (KeErrorCode + 2)
    Public Const KeTooManyCmds As Integer = (KeErrorCode + 3)
    Public Const KeInvalidParameter As Integer = (KeErrorCode + 4)
    Public Const KeNoAccess As Integer = (KeErrorCode + 5)
    Public Const KeUnsuccessful As Integer = (KeErrorCode + 6)
    Public Const KeConInterruptFailure As Integer = (KeErrorCode + 7)
    Public Const KeCreateNoteFailure As Integer = (KeErrorCode + 8)
    Public Const KeInsufficientResources As Integer = (KeErrorCode + 9)
    Public Const KeHalGetAdapterFailure As Integer = (KeErrorCode + 10)
    Public Const KeOpenEventFailure As Integer = (KeErrorCode + 11)
    Public Const KeAllocCommBufFailure As Integer = (KeErrorCode + 12)
    Public Const KeAllocMdlFailure As Integer = (KeErrorCode + 13)
    Public Const KeBufferSizeTooSmall As Integer = (KeErrorCode + 14)

    Public Const DNInitFailed As Integer = (DnetErrorCode + 1)
    Public Const DNSendMsgFailed As Integer = (DnetErrorCode + 2)
    Public Const DNRunOutOfMsgID As Integer = (DnetErrorCode + 3)
    Public Const DNInvalidInputParam As Integer = (DnetErrorCode + 4)
    Public Const DNErrorResponse As Integer = (DnetErrorCode + 5)
    Public Const DNNoResponse As Integer = (DnetErrorCode + 6)
    Public Const DNBusyOnNetwork As Integer = (DnetErrorCode + 7)
    Public Const DNUnknownResponse As Integer = (DnetErrorCode + 8)
    Public Const DNNotEnoughBuffer As Integer = (DnetErrorCode + 9)
    Public Const DNFragResponseError As Integer = (DnetErrorCode + 10)
    Public Const DNTooMuchDataAck As Integer = (DnetErrorCode + 11)
    Public Const DNFragRequestError As Integer = (DnetErrorCode + 12)
    Public Const DNEnableEventError As Integer = (DnetErrorCode + 13)
    Public Const DNCreateOrOpenEventError As Integer = (DnetErrorCode + 14)
    Public Const DNIORequestError As Integer = (DnetErrorCode + 15)
    Public Const DNGetEventNameError As Integer = (DnetErrorCode + 16)
    Public Const DNTimeOutError As Integer = (DnetErrorCode + 17)
    Public Const DNOpenFailed As Integer = (DnetErrorCode + 18)
    Public Const DNCloseFailed As Integer = (DnetErrorCode + 19)
    Public Const DNResetFailed As Integer = (DnetErrorCode + 20)

    ' define user window message
    Public Const WM_USER As Short = &H400S
    Public Const WM_ATODNOTIFY As Integer = (WM_USER + 200)
    Public Const WM_DTOANOTIFY As Integer = (WM_USER + 201)
    Public Const WM_DIGINNOTIFY As Integer = (WM_USER + 202)
    Public Const WM_DIGOUTNOTIFY As Integer = (WM_USER + 203)
    Public Const WM_MTNOTIFY As Integer = (WM_USER + 204)
    Public Const WM_CANTRANSMITCOMPLETE As Integer = (WM_USER + 205)
    Public Const WM_CANMESSAGE As Integer = (WM_USER + 206)
    Public Const WM_CANERROR As Integer = (WM_USER + 207)

    ' define the wParam in user window message
    Public Const AD_NONE As Short = 0 ' AD Section
    Public Const AD_TERMINATE As Short = 1
    Public Const AD_INT As Short = 2
    Public Const AD_BUFFERCHANGE As Short = 3
    Public Const AD_OVERRUN As Short = 4
    Public Const AD_WATCHDOGACT As Short = 5
    Public Const AD_TIMEOUT As Short = 6
    Public Const DA_TERMINATE As Short = 0 ' DA Section
    Public Const DA_DMATC As Short = 1
    Public Const DA_INT As Short = 2
    Public Const DA_BUFFERCHANGE As Short = 3
    Public Const DA_OVERRUN As Short = 4
    Public Const DI_TERMINATE As Short = 0 ' DI Section
    Public Const DI_DMATC As Short = 1
    Public Const DI_INT As Short = 2
    Public Const DI_BUFFERCHANGE As Short = 3
    Public Const DI_OVERRUN As Short = 4
    Public Const DI_WATCHDOGACT As Short = 5
    Public Const DO_TERMINATE As Short = 0 ' DO Section
    Public Const DO_DMATC As Short = 1
    Public Const DO_INT As Short = 2
    Public Const DO_BUFFERCHANGE As Short = 3
    Public Const DO_OVERRUN As Short = 4
    Public Const MT_ATOD As Short = 0 ' MT Section
    Public Const MT_DIGIN As Short = 1

    Public Const CAN_TRANSFER As Short = 0 ' CAN Section
    Public Const CAN_RECEIVE As Short = 1
    Public Const CAN_ERROR As Short = 2

    '****************************************************************************
    '    define thermocopule type J, K, S, T, B, R, E
    '****************************************************************************
    Public Const BTC As Short = 4
    Public Const ETC As Short = 6
    Public Const JTC As Short = 0
    Public Const KTC As Short = 1
    Public Const RTC As Short = 5
    Public Const STC As Short = 2
    Public Const TTC As Short = 3

    '****************************************************************************
    '    define  temperature scale
    '****************************************************************************
    Public Const C As Short = 0 'Celsius
    Public Const F As Short = 1 'Fahrenheit
    Public Const R As Short = 2 ' Rankine
    Public Const K As Short = 3 ' Kelvin


    '****************************************************************************
    '    define service type for COMEscape()
    '****************************************************************************
    Public Const EscapeFlushInput As Short = 1
    Public Const EscapeFlushOutput As Short = 2
    Public Const EscapeSetBreak As Short = 3
    Public Const EscapeClearBreak As Short = 4


    '****************************************************************************
    '    define  gate mode
    '****************************************************************************
    Public Const GATE_DISABLED As Short = 0 ' no gating
    Public Const GATE_HIGHLEVEL As Short = 1 ' active high level
    Public Const GATE_LOWLEVEL As Short = 2 ' active low level
    Public Const GATE_HIGHEDGE As Short = 3 ' active high edge
    Public Const GATE_LOWEDGE As Short = 4 ' active low edge


    '****************************************************************************
    '    define input mode for PCL-833
    '****************************************************************************
    Public Const DISABLE As Short = 0 ' disable mode
    Public Const ABPHASEX1 As Short = 1 ' Quadrature input X1
    Public Const ABPHASEX2 As Short = 2 ' Quadrature input X2
    Public Const ABPHASEX4 As Short = 3 ' Quadrature input X4
    Public Const TWOPULSEIN As Short = 4 ' 2 pulse input
    Public Const ONEPULSEIN As Short = 5 ' 1 pulse input

    '****************************************************************************
    '    define latch source for PCL-833
    '****************************************************************************
    Public Const SWLATCH As Short = 0 ' S/W read latch data
    Public Const INDEXINLATCH As Short = 1 ' Index-in latch data
    Public Const DI0LATCH As Short = 2 ' DI0 latch data
    Public Const DI1LATCH As Short = 3 ' DI1 latch data
    Public Const TIMERLATCH As Short = 4 ' Timer latch data

    '****************************************************************************
    '    define timer base mode for PCL-833
    '****************************************************************************
    Public Const TPOINT1MS As Short = 0 '    0.1 ms timer base
    Public Const T1MS As Short = 1 '    1   ms timer base
    Public Const T10MS As Short = 2 '   10   ms timer base
    Public Const T100MS As Short = 3 '  100   ms timer base
    Public Const T1000MS As Short = 4 ' 1000   ms timer base

    '****************************************************************************
    '    define clock source for PCL-833
    '****************************************************************************
    Public Const SYS8MHZ As Short = 0 ' 8 MHZ system clock
    Public Const SYS4MHZ As Short = 1 ' 4 MHZ system clock
    Public Const SYS2MHZ As Short = 2 ' 2 MHZ system clock

    '****************************************************************************
    '    define cascade mode for PCL-833
    '****************************************************************************
    Public Const NOCASCADE As Short = 0 ' 24-bit(no cascade)
    Public Const CASCADE As Short = 1 ' 48-bit(CH1, CH2 cascade)

    '\\\\\\\\\\\\\\\\\\\\\\\\\\\\ V2.0b /////////////////////////////////////
    '****************************************************************************
    '     define parameters for PCI-1780
    '****************************************************************************
    ' define the counter mode register parameter
    Public Const PA_MODE_ACT_HIGH_TC_PULSE As Short = &H0S
    Public Const PA_MODE_ACT_LOW_TC_PULSE As Short = &H1S
    Public Const PA_MODE_TC_TOGGLE_FROM_LOW As Short = &H2S
    Public Const PA_MODE_TC_TOGGLE_FROM_HIGH As Short = &H3S
    Public Const PA_MODE_ENABLE_OUTPUT As Short = &H4S
    Public Const PA_MODE_DISABLE_OUTPUT As Short = &H0S
    Public Const PA_MODE_COUNT_DOWN As Short = &H0S
    Public Const PA_MODE_COUNT_UP As Short = &H8S
    Public Const PA_MODE_COUNT_RISE_EDGE As Short = &H0S
    Public Const PA_MODE_COUNT_FALL_EDGE As Short = &H80S
    Public Const PA_MODE_COUNT_SRC_OUT_N_M1 As Short = &H100S ' N_M1 means n minus 1
    Public Const PA_MODE_COUNT_SRC_CLK_N As Short = &H200S
    Public Const PA_MODE_COUNT_SRC_CLK_N_M1 As Short = &H300S
    Public Const PA_MODE_COUNT_SRC_FOUT_0 As Short = &H400S
    Public Const PA_MODE_COUNT_SRC_FOUT_1 As Short = &H500S
    Public Const PA_MODE_COUNT_SRC_FOUT_2 As Short = &H600S
    Public Const PA_MODE_COUNT_SRC_FOUT_3 As Short = &H700S
    Public Const PA_MODE_COUNT_SRC_GATE_N_M1 As Short = &HC00S
    Public Const PA_MODE_GATE_SRC_GATE_NO As Short = &H0S
    Public Const PA_MODE_GATE_SRC_OUT_N_M1 As Short = &H1000S
    Public Const PA_MODE_GATE_SRC_GATE_N As Short = &H2000S
    Public Const PA_MODE_GATE_SRC_GATE_N_M1 As Short = &H3000S
    Public Const PA_MODE_GATE_POSITIVE As Short = &H0S
    Public Const PA_MODE_GATE_NEGATIVE As Short = &H4000S
    ' Counter Mode
    Public Const MODE_A As Short = &H0S
    Public Const MODE_B As Short = &H0S
    Public Const MODE_C As Short = &H8000S
    Public Const MODE_D As Short = &H10S
    Public Const MODE_E As Short = &H10S
    Public Const MODE_F As Short = &H8010S
    Public Const MODE_G As Short = &H20S
    Public Const MODE_H As Short = &H20S
    Public Const MODE_I As Short = &H8020S
    Public Const MODE_J As Short = &H30S
    Public Const MODE_K As Short = &H30S
    Public Const MODE_L As Short = &H8030S
    Public Const MODE_O As Short = &H8040S
    Public Const MODE_R As Short = &H8050S
    Public Const MODE_U As Short = &H8060S
    Public Const MODE_X As Short = &H8070S

    ' define the FOUT register parameter
    Public Const PA_FOUT_SRC_EXTER_CLK As Short = &H0S
    Public Const PA_FOUT_SRC_CLK_N As Short = &H100S
    Public Const PA_FOUT_SRC_FOUT_N_M1 As Short = &H200S
    Public Const PA_FOUT_SRC_CLK_10MHZ As Short = &H300S
    Public Const PA_FOUT_SRC_CLK_1MHZ As Short = &H400S
    Public Const PA_FOUT_SRC_CLK_100KHZ As Short = &H500S
    Public Const PA_FOUT_SRC_CLK_10KHZ As Short = &H600S
    Public Const PA_FOUT_SRC_CLK_1KHZ As Short = &H700S
    '/////////////////////////////// V2.0b \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

    ' sub group 0x5800 ~ 0x5fff for counter/Timer genral ID


End Module
