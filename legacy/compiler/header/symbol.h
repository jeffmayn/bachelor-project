#define HashSize 317

/* SYMBOL will be extended later.
   Function calls will take more parameters later.
*/

typedef struct SYMBOL {
  enum {var,func,type} kind;
  enum type; //this should be the enum from the TYPE struct
  char *name;
  int value;
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

SYMBOL *putSymbol(SymbolTable *t, char *name, int value, int kind);

/**
 * Add a parameter to the scop given by SymbolTable
 * TODO: implement
*/
SYMBOL *putParam(SymbolTable *t, char *name, int value, int kind, int type);


SYMBOL *getSymbol(SymbolTable *t, char *name);

void dumpSymbolTable(SymbolTable *t);