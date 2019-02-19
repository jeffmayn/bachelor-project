#include <stdio.h>
#include "pretty.h"

int INDENT = 0;
//printf("%*s%s", INDENT, "", string);

void prettyEXP(EXP *e){
    switch (typeof(e)){
      case FUNCTION*;

      break;
      case HEAD*:

      break;
      case BODY*:

      break;
      case TAIL*:

      break;
    }
}

//JEFF
void pFUNC(FUNCTION *f){

}
void pHEAD(HEAD *h){

}
void pBODY(BODY *b){

}
void pTAIL(TAIL *t){

}
void pTYPE(TYPE *t){

}
//ANDREAS
void pPARDECLLIST(PAR_DECL_LIST *pdl){

}
void pVARDECLLIST(VARDECLLIST *vdl){

}
void pVARTYPE(VAR_TYPE *vt){

}
void pDECLLIST(DECL_LIST *dl){

}
void pDECL(DECLARATION *d){

}

//FØRST TIL MØLLE
void pSTMTLIST(STATEMENT_LIST *sl){

}
void pSTMT(STATEMENT *s){

}


//MADS
void pVARIABLE(VARIABLE *v){
  printf("(");
  switch(v->kind){
    case idK:
      printf("%s", v->val.id);
      //printf("%*s%s", INDENT, "", v->val.id);
      break;
    case expK:
      //call print var print brackets call print exp
      pVARIABLE(v->val.varexp.var);
      printf("[");
      pEXP(v->val.varexp.exp);
      printf("]");
      break;
    case dotK:
      //call print var print dot print id
      pVARIABLE(v->val.vardot.var);
      printf(".");
      pVARIABLE(v->val.vardot.id);
      break;
  }
  printf(")");
}

void pEXP(EXP *e){
  printf("(");
  switch(e->kind){
    case termK:
      pTERM(e->val.term);
      break;
    default:
      pEXP(e->binOP.left);
      switch(e->kind){
        case minusK:
          printf("-");
          break;
        case plusK:
          printf("+");
          break;
        case timesK:
          printf("*");
          break;
        case divK:
          printf("/");
          break;
        case leK:
          printf("<=");
          break;
        case eqK:
          printf("==");
          break;
        case geK:
          printf(">=");
          break;
        case greatK:
          printf(">");
          break;
        case lessK:
          printf("<");
          break;
        case neK:
          printf("!=");
          break;
        case andK:
          printf("&&");
          break;
        case orK:
          printf("||");
          break;
      }
      pEXP(e->binOP.right);
      break;
  }
  printf(")");
}

void pTERM(TERM *t){
  printf("(");
  switch(t->kind){
    case varK:
      pVARIABLE(t->val.var);
      break;
    case idTermK:
      printf("%s(", t->idact.id);
      pACTLIST(t->idact.list);
      printf(")");
      break;
    case expK:
      printf("(");
      pEXP(t->val.exp);
      printf(")");
      break;
    case notTermK:
      printf("!");
      pTERM(t->val.notTerm);
      break;
    case expCardK:
      printf("|");
      pEXP(t->val.expCard);
      printf("|");
      break;
    case numK:
      printf("%d", t->val.num);
      break;
    case trueK:
      printf("true");
      break;
    case falseK:
      printf("false");
      break;
    case nullK:
      printf("null");
      break;
  }
  printf(")");
}

void pACTLIST(ACT_LIST *al){
  printf("(");
  if(al->expList == NULL){
    printf("empty");
  } else {
    pEXPLIST(al->expList);
  }
  printf(")");
}

void pEXPLIST(EXP_LIST *el){
  printf("(");
  pEXP(el->exp);
  if(el->expList == NULL){
    printf("empty");
  } else {
    pEXPLIST(el->expList);
  }
  printf(")");
}
