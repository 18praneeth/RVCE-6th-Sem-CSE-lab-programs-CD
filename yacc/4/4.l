%{
	#include "y.tab.h"
%}
 
%%
"if" return IF;
"(" return LPAREN;
")" return RPAREN;
"{" return LF;
"}" return RF;
"=" return '=';
"-" return '-';
"+" return '+';
">" return '>';
"<" return '<';
";" return ';';
[a-zA-Z]* return EXP;
[0-9]+ return NUM;
" " return SPACE; 
%%

int yywrap()
{
    return 1;
}
