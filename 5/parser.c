#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char exp1[30],stack[30],arr[30],temp[30];
int i,k=0,j,l,r,s;
void push(char exp[])
{
	arr[i]=exp1[k];
	i++;
}
void dispinp()
{
	printf("\t\t\t");
	for(k=0;k<strlen(exp1);k++)
		printf("%c",exp1[k]); printf("$");
}
void dispstk()
{
	printf("\n");
	for(k=0;k<strlen(stack);k++)
		printf("%c",stack[k]);
}
void assign()
{
	stack[++j]=arr[i];
	exp1[i]=' ';
	dispstk();
	dispinp();
}
int main()
{
	printf("\t\t\tSHIFT REDUCE PARSER\n");
	printf("\nThe Production is: E->E+E/E*E/E-E/i\n");
	printf("\nEnter the string to be parsed:\n");
	gets(exp1);
	printf("\nSTACK\t\t\tINPUT\t\t\tACTION\n");
	printf("\n$");
	dispinp();
	printf("\t\t\tShift");
	for(k=0;k<strlen(exp1);k++)
		push(exp1);
	l=strlen(exp1);
	stack[0]='$';
	for(i=0;i<l;i++)
	{
		switch(arr[i])
		{
			case 'i': 	assign();
						printf("\t\t\tReduce by E->i");
						stack[j]='E';
						dispstk();
						dispinp();
						if(arr[i+1]!='\0')
							printf("\t\t\tShift");
						break;
			case '+': 	assign();
						printf("\t\t\tShift");
						break;
			case '*': 	assign();
						printf("\t\t\tShift");
						break;
			case '-': 	assign();
						printf("\t\t\tShift");
						break;
			default: printf("\nError:String not accepted\n");
			goto label;
		}
	}
	l=strlen(stack);
	while(l>2)
	{
		r=0;
		for(i=l-1;i>=l-3;i--)
		{
			temp[r]=stack[i];r++;
		}
		temp[r]=NULL;
		if((strcmp(temp,"E+E")==0)||(strcmp(temp,"E*E")==0)||(strcmp(temp,"E-E")==0))
		{
			for(i=l;i>l-3;i--)
				stack[i]=' ';
			stack[l-3]='E';
			printf("\t\t\tReduce by E->");
			for(i=0;i<strlen(temp);i++)
				printf("%c",temp[i]);
			dispstk();
			dispinp(); l=l-2;
		}
		else
		{
			printf("\nError:String not accepted\n"); goto label;
		}
	}
	printf("\t\t\tAccept"); 
	printf("\n\nString accepted\n");
	label: exit(0);
	return 0;
}
