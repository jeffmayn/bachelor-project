#include <stdio.h>
#include <string.h>
#include "symbol.h"
#include "symbol.c"
#include "weeder.h"

extern BODY *theexpression;

void *weederBody(BODY *body){
  printf("ENTERING weederBody\n");
  body = theexpression;
  traverseBody(body);
}

void *traverseBody(BODY *body){
  printf("ENTERING traverseBody\n");
  traverseDECL(body->vList);
}

void *traverseDECL(DECL_LIST *decl){
  printf("ENTERING traverseDECL\n");
  if(decl != NULL){
    if (decl->decl != NULL && decl->decl->kind == 1){
      weederFunction(decl->decl->val.func);
      printf(" --> kind = function\n");
    } else {
    //  printf(" --> kind = %d\n", decl->decl->kind);

    }
    traverseDECL(decl->decl_list);
  }
}

FUNCTION *weederFunction(FUNCTION *f){
  printf("ENTERING weederFunction\n");
  // for debugging
  printf("function head-id: %s\n", f->head->id);
  printf("function tail-id: %s\n", f->tail->id);

  // check header-id og tail-id er ens
  if ((strcmp (f->head->id, f->tail->id))==0 ){
    printf("same");
    //return f;
  } else {
    printf("not same");
    // TODO: do stuff
  }

  traverseBody(f->body);
}
