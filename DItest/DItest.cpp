// ��������������.

#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib,"winio.lib")
using namespace std;

int creat_DI(int (&DI_bit)[8], int num)  //��8λ�����������
{
  	int i=0;
  	for(i=0;i<8;i++)
   	DI_bit[i]=(num>>i)&0x0001;    //������0001�����
  	return 0;
}


void main(void)
{
	char c;
	unsigned short BASE_ADDRESS = 0xE880;
	int iPort=16;
	


// ��ʼ��WinIO 
	
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}


//����������

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

	cout<<"��q�˳�"<<endl;

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

/*	cout<<"��n�����ɼ����������˳�"<<endl;
 	c = getch();
  	if(c=='n'||c=='N')  continue;
  	else break;
*/	   
   
   }
    ShutdownWinIo();		//�ر�WinIO							
}