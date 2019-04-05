#ifndef __stack_h
#define __stack_h

typedef struct StackNode{
  int id;
  struct StackNode *next;
} StackNode;

typedef struct Stack{
  struct StackNode *top;
} Stack;

Stack* stackCreate();
int stackPush(Stack *stack, int id);
int stackPop(Stack *stack);
#endif
