#include <stdio.h>
#include <string.h>
#include "weeder.h"
#include "memory.h"
#include "tree.h"

extern BODY *theexpression;

int retVal = -2;
int retVal2 = -2;


/**
 * Returns -1 if function with different ids or without return were found
 * Also returns -1 if return statement found in main
 * Returns 0 otherwise
 */
int weeder1(BODY *body){
  if(weederTravMainStmtList(body->sList) == -1){
    return -1;
  }
  return weederTraverseDECL(body->vList);
}

/**
 * Traverses single body (not used for main) to check if its id's match
 * and if it will reach return statement
 */
int weederTraverseBody(BODY *body, char *name){
  int ret = weederTravStmtList(body->sList);
  if(ret == -1){
    fprintf(stderr, "ERROR: Some path in function %s does not reach a return statement\n", name);
    return -1;
  }
  return weederTraverseDECL(body->vList);

}

/**
 * Finds function declarations to check if IDs match
 * and check for returns in body of declared function
 */
int weederTraverseDECL(DECL_LIST *declList){
  if(declList != NULL){                    // kind 1 = function
    if (declList->decl != NULL && declList->decl->kind == funcK){
      retVal = weederTravFunction(declList->decl->val.func);
      if(retVal == -1){
        return -1;
      }
    }
    return weederTraverseDECL(declList->decl_list);
  }
  return 0;
}

/**
 * checks ids of function and checks body for returns
 */
int weederTravFunction(FUNCTION *f){
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    retVal = 0;
  } else {
    fprintf(stderr, "ERROR: Line %d: mismatch in header-id %s and tail-id %s\n", f->head->lineno, f->head->id, f->tail->id);
    return -1;
  }
  return weederTraverseBody(f->body, f->head->id);
}


/**
 * Traverses statement     case ifK:
      return -1;list to check for returns
 */
int weederTravStmtList(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if(weederTravStmt(stmtList->statement) == 0){
      if(stmtList->statementList != NULL){
        fprintf(stderr, "Warning! Line %d: Unreachable statement after return\n", stmtList->statementList->lineno);
      }
      return 0;
    }
    return weederTravStmtList(stmtList->statementList);
  }
  else{
    return -1;
  }
}

/**
 * Traverses single statement to check its type
 */
int weederTravStmt(STATEMENT *s){
  int retVal = 0;
  //int blah = 0;
  switch(s->kind){
    case returnK:
      return 0;
      break;
    case thenK:
      retVal = weederTravStmt(s->val.ifthenelse.thenbody);
      if(retVal == -1){
        return -1;
      }
      return weederTravStmt(s->val.ifthenelse.elsebody);
      break;
    case listStmtK:
      return weederTravStmtList(s->val.list);
      break;
    default:
      return -1;
      break;
  }
}

/**
 * Returns -1 as soon as a return statment is found
 * Main scope cannot contain return statement
 */
int weederTravMainStmtList(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if(weederTravMainStmt(stmtList->statement) == -1){
      return -1;
    }
    return weederTravMainStmtList(stmtList->statementList);
  }
  return 0;
}

/**
 * returns -1 if a return is found
 */
int weederTravMainStmt(STATEMENT *s){
  int retVal = 0;
  //int blah = 0;
  switch(s->kind){
    case returnK:
      fprintf(stderr, "ERROR: Line %d: return statemenet found i main scope\n", s->lineno);
      return -1;
      break;
    case ifK:
      return weederTravMainStmt(s->val.ifthenelse.thenbody);
    case thenK:
      retVal = weederTravMainStmt(s->val.ifthenelse.thenbody);
      if(retVal == -1){ return -1; }
      return weederTravMainStmt(s->val.ifthenelse.elsebody);
      break;
    case whileK:
      return weederTravMainStmt(s->val.while_.body);
      break;
    case listStmtK:
      return weederTravMainStmtList(s->val.list);
      break;
    default:
      return 0;
      break;
  }
}
