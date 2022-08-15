%{
    #include<stdio.h>
    #include<stdlib.h>
%}

%token TYPE ID NUM RET
 
%%
S: FUN  {printf("Accepted\n");exit(0);}
;
FUN:    TYPE ID '(' PARAM ')' '{' BODY '}'
;
PARAM: PARAM ',' TYPE ID
|TYPE ID
|
;
BODY: BODY BODY
| PARAM ';'
| E ';'
| RET E ';'
|
;
E: ID '=' E
| E '+' E
| E '-' E
| E '*' E
| E '/' E
| ID
| NUM
;
%%
int main()
{
    printf("enter input: ");
    yyparse();
    printf("successfull\n");
    return 0;
}
int yyerror()
{
    printf("ERROR\n");
    exit(0);
}