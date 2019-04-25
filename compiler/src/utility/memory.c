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

/**
 * allocate and set allocated memory to 0, abort if fail.
 */
void *Calloc(unsigned n)
{
  void *p;
  if(!(p = calloc(0, n)))
  {
    fprintf(stderr,"Calloc(%d) failed.\n",n);
    fflush(stderr);
    abort();
  }
  return p;
}
