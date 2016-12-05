.PHONY: build test

build:
	mkdir -p bin
	yacc -o src/y.tab.c -d src/parser.y
	flex -o src/lexer.yy.c src/lexer.l
	g++ --std=c++11 src/math.cpp src/y.tab.c src/lexer.yy.c -I src -lfl -o bin/math

test:
	mkdir -p bin
	yacc -o src/y.tab.c -d src/parser.y
	flex -o src/lexer.yy.c src/lexer.l
	g++ --std=c++11 test/math_test.cpp src/y.tab.c src/lexer.yy.c -lgtest -lpthread -I src -lfl -o bin/test
	bin/test
