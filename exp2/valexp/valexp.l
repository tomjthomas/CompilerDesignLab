%{
    #include "y.tab.h"
    #include<stdio.h>
%}

%%

[0-9]+		{ return NUMBER ; }
[+|\-|*|/|;]	{ return *yytext; }
[a-z]+			{ return VAR;      }

%%

int yywrap()
{
	return 1;
}