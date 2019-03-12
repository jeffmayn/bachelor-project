#ifndef __weeder_h
#define __weeder_h
#include "tree.h"

int *weederBody(BODY *body);
int *weederFunction(FUNCTION *f);
int *traverseBody(BODY *body);
int *traverseDECL(DECL_LIST *decl);

int checkForReturn(STATEMENT_LIST *sList);
//void *traverseSTMTlist(STATEMENT_LIST *stmtList);

int *expTravStmts(STATEMENT_LIST *stmtList);
int expTravStmt(STATEMENT *s);

int *travCheckForReturn(BODY *body);
#endif
