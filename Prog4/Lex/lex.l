%{
    #include<stdio.h>
    int id=0,key=0,op=0;
%}
%%
int|char|float|double|exit|return|if|else|for|while {printf("keyword");key++;}
[a-zA-Z_][a-zA-Z0-9_]*  {printf("Variable");id++;}
[\+\-\*\/\^\%\|\!\=]  {printf("operator");op++;}
[^ \n]*  {printf("Invalid");}
\n {return 0;};
%%
int main()
{
    printf("Enter input:\n");
    yylex();
    printf("%d %d %d",id,key,op);
}
int yywrap()
{
    return 1;
}