%{
#include<stdio.h>
int pos=0,neg=0,posf=0,negf=0;
%}
%%
[+]?[0-9]+	pos++;
[-][0-9]+	neg++;
([+]?[0-9]+[.][0-9]+)|([+]?[0-9]+[[.][0-9]+]?[/][+]?[0-9]+[[.][0-9]+]?)|([-][0-9]+[[.][0-9]+]?+[/][-][0-9]+[[.][0-9]+]?)	posf++;
([-][0-9]+[.][0-9]+)|([+]?[0-9]+[[.][0-9]+]?[/][-][0-9]+[[.][0-9]+]?)|([-][0-9]+[[.][0-9]+]?[/][+]?[0-9]+[[.][0-9]+]?)	negf++;
.	;
\n return 0;
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter the numbers:\n");
	yylex();
	printf("pos: %d\nneg: %d\nposfrac: %d\nnegfrac:%d\n",pos,neg,posf,negf);
}
