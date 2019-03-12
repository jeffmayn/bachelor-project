#include <stdio.h>
#include <string.h>
#include "weeder.h"
#include "memory.h"

extern BODY *theexpression;

int *weederBody(BODY *body){//TODO return -1 on error.
  int retVal = -2;
  body = theexpression;
  retVal = traverseBody(body);
  printf("main return: %d\n", retVal);
  return retVal;
}

int *traverseBody(BODY *body){
  int retVal = -2;
  retVal = traverseDECL(body->vList);
  return retVal;
}

int *traverseDECL(DECL_LIST *decl){
  int retVal = -2;
  if(decl != NULL){                    // kind 1 = function
    if (decl->decl != NULL && decl->decl->kind == 1){
      retVal = weederFunction(decl->decl->val.func);
      if(retVal == -1){
        return -1;
      }
    }
    return traverseDECL(decl->decl_list);
  }
}

int *weederFunction(FUNCTION *f){
  int retVal = -2;
  int retVal2 = -2;
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    retVal = 0;
  } else {
    fprintf(stderr, "Error! Line %d: mismatch in header-id and tail-id\n", f->head->lineno);
    return -1;
  }
  retVal = traverseBody(f->body);
  retVal2 = travCheckForReturn(f->body);
}

// NEW STUFF
int *travCheckForReturn(BODY *body){
  int result = expTravStmts(body->sList);
  if(result == -1){
    fprintf(stderr, "Error! Line %d: missing return statement\n", body->lineno);
  }
  return result;
}

int *expTravStmts(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if(expTravStmt(stmtList->statement) == 0){
      if(stmtList->statementList != NULL){
        fprintf(stderr, "Warning! Line %d: Unreachable statement after return\n", stmtList->statementList->lineno);
      }
      return 0;
    }
    return expTravStmts(stmtList->statementList);
  }
  else{
    return -1;
  }
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
      if(s->val.ifthenelse.thenbody->kind == returnK){
        return 0;
      }
      else{
        if(s->val.ifthenelse.thenbody->kind == listStmtK){
          retVal = expTravStmts(s->val.ifthenelse.thenbody->val.list);
        }
        else{
          return -1;
        }
      }
      if(retVal == 0){
        if(s->val.ifthenelse.elsebody->kind == returnK){
          return 0;
        }
        else{
          if(s->val.ifthenelse.elsebody->kind == listStmtK){
            return expTravStmts(s->val.ifthenelse.elsebody->val.list);

          } else {
            return -1;
          }
        }
      }
      return -1;
      break;
    default:
    return -1;
      break;
  }
}
