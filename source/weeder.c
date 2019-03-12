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
//  printf("traverseBody return: %d\n", retVal);
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
//      printf("traverseDECL return: %d\n", retVal);
    }
    return traverseDECL(decl->decl_list);
  }
}

int *weederFunction(FUNCTION *f){//TODO return statement.
  int retVal = -2;
  int retVal2 = -2;
//  fprintf(stderr, " >> CHECK FOR HEAD-TAIL ID\n");
//  fprintf(stderr,"\nfunction: %s", f->head->id);
//  fprintf(stderr,"function tail-id: %s\n", f->tail->id);
  if ((strcmp (f->head->id, f->tail->id))==0 ){
//    fprintf(stderr," --> id return-code: 0\n");
    retVal = 0;
  } else {
  //  fprintf(stderr," --> id return-code: -1\n");
    fprintf(stderr, "Line %d: mismatch in header-id and tail-id\n", f->head->lineno);
    return -1;
  //  return -1;
  }

  retVal = traverseBody(f->body);
  retVal2 = travCheckForReturn(f->body);

//  fprintf(stderr, "--> retVal1: %d\n", retVal);
//  fprintf(stderr, "--> retVal2: %d\n", retVal2);


}

// NEW STUFF
int *travCheckForReturn(BODY *body){
//  fprintf(stderr, " >>> enters travCheckForReturn\n");
  int result = expTravStmts(body->sList);
  if(result == -1){
    fprintf(stderr, "Line %d: missing return statement\n", body->lineno);
  }
//  fprintf(stderr, "end value: %d\n", result);
  return result;
}

int *expTravStmts(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if(expTravStmt(stmtList->statement) == 0){
      if(stmtList->statementList != NULL){
        fprintf(stderr, "Line %d: Unreachable statement after return\n", stmtList->statementList->lineno);
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
      //fprintf(stderr, "Line %d: missing return statement\n", s->lineno);
      return -1;
      break;
    default:
    return -1;
      break;
  }
}
