%{
  #include <iostream>
  #include <string>
%}

%%

[ \t] ;
[0-9]+\.[0-9]+ { std::cout << "Found a floating-point number:" << yytext << std::endl; }
[0-9]+         { std::cout << "Found an integer:" << yytext << std::endl; }
[a-zA-Z0-9]+   { std::cout << "Found a string: " << yytext << std::endl; }

%%

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

  yylex();

  return 0;
}
