#include "parser.h"
#include "scanner.h"

void yyerror(yyscan_t scanner, int* value, const char* errmsg) {
    printf("\n*** Error: %s\n", errmsg);
}

int main(int argc, char** argv) {
    yyscan_t scanner;
    int value = 0;

    yylex_init(&scanner);

    if(!yyparse(scanner, &value))
        printf("result: %d\n", value);

    yylex_destroy(scanner);

    return 0;
}
