#include "memory.h"
#include "tree.h"
#include <stdio.h>
#include <stdlib.h>

extern int lineno;

FUNCTION *makeFUNCTION(struct HEAD *head, struct BODY *body, struct TAIL *tail){
  FUNCTION *function;
  function = (FUNCTION*)Malloc(sizeof(function));
  function->lineno = lineno;
  function->head = head;
  function->body = body;
  function->tail = tail;
  return function;
}

HEAD *makeHEAD(char *id, struct PAR_DECL_LIST *pList, struct TYPE *type){
  HEAD *head;
  head = (HEAD*)Malloc(sizeof(head));
  head->lineno = lineno;
  head->id = id;
  head->pList = pList;
  head->type = type;
  return head;
}

BODY *makeBODY(struct VAR_DECL_LIST *vList, struct STATEMENT_LIST *sList){
  BODY *body;
  body = (BODY*)Malloc(sizeof(body));
  body->lineno = lineno;
  body->vList = vList;
  body->sList = sList;
  return body;
}

TAIL *makeTAIL(char *id){
  TAIL *tail;
  tail = (TAIL*)Malloc(sizeof(tail));
  tail->lineno = lineno;
  tail->id = id;
  return tail;
}

TYPE *makeID(char *id){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = idK;
  type->val.id = id;
  return type;
}

TYPE *makeINT(int *integer){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = intK;
  type->val.integer = integer;
  return type;
}

TYPE *makeBOOL(bool *bool){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = boolK;
  type->val.bool = bool;
  return type;
}

TYPE *makeARRAY(TYPE *typo){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = arrayK;
  type->val.arrayE.typo = typo;
  return type;
}

TYPE *makeRECORD(VAR_DECL_LIST *vList){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = recordK;
  type->val.recordE.vList;
  return type;
}

EXPRESSION *makeEXPid(char *id)
{ EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = idK;
  expression->val.idE = id;
  return expression;
}

EXPRESSION *makeEXPintconst(int intconst)
{ EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = intconstK;
  expression->val.intconstE = intconst;
  return expression;
}

EXPRESSION *makeEXPtimes(EXPRESSION *left, EXPRESSION *right)
{ EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = timesK;
  expression->val.timesE.left = left;
  expression->val.timesE.right = right;
  return expression;
}

EXPRESSION *makeEXPdiv(EXPRESSION *left, EXPRESSION *right)
{ EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = divK;
  expression->val.divE.left = left;
  expression->val.divE.right = right;
  return expression;
}

EXPRESSION *makeEXPplus(EXPRESSION *left, EXPRESSION *right)
{
  printf("makeEXPplus\n");
  EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = plusK;
  expression->val.plusE.left = left;
  expression->val.plusE.right = right;
  return expression;
}

EXPRESSION *makeEXPminus(EXPRESSION *left, EXPRESSION *right)
{ EXPRESSION *expression;
  expression = (EXPRESSION*)Malloc(sizeof(expression));
  expression->lineno = lineno;
  expression->kind = minusK;
  expression->val.minusE.left = left;
  expression->val.minusE.right = right;
  return expression;
}
