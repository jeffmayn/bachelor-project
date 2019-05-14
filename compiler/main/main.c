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

int main() {
  int error = 0;
  lineno = 1;
  fprintf(stderr, "%s\n", "  |--> STARTING PARSING");
  yyparse();
  if(SYNTAX_ERROR){
    fprintf(stderr, "%s\n", "compilation ended in error\n");
    return -1;
  }

  fprintf(stderr, "%s\n", "  |--> STARTING 1ST WEEDER");
  error = 0;
  error = weeder1(theexpression);
  if(error == -1){
    fprintf(stderr, "%s\n", "ERROR: compilation ended in error\n");
    return -1;
  }
  fprintf(stderr, "%s\n", "  |--> STARTING TYPECHECK");
  SymbolTable *table = initSymbolTable();
  error = 0;
  error = typeCheck(table);
  if(error == -1){
    return -1;
  }
/*
  fprintf(stderr, "%s\n", "  |--> STARTING PRINTING BODY");
  pBODY(theexpression);
*/

  fprintf(stderr, "%s\n", "  |--> STARTING INTERNAL REPRESENTATION");

  error = 0;
  error = IRcreateInternalRep(bodies);
  if(error == -1){
    fprintf(stderr, "ERROR: Internal representation error\n");
    return -1;
  }

  fprintf(stderr, "%s\n", "  |--> STARTING LIVNESS ANALYSIS");
  error = 0;
  error = liveness();
  if(error == -1){
    fprintf(stderr, "ERROR: liveness analysis\n");
    return -1;
  }

  fprintf(stderr, "%s\n", "  |--> STARTING PEEPHOLE OPTIMIZATION");
  error = 0;
  error = peephole();
  if(error == -1){
    fprintf(stderr, "ERROR: peephole optimization\n");
    return -1;
  }


  // fprintf(stderr, "%s\n", "  |--> STARTING PRINTING INTERNAL REPRESENTATION");
  // printINSTRnode(intermediateHead);


  fprintf(stderr, "%s\n", "  |--> STARTING FINAL OUTPUT GENERATION");
  IRtravInternalRep(intermediateHead);
  return 0;
}
