#include "..\include\driver.h"
#ifndef _INC_DNET
#define _INC_DNET

#ifdef __cplusplus
//FEXPORT "C"
extern "C"
{
#endif

#define PORTNUM                    11 

#define SUCCESS                     0
#define DnetInitFailed              1
#define DnetSendMsgFailed           2
#define DnetRunOutOfMsgID           3
#define DnetInvalidInputParam       4
#define DnetErrorResponse           5
#define DnetNoResponse              6
#define DnetBusyOnNetwork           7
#define DnetUnknownResponse         8
#define DnetNotEnoughBuffer         9
#define DnetFragResponseError       10
#define DnetTooMuchDataAck          11
#define DnetFragRequestError        12
#define DnetEnableEventError        13
#define DnetCreateOrOpenEventError  14
#define DnetIORequestError          15
#define DnetGetEventNameError       16
#define DnetTimeOutError    		17
#define DnetOpenFailed				18
#define DnetCloseFailed				19
#define DnetResetFailed				20
#define DnetConfigDataLost			21
#define DnetBusOffError				22
#define	DnetInvalidMsgID			23
#define DnetSetEPRFailed			24
#define DnetDuplicateMacIDCheckFailed				25
#define DnetWaitMsgFailed           26
#define DnetGroup2MsgReceive		27
#define DnetCheckEventFailed		28
#define DnetCheckEventTimeOut		29
#define DnetDataOverrunError		30

#define SC_GET_ATTRIB_ALL           1
#define SC_SET_ATTRIB_ALL           2
#define SC_RESET                    5
#define SC_START                    6
#define SC_STOP                     7
#define SC_CREATE                   8
#define SC_DELETE                   9
#define SC_APPLY_ATTRIB             13
#define SC_GET_ATTRIB_SINGLE        14
#define SC_SET_ATTRIB_SINGLE        16
#define SC_FIND_NEXT_OBJECT_INST    17
#define SC_ERROR_RESPONSE           20
#define SC_DNRESTORE                21
#define SC_SAVE                     22
#define SC_NO_OPERATION             23
#define SC_UCMM_OPEN_REQUEST        75
#define SC_UCMM_CLOSE_REQUEST       76

typedef struct tagCNXINFO
{
	WORD Port;						// port number 0 or 1
    unsigned short  grp;            // message group
    unsigned short  id;             // destination MAC ID
    unsigned short  pid;            // producer ID
    unsigned short  cid;            // consumer ID
    unsigned char   format;         // message body format
    unsigned short  EPR;            // expected packet rate
    unsigned short  ConnInst;       // connection instance ID
    unsigned short  size;           // data size
    unsigned char   data[512];      // data buffer
} S_CNXINFO;

typedef struct tagS_MSG
{
    unsigned char   grp;            // message group
    unsigned short  id;             // MAC ID
    unsigned char   msg;            // message ID
    unsigned char   data[512];      // data body (fragment/non-fragment)
    unsigned short  len;            // data length
} S_MSG;

typedef struct tagALMSTATUS
{
    BOOL            LoState;        // low alarm state
    BOOL            HiState;        // high alarm state
} S_ALMSTATUS;

typedef struct tagEVENTDATA
{
	WORD Port;
	WORD MacID;
	CHAR Data[8]; 
	int Type;
} S_EVENTDATA, FAR * LPS_EVENTDATA; 

FEXPORT LRESULT FAR PASCAL DNOpen(WORD,WORD FAR *,WORD FAR *,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNClose(WORD);
FEXPORT LRESULT FAR PASCAL DNInit(WORD,WORD,WORD);
FEXPORT LRESULT FAR PASCAL DNReset(WORD);
FEXPORT LRESULT FAR PASCAL DNSetTimeout(WORD);
FEXPORT LRESULT FAR PASCAL DNAllocateGrpMsg(WORD,WORD,WORD,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNFreeGrpMsg(WORD,WORD,WORD,WORD);
FEXPORT LRESULT FAR PASCAL DNUcmmOpenReq(WORD,WORD,WORD,WORD,WORD,WORD,
    S_CNXINFO FAR *);
FEXPORT LRESULT FAR PASCAL DNUcmmCloseReq(S_CNXINFO FAR *);
FEXPORT LRESULT FAR PASCAL DNSetAttrib(S_CNXINFO FAR *,WORD,WORD,WORD,
    unsigned char FAR *,WORD);
FEXPORT LRESULT FAR PASCAL DNGetAttrib(S_CNXINFO FAR *,WORD,WORD,WORD,
    unsigned char FAR *,WORD,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNSendEXPReq(S_CNXINFO FAR *);
FEXPORT LRESULT FAR PASCAL DNGetEXPRsp(S_CNXINFO FAR *);
FEXPORT LRESULT FAR PASCAL DNSetEventEnabled(int,WORD,WORD,CHAR FAR *);
FEXPORT LRESULT FAR PASCAL DNGetEventData(WORD FAR *,WORD FAR *,int *,CHAR FAR *);
FEXPORT LRESULT FAR PASCAL DNGetAi(S_CNXINFO FAR *,int,float FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNGetCJC(S_CNXINFO FAR *,int,float FAR *);
FEXPORT LRESULT FAR PASCAL DNSetChanMask(S_CNXINFO FAR *,int,WORD FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNGetChanMask(S_CNXINFO FAR *,int,WORD FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNGetAo(S_CNXINFO FAR *,int,float FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNSetAo(S_CNXINFO FAR *,int,float FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNGetAoStart(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNSetAoStart(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNGetDo(S_CNXINFO FAR *,int,WORD FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNGetDi(S_CNXINFO FAR *,int,WORD FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNSetDo(S_CNXINFO FAR *,int,WORD FAR *,int,int,
    WORD Type);
FEXPORT LRESULT FAR PASCAL DNGetAlarmState(S_CNXINFO FAR *,int,
    S_ALMSTATUS FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNSetHiAlarm(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNSetLoAlarm(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNSetAlarmEnabled(S_CNXINFO FAR *,int,
    WORD FAR *,WORD FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNGetHiAlarm(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNGetLoAlarm(S_CNXINFO FAR *,int,float FAR *,int,
    int);
FEXPORT LRESULT FAR PASCAL DNGetAlarmEnabled(S_CNXINFO FAR *,int,
    WORD FAR *,WORD FAR *,int,int);
FEXPORT LRESULT FAR PASCAL DNGet5kVersion(S_CNXINFO FAR *,
    unsigned short FAR *);
FEXPORT LRESULT FAR PASCAL DNSetEPR(S_CNXINFO FAR *,WORD);
FEXPORT LRESULT FAR PASCAL DNGet5kType(S_CNXINFO FAR *,int,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNSetHz(S_CNXINFO FAR *,int,WORD);
FEXPORT LRESULT FAR PASCAL DNGetHz(S_CNXINFO FAR *,int,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNSetRange(S_CNXINFO FAR *,int,WORD);
FEXPORT LRESULT FAR PASCAL DNGetSlew(S_CNXINFO FAR *,int,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNSetSlew(S_CNXINFO FAR *,int,WORD);
FEXPORT LRESULT FAR PASCAL DNGetRange(S_CNXINFO FAR *,int,WORD FAR *);
FEXPORT LRESULT FAR PASCAL DNSpanCali(S_CNXINFO FAR *,int);
FEXPORT LRESULT FAR PASCAL DNZeroCali(S_CNXINFO FAR *,int);
FEXPORT LRESULT FAR PASCAL DNCJCCali(S_CNXINFO FAR *,int,float);
FEXPORT LRESULT FAR PASCAL DNAO4mACali(S_CNXINFO FAR *,int,int,float);
FEXPORT LRESULT FAR PASCAL DNAO20mACali(S_CNXINFO FAR *,int,int,float);
FEXPORT LRESULT FAR PASCAL DNetResetConnection(WORD, WORD);
FEXPORT LRESULT FAR PASCAL DNetGetIOReqAndRsp(WORD,S_EVENTDATA far *);
// Retrieve from Adapi32 & Registry for Devnet API example
FEXPORT LRESULT FAR PASCAL DNDeviceGetParamOfReg(WORD, USHORT FAR *,
												 DWORD FAR *, USHORT FAR *, 
												 USHORT FAR *,USHORT FAR *,
												 USHORT FAR *);
FEXPORT LRESULT FAR PASCAL DNDeviceGetNumOfList(SHORT far *NumOfDevices);
FEXPORT LRESULT FAR PASCAL DNDeviceGetList(DEVLIST far *DeviceList,
                       SHORT MaxEntries, SHORT far *OutEntries);
FEXPORT LRESULT FAR PASCAL DNDeviceGetSubList(DWORD DeviceNum,
                       DEVLIST far *SubDevList, SHORT MaxEntries,
                       SHORT far *OutEntries);
FEXPORT LRESULT FAR PASCAL DNNodeReset(WORD,WORD);
FEXPORT LRESULT FAR PASCAL DNEnableEvent(WORD,WORD,BOOL);
FEXPORT LRESULT FAR PASCAL DNCheckEvent(WORD,DWORD);
//1999_5_17
FEXPORT LRESULT FAR PASCAL DNCheckDuplicatedMacID(WORD,WORD);
#ifdef __cplusplus
}
#endif
#endif
