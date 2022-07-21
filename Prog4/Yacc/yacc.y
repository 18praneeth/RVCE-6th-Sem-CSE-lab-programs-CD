%{
	#include<stdio.h>
	#include<stdlib.h>
	int cnt=0;
%}
%token IF LPAREN RPAREN LF RF EXP SPACE NUM
%%
S:I
;
I:IF A B	{cnt++;}
;
A:LPAREN E RPAREN
;
E:EXP Z EXP
|EXP Z NUM
|EXP U
|SPACE
|
;
Z:'='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-' 
;
B:LF B RF
|I
|EXP
|EXP SPACE I
|
;
%%
int main()
{
	yyparse();
	printf("Count of if : %d\n",cnt);
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}