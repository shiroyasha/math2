%{
#include <iostream>
#include <cstdlib>

#include "lex.yy.h"

void yyerror(double* result, const char *s) {
  std::cout << "EEK, parse error!  Message: " << s << std::endl;
  exit(-1);
}

%}

%define api.value.type {double}
%parse-param {double* result}

%token LINE_END
%token NUMBER
%token PLUS MINUS TIMES DIVIDE

%left PLUS MINUS
%left TIMES DIVIDE
%left NEG

%start input
%%

input:
     /* nothing */ { *result = 0; }
     | expression  { *result = $$; }
     ;

expression:
  NUMBER { $$ = $1; }
  | expression PLUS expression   { $$ = $1 + $3; }
  | expression MINUS expression  { $$ = $1 - $3; }
  | expression TIMES expression  { $$ = $1 * $3; }
  | expression DIVIDE expression {
    if($3 != 0) {
      $$ = $1 / $3;
    } else {
      $$ = 1;
      fprintf (stderr, "%d.%d-%d.%d: division by zero", @3.first_line, @3.first_column, @3.last_line, @3.last_column);
    }
  }
  | MINUS expression %prec NEG   { $$ = -$2; }
  ;

%%
