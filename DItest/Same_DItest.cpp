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
	


// ��ʼ��WinIO 
	
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}


//����������

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
	cout<<"��a������ʾ����b������ʾ����q�˳�"<<endl;


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
				cout<<"��a������ʾ����b������ʾ����q�˳�"<<endl;
				system("cls");
				continue;
			}
			else if (_getch() == 'b')
		{
			reversearray(DI);
			DO_data=creat_DO(DI);
			_outp(BASE_ADDRESS+iPort,~DO_data);
			cout<<"��a������ʾ����b������ʾ����q�˳�"<<endl;
			system("cls");
			continue;
			}
	}
	else
	{
//			cout<<"��a������ʾ����b������ʾ����q�˳�"<<endl;
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
			cout<<"��q�˳�"<<endl;

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

	cout<<"��q�˳�"<<endl;

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

*/

/*	cout<<"��n�����ɼ����������˳�"<<endl;
 	c = getch();
  	if(c=='n'||c=='N')  continue;
  	else break;
*/	   
   
   




    ShutdownWinIo();		//�ر�WinIO							
}