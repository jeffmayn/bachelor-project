#include "memory.h"
#include "tree.h"

extern int lineno;

FUNCTION *makeFUNCTION(struct head *head, struct body *body, struct tail *tail){
  FUNCTION *function;
  function = NEW(FUNCTION);
  function->lineno = lineno;
  function->head = head;
  function->body = body;
  function->tail = tail;
  return function;
}

HEAD *makeHEAD(char *id, struct PAR_DECL_LIST *pList, struct TYPE *type){
  HEAD *head;
  head = NEW(HEAD);
  head->lineno = lineno;
  head->id = id;
  head->PAR_DECL_LIST = pList;
  head->TYPE = type;
  return head;
}

BODY *makeBODY(struct VAR_DECL_LIST *vList, struct STATEMENT_LIST *sList){
  BODY *body;
  body = NEW(BODY);
  body->lineno = lineno;
  body->VAR_DECL_LIST = vList;
  body->STATEMENT_LIST = sList;
  return body;
}

TAIL *makeTAIL(char *id){
  TAIL *tail;
  tail = NEW(TAIL);
  tail->lineno = lineno;
  tail->id = id;
  return tail;
}

TYPE *makeID(char *id){
  TYPE *type;
  type = NEW(TYPE);
  type->lineno = lineno;
  type->kind = idK;
  type->idE = id;
  return type;
}

TYPE *makeINT(int *Int){
//TODO
}

TYPE *makeBOOL(bool *Bool){
//TODO
}

TYPE *makeARRAY(TYPE *type){
  TYPE *type;
  type = NEW(TYPE);
  type->lineno = lineno;
  type->kind = arrayK;
  type->val.arrayE.type = type;
  return type;
}

TYPE *makeRECORD(VAR_DECL_LIST *vList){
//TODO
}
