%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
E:T D
;
D:'+'TD
|
;
T:F U
;
U:'*'FU
|
;

%%
