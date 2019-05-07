#ifndef __weeder_h
#define __weeder_h
#include "tree.h"

/**
 * Returns -1 if function with different ids or without return were found
 * Also returns -1 if return statement found in main
 * Returns 0 otherwise
 */
int weeder1(BODY *body);

/**
 * Traverses single body (not used for main) to check if its id's match
 * and if it will reach return statement
 */
int weederTraverseBody(BODY *body, char *name);

/**
 * Finds function declarations to check if IDs match
 * and check for returns in body of declared function
 */
int weederTraverseDECL(DECL_LIST *declList);

/**
 * checks ids of function and checks body for returns
 */
int weederTravFunction(FUNCTION *f);

/**
 * Traverses statement list to check for returns
 */
int weederTravStmtList(STATEMENT_LIST *stmtList);

/**
 * Traverses single statement to check its type
 */
int weederTravStmt(STATEMENT *s);

/**
 * Returns -1 as soon as a return statment is found
 * Main scope cannot contain return statement
 */
int weederTravMainStmtList(STATEMENT_LIST *stmtList);

/**
 * returns -1 if a return is found
 */
int weederTravMainStmt(STATEMENT *s);
/*
int weederBody(BODY *body);
int weederFunction(FUNCTION *f);
int weederTraverseBody(BODY *body);
int weederTraverseDECL(DECL_LIST *decl);

int weederCheckForReturn(STATEMENT_LIST *sList);

int weederExpTravStmts(STATEMENT_LIST *stmtList);
int weederExpTravStmt(STATEMENT *s);

int weederTravCheckForReturn(BODY *body);
*/
#endif
