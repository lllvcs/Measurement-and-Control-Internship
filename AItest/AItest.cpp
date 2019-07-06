#include "stdafx.h"
#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib,"winio.lib")

using namespace std;

void main(void)
{
	

	
	unsigned short BASE_ADDRESS = 0xE880;
	int iChannel = 0;
	float fHiVolt, fLoVolt, temp;
	unsigned short adData;
	unsigned char ucGain;
	unsigned char ucStatus = 1;
//	short Lbyte, Hbyte;
	int i=1;

	unsigned short tmp;

	/* 初始化WinIO */
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}

		_outp(BASE_ADDRESS + 6, 0x01);		// 设置软件触发方式，禁止中断
		_outp(BASE_ADDRESS + 9, 0);		//Clear FIFO

		//选择起始和结束通道
		_outp(BASE_ADDRESS + 4, iChannel);     //Start channel
		_outp(BASE_ADDRESS + 5, iChannel);     //Stop channel

		//设置增益及电压范围
		fLoVolt = -10.0;
		fHiVolt = 10.0;
		ucGain = 0x04;
		_outp(BASE_ADDRESS + 2, ucGain);

		
		

		while(!kbhit())
		{
			 system("cls");

			//软件触发AD采集
			_outp(BASE_ADDRESS, 0);
			ucStatus = 1;

			while((!_kbhit()) && (ucStatus == 1))
			{
				ucStatus = (_inp(BASE_ADDRESS + 7)) & 0x01;
			}


			if (ucStatus == 0)
			{
				tmp = _inpw(BASE_ADDRESS);
				adData = tmp & 0xfff;
			
				temp = (fHiVolt-fLoVolt) * adData / 4095.0 + fLoVolt;
				cout<<endl<<"模拟量第 "<<iChannel<<"通道采集电压为："<<temp;
			
			}
			else
			{
				cout<<endl<<"采集数据错误！";
				break;
			}
		}


	ShutdownWinIo();

}
