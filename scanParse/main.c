#include "tree.h"
#include "pretty.h"

int lineno = 0;
int charpos = 0;

void yyparse();

BODY *theexpression;

int main()
{ lineno = 1;

  if(yyparse()){
    printf("remember to print something to std error\n");
    return 0;
  }
  pBODY(theexpression);
  return 0;
}
