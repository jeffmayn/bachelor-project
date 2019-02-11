#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

void *Malloc(unsigned n)
{
  void *p;
  if(!(p = malloc(n)))
  {
    fprintf(stderr,"Malloc(%d) failed.\n",n);
    fflush(stderr);
    abort();
  }
  return p;
}
