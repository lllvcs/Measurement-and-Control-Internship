#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"


#pragma comment(lib,"winio.lib")
using namespace std;


int creat_DI(int (&DI_bit)[8], int num)
{
  	int i=0;
  	for(i=0;i<8;i++)
   	DI_bit[i]=(num>>i)&0x0001;
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





void main(void)
{

	unsigned short BASE_ADDRESS = 0xE880;
	int iPort=16;
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}

//数字量输入


	int DI_data;
	int DI[8]={0};
	int x=1,y=1,w=1,z=1;
	int real=0,load=0;
	_outp(BASE_ADDRESS + iPort, 0);

   while(1)
   {
		DI_data = _inp(BASE_ADDRESS + iPort);
		creat_DI(DI,DI_data);
		
		x=y;
		y=DI[0];
		w=z;
		z=DI[1];

		load=1-DI[2]+(1-DI[3])*2+(1-DI[4])*4+(1-DI[5])*8;
		system("cls");
		cout<<load<<endl;

		if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
		if(x==0 && y==1 && real==0)
			{
				_outp(BASE_ADDRESS + iPort, 1);
				Sleep(1000);

if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{

				_outp(BASE_ADDRESS + iPort, 3);
				Sleep(1000);

if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
				_outp(BASE_ADDRESS + iPort, 7);
				real=1;
				
/*				if(load<=10)
				{
					_outp(BASE_ADDRESS + iPort, 15);
					continue;
				}
				
				
				else if(load>10 && load<=13)
				{
					_outp(BASE_ADDRESS + iPort, 23);
					continue;
				}
				
				
				else
				{
					_outp(BASE_ADDRESS + iPort, 85);
					Beep(175,3000);

if(DI[7]==0)
{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
else
{
					if(load<=13)
					{continue;}
					else
					{
						_outp(BASE_ADDRESS + iPort, 35);
						Sleep(1000);
						_outp(BASE_ADDRESS + iPort, 33);
						Sleep(1000);
						_outp(BASE_ADDRESS + iPort, 0);
						real=0;
						continue;
					}
				}}*/

		}}}


//		if(DI[7]==0)
//		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		
		else if(w==0 && z==1 && real==1)
		{
				if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
				_outp(BASE_ADDRESS + iPort, 3);
				Sleep(1000);
				if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
				_outp(BASE_ADDRESS + iPort, 1);
				Sleep(1000);}
		if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
				_outp(BASE_ADDRESS + iPort, 0);
				real=0;}
				continue;
		}
		}


//		if(DI[7]==0)
//		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else if(y==1 && z==1 && real==1)
		{
			if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
			if(load<=10)
				{
					_outp(BASE_ADDRESS + iPort, 15);
					continue;
				}
				
				
				else if(load>10 && load<=13)
				{
					_outp(BASE_ADDRESS + iPort, 23);
					continue;
				}
				
				
				else
				{
					if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
					_outp(BASE_ADDRESS + iPort, 39);
					Beep(262,3000);
					if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
					//Sleep(3000);
					DI_data = _inp(BASE_ADDRESS + iPort);
					creat_DI(DI,DI_data);
					load=1-DI[2]+(1-DI[3])*2+(1-DI[4])*4+(1-DI[5])*8;
					
					system("cls");
					cout<<load<<endl;
					if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
					if (load > 13)
					{	
						_outp(BASE_ADDRESS + iPort, 35);
						Sleep(1000);
						if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
						_outp(BASE_ADDRESS + iPort, 33);
						Sleep(1000);
						if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
						_outp(BASE_ADDRESS + iPort, 0);
						real=0;
						continue;
		}}}}
				}}}

		}}
		else
		{
			if(DI[7]==0)
		{break;real=0;_outp(BASE_ADDRESS + iPort, 0);}
		else
		{
			continue;}
		}


		continue;

   }}
    ShutdownWinIo();		//关闭WinIO							
}
