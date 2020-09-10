%{

	#include<stdio.h>
	#include<stdlib.h>

	extern int yylex();
	void yyerror(char *s);

%}

%start start
%token NUMBER VAR

%left '+' '-'
%left '*' '/'

%%
start : exp ';'    { fprintf(stdout,"Valid arithmetic expression\n"); exit(0); } 

exp : ID 	    {;}
	| exp '+' exp   {;}
	| exp '-' exp   {;}
	| exp '*' exp   {;}
	| exp '/' exp   {;}
	;

ID : NUMBER     {;}
    | VAR       {;}
    ;

%%

void yyerror(char *s)
{

	fprintf(stdout,"Invalid expression\n");

}

int main()
{

	yyparse();
}