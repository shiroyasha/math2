#pragma once

#include <iostream>

#include "parser.tab.h"
#include "lexer.yy.h"

extern int yylex(void);
extern void yyerror(const char *);

double evaluate(const char* source) {
  double* result = new double;

  YY_BUFFER_STATE bufferState = yy_scan_string(source);

  yyparse(result);

  yy_delete_buffer(bufferState);

  return *result;
}

double evaluate(std::string& source) {
  return evaluate(source.c_str());
}

