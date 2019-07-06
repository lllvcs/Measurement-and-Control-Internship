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

int creat_DO(int (&DO_bit)[8])
{
	int temp = 0;
	int i=0;
	for(i=8;i>0;i--)
	{
		temp=(temp+DO_bit[i])*2;
	}
	return temp+DO_bit[0];
}

void reversearray(int DI[])
{
	int i =0 ;
	int n=8;
	while(i<n)
	{
		swap(DI[i++],DI[--n]);
	}
}


void main(void)
{
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
	int DO_data;
	int DI[8]={0};

   while(1)
   {
	DI_data = _inp(BASE_ADDRESS + iPort);
//	cout<<DI_data<<endl;
  	creat_DI(DI,DI_data);


	for(i=0;i<8;i++)
	{
	cout<<"DI_"<<i+1<<"="<<DI[i]<<endl;
	}
	cout<<"按a正向显示，按b反向显示，按q退出"<<endl;


		if(_kbhit())
	{
		if (_getch() == 'q')
		{
			break;
		}
		else if (_getch() == 'a')
			{
				reversearray(DI);
				DO_data=creat_DO(DI);
				_outp(BASE_ADDRESS+iPort,DO_data);
				cout<<"按a正向显示，按b反向显示，按q退出"<<endl;
				system("cls");
				continue;
			}
			else if (_getch() == 'b')
		{
			reversearray(DI);
			DO_data=creat_DO(DI);
			_outp(BASE_ADDRESS+iPort,~DO_data);
			cout<<"按a正向显示，按b反向显示，按q退出"<<endl;
			system("cls");
			continue;
			}
	}
	else
	{
//			cout<<"按a正向显示，按b反向显示，按q退出"<<endl;
			system("cls");
			continue;
		
	}
   }













/*



	if(_kbhit())
	{
		if (_getch() == 'a')
		{
			reversearray(DI);
			DO_data=creat_DO(DI);
			_outp(BASE_ADDRESS+iPort,DO_data);
			cout<<"按q退出"<<endl;

	if(_kbhit())
	{
		if (_getch() == 'q')
		{
			break;
		}
	
	else 
	{
		system("cls");
		continue;
	}
		}
	}
	}

	else
	{
		reversearray(DI);
		DO_data=creat_DO(DI);
		_outp(BASE_ADDRESS+iPort,~DO_data);

	cout<<"按q退出"<<endl;

	{if(_kbhit())
	{
		if (_getch() == 'q')
		{
			break;
		}
	
	else 
	{
		system("cls");
		continue;
	}

	}
	}

	}
   }
}

/*	reversearray(DI);
	DO_data=creat_DO(DI);
	_outp(BASE_ADDRESS+iPort,DO_data);

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

*/

/*	cout<<"按n继续采集，其它键退出"<<endl;
 	c = getch();
  	if(c=='n'||c=='N')  continue;
  	else break;
*/	   
   
   




    ShutdownWinIo();		//关闭WinIO							
}