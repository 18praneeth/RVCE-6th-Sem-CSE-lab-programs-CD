%{
#include<stdio.h>
#include<stdlib.h>
%}
%token Num id
%left + -
%left * /
%%
E:T {printf("result is %d",result); return 0;}
;
T:T'+'T {$$=$1+$3;}
|T'-'T {$$=$1-$3;}
|T'*'T {$$=$1*$3;}
|T'/'T {$$=$1/$3;}
|id {$$=$1;}
|Num {$$=$1;}
;
%%
int main()
{
  printf("Enter the expression\n");
  yyparse();
}
yyerror(){
 printf("The expression is invalid");
 exit(0);
}

