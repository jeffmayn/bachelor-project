#ifndef __symbol_h
#define __symbol_h
#include "tree.h"
#define HashSize 317
typedef enum Symbolkind{typeS,funcS,varS} Symbolkind;
typedef struct CODEGENUTIL CODEGENUTIL;

/**
  struktur brugt i SymbolTable
  indeholder information omkring variabler, funktioner og typer
  */
typedef struct SYMBOL {
  Symbolkind kind;
  enum Typekind typeVal; //this should be the enum from the TYPE struct
  char *name;
  int value; //never used, at all, always 0. we used it when we first created the symboltable - sorry
  struct SymbolTable* scope; //only relevant for functions
  struct SymbolTable* content; //only relevant for records
  struct TYPE* typePtr;
  char* typeId; //only relevant for user types. Containing the name of the type.
  struct SymbolTable* defScope;
  bool visited;
  struct SYMBOL *next;

  CODEGENUTIL *cgu;//codegeneration utility
} SYMBOL;

/**
  used by functions for containing parameter symbols without destrying the symbol next pointer
  */
typedef struct ParamSymbol {
  struct SYMBOL *data;
  struct ParamSymbol *next;
} ParamSymbol;

/**
  holds table which is a list of symbols, and for functions we added
  parameterlists.
  the next pointer points to the parent scope.
  */
typedef struct SymbolTable {
    SYMBOL *table[HashSize];
    ParamSymbol *ParamHead; //List of parameters in order of first to last
    ParamSymbol *ParamTail;
    struct SymbolTable *next;
} SymbolTable;

/**
  solves a similar problem to ParamSymbol
  used in typechecking to be sure we do not visit the 
  same symbol twice when looking for a typedefinition
  helps us detect type definition cycles.
  */
typedef struct SymbolList {
  SYMBOL *symbol;
  struct SymbolList *next;
} SymbolList;

extern const char *symKindNames[];

int Hash(char *str);//hashfunction

SymbolTable *initSymbolTable();

SymbolTable *scopeSymbolTable(SymbolTable *t);

SYMBOL *putSymbol(SymbolTable *t, char *name, int value, int kind, int type, SymbolTable *scope, TYPE* arrayType);

/**
 * Add a parameter to the scop given by SymbolTable
*/
SYMBOL *putParam(SymbolTable *t, char *name, int value, int kind, int type, TYPE* arrayType);
ParamSymbol *createParamSymbol(SYMBOL *sym);

SYMBOL *getSymbol(SymbolTable *t, char *name);
SYMBOL *getRecordSymbol(SymbolTable *t, char* name);
SYMBOL *IRgetSymbol(SymbolTable *t, char *name, int *nrJumps);

void dumpSymbolTable(SymbolTable *t);

/**
 * Returns 1 if symbol is in list
 * Returns 0 if not, if no list or no symbol is given
 */
int containsSym(SymbolList *list, SYMBOL *s);

/**
 * Prepends the symbol to the list
 * list may have repetitions
 * the given and returned list is the same
 */
SymbolList* prependSymbol(SymbolList *list, SYMBOL *sym);
#endif
