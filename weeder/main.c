#include <stdio.h>
#include "tree.h"
#include "pretty.h"
#include "weeder.h"

int lineno = 0;
int charpos = 0;

void yyparse();

BODY *theexpression;

int main()
{ lineno = 1;
  yyparse();
  pBODY(theexpression);
  printf("CALLING -> weeder\n");
  weederBody(theexpression);

  return 0;
}
