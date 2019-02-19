#include <stdio.h>
#include "pretty.h"

int INDENT = 0;

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
  printf("body(\n");
  printf("%p\n", b->vList);
  pDECLLIST(b->vList);
  printf(" body");
  pSTMTLIST(b->sList);
  printf(")\n");
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
        printf("record of ");
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
  printf("(pdecllist\n");
  if(dl != NULL){
    printf("Am %p\n", dl);
    if(dl->decl != NULL){
      printf("Am i inside hereeeeeeeeeeeeeeeeeeeeeeeeee?!?!?\n");
      pDECL(dl->decl);
    }
    printf("Am i inside her?!?!?\n");
    pDECLLIST(dl->decl_list);
  }
  printf(")\n");
}

void pDECL(DECLARATION *d){
  INDENT += 2;
  printf("(pdecl\n");
  printf("\n%*s", INDENT, "");
  printf("(");
  switch(d->kind){
    case idDeclK:
      printf("type %s = ", d->val.id.id);
      pTYPE(d->val.id.type);
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
  printf("(");
  pSTMT(sl->statement);
  if(sl->statementList != NULL){
    printf(" ");
    pSTMTLIST(sl->statementList);
  }
  printf(")");
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
      pEXP(s->val.allocatelength.exp);
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
      pSTMT(s->val.ifthenelse.thenbody);
      break;
    case thenK:
      printf("if ");
      pEXP(s->val.ifthenelse.cond);
      printf(")\n");
      printf("then\n");
      pSTMT(s->val.ifthenelse.thenbody);
      printf("\nelse\n");
      pSTMT(s->val.ifthenelse.elsebody);
      break;
    case whileK:
      printf("while(");
      pEXP(s->val.while_.cond);
      printf(") do\n");
      pSTMT(s->val.while_.body);
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
  printf("(");
  switch(v->kind){
    case idVarK:
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
      printf("%s", v->val.vardot.id);
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
      pEXP(e->val.binOP.left);
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
        default:
          break;
      }
      pEXP(e->val.binOP.right);
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
      printf("%s(", t->val.idact.id);
      pACTLIST(t->val.idact.list);
      printf(")");
      break;
    case expTermK:
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
