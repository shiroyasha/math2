.PHONY: build

build:
	mkdir -p bin
	yacc -o src/y.tab.c -d src/math.y
	flex -o src/lex.yy.c src/math.lex
	g++ --std=c++11 src/y.tab.c src/lex.yy.c -I src -lfl -o bin/math
