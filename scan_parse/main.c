#include "tree.h"
#include "pretty.h"

int lineno = 0;
int charpos = 0;

void yyparse();

BODY *theexpression;

int main()
{ lineno = 1;
  yyparse();
  pBODY(theexpression);
  return 0;
}
