#define     FLOAT   float
#define     CHAR    char
#define     USHORT  unsigned short
#define     SHORT   short
#define     ULONG   unsigned long

#define      MaxErrMsgLen   80         // Max Error Message Length
//#define      BD_DN5017      (0x4e)     // ADAM 5017
//#define      BD_DN5018      (0x4f)     // ADAM 5018
//#define      BD_DN5024      (0x50)     // ADAM 5024
//#define      BD_DN5051      (0x51)     // ADAM 5051
//#define      BD_DN5056      (0x52)     // ADAM 5056
//#define      BD_DN5060      (0x53)     // ADAM 5060

#define GetErrorCode(n) ((UINT)(n & 0x0000FFFF))
#define GetBaseAddr(n)  ((int)((n & 0x0FFF0000) >> 16))
#define GetComPort(n)   ((int)((n & 0xF0000000) >> 28))

static void AddControlString(HWND);
static void SetHardwareSettings(HWND);
static void GetHardwareSettings(HWND);
static float Power(int,int);
static DWORD StringToDec(char far *,int);
static void GetErrorMessage(LRESULT lError,LPSTR lpszErrMsg);
