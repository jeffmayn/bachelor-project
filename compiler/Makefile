run : main.o symbol.o memory.o
	cc -g -o run main.o symbol.o memory.o

testp1 : testp1.o symbol.o memory.o
	cc -g -o run testp1.o symbol.o memory.o

main.o : source/main.c header/symbol.h
	cc -g -c source/main.c

symbol.o : source/symbol.c header/memory.h
	cc -g -c source/symbol.c

memory.o : source/memory.c
	cc -g -c source/memory.c

testp1.o : source/testp1.c
	cc -g -c source/testp1.c

clean :
	rm *.o && rm run
