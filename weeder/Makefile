CC = gcc

CFLAGS = -std=c11 -Wall -Wextra -pedantic -g


main:	y.tab.o lex.yy.o main.o tree.h tree.o pretty.h pretty.o memory.h memory.o symbol.h symbol.o weeder.h weeder.o
	          $(CC) lex.yy.o y.tab.o tree.o pretty.o memory.o weeder.o main.o -o compiler -lfl

y.tab.c y.tab.h:  parser.y
	          bison -y -d -v parser.y

lex.yy.c:	flex.l y.tab.h
	          flex flex.l

.PHONY: clean
clean:
	-rm compiler *.o y.tab.c y.tab.h lex.yy.c y.output
