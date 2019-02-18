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

BODY *makeBODY( DECL_LIST *vList, STATEMENT_LIST *sList){
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

TYPE *makeINT(){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = intK;
  //type->val.integer = integer;
  return type;
}

TYPE *makeBOOL(){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = boolK;
  //type->val.bool = bool;
  return type;
}

TYPE *makeARRAY(TYPE *typo){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = arrayK;
  type->val.arrayType = typo;
  return type;
}

TYPE *makeRECORD(VAR_DECL_LIST *vList){
  TYPE *type;
  type = (TYPE*)Malloc(sizeof(type));
  type->lineno = lineno;
  type->kind = recordK;
  type->val.vList = vList;
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

EXP *makeEXPterm(TERM *term){
    //TODO term stuff
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = termK;
  return exp;
}

TERM *makeTERMvar(VARIABLE *var){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = varK;
  term->val.var = var;
  return term;
}

TERM *makeTERMact_list(char * id, ACT_LIST *list){
    //TODO possibly stuff
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = idTermK;
  term->val.id = list;
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

TERM *makeTERMnum(int num){
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

STATEMENT *makeSTMreturn(EXP *return_){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = returnK;
  stm->val.return_ = return_;
  return stm;
}

STATEMENT *makeSTMwrite(EXP *write){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = writeK;
  stm->val.write = write;
  return stm;
}

STATEMENT *makeSTMallocate(VARIABLE *allocate){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = allocateK;
  stm->val.allocate = allocate;
  return stm;
}

STATEMENT *makeSTMallocateLength(VARIABLE *var, EXP *exp){
    //TODO do stuff with exp
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = allocateLengthK;
  stm->val.allocateLength = var;
  return stm;
}

STATEMENT *makeSTMif_then(EXP *if_, STATEMENT *then){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = ifK;
  stm->val.if_ = if_;
  stm->val.then = then;
  return stm;
}

STATEMENT *makeSTMif_then_else(EXP *if_, STATEMENT *then, STATEMENT *else_){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = ifK;
  stm->val.if_ = if_;
  stm->val.then = then;
  stm->val.else_ = else_;
  return stm;
}

STATEMENT *makeSTMwhile_do(EXP *while_, STATEMENT *do_){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = whileK;
  stm->val.while_ = while_;
  stm->val.do_ = do_;
  return stm;
}

STATEMENT *makeSTMlist(STATEMENT_LIST *list){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = listK;
  stm->val.list = list;
  return stm;
}
