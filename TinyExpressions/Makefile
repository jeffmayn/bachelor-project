CC = gcc

CFLAGS = -std=c11 -Wall -Wextra -pedantic 


main:             y.tab.o lex.yy.o main.o tree.h tree.o pretty.h pretty.o memory.h memory.o
	          $(CC) lex.yy.o y.tab.o tree.o pretty.o memory.o main.o -o exp -lfl

y.tab.c y.tab.h:  exp.y
	          bison -y -d exp.y

lex.yy.c:         exp.l y.tab.h 
	          flex exp.l

