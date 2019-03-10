#ifndef __symbol_h
#define __symbol_h
#include "tree.h"
#define HashSize 317
//enum typeKind {idK, intK, boolK, arrayK, recordK};

/* SYMBOL will be extended later.
   Function calls will take more parameters later.

   Use scope when type is func as pointer to the scope of the function
*/

typedef struct SYMBOL {
  enum {type,func,var} kind;
  enum Typekind type; //this should be the enum from the TYPE struct
  char *name;
  int value;
  struct SymbolTable* scope; //only relevant for functions
  struct SymbolTable* content; //only relevant for records
  struct TYPE* arrayType; //only relevant for arrays
  char* typeId; //only relevant for user types. Containing the name of the type. Not yet in use
  struct SYMBOL *next;
} SYMBOL;

typedef struct SymbolTable {
    SYMBOL *table[HashSize]; //**table
    SYMBOL *param; //List of parameters in order of first to last
    struct SymbolTable *next;
} SymbolTable;

int Hash(char *str);

SymbolTable *initSymbolTable();

SymbolTable *scopeSymbolTable(SymbolTable *t);

SYMBOL *putSymbol(SymbolTable *t, char *name, int value, int kind, int type, SymbolTable *scope);

/**
 * Add a parameter to the scop given by SymbolTable
*/
SYMBOL *putParam(SymbolTable *t, char *name, int value, int kind, int type);


SYMBOL *getSymbol(SymbolTable *t, char *name);

void dumpSymbolTable(SymbolTable *t);
#endif
