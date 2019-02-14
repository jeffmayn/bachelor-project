void *Malloc(unsigned n);

#define NEW(type) (type *)Malloc(sizeof(type))
