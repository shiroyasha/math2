%{
#include <vector>
#include <iostream>
#include <string>
#include "ast.hpp"
#include "y.tab.h"  // to get the token types
%}

%%

[0-9]+\.[0-9]+ { yylval.number = atof(yytext); return NUMBER; }
[1-9][0-9]*    { yylval.number = atof(yytext); return NUMBER; }

"+" { return PLUS; }
"-" { return MINUS; }
"*" { return TIMES; }
"/" { return DIVIDE; }

\n { return LINE_END; }

[ \t] ;
. ;

%%
