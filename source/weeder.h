#ifndef __weeder_h
#define __weeder_h
#include "../scan_parse/tree.h"

void *weederBody(BODY *body);

FUNCTION *weederFunction(FUNCTION *f);

void *traverseBody(BODY *body);
void *traverseDECL(DECL_LIST *decl);


#endif
