run : main.o symbol.o memory.o
	cc -o run main.o symbol.o memory.o

main.o : source/main.c header/symbol.h
	cc -c source/main.c

symbol.o : source/symbol.c header/memory.h
	cc -c source/symbol.c

memory.o : source/memory.c
	cc -c source/memory.c
