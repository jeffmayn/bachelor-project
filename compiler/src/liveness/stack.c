#include "stack.h"
#include "memory.h"
#include <stdlib.h>

/************
 * This file implements stack.h
 * Implements a stack of integers
 ************/

/**
 * Creates and returns a new empty stack
 */
Stack* stackCreate(){
  Stack *stack = NEW(Stack);
  stack->top = NULL;
  return stack;
}

/**
 * Pushes the given integer to the stack
 * Returns the given integer
 */
int stackPush(Stack *stack, int id){
  StackNode *next = stack->top;
  stack->top = NEW(StackNode);
  stack->top->id = id;
  stack->top->next = next;
  return stack->top->id;
}

/**
 * Pops the top of the stack and returns it
 */
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
