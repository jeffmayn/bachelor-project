CC = gcc

CFLAGS = -std=c11 -Wall -Wextra -pedantic


main:             y.tab.o lex.yy.o main.o tree.h tree.o memory.h memory.o
	          $(CC) lex.yy.o y.tab.o tree.o memory.o main.o -o exp -lfl

y.tab.c y.tab.h:  parser.y
	          bison -y -d parser.y

lex.yy.c:         flex.l y.tab.h
	          flex flex.l

.PHONY: clean
clean:
	-rm exp *.o y.tab.c y.tab.h lex.yy.c lex.yy.h
