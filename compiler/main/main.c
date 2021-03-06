#include "tree.h"
#include "pretty.h"
#include "typecheck.h"
#include "weeder.h"
#include <stdio.h>
#include <string.h>
#include "internalASM.h"
#include "IRprint.h"

// symbol test dependencies
#include "main_test.h"
#include "testp1.h"

int lineno = 0;
int charpos = 0;
int SYNTAX_ERROR = 0;
int DEBUGBODY;
int DEBUGASM;
int LIVENESS;
int PEEPHOLE;

void* yyparse();
extern bodyList *bodies; //borrow from typecheck.c
BODY *theexpression;
SymbolTable *childScopeForDebugging;

int main(int argc, char *argv[]) {

  // run symboltable test
  // run_tests();


  //checking flags
  RUNTIMECHECK = 1;
  LIVENESS = 1;
  PEEPHOLE = 1;
  DEBUGBODY = 0;
  DEBUGASM = 0;
  for(int i = 1; i<argc; i++){
    if(!strcmp(argv[i], "-dBODY")){
      fprintf(stderr, "Body debug flag recognized\n");
      DEBUGBODY = 1;
    }
    if(!strcmp(argv[i], "-dASM")){
      fprintf(stderr, "Internal rep debug flag recognized\n");
      DEBUGASM = 1;
    }
    if(!strcmp(argv[i], "-noRUNCHECK")){
      fprintf(stderr, "Runtime error check disable flag recognized\n");
      RUNTIMECHECK = 0;
    }
    if(!strcmp(argv[i], "-noLIVENESS")){
      fprintf(stderr, "Livness disable flag recognized\n");
      LIVENESS = 0;
    }
    if(!strcmp(argv[i], "-noPEEPHOLE")){
      fprintf(stderr, "peephole disable flag recognized\n");
      PEEPHOLE = 0;
    }
  }





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
  if(DEBUGBODY){
    fprintf(stderr, "%s\n", "  |--> STARTING PRINTING BODY");
    pBODY(theexpression);
  }


  fprintf(stderr, "%s\n", "  |--> STARTING INTERNAL REPRESENTATION");

  error = 0;
  error = IRcreateInternalRep(bodies);
  if(error == -1){
    fprintf(stderr, "ERROR: Internal representation error\n");
    return -1;
  }

  if(LIVENESS){
    fprintf(stderr, "%s\n", "  |--> STARTING LIVNESS ANALYSIS");
    error = 0;
    error = liveness();
    if(error == -1){
      fprintf(stderr, "ERROR: liveness analysis\n");
      return -1;
    }
  }
  if(PEEPHOLE){
    fprintf(stderr, "%s\n", "  |--> STARTING PEEPHOLE OPTIMIZATION");
    error = 0;
    error = peephole();
    if(error == -1){
      fprintf(stderr, "ERROR: peephole optimization\n");
      return -1;
    }
  }

  if(DEBUGASM){
    fprintf(stderr, "%s\n", "  |--> STARTING PRINTING INTERNAL REPRESENTATION");
    printINSTRnode(intermediateHead);
  }


  fprintf(stderr, "%s\n", "  |--> STARTING FINAL OUTPUT GENERATION");
  IRtravInternalRep(intermediateHead);
  return 0;
}
