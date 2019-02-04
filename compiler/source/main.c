#include "../header/symbol.h"
#include "../header/memory.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv){



  printf("Hej\n");
  SymbolTable *table = initSymbolTable();
  printf("Symboltable = %p\n", table);
  SymbolTable *childTable = scopeSymbolTable(table);
  printf("Child Symboltable = %p\n", childTable);
  printf("parent of child Symboltable = %p\n", childTable->next);


  //char s[20];
  //char* s = Malloc(20);
  for(int i = 0; i<20; i++){
    //s = itoa(i,s,DECIMAL);
    putSymbol(table, "blah" , i);
  }
  for(int i = 0; i<16; i++){
    //s = itoa(i,s,DECIMAL);
    putSymbol(childTable, "blah2", i);
  }
  dumpSymbolTable(childTable);

}
