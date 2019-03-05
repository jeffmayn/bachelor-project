CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -pedantic -g


src = $(wildcard *.c) #finder .c filer
obj = $(src:.c=.o) #navngiver .o filer

#compiler flex, bison og vores egne c filer
main:	y.tab.o lex.yy.o $(obj)
	          $(CC) lex.yy.o y.tab.o $(obj) -o compiler -lfl -g

#laver nødvendige filer ud fra bison
y.tab.c y.tab.h:  parser.y
	          bison -y -d -v parser.y

#laver nødvendige filer ud fra flex
lex.yy.c:	flex.l y.tab.h
	          flex flex.l

.PHONY: clean
clean:
	-rm compiler *.o y.tab.c y.tab.h lex.yy.c y.output
