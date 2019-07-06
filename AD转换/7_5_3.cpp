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

	_outp(BASE_ADDRESS + 6, 0x01); // �������������ʽ����ֹ�ж�
	_outp(BASE_ADDRESS + 9, 0);	//Clear FIFO

	//ѡ����ʼ�ͽ���ͨ��
	_outp(BASE_ADDRESS + 4, channel); //Start channel
	_outp(BASE_ADDRESS + 5, channel); //Stop channel

	//�������漰��ѹ��Χ
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

			cout << "�趨�����ѹֵ:" << vout << endl
				 << "ģ������ " << channel << "ͨ���ɼ���ѹΪ:" << temp << endl
				 << "������:" << delta << endl
				 << "�������:" << relative_error << endl;
			cout << "��������˳����" << endl;
			continue;
		}

		else
		{
			cout << endl
				 << "�ɼ����ݴ���";
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

	/* ��ʼ��WinIO */
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

		cout << "��q���˳�����c������" << endl;

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