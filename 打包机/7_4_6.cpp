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
	int count1 = 0;
	int count2 = 0;
	int x = 1, y = 1;
	int w = 1, z = 1;

	while (1)
	{
		DI_data = _inp(BASE_ADDRESS + iPort);
		//			cout<<DI_data<<endl;
		creat_DI(DI, DI_data);
		//			system("cls");
		//			cout<<DI[0]<<endl<<DI[1]<<endl;
		y = DI[0];

		if (y == 0 && x == 1 && count1 < 8)
		{
			_outp(BASE_ADDRESS + iPort, 0);
			count1++;
			x = y;
			//					continue;
		}

		else if (count1 == 8)
		{

			_outp(BASE_ADDRESS + iPort, 1);

			while (1)
			{
				_outp(BASE_ADDRESS + iPort, 1);
				DI_data = _inp(BASE_ADDRESS + iPort);
				creat_DI(DI, DI_data);
				z = DI[1];
				if (z == 0 && w == 1 && count2 < 8)
				{
					count2++;
					w = z;
					//								continue;
				}

				else if (count2 == 8)
				{
					_outp(BASE_ADDRESS + iPort, 2);
					x = 1, y = 1, z = 1, w = 1;
					count1 = 0;
					count2 = 0;
					break;
				}

				else
				{
					w = z;
					//								continue;
				}

				system("cls");
				cout << count2 << endl;
				continue;
			}
			//					  continue;
		}

		else
		{
			x = y;
			//					continue;
		}

		system("cls");
		cout << count1 << endl;
		continue;
	}
	ShutdownWinIo(); //关闭WinIO
}
