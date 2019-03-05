#include <stdio.h>
#include <string.h>
#include "pretty.h"

int INDENT = 0;

void indent(){
  int i = 0;
  int space = INDENT * 2;
  for (i = space; i > 0; i--){
    printf("%s", " ");
    }
  }

//JEFF
void pFUNC(FUNCTION *f){
  fflush(stdout);
  pHEAD(f->head);
  INDENT++;
  pBODY(f->body);
  INDENT--;
  pTAIL(f->tail);
  //printf("\n");
}

void pHEAD(HEAD *h){
  fflush(stdout);
  //indent();
  printf("func %s(", h->id);
  pPARDECLLIST(h->pList);
  printf("):");
  pTYPE(h->type);
  printf("\n");
}

void pBODY(BODY *b){
  fflush(stdout);
  pDECLLIST(b->vList);
  pSTMTLIST(b->sList);
  //printf("\n");
}

void pTAIL(TAIL *t){
  fflush(stdout);
  //printf("\n");
  indent();
  printf("end %s", t->id);
  //printf("\n");
}

void pTYPE(TYPE *t){
  fflush(stdout);
  switch (t->kind) {
    case idK:
        printf("%s", t->val.id);
        break;
    case intK:
        printf("int");
        break;
    case boolK:
        printf("bool");
        break;
    case arrayK:
        printf("array of [");
        pTYPE(t->val.arrayType);
        printf("]");
        break;
    case recordK:
        printf("record of {");
        pVARDECLLIST(t->val.vList);
        printf("}");
        break;
  }
}

//ANDREAS
void pPARDECLLIST(PAR_DECL_LIST *pdl){
  fflush(stdout);
  if(pdl == NULL){
    return;
  }
  if(pdl->vList != NULL){
    pVARDECLLIST(pdl->vList);
  }
}

void pVARDECLLIST(VAR_DECL_LIST *vdl){
  fflush(stdout);
  pVARTYPE(vdl->vType);
  if(vdl->vList != NULL){
    printf(", ");
    pVARDECLLIST(vdl->vList);
  }
}

void pVARTYPE(VAR_TYPE *vt){
  fflush(stdout);
  printf("%s: ", vt->id);
  pTYPE(vt->type);
}

void pDECLLIST(DECL_LIST *dl){
  fflush(stdout);
  if(dl != NULL){
    if(dl->decl != NULL){
      indent();
      pDECL(dl->decl);
      printf("\n");
    }
    pDECLLIST(dl->decl_list);
  }
}

void pDECL(DECLARATION *d){
  fflush(stdout);
  switch(d->kind){
    case idDeclK:
      printf("type %s = ", d->val.id.id);
      pTYPE(d->val.id.type);
    break;
    case funcK:
      pFUNC(d->val.func);
    break;
    case listK:
      printf("var ");
      pVARDECLLIST(d->val.list);
    break;
  }
}

//FØRST TIL MØLLE
void pSTMTLIST(STATEMENT_LIST *sl){
  fflush(stdout);
  pSTMT(sl->statement);
  if(sl->statementList != NULL){
    //printf("\n");
    pSTMTLIST(sl->statementList);
  }
}

void pSTMT(STATEMENT *s){
  fflush(stdout);
  indent();
  switch(s->kind){
    case returnK:
      //indent();
      printf("return ");
      pEXP(s->val.return_);
      break;
    case writeK:
      printf("write ");
      pEXP(s->val.write);
      break;
    case allocateK:
      printf("allocate ");
      pVARIABLE(s->val.allocate);
      break;
    case allocateLengthK:
      printf("allocate ");
      pVARIABLE(s->val.allocatelength.var);
      printf("of length ");
      pEXP(s->val.allocatelength.exp);
      break;
    case assiK:
      pVARIABLE(s->val.allocatelength.var);
      printf(" = ");
      pEXP(s->val.allocatelength.exp);
      break;
    case ifK:
      printf("if ");
      pEXP(s->val.ifthenelse.cond);
      printf("\n");
      indent();
      printf("then (\n");
      //indent();
      INDENT++;
      pSTMT(s->val.ifthenelse.thenbody);
      INDENT--;
      indent();
      printf(")");
      break;
    case thenK:
      printf("if ");
      pEXP(s->val.ifthenelse.cond);
      printf("\n");
      indent();
      printf("then (\n");
      INDENT++;
      pSTMT(s->val.ifthenelse.thenbody);
      INDENT--;
      indent();
      printf(")\n");
      indent();
      printf("else (\n");
      INDENT++;
      pSTMT(s->val.ifthenelse.elsebody);
      INDENT--;
      indent();
      printf(")");
      break;
    case whileK:
      printf("while ");
      pEXP(s->val.while_.cond);
      printf("\n");
      indent();
      printf("do (\n");
      INDENT++;
      pSTMT(s->val.while_.body);
      INDENT--;
      indent();
      printf(")");
      break;
    case listStmtK:
      printf("{");
      printf("\n");
      INDENT++;
      //indent();
      pSTMTLIST(s->val.list);
      INDENT--;
      indent();
      printf("}");
      //printf("\n");
      break;
  }
  printf("\n");
}


//MADS
void pVARIABLE(VARIABLE *v){
  fflush(stdout);
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
}

void pEXP(EXP *e){
  fflush(stdout);

  switch(e->kind){
    case termK:
      pTERM(e->val.term);
      break;
    default:
      printf("(");
      pEXP(e->val.binOP.left);

      switch(e->kind){
        case minusK:
          printf(" - ");
          break;
        case plusK:
          printf(" + ");
          break;
        case timesK:
          printf(" * ");
          break;
        case divK:
          printf(" / ");
          break;
        case leK:
          printf(" <= ");
          break;
        case eqK:
          printf(" == ");
          break;
        case geK:
          printf(" >= ");
          break;
        case greatK:
          printf(" > ");
          break;
        case lessK:
          printf(" < ");
          break;
        case neK:
          printf(" != ");
          break;
        case andK:
          printf(" && ");
          break;
        case orK:
          printf(" || ");
          break;

        default:
          break;
      }
      pEXP(e->val.binOP.right);
      printf(")");
      break;
  }

}

void pTERM(TERM *t){
  fflush(stdout);
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
}

void pACTLIST(ACT_LIST *al){
  fflush(stdout);
  if(al->expList != NULL){
    pEXPLIST(al->expList);
  }
}

void pEXPLIST(EXP_LIST *el){
  fflush(stdout);
  pEXP(el->exp);
  if(el->expList != NULL){
    printf(", ");
    pEXPLIST(el->expList);
  }
}