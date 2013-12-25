%{
#include "common.h"
#include "parser.h"
%}
     
/* Definições */
WHITESPACE [ \n\r\t]+
DIGITS [0-9]+
ANY_CHAR .
 
%option case-insensitive
%option reentrant
/*%option debug*/
%option bison-bridge
/*%option bison-locations*/
%option noyywrap
  
%%
   
{WHITESPACE} /* Ignore */ ;

{DIGITS} {
    *yylval = atoi(yytext);
    return T_NUMBER;
}
 
"+" { return '+'; }
"-" { return '-'; }
"*" { return '*'; }
"/" { return '/'; }
"(" { return '('; }
")" { return ')'; }

{ANY_CHAR} {
    printf("Unexpected character in input: '%c' (ASCII=%d)\n", yytext[0], yytext[0]);
}

%%

