CC = gcc

CFLAGS = -std=c11 -Wall -Wextra -pedantic -g


main:	y.tab.o lex.yy.o main.o ../scan_parse/tree.h tree.o ../scan_parse/pretty.h pretty.o ../scan_parse/memory.h memory.o ../compiler/symbol.h symbol.o
	          $(CC) lex.yy.o y.tab.o tree.o pretty.o memory.o main.o -o compiler -lfl

y.tab.c y.tab.h:  ../scan_parse/parser.y
	          bison -y -d -v ../scan_parse/parser.y

lex.yy.c:	../scan_parse/flex.l y.tab.h
	          flex ../scan_parse/flex.l

.PHONY: clean
clean:
	-rm compiler *.o y.tab.c y.tab.h lex.yy.c y.output
