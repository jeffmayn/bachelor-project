#ifndef __typecheck_h
#define __typecheck_h
#include "symbol.h"
/*
Whenever a function definition (with deklarations)
then insert a new scope.
For each deklaration in scope, insert ID.
Should vars, functions and types be differentiated

For variables and types, we have a typefield
What about funktions. Is the typefield the return type?
Parameters defined in new scope?

Værdien i en variable? Den skal vel ikke bruges endnu
*/


typedef struct bodyListElm {
  BODY *body;
  struct bodyListElm *prev;
  struct bodyListElm *next;
} bodyListElm;

typedef struct bodyList {
  bodyListElm *head;
  bodyListElm *tail;
  bodyListElm *next; //the next element fetched
} bodyList;


SymbolTable* typeCheck();

/**
  Finds the types of all declared types
*/
void idTypeFinder(SymbolTable *table, bodyList *bList);

/**
 t is the root of the current scope
*/
void idTypeTravBody(SymbolTable *t, BODY* node, bodyList *bList);

void idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList);

void idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls);

/**
 * Finds the types of expressions


 * TODO: only runs on theexpression, not the bodies of declared functions
 * For each body declaration i could put the stmtlist into a list
 * traversed by this function.
*/
void expTypeFinder(SymbolTable *table, BODY *body);

void expTypeTravBody(SymbolTable *t,  BODY *body);

void expTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList);

void expTypeTravStmt(SymbolTable *t, STATEMENT *s);

enum Typekind expTypeTravExp(SymbolTable *t, EXP *exp);

int expTypeTravTerm(SymbolTable *t, TERM *term);

int expTypeTravVar(SymbolTable *t, VARIABLE *v);

void expTypeTravExps(SymbolTable *t, EXP_LIST *eList);

/**
 * Checks if expression types match variable and context types
*/
void checkTypes(SymbolTable *t, BODY *body);

void checkTypeTravBody(SymbolTable *t,  BODY *body);

void checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList);

void checkTypeTravStmt(SymbolTable *t, STATEMENT *s);




bodyList* initBodyList();

void saveBody(bodyList *list, BODY *body);

BODY* getBody(bodyList *list);

void resetbodyListIndex(bodyList *list);





#endif
