%{
#include "7.tab.h"
%}

%option noyywrap
%option outfile="7.c"

%%

"int"|"float"|"char" return DTYPE;

"void" return VOID;

[a-zA-Z_][a-zA-Z_0-9]* return IDEN;

[0-9]+ return NUM;

"++"|"--" return UOP;

"!" return BUOP;

[-+*/%] |
[><]=? |
==|!= return BOP;

"&&"|"||" return BBOP;

= return ASS;

[();{},] return yytext[0];

[ \t\n]+ ;

. ;

%%

