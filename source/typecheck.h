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
  SymbolTable *scope;
  char* funcId;
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
int idTypeFinder(SymbolTable *table, bodyList *bList);

/**
 t is the root of the current scope
*/
int idTypeTravBody(SymbolTable *t, BODY* node, bodyList *bList);

int idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList);

int idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls);

/**
 * Finds the types of expressions


 * TODO: only runs on theexpression, not the bodies of declared functions
 * For each body declaration i could put the stmtlist into a list
 * traversed by this function.
*/
int expTypeFinder(SymbolTable *table, BODY *body);

int expTypeTravBody(SymbolTable *t,  BODY *body);

int expTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList);

int expTypeTravStmt(SymbolTable *t, STATEMENT *s);

int expTypeTravExp(SymbolTable *t, EXP *exp);

Typekind expTypeTravTerm(SymbolTable *t, TERM *term, TYPE **type);

Typekind expTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym, TYPE **type);

//TYPE* expTypeTravType(SymbolTable *t, VARIABLE *v, SYMBOL *sym);

int expTypeTravExps(SymbolTable *t, EXP_LIST *eList, SYMBOL* param);

/**
 * Checks if expression types match variable and context types
*/
int checkTypes(SymbolTable *t, BODY *body, char* funcId);

int checkTypeTravBody(SymbolTable *t,  BODY *body, char* funcId);

int checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList, char* funcId);

int checkTypeTravStmt(SymbolTable *t, STATEMENT *s, char* funcId);

TYPE* checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym);

Typekind expOfType(SymbolTable *t, EXP *exp);

Typekind typeOfType(SymbolTable *t, TYPE *type);

int compareSymNExp(SymbolTable *t, SYMBOL *sym, EXP *exp);

int compareSymNSym(SymbolTable *t, SYMBOL *sym1, SYMBOL *sym2);

int compareTypeNExp(SymbolTable *t, TYPE *ty, EXP *exp);

int compareTypeNSym(SymbolTable *t, TYPE *ty, SYMBOL *sym);

int compareTypeNType(SymbolTable *t, TYPE *t1, TYPE* t2);

bodyList* initBodyList();

void saveBody(bodyList *list, BODY *body, SymbolTable* scope, char* funcId);

bodyListElm* getBody(bodyList *list);

void resetbodyListIndex(bodyList *list);





#endif
