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

	// 初始化WinIO

	if (!InitializeWinIo())
	{
		cout << "Error In InitializeWinIo!" << endl;
		exit(1);
	}

	//数字量输入

	int DI_data;
	int DO_data;
	int DI[8] = {0};
	int DO[8] = {0};
	int count = 0;
	int real = 0;
	int x = 1, y = 1;
	int m = 1, n = 1;
	int ten = 0, one = 0;

	while (1)
	{
		DI_data = _inp(BASE_ADDRESS + iPort);
		creat_DI(DI, DI_data);

		y = DI[1];
		n = DI[2];
		real = 99 - count;
		one = real % 10;
		ten = real / 10;

		DO[0] = one % 2;
		DO[1] = one / 2 % 2;
		DO[2] = one / 4 % 2;
		DO[3] = one / 8 % 2;
		DO[4] = ten % 2;
		DO[5] = ten / 2 % 2;
		DO[6] = ten / 4 % 2;
		DO[7] = ten / 8 % 2;

		DO_data = creat_DO(DO);
		_outp(BASE_ADDRESS + iPort, DO_data);

		system("cls");
		cout << real << endl
			 << "按c清零，按q退出" << endl;

		if (_kbhit())
		{
			if (_getch() == 'q')
			{
				break;
			}

			else if (_getch() == 'c')
			{
				count = 0;
			}
		}

		else
		{

			if (DI[0] == 0)
			{

				if (y == 0 && x == 1)
				{
					if (count > 99)
					{
						_outp(BASE_ADDRESS + iPort, 255);
					}

					else
					{
						count++;
						Sleep(1000);
					}

					x = y;
				}

				else if (n == 0 && m == 1)
				{

					if (count < 1)
					{
						_outp(BASE_ADDRESS + iPort, 255);
					}

					else
					{
						count--;
						Sleep(1000);
					}

					m = n;
				}

				else
				{
					x = y;
					m = n;
				}
			}

			else
			{
			}
		}
		continue;
	}
	ShutdownWinIo(); //关闭WinIO
}
