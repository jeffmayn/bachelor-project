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


/**
  Finds the types of all declared types
*/
SymbolTable* idTypeFinder();

/**
 t is the root of the current scope
*/
void idFinderRec(SymbolTable *t, BODY* node);

void travDecls(SymbolTable *t, DECL_LIST *decls);

void travVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls);

/**
 * Finds the types of expressions
*/
void expTypeFinder();

/**
 * Checks if expression types match variable and context types
*/
void checkTypes();
#endif
