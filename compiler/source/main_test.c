#include "../header/symbol.h"
#include "../header/memory.h"
#include "../header/main_test.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
  if(result == 0){
  printf("Test: %s: %s\n", "testname", "PASS!");
} else {
  printf("Test: %s: %s\n", "testname", "FAIL!");
}
*/

void run_tests(){
  int result = 123;
  //run all tests in here
  result = test_Hash();
  if(result == 0){
    printf("Test: %s: %s\n", "test_Hash", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_Hash", "FAIL!");
  }

  result = test_putSymbol();
  if(result == 0){
    printf("Test: %s: %s\n", "test_putSymbol", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_putSymbol", "FAIL!");
  }

  result = test_getSymbol();
  if(result == 0){
    printf("Test: %s: %s\n", "test_getSymbol", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_getSymbol", "FAIL!");
  }

  result = test_scopeSymbolTable();
  if(result == 0){
    printf("Test: %s: %s\n", "test_scopeSymbolTable", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_scopeSymbolTable", "FAIL!");
  }

  result = test_doublePutSymbol();
  if(result == 0){
    printf("Test: %s: %s\n", "test_doublePutSymbol", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_doublePutSymbol", "FAIL!");
  }

  result = test_doubleScopeSymbolTable();
  if(result == 0){
    printf("Test: %s: %s\n", "test_doubleScopeSymbolTable", "PASS!");
  } else {
    printf("Test: %s: %s\n", "test_doubleScopeSymbolTable", "FAIL!");
  }

}

/**
 * test hash function on known strings and their respective hash values
 */
int test_Hash(){
  char *input[10] = {"Arnold","kitty","doggy","hamster","dolphin","rhino",
                    "spider","falcon","Schwarzenegger","Dio"};
  int known[10] = {155,199,57,207,315,237,54,68,281,276};
  int results[10] = {0,0,0,0,0,0,0,0,0,0};
  int mistakes = 0;
  for(int i = 0; i < 10; i++){
    results[i] = Hash(input[i]);
  }
  for(int i = 0; i<10; i++){
    if(known[i] != results[i]){
      printf("Test: test_Hash, FAILED at hashing %s", input[i]);
      mistakes++;
    }
  }
  return mistakes;
}

/**
 * put a name and a value into a table check the SYMBOL
 */
int test_putSymbol(){
  int mistakes = 123;
  SymbolTable *table = initSymbolTable();

  SYMBOL *newSym = putSymbol(table, "kitty", 199);

  if((newSym != NULL) && (!strcmp(newSym->name, "kitty")) && (newSym->value == 199)){
    mistakes = 0;
  } else {
    printf("failed: %s, %d\n",newSym->name, newSym->value);
  }

  return mistakes;
}

/**
 * insert a name and value in a table and
 * test if it is retrievable
 */
int test_getSymbol(){
  int mistakes = 123;
  SymbolTable *table = initSymbolTable();
  putSymbol(table, "kitty", 199);
  SYMBOL *retrieved = getSymbol(table, "kitty");
  if(retrieved == NULL){
    printf("failed: getsymbol null pointer\n");
  }
  if((retrieved != NULL) && (!strcmp(retrieved->name, "kitty")) && (retrieved->value == 199)){
    mistakes = 0;
  } else {
    printf("failed: getSymbol\n");
  }

  return mistakes;
}

/**
 * create a table and scope a new table,
 * insert two different symbols into the
 * two tables and show that both are reachable from the childtable
 */
int test_scopeSymbolTable(){
  int mistakes = 123;
  SymbolTable *t = initSymbolTable();
  SymbolTable *childTable = scopeSymbolTable(t);

  putSymbol(t, "kitty", 199);
  putSymbol(childTable, "Arnold", 155);

  SYMBOL **table = childTable->table;
/*
  for(int i = 0; i < HashSize; i++){
    if(table[i]){
      SYMBOL *elm = table[i];
      printf("%s: %d\n",elm->name, elm->value);
      elm = elm->next;
      while(elm){
        printf("%s: %d\n",elm->name, elm->value);
        elm = elm->next;
      }
      printf("\n");
    }
  }
*/
  SYMBOL *retrieved = getSymbol(childTable, "kitty");
  SYMBOL *retrieved2 = getSymbol(childTable, "Arnold");

  if(!retrieved){
    printf("failed: getsymbol null pointer\n");
  }
  if((retrieved && retrieved2) && ((!strcmp(retrieved->name, "kitty")) && (retrieved->value == 199))\
                               && ((!strcmp(retrieved2->name, "Arnold")) && (retrieved2->value == 155))) {
    mistakes = 0;
  } else {
  }
  return mistakes;
}

/**
 * put the same name twice into the same table, it should not be
 * possible
 */
int test_doublePutSymbol(){
  int mistakes = 123;
  SymbolTable *t = initSymbolTable();

  // create first 'kitty' symbol and insert
  putSymbol(t, "kitty", 199);

  // create second 'kitty' symbol
  SYMBOL *newSym = Malloc(sizeof(SYMBOL));
  newSym->value = 199;
  newSym->name = Malloc(strlen("kitty")+1);
  memcpy(newSym->name, "kitty", strlen("kitty")+1);
  newSym->next = NULL;

  int hashIndex = Hash("kitty");

  SYMBOL **table = t->table;
  if(table[hashIndex] == NULL){
    // no symbol 'kitty' exist
    table[hashIndex] = newSym;
    mistakes = 0;
  } else {
    // 'kitty' symbol already exists
    SYMBOL *temp = table[hashIndex];
    if(!strcmp("kitty",temp->name)){
      mistakes = -1;
    }
  }
  return mistakes;
}

/**
 * create table and scope a new table onto it
 * put the same symbol into both tables
 * this should be allowed
 */
int test_doubleScopeSymbolTable(){
  int mistakes = 123;
  SymbolTable *t = initSymbolTable();
  SymbolTable *childTable = scopeSymbolTable(t);

  putSymbol(t, "kitty", 199);
  putSymbol(childTable, "kitty", 199);

  SYMBOL **table = childTable->table;

  SYMBOL *retrieved = getSymbol(t, "kitty");
  SYMBOL *retrieved2 = getSymbol(childTable, "kitty");

  if((retrieved && retrieved2) && ((!strcmp(retrieved->name, "kitty")))\
                               && ((!strcmp(retrieved2->name, "kitty")))){
    mistakes = 0;
  } else {
    printf("failed: getSymbol\n");
  }

  return mistakes;

}
