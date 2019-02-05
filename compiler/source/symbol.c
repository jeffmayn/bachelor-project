#include "../header/symbol.h"
#include "../header/memory.h"
#include <stdlib.h>
#include  <stdio.h>
#include  <string.h>

int Hash(char *str){
  unsigned int sum = 0;
  for (int i = 0; i < strlen(str); i++){
    char c = str[i];
    sum += c;
    if(i < strlen(str)-1){
      sum <<= 1;
    }
  } return sum % HashSize;
}

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

/**
 * creates a new symbol which stores the name and value
 * from the arguments in table t
 *
 * return NULL* if the name is already in the table
 * return SYMBOL* to the new symbol on success
 */
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
  SYMBOL **table = t->table;
  if(table[hashIndex] == NULL){
    table[hashIndex] = newSym;
  } else {
    SYMBOL *temp = table[hashIndex];
    if(!strcmp(name,temp->name)){
      //name is already in this table
      free(newSym->name);
      free(newSym);
      return NULL;
    }
    while(temp->next != NULL){
      if(!strcmp(name,temp->name)){
        //name is already in this table
        free(newSym->name);
        free(newSym);
        return NULL;
      }
      temp = temp->next;
    }
    temp->next = newSym;
  }

  return newSym;
}

SYMBOL *getSymbol(SymbolTable *t, char *name){
  //find index via hash
  int hashIndex = Hash(name);

  //search in current table
  SYMBOL **table = t->table;
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

void dumpSymbolTable(SymbolTable *t){
  if(t == NULL){
    return;
  }

  dumpSymbolTable(t->next);
  if(t->next != NULL){
    printf("\n /\\\n");
    printf("/||\\\n");
    printf(" ||\n");
    printf(" ||\n\n");
  }
  SYMBOL **table = t->table;
  for(int i=0; i<HashSize; i++){
    if(table[i]!=NULL){
      SYMBOL *elm = table[i];
      printf("(%s,%d)",elm->name,elm->value);
      elm = elm->next;
      while(elm != NULL){
        printf("->(%s,%d)",elm->name,elm->value);
        elm = elm->next;
      }
      printf("\n");
    }
  }

}
