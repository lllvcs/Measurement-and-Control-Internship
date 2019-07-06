Attribute VB_Name = "Module2"
Global Const SUCCESS = 0
Global Const DnetInitFailed = 1
Global Const DnetSendMsgFailed = 2
Global Const DnetRunOutOfMsgID = 3
Global Const DnetInvalidInputParam = 4
Global Const DnetErrorResponse = 5
Global Const DnetNoResponse = 6
Global Const DnetBusyOnNetwork = 7
Global Const DnetUnknownResponse = 8
Global Const DnetNotEnoughBuffer = 9
Global Const DnetFragResponseError = 10
Global Const DnetTooMuchDataAck = 11
Global Const DnetFragRequestError = 12
Global Const DnetEnableEventError = 13
Global Const DnetCreateOrOpenEventError = 14
Global Const DnetIORequestError = 15
Global Const DnetGetEventNameError = 16
Global Const DnetTimeOutError = 17
Global Const DnetOpenFailed = 18
Global Const DnetCloseFailed = 19
Global Const DnetResetFailed = 20
Global Const DnetConfigDataLost = 21
Global Const DnetBusOffError = 22
Global Const DnetInvalidMsgID = 23
Global Const DnetSetEPRFailed = 24
Global Const DnetDuplicateMacIDCheckFailed = 25
Global Const DnetWaitMsgFailed = 26
Global Const DnetGroup2MsgReceive = 27
Global Const DnetCheckEventFailed = 28
Global Const DnetCheckEventTimeOut = 29
Global Const DnetDataOverrunError =	30

Global Const SC_GET_ATTRIB_ALL = 1
Global Const SC_SET_ATTRIB_ALL = 2
Global Const SC_RESET = 5
Global Const SC_START = 6
Global Const SC_STOP = 7
Global Const SC_CREATE = 8
Global Const SC_DELETE = 9
Global Const SC_APPLY_ATTRIB = 13
Global Const SC_GET_ATTRIB_SINGLE = 14
Global Const SC_SET_ATTRIB_SINGLE = 16
Global Const SC_FIND_NEXT_OBJECT_INST = 17
Global Const SC_ERROR_RESPONSE = 20
Global Const SC_DNRESTORE = 21
Global Const SC_SAVE = 22
Global Const SC_NO_OPERATION = 23
Global Const SC_UCMM_OPEN_REQUEST = 75
Global Const SC_UCMM_CLOSE_REQUEST = 76


Type S_CNXINFO
      port As Integer           ' port number 0 or 1
      grp As Integer            ' message group
      ID As Integer             ' destination MAC ID
      pid As Integer            ' producer ID
      cid As Integer            ' consumer ID
      format As Byte            ' message body format
      epr As Integer            ' expected packet rate
      ConnInst As Integer       ' connection instance ID
      size As Integer           ' data size
      Data(512) As Byte         ' data buffer
End Type
    
Type S_MSG
      grp As Byte               ' message group
      ID As Integer             ' MAC ID
      Msg As Integer            ' message ID
      Data(512) As Byte         ' data body (fragment/non-fragment)
      len As Integer            ' data length
End Type

Type S_ALMSTATUS
      LoState As Long     ' low alarm state
      HiState As Long     ' high alarm state
