#ifndef __weeder_h
#define __weeder_h
#include "tree.h"

void *weederBody(BODY *body);
FUNCTION *weederFunction(FUNCTION *f);
void *traverseBody(BODY *body);
void *traverseDECL(DECL_LIST *decl);

int checkForReturn(STATEMENT_LIST *sList);
void *traverseSTMTlist(STATEMENT_LIST *stmtList);

void *expTravStmts(STATEMENT_LIST *stmtList, int* listRet);
int expTravStmt(STATEMENT *s);

void *travCheckForReturn(BODY *body);
#endif
