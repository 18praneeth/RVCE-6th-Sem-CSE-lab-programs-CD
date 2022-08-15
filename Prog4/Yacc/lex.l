%{
    #include "y.tab.h"
%}
%%
"if"    {return IF;}
[a-zA-Z]*   {return EXP;}
[0-9]+  {return NUM;}
[\n ]   ;
.   {return yytext[0];}
%%