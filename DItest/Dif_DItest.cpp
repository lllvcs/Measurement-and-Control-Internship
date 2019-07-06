// 数字量输入例程.

#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib,"winio.lib")
using namespace std;

int creat_DI(int (&DI_bit)[8], int num)  //把8位拆出放入数组
{
  	int i=0;
  	for(i=0;i<8;i++)
   	DI_bit[i]=(num>>i)&0x0001;    //右移与0001与计算
  	return 0;
}


void main(void)
{
	char c;
	unsigned short BASE_ADDRESS = 0xE880;
	int iPort=16;
	


// 初始化WinIO 
	
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}


//数字量输入

	int i;
	int DI_data;
	int DI[8]={0};

   while(1)
   {
	DI_data = _inp(BASE_ADDRESS + iPort);
//	cout<<DI_data<<endl;
  	creat_DI(DI,DI_data);
//	Sleep(100);
  	for(i=0;i<8;i++)
	{
	cout<<"DI_"<<i+1<<"="<<DI[i]<<endl;
	}
  	
	
	_outp(BASE_ADDRESS+iPort,DI_data);

//	Sleep(200);

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
		system("cls");
		continue;
	}

/*	cout<<"按n继续采集，其它键退出"<<endl;
 	c = getch();
  	if(c=='n'||c=='N')  continue;
  	else break;
*/	   
   
   }
    ShutdownWinIo();		//关闭WinIO							
}