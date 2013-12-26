%{
#include <stdio.h>
#include "parser.h"
%}
     
/* Definições */
WHITESPACE [ \n\r\t]+
DIGITS [0-9]+
ANY_CHAR .

%option outfile="scanner.c" header-file="scanner.h"
%option warn nodefault
 
%option reentrant noyywrap never-interactive nounistd
%option bison-bridge

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

