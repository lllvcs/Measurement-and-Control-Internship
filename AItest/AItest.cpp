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

	/* ��ʼ��WinIO */
	if (!InitializeWinIo())
	{
		cout<<"Error In InitializeWinIo!"<<endl;
		exit(1);
	}

		_outp(BASE_ADDRESS + 6, 0x01);		// �������������ʽ����ֹ�ж�
		_outp(BASE_ADDRESS + 9, 0);		//Clear FIFO

		//ѡ����ʼ�ͽ���ͨ��
		_outp(BASE_ADDRESS + 4, iChannel);     //Start channel
		_outp(BASE_ADDRESS + 5, iChannel);     //Stop channel

		//�������漰��ѹ��Χ
		fLoVolt = -10.0;
		fHiVolt = 10.0;
		ucGain = 0x04;
		_outp(BASE_ADDRESS + 2, ucGain);

		
		

		while(!kbhit())
		{
			 system("cls");

			//�������AD�ɼ�
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
				cout<<endl<<"ģ������ "<<iChannel<<"ͨ���ɼ���ѹΪ��"<<temp;
			
			}
			else
			{
				cout<<endl<<"�ɼ����ݴ���";
				break;
			}
		}


	ShutdownWinIo();

}
