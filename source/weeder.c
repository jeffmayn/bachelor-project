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
  printf("traverseBody return: %d\n", retVal);
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

      printf("traverseDECL return: %d\n", retVal);
    }
    return traverseDECL(decl->decl_list);
    //return traverseDECL(decl->decl_list);
  }
}

int *weederFunction(FUNCTION *f){//TODO return statement.
  int retVal = -2;
  int retVal2 = -2;
  //int retVal3 = -2;
//  fprintf(stderr, " >> CHECK FOR HEAD-TAIL ID\n");
  fprintf(stderr,"\nfunction: %s\n", f->head->id);
//  fprintf(stderr,"function tail-id: %s\n", f->tail->id);
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    fprintf(stderr," --> id return-code: 0\n");
    return 0;
  } else {
    fprintf(stderr, "Line %d: mismatch in header-id and tail-id\n", f->head->lineno);
    return -1;
  }

  retVal = traverseBody(f->body);
  retVal2 = travCheckForReturn(f->body);

  fprintf(stderr, "--> retVal2: %d\n", retVal2);


  if(retVal == -1 || retVal2 == -1){
  //  fprintf(stderr, "Line %d: error\n", f->head->lineno);
    return -1;
  } else {
    return 0;
  }

}

// NEW STUFF
int *travCheckForReturn(BODY *body){
  fprintf(stderr, " >>> enters travCheckForReturn\n");
  int result = expTravStmts(body->sList);
  fprintf(stderr, "end value: %d\n", result);
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
      fprintf(stderr, "Line %d: missing return statement\n", s->lineno);
      return -1;
      break;
    default:
    return -1;
      break;
  }
}
