%{
	# include <stdio.h>
	# include <stdlib.h>
	int count=0;
%}
 
%token IF LPAREN RPAREN LF RF EXP SPACE NUM
 
%%
S:I
;

I:IF A B {count++;}
;
 
A:LPAREN E RPAREN
;
 
E:EXP Z NUM
|EXP Z EXP
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
    printf("\ncount of if is %d\n",count);
    return 0;
}
 
int yyerror()
{
    printf("\n Invalid \n");
    return 0;
}
