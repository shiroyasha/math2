%{
#include <vector>
#include <iostream>
#include <string>

#include "y.tab.h"
%}

%option header-file="src/lex.yy.h"

%%

[0-9]+\.[0-9]+ { yylval = atof(yytext); return NUMBER; }
[1-9][0-9]*    { yylval = atof(yytext); return NUMBER; }
0              { yylval = 0; return NUMBER; }

"+" { return PLUS; }
"-" { return MINUS; }
"*" { return TIMES; }
"/" { return DIVIDE; }
"^" { return EXPONENT; }

\n { return LINE_END; }

[ \t] ;
. ;

%%
