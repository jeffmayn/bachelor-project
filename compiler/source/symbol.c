#include "../header/symbol.h"
#include "../header/memory.h"
#include <stdlib.h>
#include  <stdio.h>
#include  <string.h>

int Hash(char *str);

SymbolTable *initSymbolTable(){
  SymbolTable* table = Malloc(sizeof(SymbolTable));
  memset(table->table, 0, sizeof(table->table));
  table->next = NULL;
  return table;
}

SymbolTable *scopeSymbolTable(SymbolTable *t){
  SymbolTable* newt = initSymbolTable();
  newt->next = t;
  return newt;
}

SYMBOL *putSymbol(SymbolTable *t, char *name, int value);

SYMBOL *getSymbol(SymbolTable *t, char *name);

void dumpSymbolTable(SymbolTable *t){
  if(t == NULL){
    return;
  }
  printf(" /\\\n");
  printf("/||\\\n");
  printf(" ||\n");
  printf(" ||\n");
  dumpSymbolTable(t->next);
  SYMBOL **table = t->table;
  for(int i=0; i<317; i++){
    if(table[i]!=NULL){
      SYMBOL *elm = table[i];
      while(elm != NULL){
        printf("(%s,%d)\n",elm->name,elm->value);
      }
    }
  }

}
