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
	int DI[8] = {0};

	while (1)
	{
		DI_data = _inp(BASE_ADDRESS + iPort);
		creat_DI(DI, DI_data);

		if (DI[0] == 0 && DI[1] == 1)
		{
			_outp(BASE_ADDRESS + iPort, 85);

			DI_data = _inp(BASE_ADDRESS + iPort);
			creat_DI(DI, DI_data);

			if (DI[0] == 0 && DI[1] == 1)
			{
				Sleep(100);
				_outp(BASE_ADDRESS + iPort, 170);
				Sleep(100);
			}
			else
			{
				continue;
			}
		}

		else if (DI[0] == 1 && DI[1] == 0)
		{
			_outp(BASE_ADDRESS + iPort, 129);
			if (DI[0] != 1 || DI[1] != 0)
			{
				continue;
			}

			else
			{
				Sleep(100);

				_outp(BASE_ADDRESS + iPort, 66);
				DI_data = _inp(BASE_ADDRESS + iPort);
				creat_DI(DI, DI_data);
				if (DI[0] != 1 || DI[1] != 0)
				{
					continue;
				}

				else
				{
					Sleep(100);

					_outp(BASE_ADDRESS + iPort, 36);
					DI_data = _inp(BASE_ADDRESS + iPort);
					creat_DI(DI, DI_data);
					if (DI[0] != 1 || DI[1] != 0)
					{
						continue;
					}
					else
					{
						Sleep(100);

						_outp(BASE_ADDRESS + iPort, 24);
						DI_data = _inp(BASE_ADDRESS + iPort);
						creat_DI(DI, DI_data);
						if (DI[0] != 1 || DI[1] != 0)
						{
							continue;
						}
						else
						{
							Sleep(100);

							_outp(BASE_ADDRESS + iPort, 36);
							DI_data = _inp(BASE_ADDRESS + iPort);
							creat_DI(DI, DI_data);
							if (DI[0] != 1 || DI[1] != 0)
							{
								continue;
							}
							else
							{
								Sleep(100);

								_outp(BASE_ADDRESS + iPort, 66);
								DI_data = _inp(BASE_ADDRESS + iPort);
								creat_DI(DI, DI_data);
								if (DI[0] != 1 || DI[1] != 0)
								{
									continue;
								}
								else
								{
									Sleep(100);

									_outp(BASE_ADDRESS + iPort, 129);
									DI_data = _inp(BASE_ADDRESS + iPort);
									creat_DI(DI, DI_data);
									if (DI[0] != 1 || DI[1] != 0)
									{
										continue;
									}
									else
									{
										Sleep(100);
									}
								}
							}
						}
					}
				}
			}
		}

		else if (DI[0] == 0 && DI[1] == 0)
		{
			_outp(BASE_ADDRESS + iPort, 1);
			if (DI[0] + DI[1] != 0)
			{
				continue;
			}

			else
			{
				Sleep(100);

				_outp(BASE_ADDRESS + iPort, 2);
				DI_data = _inp(BASE_ADDRESS + iPort);
				creat_DI(DI, DI_data);
				if (DI[0] + DI[1] != 0)
				{
					continue;
				}

				else
				{
					Sleep(100);

					_outp(BASE_ADDRESS + iPort, 4);
					DI_data = _inp(BASE_ADDRESS + iPort);
					creat_DI(DI, DI_data);
					if (DI[0] + DI[1] != 0)
					{
						continue;
					}
					else
					{
						Sleep(100);

						_outp(BASE_ADDRESS + iPort, 8);
						DI_data = _inp(BASE_ADDRESS + iPort);
						creat_DI(DI, DI_data);
						if (DI[0] + DI[1] != 0)
						{
							continue;
						}
						else
						{
							Sleep(100);

							_outp(BASE_ADDRESS + iPort, 16);
							DI_data = _inp(BASE_ADDRESS + iPort);
							creat_DI(DI, DI_data);
							if (DI[0] + DI[1] != 0)
							{
								continue;
							}
							else
							{
								Sleep(100);

								_outp(BASE_ADDRESS + iPort, 32);
								DI_data = _inp(BASE_ADDRESS + iPort);
								creat_DI(DI, DI_data);
								if (DI[0] + DI[1] != 0)
								{
									continue;
								}
								else
								{
									Sleep(100);

									_outp(BASE_ADDRESS + iPort, 64);
									DI_data = _inp(BASE_ADDRESS + iPort);
									creat_DI(DI, DI_data);
									if (DI[0] + DI[1] != 0)
									{
										continue;
									}
									else
									{
										Sleep(100);

										_outp(BASE_ADDRESS + iPort, 128);
										DI_data = _inp(BASE_ADDRESS + iPort);
										creat_DI(DI, DI_data);
										if (DI[0] + DI[1] != 0)
										{
											continue;
										}
										else
										{
											Sleep(100);
										}
									}
								}
							}
						}
					}
				}
			}
		}

		else
		{
			_outp(BASE_ADDRESS + iPort, 255);
			Sleep(100);
			_outp(BASE_ADDRESS + iPort, 0);
			Sleep(100);
		}

		//	Sleep(100);
		continue;
	}
	ShutdownWinIo(); //关闭WinIO
}
