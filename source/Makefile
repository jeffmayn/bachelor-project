CC = gcc
CFLAGS = -std=c11 -Wall -Wextra -pedantic -g

src = $(wildcard *.c) #finder .c filer
obj = $(src:.c=.o) #navngiver .o filer

#compiler flex, bison og vores egne c filer
compiler:	y.tab.o lex.yy.o $(obj)
	          $(CC) $^ -o $@.out $(CFLAGS)

#$^ referere til højresiden på
#reglen, $@ referere til venstresiden
#på reglen

#laver nødvendige filer ud fra bison
y.tab.c y.tab.h:  parser.y
	          bison -y -d -v parser.y

#laver nødvendige filer ud fra flex
lex.yy.c:	flex.l y.tab.h
	          flex flex.l

.PHONY: y.tab.c y.tab.h lex.yy.c clean
	
clean:
						-rm compiler.out *.o y.tab.c y.tab.h lex.yy.c y.output
