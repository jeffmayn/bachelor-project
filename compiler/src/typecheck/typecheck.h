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
  SymbolTable *defScope;
  char* funcId;
  struct bodyListElm *prev;
  struct bodyListElm *next;
} bodyListElm;

typedef struct bodyList {
  bodyListElm *head;
  bodyListElm *tail;
  bodyListElm *next;
} bodyList;

int typeCheck(SymbolTable *table);

/**
  Finds the types of all declared types
*/
int idTypeFinder(SymbolTable *table, bodyList *bList);

/**
 t is the root of the current scope
*/
int idTypeTravBody(SymbolTable *t, BODY* node, bodyList *bList);

int idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList);

int idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls, int isParamList);

/**
 * Finds the types of expressions
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

int expTypeTravExps(SymbolTable *t, EXP_LIST *eList, ParamSymbol* pSym);

/**
 * Checks if expression types match variable and context types
*/
int checkTypes(SymbolTable *t, BODY *body, char* funcId);

int checkTypeTravBody(SymbolTable *t,  BODY *body, char* funcId);

int checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList, char* funcId);

int checkTypeTravStmt(SymbolTable *t, STATEMENT *s, char* funcId);

TYPE* checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym);

int checkTypeTravDecls(SymbolTable *t, DECL_LIST *decls);

int checkTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls);

Typekind expOfType(EXP *exp);

int cmpTypekind(Typekind tk1, Typekind tk2);

int cmpTypeSymExp(SymbolTable *t, SYMBOL *sym, EXP *exp);

int cmpTypeTyExp(SymbolTable *t, TYPE *ty, EXP *exp);

int cmpTypeTyTy(SymbolTable *t, TYPE *ty1, TYPE *ty2);

int cmpTypeSymTy(SymbolTable *t, SYMBOL *sym, TYPE *ty);

int cmpTypeSymSym(SymbolTable *t, SYMBOL *sym1, SYMBOL *sym2);

SYMBOL* recursiveSymbolRetrieval(SymbolTable *t, char* symbolID, SymbolList *knownSyms);

bodyList* initBodyList();

void saveBody(bodyList *list, BODY *body, SymbolTable* scope, char* funcId, SymbolTable* defScope);

bodyListElm* getBody(bodyList *list);

void resetbodyListIndex(bodyList *list);





#endif
