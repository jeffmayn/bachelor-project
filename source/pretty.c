#include <stdio.h>
#include <string.h>
#include "pretty.h"

int INDENT = 0;

void indent(){
  int i = 0;
  int space = INDENT * 2;
  for (i = space; i > 0; i--){
    fprintf(stderr,"%s", " ");
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
}

void pHEAD(HEAD *h){
  fflush(stdout);
  fprintf(stderr,"func %s(", h->id);
  pPARDECLLIST(h->pList);
  fprintf(stderr,") : ");
  pTYPE(h->type);
  fprintf(stderr,"\n");
}

void pBODY(BODY *b){
  fflush(stdout);
  pDECLLIST(b->vList);
  pSTMTLIST(b->sList);
}

void pTAIL(TAIL *t){
  fflush(stdout);
  indent();
  fprintf(stderr,"end %s;", t->id);
}

void pTYPE(TYPE *t){
  fflush(stdout);
  switch (t->kind) {
    case idK:
        fprintf(stderr,"%s", t->val.id);
        break;
    case intK:
        fprintf(stderr,"int");
        break;
    case boolK:
        fprintf(stderr,"bool");
        break;
    case arrayK:
        fprintf(stderr,"array of [");
        pTYPE(t->val.arrayType);
        fprintf(stderr,"]");
        break;
    case recordK:
        fprintf(stderr,"record of {\n");
        pVARDECLLIST(t->val.vList);
        fprintf(stderr,"}");
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
    fprintf(stderr,", ");
    pVARDECLLIST(vdl->vList);
  }
}

void pVARTYPE(VAR_TYPE *vt){
  fflush(stdout);
  fprintf(stderr,"%s: ", vt->id);
  pTYPE(vt->type);
}

void pDECLLIST(DECL_LIST *dl){
  fflush(stdout);
  if(dl != NULL){
    if(dl->decl != NULL){
      indent();
      pDECL(dl->decl);
      fprintf(stderr,"\n");
    }
    pDECLLIST(dl->decl_list);
  }
}

void pDECL(DECLARATION *d){
  fflush(stdout);
  switch(d->kind){
    case idDeclK:
      fprintf(stderr,"type %s = ", d->val.id.id);
      pTYPE(d->val.id.type);
      fprintf(stderr,";");
    break;
    case funcK:
      pFUNC(d->val.func);
    break;
    case listK:
      fprintf(stderr,"var ");
      pVARDECLLIST(d->val.list);
      fprintf(stderr,";");
    break;
  }
}

//FØRST TIL MØLLE
void pSTMTLIST(STATEMENT_LIST *sl){
  fflush(stdout);
  pSTMT(sl->statement);
  if(sl->statementList != NULL){
    pSTMTLIST(sl->statementList);
  }
}

void pSTMT(STATEMENT *s){
  fflush(stdout);
  indent();
  switch(s->kind){
    case returnK:
      fprintf(stderr,"return( ");
      pEXP(s->val.return_);
      fprintf(stderr," );");
      break;
    case writeK:
      fprintf(stderr,"write( ");
      pEXP(s->val.write);
      fprintf(stderr," );");
      break;
    case allocateK:
      fprintf(stderr,"allocate( ");
      pVARIABLE(s->val.allocate);
      fprintf(stderr," );");
      break;
    case allocateLengthK:
      fprintf(stderr,"allocate( ");
      pVARIABLE(s->val.allocatelength.var);
      fprintf(stderr," ) of length( ");
      pEXP(s->val.allocatelength.exp);
      fprintf(stderr,");");
      break;
    case assiK:
      fprintf(stderr,"(");
      pVARIABLE(s->val.assign.var);
      fprintf(stderr," = ");
      pEXP(s->val.assign.exp);
      fprintf(stderr,");");
      break;
    case ifK:
      fprintf(stderr,"if( ");
      pEXP(s->val.ifthenelse.cond);
      fprintf(stderr," ) then(\n");
      indent();
      INDENT++;
      pSTMT(s->val.ifthenelse.thenbody);
      INDENT--;
      indent();
      fprintf(stderr,");");
      break;
    case thenK:
      fprintf(stderr,"if( ");
      pEXP(s->val.ifthenelse.cond);
      fprintf(stderr," ) then(\n");
      indent();
      INDENT++;
      pSTMT(s->val.ifthenelse.thenbody);
      INDENT--;
      indent();
      fprintf(stderr,") else (\n");
      INDENT++;
      pSTMT(s->val.ifthenelse.elsebody);
      INDENT--;
      indent();
      fprintf(stderr,");");
      break;
    case whileK:
      fprintf(stderr,"while( ");
      pEXP(s->val.while_.cond);
      fprintf(stderr," ) do ( \n");
      INDENT++;
      pSTMT(s->val.while_.body);
      INDENT--;
      indent();
      fprintf(stderr,");");
      break;
    case listStmtK:
      fprintf(stderr,"{");
      fprintf(stderr,"\n");
      INDENT++;
      pSTMTLIST(s->val.list);
      INDENT--;
      indent();
      fprintf(stderr,"}");
      break;
  }
  fprintf(stderr,"\n");
}


//MADS
void pVARIABLE(VARIABLE *v){
  fflush(stdout);
  switch(v->kind){
    case idVarK:
      fprintf(stderr,"%s", v->val.id);
      break;
    case expK:
      pVARIABLE(v->val.varexp.var);
      fprintf(stderr,"[");
      pEXP(v->val.varexp.exp);
      fprintf(stderr,"]");
      break;
    case dotK:
      pVARIABLE(v->val.vardot.var);
      fprintf(stderr,".");
      fprintf(stderr,"%s", v->val.vardot.id);
      break;
  }
}

void pEXP(EXP *e){
  fflush(stdout);

  switch(e->kind){
    case termK:
      fprintf(stderr,"(");
      pTERM(e->val.term);
      fprintf(stderr,")");
      break;
    default:
      fprintf(stderr,"(");
      pEXP(e->val.binOP.left);

      switch(e->kind){
        case minusK:
          fprintf(stderr," - ");
          break;
        case plusK:
          fprintf(stderr," + ");
          break;
        case timesK:
          fprintf(stderr," * ");
          break;
        case divK:
          fprintf(stderr," / ");
          break;
        case leK:
          fprintf(stderr," <= ");
          break;
        case eqK:
          fprintf(stderr," == ");
          break;
        case geK:
          fprintf(stderr," >= ");
          break;
        case greatK:
          fprintf(stderr," > ");
          break;
        case lessK:
          fprintf(stderr," < ");
          break;
        case neK:
          fprintf(stderr," != ");
          break;
        case andK:
          fprintf(stderr," && ");
          break;
        case orK:
          fprintf(stderr," || ");
          break;

        default:
          break;
      }
      pEXP(e->val.binOP.right);
      fprintf(stderr,")");
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
      fprintf(stderr,"%s(", t->val.idact.id);
      pACTLIST(t->val.idact.list);
      fprintf(stderr,")");
      break;
    case expTermK:
      fprintf(stderr,"(");
      pEXP(t->val.exp);
      fprintf(stderr,")");
      break;
    case notTermK:
      fprintf(stderr,"(");
      fprintf(stderr,"!");
      pTERM(t->val.notTerm);
      fprintf(stderr,")");
      break;
    case expCardK:
      fprintf(stderr,"(");
      fprintf(stderr,"|");
      pEXP(t->val.expCard);
      fprintf(stderr,"|");
      fprintf(stderr,")");
      break;
    case numK:
      fprintf(stderr,"%d", t->val.num);
      break;
    case trueK:
      fprintf(stderr,"true");
      break;
    case falseK:
      fprintf(stderr,"false");
      break;
    case nullK:
      fprintf(stderr,"null");
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
    fprintf(stderr,", ");
    pEXPLIST(el->expList);
  }
}
