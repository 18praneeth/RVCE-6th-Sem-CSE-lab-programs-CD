%{
#include<stdio.h>
%}
%%
int|char|float|double|for|while|if|else|exit|return printf("keyword");
[a-zA-Z_][a-zA-Z0-9_]* printf("variable");
[\+\-\*\/\^\%\|\!\=] printf("operator");
[^\n]* printf("Not valid");
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter the string:\n");
	yylex();
}
