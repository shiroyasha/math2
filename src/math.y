%{
#include <iostream>
#include <cstdlib>

extern int yylex(void);
extern void yyerror(const char *);
extern FILE *yyin;

void yyerror(const char *s) {
  std::cout << "EEK, parse error!  Message: " << s << std::endl;
  exit(-1);
}
%}

%union {
  int    ival;
  float  fval;
  char*  sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING

%%

math:
    INT math       { std::cout << "yacc found an int:   " << $1 << std::endl; }
    | FLOAT math   { std::cout << "yacc found a float:  " << $1 << std::endl; }
    | STRING math  { std::cout << "yacc found a string: " << $1 << std::endl; }
    | INT          { std::cout << "yacc found an int:   " << $1 << std::endl; }
    | FLOAT        { std::cout << "yacc found a float:  " << $1 << std::endl; }
    | STRING       { std::cout << "yacc found a string: " << $1 << std::endl; }
    ;
%%
#include <stdio.h>

int main() {
  std::string filename = "examples/math001.math";

  FILE *f = fopen(filename.c_str(), "r");

  // make sure it's valid:
  if (!f) {
    std::cout << "I can't open '" + filename + "'!" << std::endl;
    return -1;
  }

  // set lex to read from it instead of defaulting to STDIN:
  yyin = f;

  do {
    yyparse();
  } while(!feof(yyin));

  return 0;
}
