unit DNET;

Interface

uses Windows, SysUtils, Driver;

const
    AdSDNet = 'ADSDNet.DLL';
    ADSAPI32  = 'ADSAPI32.DLL';

    SUCCESS                   = 0;
    DnetInitFailed            = 1;
    DnetSendMsgFailed         = 2;
    DnetRunOutOfMsgID         = 3;
    DnetInvalidInputParam     = 4;
    DnetErrorResponse         = 5;
    DnetNoResponse            = 6;
    DnetBusyOnNetwork         = 7;
    DnetUnknownResponse       = 8;
    DnetNotEnoughBuffer       = 9;
    DnetFragResponseError     = 10;
    DnetTooMuchDataAck        = 11;
    DnetFragRequestError      = 12;
    DnetEnableEventError      = 13;
    DnetCreateOrOpenEventError= 14;
    DnetIORequestError        = 15;
    DnetGetEventNameError     = 16;
    DnetTimeOutError          = 17;
    DnetOpenFailed            = 18;
    DnetCloseFailed           = 19;
    DnetResetFailed           = 20;
	DnetConfigDataLost		  =	21;
	DnetBusOffError			  =	22;
	DnetInvalidMsgID		  =	23;
	DnetSetEPRFailed		  =	24;
    DnetDuplicateMacIDCheckFailed	= 25;
    DnetWaitMsgFailed         = 26;
    DnetGroup2MsgReceive	  =	27;
	DnetCheckEventFailed	  = 28;
	DnetCheckEventTimeOut	  = 29;
	DnetDataOverrunError	  =	30;

    SC_GET_ATTRIB_ALL         = 1;
    SC_SET_ATTRIB_ALL         = 2;
    SC_RESET                  = 5;
    SC_START                  = 6;
    SC_STOP                   = 7;
    SC_CREATE                 = 8;
    SC_DELETE                 = 9;
    SC_APPLY_ATTRIB           = 13;
    SC_GET_ATTRIB_SINGLE      = 14;
    SC_SET_ATTRIB_SINGLE      = 16;
    SC_FIND_NEXT_OBJECT_INST  = 17;
    SC_ERROR_RESPONSE         = 20;
    SC_DNRESTORE              = 21;
    SC_SAVE                   = 22;
    SC_NO_OPERATION           = 23;
    SC_UCMM_OPEN_REQUEST      = 75;
    SC_UCMM_CLOSE_REQUEST     = 76;

type
    Float  = Single;
    pWord  = ^Word;
    pFloat = ^Float;

    S_CNXINFO = packed record
      Port:     Word;       { port number 0 or 1       }
      grp:      Word;       { message group            }
      id:       Word;       { destination MAC ID       }
      pid:      Word;       { producer ID              }
      cid:      Word;       { consumer ID              }
      format:   Byte;       { message body format      }
      EPR:      Word;       { expected packet rate     }
      ConnInst: Word;       { connection instance ID   }
      size:     Word;       { data size                }
      data:     array[0..511] of Byte;  { data buffer  }
    end;
    pS_CNXINFO = ^S_CNXINFO;

    S_MSG = packed record
      grp:  Byte;           { message group             }
      id:   Word;           { MAC ID                    }
      msg:  Word;           { message ID                }
      data: array[0..511] of Byte;  { data body (fragment/non-fragment) }
      len:  Word;           { data length               }
    end;

    S_ALMSTATUS = packed record
      LoState:  LongBool;       { low alarm state   }
      HiState:  LongBool;       { high alarm state  }
    end;
    pS_ALMSTATUS = ^S_ALMSTATUS;

    pDEVLIST = ^PT_DEVLIST;
    

function DNOpen( DeviceNum: WORD; var Port, MyMacID, BaudRate: WORD): Longint;
    stdcall; external ADSDNet;
function DNClose( Port: WORD ): Longint;
    stdcall; external ADSDNet;
function DNInit( MyMacID: WORD; Port: WORD; BaudRate: WORD ): Longint;
    stdcall; external ADSDNet;
function DNReset( Port: WORD ): Longint;
    stdcall; external ADSDNet;
function DNSetTimeout( Port: WORD ): Longint;
    stdcall; external ADSDNet;
function DNAllocateGrpMsg( Port: WORD; Group: WORD; var MsgID: Word ): Longint;
    stdcall; external ADSDNet;
function DNFreeGrpMsg( Port: WORD; Group: WORD; MsgID: WORD ): Longint;
    stdcall; external ADSDNet;
function DNUcmmOpenReq( Port: WORD; DestMacID: WORD; MsgGroup: WORD;
            SrcMsgID: WORD; ReqMsgFormat: WORD; ERR: WORD;
            CnxInfo: pS_CNXINFO ): Longint;
    stdcall; external ADSDNet;
function DNUcmmCloseReq( CnxInfo: pS_CNXINFO ): Longint;
    stdcall; external ADSDNet;
function DNSetAttrib( CnxInfo: pS_CNXINFO; ClassID, InstanceID, AttribID: WORD;
            AttribData: PChar; DataLength: Word ): Longint;
    stdcall; external ADSDNet;
