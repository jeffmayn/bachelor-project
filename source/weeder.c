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
  fprintf(stderr, " >> CHECK FOR HEAD-TAIL ID\n");
  fprintf(stderr,"function head-id: %s\n", f->head->id);
  fprintf(stderr,"function tail-id: %s\n", f->tail->id);
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    fprintf(stderr,"return code: 0\n\n");
  } else {
    fprintf(stderr,"return code: -1\n\n");
  }
  traverseBody(f->body);
  travCheckForReturn(f->body);
  //checkForReturn(f->body);
}



// NEW STUFF

void *travCheckForReturn(BODY *body){
  int* listRet = NEW(int);
  *listRet = -1;
  expTravStmts(body->sList, listRet);
  int temp = *listRet;
  fprintf(stderr, "end value: %d\n", *listRet);
  free(listRet);
  //return temp;
}

int checkForReturn(STATEMENT_LIST *sList){
  int* listRet = NEW(int);
  *listRet = -1;
  fprintf(stderr, " >> CHECK FOR RETURN STATEMENTS\n");
  if(sList != NULL){
    if(sList->statement->kind == returnK){
      fprintf(stderr, "found the return, yaaah\n");
      fprintf(stderr,"return code: 0\n\n");
      *listRet = 0;
    }

    if(sList->statement->kind == ifK){
      fprintf(stderr, "no return, but found: if_then\n");
      expTravStmts(sList, listRet);
    }

    if(sList->statement->kind == thenK){
      fprintf(stderr, "no return, but found: if_else_then\n");
      expTravStmts(sList, listRet);
    }
  }
  int temp = *listRet;
  free(listRet);
  return temp;
}

/*
void *traverseSTMTlist(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    fprintf(stderr, "kind --> %d\n\n", stmtList->statement->kind);
    expTravStmts(stmtList->statement);
  }
}
*/
void *expTravStmts(STATEMENT_LIST *stmtList, int* listRet){
  if(stmtList != NULL){
    if (stmtList->statement != NULL){
      fprintf(stderr, " >> STATEMENT_LIST\n");
      if(*listRet < expTravStmt(stmtList->statement)){
        *listRet = 0;
      }

      if(stmtList->statementList != NULL){
        expTravStmts(stmtList->statementList, listRet);
      }
    }
  }
}

int expTravStmt(STATEMENT *s){
  int retVal = 0;
  switch(s->kind){
    case returnK:
      fprintf(stderr, "found the return, yaaah\n");
      fprintf(stderr,"return code: 0\n\n");
      //checkForReturn(s->val.return_);
      break;
    case ifK:
      printf("!! ifK !!\n\n");
      retVal = checkForReturn(s->val.ifthenelse.thenbody->val.list);
      break;
    case thenK:
      printf("!! thenbody !!\n\n");
      retVal = checkForReturn(s->val.ifthenelse.thenbody->val.list);
      printf("!! elsebody !!\n\n");
      if(retVal > checkForReturn(s->val.ifthenelse.elsebody->val.list)){
        retVal = -1;
      }
      break;
    default:
      break;
  }
  return retVal;
}
