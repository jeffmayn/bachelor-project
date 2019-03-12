#include "tree.h"
#include "pretty.h"
#include "typecheck.h"
#include "weeder.h"
#include "del3Pretty.h"
#include <stdio.h>

int lineno = 0;
int charpos = 0;
int SYNTAX_ERROR = 0;

void* yyparse();

BODY *theexpression;
SymbolTable *childScopeForDebugging;

void printSymbol(SymbolTable *t, char *id){
  SYMBOL *s = getSymbol(t,id);
  if(s!=0){
    fprintf(stderr,"Successfully found '%s' of kind %d and type %d with value %d\n", s->name, s->kind, s->type, s->value);
  }
  else{
    fprintf(stderr,"unfortunately '%s' were not found in current scope\n", id);
  }
}

SymbolTable* findFunctionScope(SymbolTable *t, char *fId){
  SYMBOL *s = getSymbol(t,fId);
  if(s == NULL){
    fprintf(stderr, "%s where not found in current scope\n", fId);
    return NULL;
  }
  if(s->kind != funcK){
    fprintf(stderr,"'%s' is not a function\n", s->name);
    return NULL;
  }
  return s->scope;
}

int main() {
  lineno = 1;
  fprintf(stderr, "\n%s\n", "######## STARTING PARSING ########");
  yyparse();
  if(!SYNTAX_ERROR){
    //fprintf(stderr, "\n%s\n", "######## STARTING 1ST WEEDER ########");
    //weederBody(theexpression);
    //fprintf(stderr, "\n%s\n", "######## STARTING TYPECHECK ########");
    //SymbolTable* t = typeCheck();
    //TODO PRINT STDERROR
    fprintf(stderr, "\n%s\n", "######## STARTING PRINTING BODY ########");
    //pBODY(theexpression);
    prettyDel3PrintStart(theexpression);
    return 0;
  }
  fprintf(stderr, "\n%s\n", "compilation ended in error\n");
  return -1;
}
