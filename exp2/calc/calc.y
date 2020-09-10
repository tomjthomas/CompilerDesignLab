%{
	#include<stdio.h>
	#include <stdlib.h>

	extern int yylex();
	void yyerror(char *s);
%}

%union	{
		int integer ;
	}

%token<integer> NUMBER 
%start start 
%type<integer> expr;

%left '+' '-'
%left '*' '/'


%%
 start : expr ';' {  printf("%d\n",$1); exit(0); }

 expr  : expr '+' expr  { $$= $1+$3;  }
	| expr '-' expr { $$ =$1-$3;  }
	| expr '*' expr { $$ = $1*$3; } 
    | expr '/' expr { $$ =$1/$3;  }
	| NUMBER 	{ $$=$1;      }
	
%%	

void yyerror(char *s)
{
	 fprintf(stdout,"Invalid Expression");

}

int main()
{
	yyparse();

}