#include <stdio.h>
#include <string.h>
#include "weeder.h"

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
  checkForReturn(f->body);
}

// NEW STUFF
void *checkForReturn(BODY *body){
  fprintf(stderr, " >> CHECK FOR RETURN STATEMENTS\n");
  if(body != NULL){
    if(body->sList->statement->kind == 0){
      fprintf(stderr, "found the return, yaaah\n");
      fprintf(stderr,"return code: 0\n\n");
    }

    if(body->sList->statement->kind == 5){
      fprintf(stderr, "no return, but found: if_else\n");
      expTravStmts(body->sList);
    }

    if(body->sList->statement->kind == 6){
      fprintf(stderr, "no return, but found: if_else_then\n");
      expTravStmts(body->sList);
    }
  }
}

/*
void *traverseSTMTlist(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    fprintf(stderr, "kind --> %d\n\n", stmtList->statement->kind);
    expTravStmts(stmtList->statement);
  }
}
*/
void *expTravStmts(STATEMENT_LIST *stmtList){
  if(stmtList != NULL){
    if (stmtList->statement != NULL){
      fprintf(stderr, " >> STATEMENT_LIST\n");
      expTravStmt(stmtList);
    }
  }
}

void *expTravStmt(STATEMENT *s){
  switch(s->kind){
    case returnK:
      fprintf(stderr, "found the return, yaaah\n");
      fprintf(stderr,"return code: 0\n\n");
      //checkForReturn(s->val.return_);
      break;
    case ifK:
      printf("!! ifK !!\n\n");
      checkForReturn(s->val.ifthenelse.elsebody);
      break;
    case thenK:
      printf("!! thenK !!\n\n");
      checkForReturn(s->val.ifthenelse.thenbody);
      break;
    default:
      printf("kiss my ass\n\n");
      break;
  }
}
