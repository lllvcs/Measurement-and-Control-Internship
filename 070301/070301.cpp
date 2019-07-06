#include <iostream.h>


void maopao(int a[], int n)
{
	int i,j,b;
	for (i=n-1;i>0;i--)
	{
		for (j=0;j<i;j++)
		{if (a[j]>a[j+1])
		
		b=a[j];
		a[j]=a[j+1];
		a[j+1]=b;

		}
	}
}


int main()
{
	int i;
	extern int n;
	cin>>n;
	int a[];
	i=0;
	while (cin>>a[i])
	{
//		cout<<a[i]<<" ";
		i++;
	}

	maopao(a,n);
		for(i=1; i<=n; i++)
			cout<<a[i]<<" ";

	return 0;
}