End Type

    
Declare Function DNOpen Lib "ADSDNet.dll" (ByVal DeviceNum As Integer, port As Integer, MyMacID As Integer, BaudRate As Integer) As Long
Declare Function DNClose Lib "ADSDNet.dll" (ByVal port As Integer) As Long
Declare Function DNInit Lib "ADSDNet.dll" (ByVal MyMacID As Integer, ByVal port As Integer, ByVal BaudRate As Integer) As Long
Declare Function DNReset Lib "ADSDNet.dll" (ByVal port As Integer) As Long
Declare Function DNSetTimeout Lib "ADSDNet.dll" (ByVal port As Integer) As Long
Declare Function DNAllocateGrpMsg Lib "ADSDNet.dll" (ByVal port As Integer, ByVal Group As Integer, MsgID As Integer) As Long
Declare Function DNFreeGrpMsg Lib "ADSDNet.dll" (ByVal port As Integer, ByVal Group As Integer, ByVal MsgID As Integer) As Long
Declare Function DNUcmmOpenReq Lib "ADSDNet.dll" (ByVal port As Integer, ByVal DestMacID As Integer, ByVal MsgGroup As Integer, ByVal SrcMsgID As Integer, ByVal ReqMsgFormat As Integer, ByVal ERR As Integer, CnxInfo As S_CNXINFO) As Long
Declare Function DNUcmmCloseReq Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO) As Long
Declare Function DNSetAttrib Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal ClassID As Integer, ByVal InstanceID As Integer, ByVal AttribID As Integer, AttribData As Any, ByVal DataLength As Integer) As Long
Declare Function DNGetAttrib Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal CalssID As Integer, ByVal InstanceID As Integer, ByVal AttribID As Integer, AttribData As Any, ByVal BufferSize As Integer, DataLength As Integer) As Long
Declare Function DNSendEXPReq Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO) As Long
Declare Function DNGetEXPRsp Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO) As Long
Declare Function DNGetAi Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AiArray As Single, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetCJC Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, value As Single) As Long
Declare Function DNSetChanMask Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, MaskArray As Integer, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetChanMask Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, MaskArray As Integer, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetAo Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Single, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetAo Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Single, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetAoStart Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetAoStart Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetDo Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Integer, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetDi Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AiArray As Integer, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetDo Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AoArray As Integer, ByVal StartCnah As Long, ByVal NumOfChans As Integer, ByVal Type1 As Integer) As Long
Declare Function DNGetAlarmState Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, AlarmState As S_ALMSTATUS, ByVal StartChan As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetHiAlarm Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, HiAlarm As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetLoAlarm Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, LoAlarm As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNSetAlarmEnabled Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, LoAlarm As Integer, HiAlarm As Integer, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetHiAlarm Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, HiAlarm As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetLoAlarm Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, LoAlarm As Single, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGetAlarmEnabled Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, LoAlarm As Integer, HiAlarm As Integer, ByVal StartCnah As Long, ByVal NumOfChans As Long) As Long
Declare Function DNGet5kVersion Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, Version As Integer) As Long
Declare Function DNSetEPR Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal epr As Integer) As Long
Declare Function DNGet5kType Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, Type1 As Integer) As Long
Declare Function DNSetHz Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal Hz As Integer) As Long
Declare Function DNGetHz Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, Hz As Integer) As Long
Declare Function DNSetRange Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal RangeCode As Integer) As Long
Declare Function DNGetRange Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, RangeCode As Integer) As Long
Declare Function DNSetSlew Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal SlewRate As Integer) As Long
Declare Function DNGetSlew Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, SlewRate As Integer) As Long
Declare Function DNSpanCali Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long) As Long
Declare Function DNZeroCali Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long) As Long
Declare Function DNCJCCali Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal offset As Single) As Long
Declare Function DNAO4mACali Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal chan As Long, ByVal ReadValue As Single) As Long
Declare Function DNAO20mACali Lib "ADSDNet.dll" (CnxInfo As S_CNXINFO, ByVal slot As Long, ByVal chan As Long, ByVal ReadValue As Single) As Long
Declare Function DNSetEventEnabled Lib "ADSDNet.dll" (ByVal Enabled As Long, ByVal port As Integer, ByVal DestMacID As Integer, APEventName As Byte) As Long
Declare Function DNGetEventData Lib "ADSDNet.dll" (port As Integer, MacID As Integer, Type1 As Long, Data As Any) As Long
Declare Function DNDeviceGetParamOfReg Lib "ADSDNet.dll" (ByVal DeviceNum As Integer, MacID As Integer, BoardID As Long, SlotNo As Integer, DelayTime As Integer, AlarmEnabled As Integer, EventEnabled As Integer) As Long
Declare Function DNNodeReset Lib "ADSDNet.dll" (ByVal port As Integer, ByVal MacID As Integer) As Long
Declare Function DNEnableEvent Lib "ADSDNet.dll" (ByVal port As Integer, ByVal DestMacID As Integer, ByVal Enable As Long) As Long
Declare Function DNCheckEvent Lib "ADSDNet.dll" (ByVal port As Integer, ByVal TimePeriod As Long) As Long
'Declare Function DRV_SelectDevice Lib "ADSDev.dll" (ByVal hWnd As Long, ByVal GetModule As Long, DeviceNum As Long, ByVal DeviceName As String) As Long
Declare Function DNCheckDuplicatedMacID Lib "ADSDNet.dll" (ByVal MyMacID As Integer, ByVal port As Integer) As Long

