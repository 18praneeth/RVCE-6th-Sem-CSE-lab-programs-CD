%{
	#include "y.tab.h"
%}
%%
"for" return FOR;
[a-zA-Z]* return EXP;
[0-9]+ return NUM;
[\n ]  ;
.   return yytext[0];
%%