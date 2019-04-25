#ifndef __memory_h
#define __memory_h
void *Malloc(unsigned n);
void *Calloc(unsigned n);


#define NEW(type) (type *)Malloc(sizeof(type))

#endif
