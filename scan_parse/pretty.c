#include <stdio.h>
#include "pretty.h"

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
  printf("(");
  pHEAD(f->head);
  INDENT += 2;
  pBODY(f->body);
  INDENT -= 2;
  pTAIL(f->tail);
  printf(")");
}

void pHEAD(HEAD *h){
  printf("(");
  printf("%s ", h->id);
  pPARDECLLIST(h->pList);
  printf(":");
  pTYPE(h->type);
  printf(")");
}

void pBODY(BODY *b){
  printf("(");
  pDECLLIST(b->vList);
  printf(" ");
  pSTMTLIST(b->sList);
  printf(")");
}

void pTAIL(TAIL *t){
  printf("(%s)", t->id);
}

void pTYPE(TYPE *t){
  switch (t->kind) {
    case idK:
        printf("(");
        printf("%s", t->val.id);
        printf(")");
        break;
    case intK:
        printf("(");
        printf("int");
        printf(")");
        break;
    case boolK:
        printf("(");
        printf("bool");
        printf(")");
        break;
    case arrayK:
        printf("(");
        printf("array of ");
        pTYPE(t->val.arrayType);
        printf(")");
        break;
    case recordK:
        printf("(");
        printf("%record of ");
        pVARDECLLIST(t->val.vList);
        printf(")");
        break;
  }
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
  printf("(%s)", sl->statement);
  printf(" (%s)", sl->statementList);
}

void pSTMT(STATEMENT *s){

}


//MADS
void pVARIABLE(VARIABLE *v){

}
void pEXP(EXP *e){

}
void pTERM(TERM *t){

}
void pACTLIST(ACT_LIST *al){

}
void pEXPLIST(EXP_LIST *el){

}
