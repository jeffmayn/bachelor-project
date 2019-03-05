#ifndef __weeder_h
#define __weeder_h
#include "tree.h"

void *weederBody(BODY *body);

FUNCTION *weederFunction(FUNCTION *f);

void *traverseBody(BODY *body);
void *traverseDECL(DECL_LIST *decl);
void *traverseSTMTlist(STATEMENT_LIST *stmtList);
void *checkForReturn(BODY *body);


#endif
