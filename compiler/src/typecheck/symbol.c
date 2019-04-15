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
  table->ParamHead = NULL;
  table->ParamTail = NULL;
  return table;
}

SymbolTable *scopeSymbolTable(SymbolTable *t){
  SymbolTable* newt = initSymbolTable();
  newt->next = t;
  return newt;
}

ParamSymbol *createParamSymbol(SYMBOL *sym){
  ParamSymbol *newParSym = NEW(ParamSymbol);
  newParSym->data = sym;
  newParSym->next = NULL;
  return newParSym;
}

/**
 * creates a new symbol which stores the name and value
 * from the arguments in table t
 *
 * return NULL* if the name is already in the table
 * return SYMBOL* to the new symbol on success
 */
SYMBOL *putSymbol(SymbolTable *t, char *name, int value, int kind, int type, SymbolTable *scope, TYPE* arrayType){
  //make new symbol add name and value
  SYMBOL *newSym = Malloc(sizeof(SYMBOL));
  newSym->kind = kind;
  newSym->typeVal = type;
  newSym->value = value;
  newSym->name = Malloc(strlen(name)+1);
  memcpy(newSym->name, name, strlen(name)+1);
  newSym->scope = scope;
  newSym->typePtr = arrayType;
  newSym->defScope = t;
  newSym->typePtr->scope = t;
  newSym->visited = false;
  newSym->next = NULL;
  TYPE *ty = newSym->typePtr;
  while(ty->kind == arrayK){
    ty = ty->val.arrayType;
    ty->scope = t;
  }
  newSym->cgu = NULL;

  //find index via hash value
  int hashIndex = Hash(name);

  //insert into table
  SYMBOL **table = t->table;
  if(table[hashIndex] == NULL){
    table[hashIndex] = newSym;
  } else {
    SYMBOL *temp = table[hashIndex];
    /*if(!strcmp(name,temp->name)){
      //name is already in this table
      free(newSym->name);
      free(newSym);
      return NULL;
    }*/
    while(temp != NULL){
      //temp = temp->next;
      if(!strcmp(name,temp->name)){
        //name is already in this table
        fprintf(stderr, "putSymbol(): SYMBOL name: %s alredy in table\n", name);
        free(newSym->name);
        free(newSym);
        return NULL;
      }
      if(temp->next != NULL){//as long as there is a next, check the next one.
        temp = temp->next;
      }
    }
    temp->next = newSym;
  }

  return newSym;
}


SYMBOL *putParam(SymbolTable *t, char *name, int value, int kind, int type, TYPE* arrayType){
  //fprintf(stderr, "putParam*****************************\n");
  SYMBOL* s = putSymbol(t, name, value, kind, type, NULL, arrayType); //assuming param is variable, so no scope is relevant
  if(s == NULL){
    fprintf(stderr, "putParam(): The id: %s already exists\n", name);
    return NULL;
  }

  ParamSymbol *pSym = createParamSymbol(s);
  if(t->ParamHead == NULL){
    t->ParamHead = pSym;
    t->ParamTail = pSym;
  }
  else {
    t->ParamTail->next = pSym;
    t->ParamTail = pSym;
  }
  // if(getSymbol(t, name) == NULL){
  //   fprintf(stderr, "param %s not found after putting it\n", name);
  // }
  return s;
}

SYMBOL *getRecordSymbol(SymbolTable *t, char* name){
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
    /*we only check one symboltable*/
    return NULL;
}

SYMBOL *getSymbol(SymbolTable *t, char *name){//TODO REFORMAT: getRecordSymbol kan integreres.
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
    fprintf(stderr,"\n%8s\n","/\\ ");
    fprintf(stderr,"%8s\n","/||\\");
    fprintf(stderr,"%8s\n"," || ");
    fprintf(stderr,"%8s\n"," || ");
    fprintf(stderr,".:childnode:.\n");
  } else {
    fprintf(stderr,".:root:.\n");
  }
  SYMBOL **table = t->table;
  fprintf(stderr,"%-9s %-15s %-10s %s\n", "hashIndex", "name", "value",
   "chained pairs->");
  for(int i=0; i<HashSize; i++){
    if(table[i]!=NULL){
      SYMBOL *elm = table[i];
      fprintf(stderr,"%9d %-15s %-10d", i, elm->name, elm->value);
      elm = elm->next;
      while(elm != NULL){
        fprintf(stderr," -> (%s,%d)",elm->name,elm->value);
        elm = elm->next;
      }
      fprintf(stderr,"\n");
    }
  }

}
