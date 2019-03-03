#include "tree.h"
#include "typecheck.h"
#include "symbol.h"
/*#include "symbol.c" //virker ikke uden //virker ikke med!*/
#include <stdlib.h>
#include <stdio.h>

extern BODY *theexpression;
extern SymbolTable *childScopeForDebugging;

/**
  Finds the types of all declared types

  måske denne skal returnere symboltabellen
  Eller skal den være global
  Nej, den må hellere være lokal i de rekursive funktioner, så vi kan bestemme roden
*/
SymbolTable* idTypeFinder(){
  SymbolTable *table = initSymbolTable();
  idFinderRec(table, theexpression);
  return table;
}

/**
 t is the root of the current scope
*/
void idFinderRec(SymbolTable *t, BODY *body){
  printf("idFinderRec\n");
  travDecls(t,body->vList);
}

void travDecls(SymbolTable *t, DECL_LIST *decls){
  if(decls == NULL){
    return;
  }
  //TODO things
  DECLARATION *d = decls->decl;
  if(d == NULL){
    printf("null\n");
    return;
  }
  printf("id of kind %d found in travDecls\n", d->kind);
  switch (d->kind) {
    case listK:
      travVDecls(t, d->val.list);
    break;
    case funcK:
      ; //empty statement
      //^labels may only be followed by statments, and declarations are not statements
      //create new scope
      SymbolTable *child = scopeSymbolTable(t);
      childScopeForDebugging = child;
      //add function to current scope
      putSymbol(t, d->val.func->head->id, 0, func, d->val.func->head->type->kind, child); //add some shit for named types, records and arrays
      //add parametrs to that scope
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        VAR_DECL_LIST *vList = pList->vList;
        printf("vList %p\n", (void*) vList);
        if(vList != NULL){
          while(vList != NULL){
            printf("about to put params for %s\n", d->val.func->head->id);
            putParam(child, vList->vType->id, 0, var, vList->vType->type->kind); //can a parameter be anything different from a variable (func or type)
            vList = vList->vList;
          }
        }
      }

      //I may use travVDecls instead of using this while loop
      //NO because its putParam and not Symbol, which is used.
      //segmentation fault right here/below (When there is no parameters) *********************************************************************************************************
      //Solved by if above

      //recursively call idFinderRec on body of function
      idFinderRec(child,d->val.func->body);
    break;
    case idDeclK:
      printf("%s of type %d put into SymbolTable\n", d->val.id.id, d->val.id.type->kind);
      putSymbol(t, d->val.id.id, 0, type, d->val.id.type->kind, NULL);
    break;
  }

  travDecls(t, decls->decl_list);

}

void travVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls){
  if(vDecls == NULL){
    return;
  }
  //TODO: may be done
  VAR_TYPE *vty = vDecls->vType;
  printf("%s of type %d put into SymbolTable\n", vty->id, vty->type->kind);
  putSymbol(t, vty->id, 0, var, vty->type->kind, NULL); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  travVDecls(t, vDecls->vList);
}





/**
 * Finds the types of expressions
*/
void expTypeFinder(){
  expFinderRec(table,  theexpression);
}

void expFinderRec(SymbolTable *t,  BODY *body){
  travStmt(SymbolTable *t, body->sList);
}

void travStmts(SymbolTable *t, STATEMENT_LIST *sList){
  expTypeTravStmt(t, sList->statement);
  if(sList->statementList != NULL){
    travStmts(t, sList->statementList);
  }
}

void expTypeTravStmt(SymbolTable *t, STATEMENT *s){
  switch(s->kind){
    case returnK:
      expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      printf("expTypeTravStmt allocateK not implemented\n");
      break;
    case allocateLengthK:
      printf("expTypeTravStmt allocateLengthK not implemented\n");
      break;
    case assiK:
      expTypeTravExp(t, s->val.allocatelength.exp);
      //Kunne i teorien tjekke typer her
      break;
    case ifK:
      expTypeTravExp(t, s->val.ifthenelse.cond);
      expTypeTravStmt(t, s->val.ifthenelse.thenbody);
      break;
    case thenK:
      expTypeTravExp(t, s->val.ifthenelse.cond);
      expTypeTravStmt(t, s->val.ifthenelse.thenbody);
      expTypeTravStmt(t, s->val.ifthenelse.elsebody);
      break;
    case whileK:
      expTypeTravExp(t, s->val.while_.cond);
      expTypeTravStmt(t, s->val.while_.body);
      break;
    case listStmtK:
      travStmts(t, s->val.list)
      break;
  }
  printf("\n");
}

int expTypeTravExp(SymbolTable *t, EXP *exp){
  //error cheking needed from recursive calls
  switch(exp->kind){
    case termK:
      exp->type = expTypeTravTerm(t, exp->val.term);
    default:
      int type1 = expTypeTravExp(t, exp->val.binOP.left);
      int type2 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type1 == type2){
        exp->type = type1;
      }
      printf("The two subxpressions of the binary expression does not have the same type");
      return -1;
  }
}

int expTypeTravTerm(SymbolTable *t, TERM *term){
  switch(term->kind){
    case varK:
      return expTypeTravVar(t, t->val.var);
      break;
    case idTermK:
      SYMBOL s = getSymbol(t, t->val.idact.id);
      if(s == NULL){
        printf("Symbol '%s' where not found\n", t->val.idact.id);
      }
      //maybe i should check if this is a function or something else
      ACT_LIST act = term->val.idact.list;
      if(act != NULL){
        expTypeTravExps(t, act->expList);
      }
      return s->type;
      printf("expTypeTravTerm: maybe funktion calls not yet implemented\n")
      break;
    case expTermK:
      return expTypeTravEXP(t, term->val.exp);
      break;
    case notTermK:
      int type = expTypeTravTerm(t, term->val.notTerm);
      if(type != boolK){
        printf("Cannot negate something of different type than boolean\n");
        return -1;
      }
      return type;
      break;
    case expCardK:
      printf("expTypeTravTerm: cardinality not yet fully supported\n");
      //check if term->val.expCard == array or int or maybe record
      return intK;
      //pEXP(t->val.expCard);
      break;
    case numK:
      return intK;
      //printf("%d", t->val.num);
      break;
    case trueK:
      return boolK;
      break;
    case falseK:
      return boolK;
      break;
    case nullK:
      printf("expTypeTravTerm: What type is a NULL???!?!");
      break;
  }
}

int expTypeTravVar(SymbolTable *t, VARIABLE *v){
  switch(v->kind){
    case idVarK:
      SYMBOL s = getSymbol(t, v->val.name);
      if(s != NULL){
        return s->type;
      }
      printf("ID %s, not found\n", v->val.name);
      return -1;
      break;
    case expK:
      printf("expTypeTravVar: Arrays not yet supported\n");
      return -1;
      // pVARIABLE(v->val.varexp.var);
      // printf("[");
      // pEXP(v->val.varexp.exp);
      // printf("]");
      break;
    case dotK:
      printf("expTypeTravVar: records not yet supported\n");
      return -1;
      // pVARIABLE(v->val.vardot.var);
      // printf(".");
      // printf("%s", v->val.vardot.id);
      break;
  }
}

void expTypeTravExps(SymbolTable *t, EXP_LIST *eList){
  expTypeTravExp(t, eList->exp);
  if(eList->expList != NULL){
    travStmt(t, sList->statementList);
  }
}


/**
 * Checks if expression types match variable and context types
*/
void checkTypes();
