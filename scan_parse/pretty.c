#include <stdio.h>
#include "pretty.h"

int INDENT = 0;
//printf("%*s%s", indent, "", string);


// void prettyEXP(EXP *e){
//     switch (typeof(e)){
//       case FUNCTION*;
//
//       break;
//       case HEAD*:
//
//       break;
//       case BODY*:
//
//       break;
//       case TAIL*:
//
//       break;
//     }
// }

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
  printf("(");
  if(pdl == NULL){
    return;
  }
  pVARDECLLIST(pdl->vList);
  printf(")");
}

void pVARDECLLIST(VAR_DECL_LIST *vdl){
  printf("(");
  pVARTYPE(vdl->vType);
  if(vdl->vList != NULL){
    printf(", ");
    pVARDECLLIST(vdl->vList);
  }
  printf(")");
}

void pVARTYPE(VAR_TYPE *vt){
  printf("(");
  printf("%s : ", vt->id);
  pTYPE(vt->type);
  printf(")");
}

void pDECLLIST(DECL_LIST *dl){
  printf("(");
  pDECL(dl->decl);
  if(dl->decl_list == NULL){
    pDECLLIST(dl->decl_list);
  }
  printf(")");
}

void pDECL(DECLARATION *d){
  INDENT += 2;
  printf("\n%*s", INDENT, "");
  printf("(");
  switch(d->kind){
    case idDeclK:
      printf("type %s = ", d->val.id);
      pTYPE(d->val.type);
    break;
    case funcK:
      pFUNC(d->val.func);
    break;
    case listK:
      printf("var");
      pVARDECLLIST(d->val.list);
    break;
    printf(")");
  }
  INDENT -= 2;
}

//FØRST TIL MØLLE
void pSTMTLIST(STATEMENT_LIST *sl){

}

void pSTMT(STATEMENT *s){
  switch(s->kind){
    case returnK:
      printf("return");
      pEXP(s->val.return_);
      break;
    case writeK:
      printf("write");
      pEXP(s->val.write);
      break;
    case allocateK:
      printf("allocate");
      pVARIABLE(s->val.allocate);
      break;
    case allocateLengthK:
      printf("allocate ");
      pVARIABLE(s->val.allocatelength.var);
      printf(" of length ");
      pEXP(s->allocatelength.exp);
      break;
    case assiK:
      pVARIABLE(s->val.allocatelength.var);
      printf(" = ");
      pEXP(s->val.allocatelength.exp);
      break;
    case ifK:
      printf("if(");
      pEXP(s->val.ifthenelse.cond);
      printf(")\n");
      printf(" then\n");
      pTERM(s->val.ifthenelse.thenbody);
      break;
    case thenK:
      printf("if ");
      pEXP(s->val.ifthenelse.cond);
      printf(")\n");
      printf("then\n");
      pSTMT(s->ifthenelse.thenbody);
      printf("\nelse\n");
      pSTMT(s->val.ifthenelse.elsebody);
      break;
    case whileK:
      printf("while(");
      pEXP(s->val.while_.cond);
      printf(") do\n");
      pTERM(s->val.while_.body);
      break;
    case listStmtK:
      printf("{");
      INDENT += 2;
      pSTMTLIST(s->val.list);
      printf("}");
      break;
  }
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
