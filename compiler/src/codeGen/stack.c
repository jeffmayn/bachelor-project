#include "stack.h"
#include "memory.h"
#include <stdlib.h>
Stack* stackCreate(){
  Stack *stack = NEW(Stack);
  stack->top = NULL;
  return stack;
}

int stackPush(Stack *stack, int id){
  StackNode *next = stack->top;
  stack->top = NEW(StackNode);
  stack->top->id = id;
  stack->top->next = next;
  return stack->top->id;
}

int stackPop(Stack *stack){
  StackNode *top = stack->top;
  if(top == NULL){
    return -1;
  }
  int ret = top->id;
  stack->top = stack->top->next;
  free(top);
  return ret;
}
