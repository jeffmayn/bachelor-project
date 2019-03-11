#include <stdio.h>
#include <string.h>
#include "weeder.h"
#include "memory.h"

extern BODY *theexpression;

void *weederBody(BODY *body){//TODO return -1 on error.
  body = theexpression;
  traverseBody(body);
}

void *traverseBody(BODY *body){
  traverseDECL(body->vList);
}

void *traverseDECL(DECL_LIST *decl){
  if(decl != NULL){                    // kind 1 = function
    if (decl->decl != NULL && decl->decl->kind == 1){
      weederFunction(decl->decl->val.func);
    } else {
    }
    traverseDECL(decl->decl_list);
  }
}

FUNCTION *weederFunction(FUNCTION *f){//TODO return statement.
//  fprintf(stderr, " >> CHECK FOR HEAD-TAIL ID\n");
  fprintf(stderr,"function: %s\n", f->head->id);
//  fprintf(stderr,"function tail-id: %s\n", f->tail->id);
  if ((strcmp (f->head->id, f->tail->id))==0 ){
  //  fprintf(stderr,"return code: 0\n\n");
  // TODO: retuner 0
  } else {
    //fprintf(stderr,"return code: -1\n\n");
  // TODO: retuner -1
  }
  traverseBody(f->body);
  travCheckForReturn(f->body);
}

// NEW STUFF
void *travCheckForReturn(BODY *body){
  int result = expTravStmts(body->sList);
  fprintf(stderr, "end value: %d\n\n", result);
}

int *expTravStmts(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if(expTravStmt(stmtList->statement) == 0){
      if(stmtList->statementList != NULL){
        fprintf(stderr, "Line %d: Unreachable statement after return\n", stmtList->statementList->lineno);
      }
      return 0;
    }
  }
  else{
    return -1;
  }
  return expTravStmts(stmtList->statementList);
}

int expTravStmt(STATEMENT *s){
  int retVal = 0;
  switch(s->kind){
    case returnK:
      return 0;
      break;
    case ifK:
      break;
    case thenK:
      retVal = expTravStmts(s->val.ifthenelse.thenbody->val.list);
      if(retVal == 0){
        return expTravStmts(s->val.ifthenelse.elsebody->val.list);
      }
      return -1;
      break;
    default:
    return -1;
      break;
  }
}