function DNGetAttrib( CnxInfo: pS_CNXINFO; CalssID, InstanceID, AttribID: WORD;
            AttribData: PChar; BufferSize: Word; var DataLength: Word ): Longint;
    stdcall; external ADSDNet;
function DNSendEXPReq( CnxInfo: pS_CNXINFO ): Longint;
    stdcall; external ADSDNet;
function DNGetEXPRsp( CnxInfo: pS_CNXINFO ): Longint;
    stdcall; external ADSDNet;
function DNGetAi( CnxInfo: pS_CNXINFO; Slot: Integer; var AiArray: Float;
            StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetCJC( CnxInfo: pS_CNXINFO; Slot: Integer;
            var Value: Float ): Longint;
    stdcall; external ADSDNet;
function DNSetChanMask( CnxInfo: pS_CNXINFO; Slot: Integer; MaskArray: pWORD;
            StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetChanMask( CnxInfo: pS_CNXINFO; Slot: Integer; MaskArray: pWord;
            StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetAo( CnxInfo: pS_CNXINFO; Slot: Integer; var AoArray: Float;
            StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetAo( CnxInfo: pS_CNXINFO; Slot: Integer; var AoArray: Float;
            StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetAoStart( CnxInfo: pS_CNXINFO; Slot: Integer; var AoArray: Float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetAoStart( CnxInfo: pS_CNXINFO; Slot: Integer; var AoArray: Float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetDo( CnxInfo: pS_CNXINFO; Slot: Integer; AoArray: pWord;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetDi( CnxInfo: pS_CNXINFO; Slot: Integer; AiArray: pWord;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetDo( CnxInfo: pS_CNXINFO; Slot: Integer; AoArray: pWord;
            StartCnah, NumOfChans: Integer; type1: Word ): Longint;
    stdcall; external ADSDNet;
function DNGetAlarmState( CnxInfo: pS_CNXINFO; Slot: Integer;
            AlarmState: pS_ALMSTATUS; StartChan, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetHiAlarm( CnxInfo: pS_CNXINFO; Slot: Integer; var HiAlarm: Float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetLoAlarm( CnxInfo: pS_CNXINFO; Slot: Integer; var LoAlarm: Float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNSetAlarmEnabled( CnxInfo: pS_CNXINFO; Slot: Integer;
            var LoAlarm, HiAlarm: Word;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetHiAlarm( CnxInfo: pS_CNXINFO; Slot: Integer; var HiAlarm: float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetLoAlarm( CnxInfo: pS_CNXINFO; Slot: Integer; var LoAlarm: float;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGetAlarmEnabled( CnxInfo: pS_CNXINFO; Slot: Integer;
            var LoAlarm, HiAlarm: Word;
            StartCnah, NumOfChans: Integer ): Longint;
    stdcall; external ADSDNet;
function DNGet5kVersion( CnxInfo: pS_CNXINFO; var Version: Word ): Longint;
    stdcall; external ADSDNet;
function DNSetEPR( CnxInfo: pS_CNXINFO; EPR: Word ): Longint;
    stdcall; external ADSDNet;
function DNGet5kType( CnxInfo: pS_CNXINFO; Slot: Integer;
            var type1: Word ): Longint;
    stdcall; external ADSDNet;
function DNSetHz( CnxInfo: pS_CNXINFO; Slot: Integer; Hz: WORD ): Longint;
    stdcall; external ADSDNet;
function DNGetHz( CnxInfo: pS_CNXINFO; Slot: Integer; var Hz: Word ): Longint;
    stdcall; external ADSDNet;
function DNSetRange( CnxInfo: pS_CNXINFO; Slot: Integer;
            RangeCode: Word ): Longint;
    stdcall; external ADSDNet;
function DNGetRange( CnxInfo: pS_CNXINFO; Slot: Integer;
            var RangeCode: Word ): Longint;
    stdcall; external ADSDNet;
function DNSetSlew( CnxInfo: pS_CNXINFO; Slot: Integer;
            SlewRate: Word ): Longint;
    stdcall; external ADSDNet;
function DNGetSlew( CnxInfo: pS_CNXINFO; Slot: Integer;
            var SlewRate: Word ): Longint;
    stdcall; external ADSDNet;
function DNSpanCali( CnxInfo: pS_CNXINFO; Slot: Integer ): Longint;
    stdcall; external ADSDNet;
function DNZeroCali( Cnxinfo: pS_CNXINFO; Slot: Integer ): Longint;
    stdcall; external ADSDNet;
function DNCJCCali( CnxInfo: pS_CNXINFO; Slot: Integer; offset: float ): Longint;
    stdcall; external ADSDNet;
function DNAO4mACali( CnxInfo: pS_CNXINFO; Slot, Chan: Integer;
            ReadValue: float ): Longint;
    stdcall; external ADSDNet;
function DNAO20mACali( CnxInfo: pS_CNXINFO; Slot, Chan: Integer;
            ReadValue: float ): Longint;
    stdcall; external ADSDNet;
function DNSetEventEnabled( Enabled: Integer; Port, DestMacID: Word;
            APEventName: PChar ): Longint;
    stdcall; external ADSDNet;
function DNGetEventData( var Port, MacID: Word; var type1: Integer;
            Data: PChar ): Longint;
    stdcall; external ADSDNet;
function DNDeviceGetParamOfReg( DeviceNum: Longint;
            var MacID: Word;
            var BoardID: Longint;
            var SlotNo, DelayTime,
                AlarmEnabled, EventEnabled: Word ): Longint;
    stdcall; external ADSDNet;
function DNNodeReset( Port: WORD; DestMacID: WORD ): Longint;
    stdcall; external ADSDNet;
function DNEnableEvent( Port: WORD; DestMacID: WORD; Enable: Boolean): Longint; 
	stdcall; external ADSDNet;
function DNCheckEvent( Port: WORD; TimePeriod: Longint): Longint;
	stdcall; external ADSDNet;
function DNCheckDuplicatedMacID( MyMacID: WORD; Port: WORD): Longint;
    stdcall; external ADSDNet;

 {function DRV_SelectDevice( hCaller : HWND; wGetModule : Boolean;
             Var lDeviceNum : Longint; szDescription : Pchar) : Longint; stdcall;
             external ADSAPI32;}
function  GetErrorMessage( ErrCode: Longint ): string;
function  StrToFloat(const s: string ): Double;

implementation

function GetErrorMessage( ErrCode: Longint ): string;
const
  MaxErrMsg = 30;
  ErrMsg: array[1..MaxErrMsg] of PChar = (
    'DeviceNet Initialization Failed',
    'Send Message Failed On Port %d MACID %XH',
    'Run Out Of Message ID',
    'Invalid Input Parameters',
    'Error Response On Port %d MACID %XH',
    'No Response On Port %d MACID %XH',
    'Busy On Network On Port %d MACID %XH',
    'Unknown Response On Port %d MACID %XH',
    'Message Length Is Too Long On Port %d MACID %XH',
    'Fragment Response Error On Port %d MACID %XH',
    'Too Much Data Acknowledge On Port %d MACID %XH',
    'Fragment Request Error On Port %d MACID %XH',
    'Event Enable/Disable Error On Port%d MACID%XH',
    'Device Net Driver Create/Open Event Failed On Port%d MACID%XH',
    'IO Message Request Error On Port%d MACID%XH',
    'Get Event Name From CAN Driver Failed On Port%d MACID%XH',
    'Wait For Message Time Out Error On Port%d MACID%XH',
    'Open CAN Card Failed',
    'Close CAN Card Failed',
    'DeviceNet Reset Failed',
    'Configure Data In Registry Lost',
    'CAN Bus Bus-Off Error On Port%d ! DNinit(...) Please!',
    'Invalid Message ID On Port%d MACID%XH',
    'Set EPR Error On Port%d MACID%XH ! DNUcmmCloseReq(...) Please!',
    'Duplicate Mac ID Check Failed On Port%d',
    'Wait For Message Time Out Error On Port%d MACID%XH',
	'Receive Group2 Message On Port%d MacID%XH',
	'Check Event Failed On Port%d MacID%XH',
	'Check Event Timeout On Port%d MacID%XH',
	'Data Overrun Error On Port%d');

var code: Longint;
    nBase, nPort: Integer;

  function GetErrorCode( n: Longint ): Longint;
  begin
    Result := n and $0FFFF;
  end;

  function GetBaseAddr( n: Longint ): Integer;
  begin
    Result := (n and $0FFF0000) shr 16;
  end;

  function GetComPort( n: Longint ): Integer;
  begin
    Result := (n and $F0000000) shr 28;
  end;

begin
  code := GetErrorCode(ErrCode);
  if (code<1) or (code>MaxErrMsg) then
    Result := 'Invalid Error Code'
  else
    begin
      Result := StrPas(ErrMsg[code]);

      nBase := GetBaseAddr(ErrCode);
      nPort := GetComPort(ErrCode);

      if (nBase<>0) and (nPort<>0) then
        Result := Format( Result, [nPort,nBase] )
      else if (nBase<>0) and (nPort=0) then
        Result := Format( Result, [nBase] )
      else if (nBase=0) and (nPort<>0) then
        Result := Format( Result, [nPort] );
    end;
end;

function  StrToFloat(const s: string ): Double;
var fraction, i: Integer;
begin
  Result := 0.0;
  fraction := 0;

  for i:= 1 to Length(s) do
  begin
    if s[i] in ['0'..'9'] then
      if fraction=0 then
        Result := Result*10 + (ord(s[i]) - ord('0'))
      else
        begin
          Result := Result + (ord(s[i]) - ord('0')) / fraction;
          fraction := fraction * 10;
        end
    else if (s[i]='.') and (fraction=0) then
      fraction := 10
    else
      break;
  end;
end;

end.
