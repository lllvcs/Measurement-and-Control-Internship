#include "stdafx.h"
#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib, "winio.lib")

using namespace std;

extern unsigned short BASE_ADDRESS = 0xE880;

void AD(short channel, float vout)
{
	//	float fVoltage;
	float fHiVolt, fLoVolt, temp, delta, relative_error;
	unsigned short adData;
	unsigned char ucGain;
	unsigned char ucStatus = 1;
	//	short Lbyte, Hbyte;
	short i = 1;
	unsigned short tmp;

	_outp(BASE_ADDRESS + 6, 0x01); // 设置软件触发方式，禁止中断
	_outp(BASE_ADDRESS + 9, 0);	//Clear FIFO

	//选择起始和结束通道
	_outp(BASE_ADDRESS + 4, channel); //Start channel
	_outp(BASE_ADDRESS + 5, channel); //Stop channel

	//设置增益及电压范围
	fLoVolt = -10.0;
	fHiVolt = 10.0;
	ucGain = 0x04;
	_outp(BASE_ADDRESS + 2, ucGain);

	while (!kbhit())
	{
		system("cls");
		_outp(BASE_ADDRESS, 0);
		ucStatus = 1;
		while (ucStatus == 1)
		{
			ucStatus = (_inp(BASE_ADDRESS + 7)) & 0x01;
		}

		if (ucStatus == 0)
		{

			tmp = _inpw(BASE_ADDRESS);
			adData = tmp & 0xfff;

			temp = (fHiVolt - fLoVolt) * adData / 4095.0 + fLoVolt;

			delta = (vout - temp);
			relative_error = delta / temp;

			cout << "设定输出电压值:" << vout << endl
				 << "模拟量第 " << channel << "通道采集电压为:" << temp << endl
				 << "相对误差:" << delta << endl
				 << "绝对误差:" << relative_error << endl;
			cout << "按任意键退出检测" << endl;
			continue;
		}

		else
		{
			cout << endl
				 << "采集数据错误！";
			break;
		}
	}
}

void DA(short channel, float vout)
{

	float fHiVolt, fLoVolt;
	short AOPort;
	short LByte;
	short HByte;
	unsigned short outData;
	_outp(BASE_ADDRESS + 14, 1);
	fHiVolt = 10;
	fLoVolt = 0;
	AOPort = 10 + channel * 2;

	outData = (unsigned short)(vout / (fHiVolt - fLoVolt) * 0xfff);
	LByte = outData & 0xff;
	HByte = (outData >> 8) & 0x0f;
	_outp(BASE_ADDRESS + AOPort, LByte);
	_outp(BASE_ADDRESS + AOPort + 1, HByte);
}

void main(void)
{

	system("cls");
	short iChannel;
	short AOPort;
	float fVoltage;

	/* 初始化WinIO */
	if (!InitializeWinIo())
	{
		cout << "Error In InitializeWinIo!" << endl;
		exit(1);
	}

	while (1)
	{
		system("cls");

		cout << "please input channel value" << endl;
		cin >> iChannel;

		cout << "please input volt value" << endl;
		cin >> fVoltage;

		AOPort = 10 + iChannel * 2;
		DA(iChannel, fVoltage);
		AD(iChannel, fVoltage);

		cout << "按q键退出，按c键继续" << endl;

		if (_kbhit())
		{
			if (_getch() == 'q')
			{
				break;
			}

			else if (_getch() == 'c')
			{
				continue;
			}
		}

		_outp(BASE_ADDRESS + AOPort, 0);
		_outp(BASE_ADDRESS + AOPort + 1, 0);
		ShutdownWinIo();
	}
}