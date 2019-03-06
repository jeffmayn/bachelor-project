#include <stdio.h>
#include <string.h>
#include "weeder.h"

extern BODY *theexpression;

void *weederBody(BODY *body){//TODO return -1 on error.
  fprintf(stderr,"ENTERING weederBody\n");
  body = theexpression;
  traverseBody(body);
  checkForReturn(body);
}

void *traverseBody(BODY *body){
  fprintf(stderr,"ENTERING traverseBody\n");
  traverseDECL(body->vList);
}

void *traverseDECL(DECL_LIST *decl){
  fprintf(stderr,"ENTERING traverseDECL\n");
  if(decl != NULL){
    if (decl->decl != NULL && decl->decl->kind == 1){
      weederFunction(decl->decl->val.func);
      fprintf(stderr," --> kind = function\n");
    } else {
<<<<<<< HEAD
    //  printf(" --> kind = %d\n", decl->decl->kind);
=======
    //  fprintf(stderr," --> kind = %d\n", decl->decl->kind);

>>>>>>> prettyP
    }
    traverseDECL(decl->decl_list);
  }
}

FUNCTION *weederFunction(FUNCTION *f){//TODO return statement.
  fprintf(stderr,"ENTERING weederFunction\n");
  // for debugging
  fprintf(stderr,"function head-id: %s\n", f->head->id);
  fprintf(stderr,"function tail-id: %s\n", f->tail->id);

  // check header-id og tail-id er ens
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    fprintf(stderr,"same");
    //return f;
  } else {
    fprintf(stderr,"not same");
    // TODO: do stuff
  }
  traverseBody(f->body);
}


// NEW STUFF

void *checkForReturn(BODY *body){
  printf("ENTERING checkForReturn\n");
  traverseSTMTlist(body->sList);
}

void *traverseSTMTlist(STATEMENT_LIST *stmtList){
  printf("ENTERING traverseSTMTlist\n");
  while (stmtList != NULL){
    printf("!!!! --> %d\n", stmtList->statement->kind);
  }
//  if(stmtList != NULL){
//    printf("!!!! --> %d\n", stmtList->statement->kind);
//    traverseSTMTlist()

  //}

}
