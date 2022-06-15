%{
#include<stdio.h>
int lines=0,chars=0,words=0,spaces=0;
%}
%%
\n	{lines++;words++;} 
([ ])+	{spaces++;words++;}
[^ #] chars++;
# {return 0;}
%%
int yywrap()
{
	return 1;
}
int main()
{
	printf("Enter the string:\n");
	yylex();
	printf("Lines: %d\nWords: %d\nChars: %d\nSpaces: %d\n",lines,words,chars,spaces);
	return 0;
}
	
