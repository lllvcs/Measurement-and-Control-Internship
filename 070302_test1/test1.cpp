#include <windows.h>
#include <iostream>
#include <conio.h>
#include "winio.h"
#pragma comment(lib,"winio.lib")
using namespace std;


void main(void)
{
	unsigned short BASE =0xE880;
	int iPort=16;
	if (!InitializeWinIo())
	{
		cout<<"Error in InitializeWinIo!"<<endl;
		exit(1);
	}

	int DO_data;
	cout <<"DI_data"<<"=";
	cin >>DO_data;

	_outp(BASE+iPort,DO_data);
	ShutdownWinIo();

/*	int DI_data;
	DI_data = _inp(BASE+iPort);
	cout <<"DI_data"<<"="<<DI_data<<endl;
	ShutdownWinIo();
	*/
}