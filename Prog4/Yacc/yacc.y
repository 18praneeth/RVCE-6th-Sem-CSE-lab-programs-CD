%{
    #include<stdio.h>
    #include<stdlib.h>
    int cnt=0;
%}
%token IF EXP NUM
%%
S:I
;
I:IF A B    {cnt++;}
;
A:'('E')'
;
E:EXP Z EXP
|EXP Z NUM
|EXP U
|
;
Z:'='|'<'|'>'|'<''='|'>''='|'=''+'|'=''-'
;
U:'+''+'|'-''-'
;
B:B B
|'{'B'}'
|I
|E';'
|
;
%%
int main()
{
    printf("Enter the snippet:\n");
    yyparse();
    printf("Count of if is %d\n",cnt);
    return 0;
}
int yyerror()
{
    printf("Invalid\n");
    exit(0);
}