#include "../header/symbol.h"
#include "../header/memory.h"
#include "../header/main_test.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void run_tests(){
  //run all tests in here
  test_Hash();
}

void test_Hash(){
  char *input[10] = {"Arnold","kitty","doggy","hamster","dolphin","rhino","spider","falcon","Schwarzenegger","Dio"};
  int known[10] = {155,199,57,207,315,237,54,68,281,276};
  int results[10] = {0,0,0,0,0,0,0,0,0,0};
  for(int i = 0; i < 10; i++){
    results[i] = Hash(input[i]);
  }
  for(int i = 0; i<10; i++){
    if(known[i] != results[i]){
      printf("Test: test_Hash, FAILED at hashing %s", input[i]);
    }
  }

}
