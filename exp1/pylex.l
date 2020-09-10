%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>

		
	FILE *fp;
%}


%%

"print"	     {   fprintf(fp," (keyword, print) ");			   }
"def" 	     {   fprintf(fp," (keyword, def)   ");  		   }
"return" 	 {   fprintf(fp," (keyword, return) ");  		   }
"while"      {   fprintf(fp," (keyword, while) ");	           }
"if"	     {   fprintf(fp," (keyword, if)    ");			   }
"else"       {   fprintf(fp," (keyword, else)  ");  		   }
"for"        {   fprintf(fp," (keyword, for)    ");	           }
"in"	     {   fprintf(fp," (keyword, in)     ");			   }

([a-z]|[A-Z])([a-z]|[A-Z]|[0-9])*	  { fprintf(fp,"  (identifier, %s)  ",yytext); }
[0-9][0-9]*                           { fprintf(fp,"  (literal, %s)  ",yytext);		 	}
[+|-|*|%|/|=|:|<|<=|>=|>|==|!=] 	  { fprintf(fp,"  (operator, %s)  ",yytext);   }            
[\n]    {  fprintf(fp,"\n");					}
"exit;" {   fclose(fp); exit(0); 			   }
.       { ;     }
		
%%

int main(int argc , char*argv[])
{
	fp = fopen("output.txt","w");
	yylex();
	

}