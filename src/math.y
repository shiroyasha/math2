%{
#include <iostream>
#include <cstdlib>

#include "ast.hpp"

extern int yylex(void);
extern void yyerror(const char *);
extern FILE *yyin;

void yyerror(const char *s) {
  std::cout << "EEK, parse error!  Message: " << s << std::endl;
  exit(-1);
}

Expression* root = NULL;
%}

%union {
  double number;
  Expression* node;
  Expression* math;
};

%token NUMBER
%token PLUS MINUS TIMES DIVIDE

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG

%type <node> expression
%type <math> math
%type <number> NUMBER

%start math
%%

math: expression { root = $$; }
    ;

expression:
  NUMBER { $$ = new Number($1); }
  | expression PLUS expression   { $$ = new Plus($1, $3); }
  /* | expression MINUS expression  { $$ = new Minus($1, $3); } */
  /* | expression TIMES expression  { $$ = new Times($1, $3); } */
  /* | expression DIVIDE expression { $$ = new Divide($1, $3); } */
  /* | MINUS expression %prec NEG   { $$ = new Number(-$2); } */
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

  std::cout << root->value() << std::endl;

  return 0;
}
