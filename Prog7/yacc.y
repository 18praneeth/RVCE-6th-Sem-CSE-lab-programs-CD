%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *yyin;

int yylex(void);
int yyerror(const char *);

%}

%token DTYPE VOID IDEN NUM UOP BUOP BOP BBOP ASS

%%

FUNC	: RET IDEN '(' PARS ')' BLOCK
	| RET IDEN '(' VOID ')' BLOCK
	| RET IDEN '(' ')' BLOCK
	;

RET	: DTYPE
	| VOID
	;

PARS	: PARS ',' PAR
	| PAR
	;

PAR	: DTYPE IDEN
	;

STMT	: DECL ';'
	| EXP_O ';'
	| BLOCK
	;

BLOCK	: '{' STMTS '}'
	;

STMTS	: STMTS STMT
	|
	;

DECL	: DTYPE IDEN
	| DTYPE IDEN ASS EXP
	;

EXP_O	: EXP
	|
	;

EXP	: IDEN
	| NUM
	| UOP EXP
	| EXP UOP
	| BUOP EXP
	| EXP BOP EXP
	| EXP BBOP EXP
	| EXP ASS EXP
	;

%%

void main() {
	yyin = fopen("7.txt", "r");
	yyparse();
	printf("Valid function definition\n");
}

int yyerror(const char *s) {
	printf("Invalid syntax\n");
	exit(0);
}
