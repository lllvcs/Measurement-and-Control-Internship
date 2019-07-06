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

	_outp(BASE_ADDRESS + iPort, 9);
	int DI_data;
	int DI[8] = {0};
	int i = 0;
	int call1 = 0;
	int call2 = 0;
	int x = 1, y = 1, z = 1, w = 1;
	int run = 0;
	int floor = 1;
	int doorclose = 1;

	while (1)
	{
		DI_data = _inp(BASE_ADDRESS + iPort);
		creat_DI(DI, DI_data);

		if (run == 1)
		{
			continue;
		}

		//1 人2 梯1 先上后下

		if (DI[1] == 0 && DI[0] == 1 && run == 0 && floor == 1 && doorclose == 1)
		{
			run = 1;
			_outp(BASE_ADDRESS + iPort, 9);
			Sleep(1000);

			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 6);
			floor = 2;
			doorclose = 0;

			if (doorclose == 0 && floor == 2)
			{
				int count = 0;

				while (1)
				{
					if (DI[7] == 0 || count == 30)
					{
						_outp(BASE_ADDRESS + iPort, 10);
						Sleep(1000);
						doorclose = 1;
						break;
					}
					else
					{
						Sleep(200);
						count++;
						continue;
					}
				}
			}

			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 5);
			floor = 1;
			doorclose = 0;
			run = 0;
		}

		//2 人1梯1 直接上

		if (DI[0] == 0 && DI[1] == 1 && run == 0 && floor == 1 && doorclose == 1)
		{
			_outp(BASE_ADDRESS + iPort, 5);
			Sleep(1000);
			doorclose = 0;
			if (doorclose == 0 && floor == 1)
			{
				int count = 0;

				while (1)
				{
					if (DI[7] == 0 || count == 30)
					{
						_outp(BASE_ADDRESS + iPort, 9);
						Sleep(1000);
						doorclose = 1;
						break;
					}
					else
					{
						Sleep(200);
						count++;
						continue;
					}
				}
			}

			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 6);
			floor = 2;
			doorclose = 0;
		}

		//3 人1梯2 先下后上

		if (DI[0] == 0 && DI[1] == 1 && run == 0 && floor == 2 && doorclose == 1)
		{
			_outp(BASE_ADDRESS + iPort, 10);
			Sleep(1000);

			run = 1;
			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 5);
			floor = 1;
			doorclose = 0;

			if (doorclose == 0 && floor == 1)
			{
				int count = 0;

				while (1)
				{
					if (DI[7] == 0 || count == 30)
					{
						_outp(BASE_ADDRESS + iPort, 9);
						Sleep(1000);
						doorclose = 1;
						break;
					}
					else
					{
						Sleep(200);
						count++;
						continue;
					}
				}
			}

			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 6);
			floor = 2;
			doorclose = 0;
			run = 0;
		}

		//4 人2梯2 直接下

		if (DI[1] == 0 && DI[0] != 0 && run == 0 && floor == 2 && doorclose == 1)
		{

			_outp(BASE_ADDRESS + iPort, 6);
			Sleep(1000);
			doorclose = 0;
			int count = 0;

			while (1)
			{
				if (DI[7] == 0 || count == 30)
				{
					_outp(BASE_ADDRESS + iPort, 10);
					Sleep(1000);
					doorclose = 1;
					break;
				}
				else
				{
					Sleep(200);
					count++;
					continue;
				}
			}

			_outp(BASE_ADDRESS + iPort, 128);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 64);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 32);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 16);
			Sleep(1000);
			_outp(BASE_ADDRESS + iPort, 5);
			floor = 1;
			doorclose = 0;
		}

		//关门判断

		if (doorclose == 0 && floor == 1)
		{
			int count = 0;

			while (1)
			{
				if (DI[7] == 0 || count == 30)
				{
					_outp(BASE_ADDRESS + iPort, 9);

					doorclose = 1;
					break;
				}
				else
				{
					Sleep(200);
					count++;
					continue;
				}
			}
		}

		if (doorclose == 0 && floor == 2)
		{
			int count = 0;

			while (1)
			{
				if (DI[7] == 0 || count == 30)
				{
					_outp(BASE_ADDRESS + iPort, 10);
					doorclose = 1;
					break;
				}
				else
				{
					Sleep(200);
					count++;
					continue;
				}
			}
		}

		continue;
	}
	ShutdownWinIo(); //关闭WinIO
}