Function GetErrorMessage(ByVal ErrCode As Long) As String
Dim code, base, port As Integer
Dim s1 As String

    code = ErrCode Mod &H10000
    base = (ErrCode And &HFFF0000) / &H10000
    port = (ErrCode And &HF0000000) / &H10000000
    s1 = "On Port " + Str(port) + " MacID " + Str(base) + "H"

    Select Case code
      Case 1
          GetErrorMessage = "DeviceNet Initialization Failed"
      Case 2
          GetErrorMessage = "Send Message Failed On "
      Case 3
          GetErrorMessage = "Run Out Of Message ID"
      Case 4
          GetErrorMessage = "Invalid Input Parameters"
      Case 5
          GetErrorMessage = "Error Response " + s1
      Case 6
          GetErrorMessage = "No Response " + s1
      Case 7
          GetErrorMessage = "Busy On Network " + s1
      Case 8
          GetErrorMessage = "Unknown Response " + s1
      Case 9
          GetErrorMessage = "Message Length Is Too Long " + s1
      Case 10
          GetErrorMessage = "Fragment Response Error " + s1
      Case 11
          GetErrorMessage = "Too Much Data Acknowledge " + s1
      Case 12
          GetErrorMessage = "Fragment Request Error " + s1
      Case 13
          GetErrorMessage = "Event Enable/Disable Error " + s1
      Case 14
          GetErrorMessage = "Device Net Driver Create/Open Event Failed " + s1
      Case 15
          GetErrorMessage = "IO Message Request Error " + s1
      Case 16
          GetErrorMessage = "Get Event Name From CAN Driver Failed " + s1
      Case 17
          GetErrorMessage = "Wait For Message Time Out Error " + s1
      Case 18
          GetErrorMessage = "Open CAN Card Failed"
      Case 19
          GetErrorMessage = "Close CAN Card Failed"
      Case 20
          GetErrorMessage = "DeviceNet Reset Failed"
	  Case 21
		  GetErrorMessage = "Configure Data In Registry Lost"
	  Case 22
	      GetErrorMessage = "CAN Bus Bus-Off Error " + s1
      Case 23 
		  GetErrorMessage = "Invalid Message ID " + s1
      Case 24
		  GetErrorMessage = "Set EPR Error " + s1
      Case 25 
		  GetErrorMessage = "Duplicate Mac ID Check Failed "
      Case 26       
	      GetErrorMessage = "Wait For Message Time Out Error "
      Case 27       
	      GetErrorMessage = "Receive Group2 Message "
	  Case 28
		  GetErrorMessage = "Check Event Failed "
	  Case 29
	      GetErrorMessage = "Check Event Timeout "
	  Case 30
	      GetErrorMessage = "Data Overrun Error "
      Case Else
          GetErrorMesaage = "Invalid Error Code"
  End Select
End Function

Function StrToFloat(s As String) As Double
Dim fraction, ord, i As Integer
  StrToFloat = 0
  fraction = 0

  For i = 0 To Len(s) Step 1
    ord = Asc(Mid(s, i, 1))
    Select Case ord
        Case Asc("0") To Asc("9")
            If fraction = 0 Then
                StrToFloat = StrToFloat * 10 + (ord - Asc("0"))
            Else
                StrToFloat = StrToFloat + (ord - Asc("0")) / fraction
                fraction = fraction * 10
            End If
        Case "."
            If fraction = 0 Then
                fraction = 10
            End If
    End Select
  Next i
End Function

