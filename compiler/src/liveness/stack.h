#ifndef __stack_h
#define __stack_h



typedef struct StackNode{
  int id;
  struct StackNode *next;
} StackNode;

typedef struct Stack{
  struct StackNode *top;
} Stack;

/**
 * Creates and returns a new empty stack
 */
Stack* stackCreate();

/**
 * Pushes the given integer to the stack
 * Returns the given integer
 */
int stackPush(Stack *stack, int id);

/**
 * Pops the top of the stack and returns it
 */
int stackPop(Stack *stack);
#endif
