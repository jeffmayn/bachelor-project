#include "tree.h"
#include "pretty.h"
#include "typecheck.h"
#include "weeder.h"
#include <stdio.h>
#include "internalASM.h"
#include "IRprint.h"

int lineno = 0;
int charpos = 0;
int SYNTAX_ERROR = 0;

void* yyparse();
extern bodyList *bodies; //borrow from typecheck.c
BODY *theexpression;
SymbolTable *childScopeForDebugging;

void printSymbol(SymbolTable *t, char *id){
  SYMBOL *s = getSymbol(t,id);
  if(s!=0){
    fprintf(stderr,"Successfully found '%s' of kind %d and type %d with value %d\n", s->name, s->kind, s->typeVal, s->value);
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
  int error = 0;
  lineno = 1;
  fprintf(stderr, "\n%s\n", "######## STARTING PARSING ########");
  yyparse();
  if(SYNTAX_ERROR){
    fprintf(stderr, "\n%s\n", "compilation ended in error\n");
    return -1;
  }


  fprintf(stderr, "\n%s\n", "######## STARTING 1ST WEEDER ########");
  error = 0;
  error = weederBody(theexpression);
  if(error == -1){
    return -1;
  }
  fprintf(stderr, "\n%s\n", "######## STARTING TYPECHECK ########");
  SymbolTable *table = initSymbolTable();
  error = 0;
  error = typeCheck(table);
  if(error == -1){
    return -1;
  }

  fprintf(stderr, "\n%s\n", "######## STARTING PRINTING BODY ########");
  pBODY(theexpression);



  fprintf(stderr, "\n%s\n", "####### STARTING INTERNAL REPRESENTATION ######");
  //TempLocMap tempMap = TempLocMap* IRsetupTemporaries(bodies, table);
  // if(tempMap == NULL){
  //   return -1;
  // }

  error = 0;
  error = IRcreateInternalRep(table, bodies);
  if(error == -1){
    fprintf(stderr, "Internal representation error\n");
    return -1;
  }

  fprintf(stderr, "\n%s\n", "####### STARTING PRINTING INTERNAL REPRESENTATION ######");
  printINSTRnode(intermediateHead);



  fprintf(stderr, "\n%s\n", "####### STARTING FINAL OUTPUT GENERATION ######");
  //printf("WHEREDOES THIS GO\n");
  //IRtravINSTR(intermediateHead);
  IRtravInternalRep(intermediateHead);




  return 0;
}
