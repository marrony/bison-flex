%{
#include "common.h"
#include <stdio.h>
%}
 
%error-verbose
%define api.pure full

%parse-param {void* scanner} 
%parse-param {int *value}
%lex-param {void *scanner}
 
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
 
void yyerror(void* scanner, int* value, const char* errmsg) {
    printf("\n*** Error: %s\n", errmsg);
}
 
int yywrap(void) { return 1; }

int main(int argc, char** argv) {
    void* scanner;
    int value = 0;

    yylex_init(&scanner);

    if(!yyparse(scanner, &value))
        printf("%d\n", value);

    yylex_destroy(scanner);

    return 0;
}
