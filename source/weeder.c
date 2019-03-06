#include <stdio.h>
#include <string.h>
#include "weeder.h"

extern BODY *theexpression;

void *weederBody(BODY *body){//TODO return -1 on error.
  //fprintf(stderr,"ENTERING weederBody\n");
  body = theexpression;
  traverseBody(body);
  //checkForReturn(body);
}

void *traverseBody(BODY *body){
  //fprintf(stderr,"ENTERING traverseBody\n");
  traverseDECL(body->vList);
}

void *traverseDECL(DECL_LIST *decl){
  //fprintf(stderr,"ENTERING traverseDECL\n");
  if(decl != NULL){
    if (decl->decl != NULL && decl->decl->kind == 1){
      weederFunction(decl->decl->val.func);
    //  fprintf(stderr," --> kind = function\n");
    } else {
    //  fprintf(stderr," --> kind = %d\n", decl->decl->kind);
    }
    traverseDECL(decl->decl_list);
  }
}

FUNCTION *weederFunction(FUNCTION *f){//TODO return statement.
  //fprintf(stderr,"ENTERING weederFunction\n");
  // for debugging
  fprintf(stderr,"function head-id: %s\n", f->head->id);
  fprintf(stderr,"function tail-id: %s\n", f->tail->id);

  // check header-id og tail-id er ens
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    fprintf(stderr,"!! same !!\n\n");
    //return f;
  } else {
    fprintf(stderr,"!! not same !!\n\n");
    // TODO: do stuff
  }
  traverseBody(f->body);
  checkForReturn(f->body);
}

// NEW STUFF
void *checkForReturn(BODY *body){
  printf("ENTERING checkForReturn\n");
  traverseSTMTlist(body->sList);

}

void *traverseSTMTlist(STATEMENT_LIST *stmtList){
  printf("ENTERING traverseSTMTlist\n");
  if(stmtList != NULL){
    printf("kind --> %d\n", stmtList->statement->kind);
    if(stmtList->statement->kind == 5){
      printf("return stmnt found\n");
      // ifthenelse();
    } else {
      printf("no return stmnt found\n");
    }
  }
}

void *travStmts(STATEMENT_LIST *stmtList){
  travStmt(stmtList->statement);
}

void *travStmt(STATEMENT *s){
  switch(s->kind){
    case returnK:
      // TODO
      break;
    case ifK:
      // TODO
      break;
    case thenK:
      // TODO
      break;
    default:
      break;
  }
}

/*

void expTypeTravBody(SymbolTable *t,  BODY *body){
  expTypeTravStmts(t, body->sList);
}

void expTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList){
  expTypeTravStmt(t, sList->statement);
  if(sList->statementList != NULL){
    expTypeTravStmts(t, sList->statementList);
  }
}


void expTypeTravStmt(SymbolTable *t, STATEMENT *s){
  switch(s->kind){
    case returnK:
      expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      fprintf(stderr,"expTypeTravStmt allocateK not implemented\n");
      break;
    case allocateLengthK:
      fprintf(stderr,"expTypeTravStmt allocateLengthK not implemented\n");
      break;
    case assiK:
      //something is wrong here ********************************************
      expTypeTravExp(t, s->val.allocatelength.exp);
      //Kunne i teorien tjekke typer her
      break;
    case ifK:
      expTypeTravExp(t, s->val.ifthenelse.cond);
      expTypeTravStmt(t, s->val.ifthenelse.thenbody);
      break;
    case thenK:
      expTypeTravExp(t, s->val.ifthenelse.cond);
      expTypeTravStmt(t, s->val.ifthenelse.thenbody);
      expTypeTravStmt(t, s->val.ifthenelse.elsebody);
      break;
    case whileK:
      expTypeTravExp(t, s->val.while_.cond);
      expTypeTravStmt(t, s->val.while_.body);
      break;
    case listStmtK:
      expTypeTravStmts(t, s->val.list);
      break;
  }
  fprintf(stderr,"\n");
}



*/
