#include "tree.h"
#include "pretty.h"
#include "typecheck.h"
#include <stdio.h>

int lineno = 0;
int charpos = 0;

void yyparse();

BODY *theexpression;
SymbolTable *childScopeForDebugging;

void printSymbol(SymbolTable *t, char *id){
  SYMBOL *s = getSymbol(t,id);
  if(s!=0){
    printf("Successfully found the variable '%s' with which is of kind %d and type %d it has the value %d\n", s->name, s->kind, s->type, s->value);
  }
  else{
    printf("unfortunately '%s' where not found in current scope\n", id);
  }
}

int main()
{ lineno = 1;
  yyparse();
  pBODY(theexpression);
  printf("Calling idTypeFinder\n");
  SymbolTable* t = idTypeFinder();
  printf("table: %p\n", (void* )t);
  printf("printing symbol\n");
  printSymbol(t, "x");
  printSymbol(t, "y");
  printSymbol(t, "z");
  printSymbol(t, "a");
  printSymbol(t, "f");
  printSymbol(t, "v");
  printSymbol(childScopeForDebugging, "v");
  printSymbol(childScopeForDebugging, "x");
  printSymbol(childScopeForDebugging, "g");
  printSymbol(childScopeForDebugging, "x");
  printSymbol(childScopeForDebugging, "u");
  printSymbol(childScopeForDebugging, "w");
  return 0;
}
