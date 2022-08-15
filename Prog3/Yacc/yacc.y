%{
	#include<stdio.h>
	#include<stdlib.h>
	int cnt=0;
%}
%token FOR EXP NUM
%%
S:I
;
I:FOR A B	{cnt++;}
;
A:'('E';'E';'E')'
;
E:EXP Z EXP
|EXP Z NUM
|EXP U
|
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-' 
;
B:B B
|'{' B '}'
|I
|E';'
|
;
%%
int main()
{
	yyparse();
	printf("Count of for : %d\n",cnt);
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}