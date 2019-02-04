#include <stdio.h>
#include <stdlib.h>
#include <symbol.h>
#include <memory.h>
#include <string.h>

int Hash(char *str);

SymbolTable *initSymbolTable();

SymbolTable *scopeSymbolTable(SymbolTable *t);

SYMBOL *putSymbol(SymbolTable *t, char *name, int value){
  //make new symbol add name and value
  SYMBOL *newSym = Malloc(sizeof(SYMBOL));
  newSym->value = value;
  newSym->name = Malloc(strlen(name)+1);
  memcpy(newSym->name, name, strlen(name)+1);
  newSym->next = NULL;

  //find index via hash value
  int hashIndex = Hash(name);

  //insert into table
  SYMBOL *table = t->table;
  if(table[hashIndex] == NULL){
    table[hashIndex] = newSym;
  } else {
    SYMBOL *temp = table[hashIndex];
    while(temp->next != NULL){
      temp = temp->next;
    }
    temp->next = newSym;
  }

  return newSym;
}

SYMBOL *getSymbol(SymbolTable *t, char *name){
  //find index via hash
  int hashIndex = hash(name);

  //search in current table
  SYMBOL *table = t->table;
  SYMBOL *temp = table[hashIndex];
  while(temp != NULL){
    if(strcmp(temp->name, name)){
      return temp;
    } else {
      temp = temp->next;
    }
  }

  //navigate to next hashtable if there is one
  if(t->next != NULL){
    return getSymbol(t->next, name);
  } else {
    return NULL;
  }
}

void dumpSymbolTable(SymbolTable *t);
