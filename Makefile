.PHONY: build test


bin/math: bin src/lexer.yy.c src/parser.tab.c src/eval.hpp src/math.cpp
	g++ --std=c++11 src/math.cpp src/parser.tab.c src/lexer.yy.c -I src -lfl -o bin/math

bin/test: bin src/lexer.yy.c src/parser.tab.c src/eval.hpp test/math_test.cpp
	g++ --std=c++11 test/math_test.cpp src/parser.tab.c src/lexer.yy.c -lgtest -lpthread -I src -lfl -o bin/test


bin:
	mkdir -p bin

src/parser.tab.c: src/parser.y
	yacc -o src/parser.tab.c -d src/parser.y

src/lexer.yy.c: src/lexer.l
	flex -o src/lexer.yy.c src/lexer.l


test: bin/test
	./bin/test

