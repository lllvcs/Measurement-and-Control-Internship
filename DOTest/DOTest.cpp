#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib,"winio.lib")
using namespace std;


int creat_DO(int (&DO_bit)[8])
{
	int temp=0;
  	int i=0;
  	for(i=7;i>0;i--)
   	{
    	temp=(temp+DO_bit[i])*2;
   	}
  	return temp+DO_bit[0];
  }


void main(void)

{
	
	unsigned short BASE_ADDRESS = 0xE880;
	int OPort=16;
	
// 初始化WinIO 
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}
//数字量输出

	char c;
	int DO_data;
	int DO[8]={0};

	cout<<"请参照以下格式输入:1 0 1 0 1 0"<<endl;
  	cin>>DO[0]>>DO[1]>>DO[2]>>DO[3]>>DO[4]>>DO[5]>>DO[6]>>DO[7];
  	DO_data=creat_DO(DO);

   while(1)
   {
/*	cout<<"请参照以下格式输入:1 0 1 0 1 0"<<endl;
  	cin>>DO[0]>>DO[1]>>DO[2]>>DO[3]>>DO[4]>>DO[5]>>DO[6]>>DO[7];
  	DO_data=creat_DO(DO);
*/

  	_outp(BASE_ADDRESS + OPort, DO_data);
	Sleep(200);
    cout<<"按q退出"<<endl;

	if(_kbhit())
	{
		if (_getch() == 'q')
		{
			break;
		}
	}
	else 
	{
		DO_data++;
		system("cls");
		continue;
	}


/*	cout<<"Press n to next and other key to quit!"<<endl;
    c = _getch();
  	if(c=='n'||c=='N')  continue;
  	else break;
*/ 
	   
   }
	_outp(BASE_ADDRESS + OPort, 0);
    ShutdownWinIo();													//关闭WinIO
}