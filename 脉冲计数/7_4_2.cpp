// ��������������.

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

void main(void)
{

	unsigned short BASE_ADDRESS = 0xE880;
	int iPort = 16;

	// ��ʼ��WinIO

	if (!InitializeWinIo())
	{
		cout << "Error In InitializeWinIo!" << endl;
		exit(1);
	}

	//����������

	int DI_data;
	int DI[8] = {0};
	int count = 0;
	int x = 1, y = 1;

	while (1)
	{
		if (_kbhit())
		{
			if (_getch() == 'q')
			{
				break;
			}

			else if (_getch() == 'c')
			{
				count = 0;
				continue;
			}
		}
		else
		{
			DI_data = _inp(BASE_ADDRESS + iPort);
			creat_DI(DI, DI_data);
			y = DI[1];

			if (DI[0] == 1)
			{
				continue;
			}

			else if (DI[0] == 0)
			{
				if (y == 0 && x == 1)
				{
					count++;
					x = y;
				}

				else
				{
					x = y;
				}
			}
		}

		system("cls");
		cout << count << endl
			 << "��c���㣬��q�˳�" << endl;
		continue;
	}
	ShutdownWinIo(); //�ر�WinIO
}