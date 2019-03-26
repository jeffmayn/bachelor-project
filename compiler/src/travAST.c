#include "internalASM.h"
#include "memory.h"
#include "symbol.h"
#include "tree.h"
#include "typecheck.h"

/**
 * create hash index value for the string
 *
 * - note: something fishy with the .h files, created my own stuff.
 */
int IRtemporaryHash(char *str){
  unsigned int sum = 0;
  for (unsigned int i = 0; i < strlen(str); i++){
    char c = str[i];
    sum += c;
    if(i < strlen(str)-1){
      sum <<= 1;
    }
  } return sum % HashSize;
}

TempLocMap *IRinitTempLocMap(){
  TempLocMap* table = NEW(TempLocMap);
  memset(table->table, 0, sizeof(table->table));
  return table;
}

/**
 * create new TempNode and put into table
 */
TempNode *IRputTempNode(TempLocMap *t, char *tempName){
  TempNode *newNode = NEW(TempNode);
  newNode->name = Malloc(strlen(name)+1);
  memcpy(newNode->name, name, strlen(name)+1);
  newNode->next = NULLL;
  newNode->graphNodeId = UNUSED_GRAPH_ID;
  newNode->reg = NA; //NA = not assigned

  //find index via hash value
  int hashIndex = IRtemporaryHash(name);

  //insert into table
  TempLocMap **table = t->table;
  if(table[hashIndex] == NULL){
    table[hashIndex] = newNode;
  } else {
    TempNode *temp = table[hashIndex];
    while(temp != NULL){
      if(!strcmp(name,temp->name)){
        //name is already in this table
        fprintf(stderr, "IRputTempNode: Node already in table\n", name);
        free(newNode->name);
        free(newNode);
        return NULL;
      }
      if(temp->next != NULL){//as long as there is a next, check the next one.
        temp = temp->next;
      }
    }
    temp->next = newNode;
  }
  return newNode;
}

TempLocMap* IRsetupTemporaries(bodyListElm *bodyList, SymbolTable *mainSymbolTable){
  //TODO setup map
  //TODO call traverse of declarations
  //TODO possibly traverse statements
}

/**
 * traverse decleration list to find variables
 * and insert into TempNodeMap
 */
int IRtraverseDeclerationList(DECL_LIST *declerations){
  //TODO 
}








/*
 * comfort space for mads
 * just because my editor removes extra white space
 * and I like my whitespace
 *
 */
