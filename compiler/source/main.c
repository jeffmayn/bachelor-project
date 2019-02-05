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


void createAFuckingTree(){
  int tableCount = 20;
  SymbolTable *tables[tableCount]; //list of pointers to any symbolTable in the tree
  SymbolTable *tableRoot = initSymbolTable();
  tables[0] = tableRoot;

  //create tables
  for(int i = 0; i < tableCount; tableCount++){
    int search = 1; //continue to search for parent
    int j = 1; //randomization factor for finding parent
    int parentIndex = i*j*300 % HashSize;
    while(tables[parentIndex] == NULL){
      int parentIndex = i*j*300 % HashSize;
    }
    SymbolTable *childTable = scopeSymbolTable(tables[parentIndex]); //set parent of child
    tables[i] = childTable; //save child i table
  }

  //insert symbol into the tables
  for(int i = 0; i<500; i++){
    
  }

}
