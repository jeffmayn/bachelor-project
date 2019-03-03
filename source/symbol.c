#include "symbol.h"
#include "memory.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int Hash(char *str){
  unsigned int sum = 0;
  for (unsigned int i = 0; i < strlen(str); i++){
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
SYMBOL *putSymbol(SymbolTable *t, char *name, int value, int kind, int type, SymbolTable *scope){
  //make new symbol add name and value
  SYMBOL *newSym = Malloc(sizeof(SYMBOL));
  newSym->kind = kind;
  newSym->type = type;
  newSym->value = value;
  newSym->name = Malloc(strlen(name)+1);
  memcpy(newSym->name, name, strlen(name)+1);
  newSym->scope = scope;
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
      temp = temp->next;
      if(!strcmp(name,temp->name)){
        //name is already in this table
        free(newSym->name);
        free(newSym);
        return NULL;
      }
    }
    temp->next = newSym;
  }

  return newSym;
}


SYMBOL *putParam(SymbolTable *t, char *name, int value, int kind, int type){
  SYMBOL* s = putSymbol(t, name, value, kind, type, NULL); //assuming param is variable, so no scope is relevant
  if(s == NULL){
    printf("PutParam: The id already exists \n");
    return NULL;
  }
  SYMBOL *param = t->param;
  if(param == NULL){
    param = s;
  }
  while(param->next != NULL){
    param = param->next;
  }
  param->next = s;
  return s;
}


SYMBOL *getSymbol(SymbolTable *t, char *name){
  //find index via hash
  int hashIndex = Hash(name);

  //search in current table
  SYMBOL **table = t->table;
  SYMBOL *temp = table[hashIndex];
  while(temp != NULL){
    if(!strcmp(temp->name, name)){
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
    printf("\n%8s\n","/\\ ");
    printf("%8s\n","/||\\");
    printf("%8s\n"," || ");
    printf("%8s\n"," || ");
    printf(".:childnode:.\n");
  } else {
    printf(".:root:.\n");
  }
  SYMBOL **table = t->table;
  printf("%-9s %-15s %-10s %s\n", "hashIndex", "name", "value",
   "chained pairs->");
  for(int i=0; i<HashSize; i++){
    if(table[i]!=NULL){
      SYMBOL *elm = table[i];
      printf("%9d %-15s %-10d", i, elm->name, elm->value);
      elm = elm->next;
      while(elm != NULL){
        printf(" -> (%s,%d)",elm->name,elm->value);
        elm = elm->next;
      }
      printf("\n");
    }
  }

}
