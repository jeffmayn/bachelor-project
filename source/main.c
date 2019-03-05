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
    printf("Successfully found '%s' of kind %d and type %d with value %d\n", s->name, s->kind, s->type, s->value);
  }
  else{
    printf("unfortunately '%s' where not found in current scope\n", id);
  }
}

SymbolTable* findFunctionScope(SymbolTable *t, char *fId){
  SYMBOL *s = getSymbol(t,fId);
  if(s == NULL){
    printf("'%s' where not found in current scope\n", fId);
    return NULL;
  }
  if(s->kind != funcK){
    printf("'%s' is not a function", s->name);
    return NULL;
  }
  return s->scope;
}

int main()
{ lineno = 1;
  yyparse();
  pBODY(theexpression);
  printf("Calling idTypeFinder\n");
  SymbolTable* t = typeCheck();
  // printf("table: %p\n", (void* )t);
  // printf("printing symbol\n");
  // printSymbol(t, "x");
  // printSymbol(t, "y");
  // printSymbol(t, "z");
  // printSymbol(t, "a");
  // printSymbol(t, "f");
  // printSymbol(t, "v");
  // SymbolTable *t2 = findFunctionScope(t,"f");
  // SymbolTable *t10 = findFunctionScope(t2,"f");
  // SymbolTable *t3 = findFunctionScope(t,"g");
  // printSymbol(t2, "v");
  // printSymbol(t2, "x");
  // printSymbol(t2, "g");
  // printSymbol(t2, "x");
  // printSymbol(t2, "u");
  // printSymbol(t2, "w");
  // printSymbol(t3, "u");
  // printSymbol(t3, "w");
  return 0;
}
