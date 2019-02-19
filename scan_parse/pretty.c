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
    case idK;
      printf("%s", v->val.id);
      //printf("%*s%s", INDENT, "", v->val.id);
      break;
    case expK;
      //call print var print brackets call print exp
      pVARIABLE(v->val.varexp.var);
      printf("[ ");
      pEXP(v->val.varexp.exp);
      printf(" ]");
      break;
    case dotK;
      //call print var print dot print id
      pVARIABLE(v->val.vardot.var);
      printf(".");
      pVARIABLE(v->val.vardot.id);
      break;
  }
  printf(")");
}

void pEXP(EXP *e){

}

void pTERM(TERM *t){

}

void pACTLIST(ACT_LIST *al){

}

void pEXPLIST(EXP_LIST *el){

}
