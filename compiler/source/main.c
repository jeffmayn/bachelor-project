#include "../header/symbol.h"
#include <stdio.h>

int main(int argc, char** argv){
  printf("Hej\n");
  SymbolTable *table = initSymbolTable();
  printf("Symboltable = %p\n", table);
  SymbolTable *childTable = scopeSymbolTable(table);
  printf("Child Symboltable = %p\n", childTable);
  printf("parent of child Symboltable = %p\n", childTable->next);
  dumpSymbolTable(childTable);

}
