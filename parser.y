%{
#include "parser.h"
#include "scanner.h"

void yyerror(yyscan_t scanner, int* value, const char* msg);
%}

%code requires {

#ifndef YYSTYPE
#define YYSTYPE int
#endif

#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T
    typedef void* yyscan_t;
#endif

}

%output "parser.c"
%defines "parser.h"
 
%error-verbose
%define api.pure full

%parse-param {yyscan_t* scanner} 
%parse-param {int *value}
%lex-param {yyscan_t *scanner}

%token T_NUMBER

%%

start:
    expr { *value = $1; }
 
expr:
    expr '+' term { $$ = $1 + $3; }
    | expr '-' term { $$ = $1 - $3; }
    | term { $$ = $1; }
    ;

term:
    term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | factor { $$ = $1; }
    ;

factor:
    T_NUMBER { $$ = $1; }
    | '(' expr ')' { $$ = $2; }
    ;
   
%%

 
