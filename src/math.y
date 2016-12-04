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

#define YYTYPE double;
%}

%token LINE_END
%token NUMBER
%token PLUS MINUS TIMES DIVIDE

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG

%start math
%%

math:
  /* empty line */           { $$ = 0; }
  | LINE_END                 { $$ = 0; }
  | expression               { std::cout << $1 << std::endl; $$ = $1; }
  | expression LINE_END math { std::cout << $1 << std::endl; $$ = $3; }
  ;

expression:
  NUMBER { $$ = $1; }
  | expression PLUS expression   { $$ = $1 + $3; }
  | expression MINUS expression  { $$ = $1 + $3; }
  | expression TIMES expression  { $$ = $1 + $3; }
  | expression DIVIDE expression { $$ = $1 + $3; }
  | MINUS expression %prec NEG   { $$ = -$2; }
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
