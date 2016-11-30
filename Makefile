.PHONY: gen_lexer build

build: gen_lexer
	mkdir -p bin
	g++ src/lex.yy.c -lfl -o bin/lexer

gen_lexer:
	flex -o src/lex.yy.c src/math.lex
