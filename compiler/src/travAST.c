#include "internalASM.h"
#include "memory.h"
#include "symbol.c"

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

TempNode *IRputTempNode(char *tempName){
  TempNode *newNode = NEW(TempNode);
  newNode->name = Malloc(strlen(name)+1);
  memcpy(newNode->name, name, strlen(name)+1);
  newNode->next = NULLL;
  newNode->graphNodeId = UNUSED_GRAPH_ID;
  newNode->reg = NA; //Gætter på NA betyder NOT ASSIGNED;
}









/*
 * comfort space for mads
 * just because my editor removes extra white space
 * and I like my whitespace
 *
 */
