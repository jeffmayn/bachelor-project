#include <stdio.h>
#include <string.h>
#include "weeder.h"

extern BODY *theexpression;

FUNCTION *weederFunction(FUNCTION *node){
  // for debugging
  printf("function head-id: %s\n", node->head->id);
  printf("function tail-id: %s\n", node->tail->id);

  // check header-id og tail-id er ens
  if (strcmp (node->head->id, node->tail->id) ){
    printf("same");
    return FUNCTION;
  } else {
    printf("not same");
    // TODO: do stuff
  }
}
