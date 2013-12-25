#ifndef __COMMON_H__
#define __COMMON_H__

extern int yylex_init(void**);
extern int yylex_destroy(void*);
extern int yylex(); 
extern int yyparse(void* scanner, int* value); 
extern void yyerror(void* scanner, int* value, const char* s);
  
#endif
