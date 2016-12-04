.PHONY: build test

build:
	mkdir -p bin
	yacc -o src/y.tab.c -d src/parser.y
	flex -o src/lex.yy.c src/math.lex
	g++ --std=c++11 src/math.cpp src/y.tab.c src/lex.yy.c -I src -lfl -o bin/math

test:
	mkdir -p bin
	yacc -o src/y.tab.c -d src/parser.y
	flex -o src/lex.yy.c src/math.lex
	g++ --std=c++11 test/math_test.cpp src/y.tab.c src/lex.yy.c -lgtest -lpthread -I src -lfl -o bin/test
	bin/test
