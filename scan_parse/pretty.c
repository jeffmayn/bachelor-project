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
  printf("(");
  if(pdl == NULL){
    return;
  }
  pVARDECLLIST(pdl->vList);
  printf(")");
}

void pVARDECLLIST(VARDECLLIST *vdl){
  printf("(");
  pVARTYPE(vdl->vType);
  if(vdl->vList != NULL){
    printf(", ");
    pVARDECLLIST(vdl->vLIST);
  }
  printf(")")
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
    case idK:
      printf("type %s = ", d->val.id);
      pTYPE(d->val.type);
    break;
    case funcK:
      pFUNC(d->val.func);
    break;
    case listK:
      printf("var");
      pVARDECLLIST(d->list);
    breaK;
    printf(")");
  }
  INDENT -= 2;
}

//FØRST TIL MØLLE
void pSTMTLIST(STATEMENT_LIST *sl){
  printf("(%s)", sl->statement);
  printf(" (%s)", sl->statementList);
}

void pSTMT(STATEMENT *s){
  switch(s->kind){
    case returnK
      printf("return");
      pEXP(s->return_);
    break;
    case writeK
      printf("write");
      pEXP(s->->write);
    break;
    case allocateK
      printf("allocate")
    break;
    case allocateLengthK

    break;
    case ifK

    break;
    case thenK

    break;
    case whileK

    break;
    case listK

    break;
  }
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
