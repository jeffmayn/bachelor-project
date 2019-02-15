#include "memory.h"
#include "tree.h"
#include <stdio.h>

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

EXP *makeEXPminus(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = minusK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPplusK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = plusK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPtimesK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = timesK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPdivK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = divK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPeqK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = eqK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPleK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = leK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPgeK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = geK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPgreatK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = greatK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPlessK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = lessK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPneK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = neK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPandK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = andK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPorK(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = orK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPterm(EXP *term){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = termK;
  return exp;
}

TERM *makeTERMvar(char *var){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = varK;
  term->val.var = var;
  return term;
}

TERM *makeTERMact_list(ACT_LIST *id){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = idTermK;
  term->val.id = id;
  return term;
}

TERM *makeTERMexp(EXP *exp){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = expK;
  term->val.exp = exp;
  return term;
}

TERM *makeTERMnotTerm(TERM *notTerm){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = notTermK;
  term->val.notTerm = notTerm;
  return term;
}

TERM *makeTERMexpCard(EXP *expCard){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = expCardK;
  term->val.expCard = expCard;
  return term;
}

TERM *makeTERMnum(int *num){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = numK;
  term->val.num = num;
  return term;
}

TERM *makeTERMtrue(bool *trueE){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = trueK;
  term->val.true = trueE;
  return term;
}

TERM *makeTERMfalse(bool *falseE){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = falseK;
  term->val.false = falseE;
  return term;
}
