#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"

#pragma comment(lib, "winio.lib")
using namespace std;

int creat_DI(int (&DI_bit)[8], int num)
{
	int i = 0;
	for (i = 0; i < 8; i++)
		DI_bit[i] = (num >> i) & 0x0001;
	return 0;
}

int creat_DO(int (&DO_bit)[8])
{
	int temp = 0;
	int i = 0;
	for (i = 8; i > 0; i--)
	{
		temp = (temp + DO_bit[i]) * 2;
	}
	return temp + DO_bit[0];
}

void main(void)
{

	unsigned short BASE_ADDRESS = 0xE880;
	int iPort = 16;
	if (!InitializeWinIo())
	{
		cout << "Error In InitializeWinIo!" << endl;
		exit(1);
	}

	//数字量输入

	_outp(BASE_ADDRESS + iPort, 0);
	int DI_data;
	int DI[8] = {0};
	int count[8] = {0};
	int real[8] = {0};
	int i = 0;
	int light = 0;

	while (1)
	{
		DI_data = _inp(BASE_ADDRESS + iPort);
		creat_DI(DI, DI_data);

		for (i = 0; i < 8; i++)
		{
			if (DI[i] == 0)
			{
				count[i] = 1;
			}

			if (count[i] == 100)
			{
				count[i] = 0;
			}

			if (count[i] != 0)
			{
				count[i]++;
				real[i] = 1;
			}

			if (count[i] == 0)
			{
				real[i] = 0;
			}
		}
		light = real[0] + real[1] * 2 + real[2] * 4 + real[3] * 8 + real[4] * 16 + real[5] * 32 + real[6] * 64 + real[7] * 128;
		system("cls");
		cout << light << endl
			 << count[0] << endl
			 << count[1] << endl
			 << count[2] << endl
			 << count[3] << endl
			 << count[4] << endl
			 << count[5] << endl
			 << count[6] << endl
			 << count[7] << endl;
		_outp(BASE_ADDRESS + iPort, light);
		Sleep(30);
		continue;
	}
	ShutdownWinIo(); //关闭WinIO
}
