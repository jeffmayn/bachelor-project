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

EXP *makeEXPplus(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = plusK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPtimes(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = timesK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPdiv(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = divK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPeq(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = eqK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPle(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = leK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPge(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = geK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPgreat(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = greatK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPless(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = lessK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPne(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = neK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPand(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = andK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPor(EXP *left, EXP *right){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = orK;
  exp->val.binOP.left = left;
  exp->val.binOP.right = right;
  return exp;
}

EXP *makeEXPterm(TERM *term){
  EXP *exp;
  exp = (EXP*)Malloc(sizeof(exp));
  exp->lineno = lineno;
  exp->kind = termK;
  exp->val.term = term;
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
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = idTermK;
  term->val.idact.id = id;
  term->val.idact.list = list;
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
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = allocateLengthK;
  stm->val.allocatelength.var = var;
  stm->val.allocatelength.exp = exp;

  return stm;
}

STATEMENT *makeSTMif_then(EXP *if_, STATEMENT *then){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = ifK;
  stm->val.ifthenelse.cond = if_;
  stm->val.ifthenelse.thenbody = then;
  stm->val.ifthenelse.elsebody = NULL;
  return stm;
}

STATEMENT *makeSTMif_then_else(EXP *if_, STATEMENT *then, STATEMENT *else_){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = ifK;
  stm->val.ifthenelse.cond = if_;
  stm->val.ifthenelse.thenbody = then;
  stm->val.ifthenelse.elsebody = else_;
  return stm;
}

STATEMENT *makeSTMwhile_do(EXP *while_, STATEMENT *do_){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = whileK;
  stm->val.while_.cond = while_;
  stm->val.while_.body = do_;
  return stm;
}

STATEMENT *makeSTMlist(STATEMENT_LIST *list){
  STATEMENT *stm;
  stm = (STATEMENT*)Malloc(sizeof(stm));
  stm->lineno = lineno;
  stm->kind = listStmtK;
  stm->val.list = list;
  return stm;
}

PAR_DECL_LIST *makePDL(VAR_DECL_LIST *vList){
  PAR_DECL_LIST *pdl;
  pdl = (PAR_DECL_LIST*)Malloc(sizeof(pdl));
  pdl->lineno = lineno;
  pdl->vList = vList;
  return pdl;
}

VAR_DECL_LIST *makeVDL(VAR_TYPE *vType, VAR_DECL_LIST *vList){
  VAR_DECL_LIST *vdl;
  vdl = (VAR_DECL_LIST*)Malloc(sizeof(vdl));
  vdl->lineno = lineno;
  vdl->vType = vType;
  vdl->vList = vList;
  return vdl;
}

VAR_TYPE *makeVAR_TYPE(char *id, TYPE *type){
  VAR_TYPE *vtp;
  vtp = (VAR_TYPE*)Malloc(sizeof(vtp));
  vtp->lineno = lineno;
  vtp->id = id;
  vtp->type = type;
  return vtp;
}

DECLARATION *makeDECLid(char *id, TYPE *type){
  DECLARATION *decl;
  decl = (DECLARATION*)Malloc(sizeof(decl));
  decl->lineno = lineno;
  decl->kind = idDeclK;
  decl->val.id.id = id;
  decl->val.id.type = type;
  return decl;

}
DECLARATION *makeDECLfunc(FUNCTION *func){
  DECLARATION *decl;
  decl = (DECLARATION*)Malloc(sizeof(decl));
  decl->lineno = lineno;
  decl->kind = funcK;
  decl->val.func = func;
  return decl;
}
DECLARATION *makeDECLlist(VAR_DECL_LIST *list){
  DECLARATION *decl;
  decl = (DECLARATION*)Malloc(sizeof(decl));
  decl->lineno = lineno;
  decl->kind = listK;
  decl->val.list = list;
  return decl;
}

DECL_LIST *makeDECL_LIST(DECLARATION *decl, DECL_LIST *decl_list){
  DECL_LIST *list;
  list = (DECL_LIST*)Malloc(sizeof(list));
  list->lineno = lineno;
  list->decl = decl;
  list->decl_list = decl_list;
  return list;
}

TERM *makeTERMnull(){
  TERM *term;
  term = (TERM*)Malloc(sizeof(term));
  term->lineno = lineno;
  term->kind = nullK;
  term->val.null = NULL;
  return term;
}

ACT_LIST *makeACT_LIST(EXP_LIST *list){
  ACT_LIST *act;
  act = (ACT_LIST*)Malloc(sizeof(act));
  act->lineno = lineno;
  act->expList = list;
  return act;
}
EXP_LIST *makeEXP_LIST(EXP *exp, EXP_LIST *list){
  EXP_LIST *new;
  new = (EXP_LIST*)Malloc(sizeof(new));
  new->lineno = lineno;
  new->expList = list;
  new->exp = exp;
  return new;
}

STATEMENT *makeSTMassign(VARIABLE *var, EXP *exp){
  STATEMENT *ass; // sorry :-P
  ass = (STATEMENT*)Malloc(sizeof(ass));
  ass->lineno = lineno;
  ass->kind = assiK; // måske ændre navnet i vores typedef struct?
  ass->val.assign.var = var;
  ass->val.assign.exp = exp;
  return ass;
}

STATEMENT_LIST *makeSTM_LISTstmtlist(STATEMENT *stmt, STATEMENT_LIST *list){
  STATEMENT_LIST *stml;
  stml = (STATEMENT_LIST*)Malloc(sizeof(stml));
  stml->lineno = lineno;
  stml->statement = stmt;
  stml->statementList = list;
  return stml;
}
VARIABLE *makeVARIABLEid(char *id){
  VARIABLE *varId;
  varId = (VARIABLE*)Malloc(sizeof(varId));
  varId->lineno = lineno;
  varId->val.id = id;
  return varId;
}
VARIABLE *makeVARIABLEexp(VARIABLE *var, EXP *exp){
  VARIABLE *varExp;
  varExp = (VARIABLE*)Malloc(sizeof(varExp));
  varExp->lineno = lineno;
  varExp->val.var = var;
  varExp->val.exp = exp;
  return varExp;
}
VARIABLE *makeVARIABLEdot(char *id, VARIABLE *var){
  VARIABLE *varDot;
  varDot = (VARIABLE*)Malloc(sizeof(varDot));
  varDot->lineno = lineno;
  varDot->val.id = id;
  varDot->val.var = var;
  return varDot;
}
