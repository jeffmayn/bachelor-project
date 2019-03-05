#include "tree.h"
#include "typecheck.h"
#include "symbol.h"
#include "memory.h"
#include <stdlib.h>
#include <stdio.h>

extern BODY *theexpression;
extern SymbolTable *childScopeForDebugging;



SymbolTable* typeCheck(){
  SymbolTable *table = initSymbolTable();
  bodyList *bodies = initBodyList();
  idTypeFinder(table, bodies);
  BODY *body = getBody(bodies);
  while(body != NULL){
    expTypeFinder(table, body);
    body = getBody(bodies);
  }
  resetbodyListIndex(bodies);
  body = getBody(bodies);
  while(body != NULL){
    checkTypes(table, body);
    body = getBody(bodies);
  }
  //TODO: destroy body list
  return table;
}


/**
  Finds the types of all declared types

  måske denne skal returnere symboltabellen
  Eller skal den være global
  Nej, den må hellere være lokal i de rekursive funktioner, så vi kan bestemme roden
*/
void idTypeFinder(SymbolTable *table, bodyList *bList){
  saveBody(bList, theexpression);
  idTypeTravBody(table, theexpression, bList);
}

/**
 t is the root of the current scope
*/
void idTypeTravBody(SymbolTable *t, BODY *body, bodyList *bList){
  printf("idFinderRec\n");
  idTypeTravDecls(t,body->vList, bList);
}

void idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList){
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
      idTypeTravVDecls(t, d->val.list);
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
      idTypeTravBody(child,d->val.func->body, bList);
      //save body for statement traversal
      saveBody(bList, d->val.func->body);
    break;
    case idDeclK:
      printf("%s of type %d put into SymbolTable\n", d->val.id.id, d->val.id.type->kind);
      putSymbol(t, d->val.id.id, 0, type, d->val.id.type->kind, NULL);
    break;
  }

  idTypeTravDecls(t, decls->decl_list, bList);

}

void idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls){
  if(vDecls == NULL){
    return;
  }
  //TODO: may be done
  VAR_TYPE *vty = vDecls->vType;
  printf("%s of type %d put into SymbolTable\n", vty->id, vty->type->kind);
  putSymbol(t, vty->id, 0, var, vty->type->kind, NULL); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  idTypeTravVDecls(t, vDecls->vList);
}





/**
 * Finds the types of expressions
*/
void expTypeFinder(SymbolTable *table, BODY *body){
  expTypeTravBody(table,  body);
}

void expTypeTravBody(SymbolTable *t,  BODY *body){
  expTypeTravStmts(t, body->sList);
}

void expTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList){
  expTypeTravStmt(t, sList->statement);
  if(sList->statementList != NULL){
    expTypeTravStmts(t, sList->statementList);
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
      //something is wrong here ***********************************************************
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
      expTypeTravStmts(t, s->val.list);
      break;
  }
  printf("\n");
}
//MADS TODO sørg for binære operatorer.
enum Typekind expTypeTravExp(SymbolTable *t, EXP *exp){
  //error cheking needed from recursive calls
  switch(exp->kind){
    case termK:
      ; //empty statement
      enum Typekind type = expTypeTravTerm(t, exp->val.term);
      exp->type = type;
      return type;
      break;
    case minusK:
    case plusK:
    case divK:
    case timesK:
      ; //empty statement
      Typekind type1 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type2 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type1 == type2 && type1 == intK){
        exp->type = intK;
        return intK;
      }
      printf("expTypeTravExp left and right not both integers.\n");
      return -1;
    case andK:
    case orK:
      ; //empty statement
      Typekind type3 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type4 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type3 == type4 && type3== boolK){
        exp->type = boolK;
        return boolK;
      }
      printf("expTypeTravExp left and right not both booleans.\n");
      return -1;
    case leK: //TODO er det ok at left og right bare er ens og vi så returnere en bool
    case eqK:
    case geK:
    case greatK:
    case lessK:
    case neK:
      ; //empty statement
      Typekind type5 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type6 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type5 == type6){
        exp->type = boolK;
        return boolK;
      }
      printf("expTypeTravExp left and right not same type.\n");
      return -1;

  }
}

int expTypeTravTerm(SymbolTable *t, TERM *term){
  switch(term->kind){
    case varK:
      return expTypeTravVar(t, term->val.var);
      break;
    case idTermK:
      ; //empty statement
      SYMBOL *s = getSymbol(t, term->val.idact.id);
      if(s == NULL){
        printf("Symbol '%s' where not found\n", term->val.idact.id);
      }
      //maybe i should check if this is a function or something else
      ACT_LIST *act = term->val.idact.list;
      if(act != NULL){
        expTypeTravExps(t, act->expList);
      }
      return s->type;
      printf("expTypeTravTerm: maybe funktion calls not yet implemented\n");
      break;
    case expTermK:
      return expTypeTravExp(t, term->val.exp);
      break;
    case notTermK:
      ; //empty statement
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
      printf("expTypeTravTerm: What type is a NULL?!?!?!");
      return -1;
      break;
  }
    return -1; //compiler warning
}

int expTypeTravVar(SymbolTable *t, VARIABLE *v){
  switch(v->kind){
    case idVarK:
      ; //empty statement
      SYMBOL *s = getSymbol(t, v->val.id);
      if(s != NULL){
        return s->type;
      }
      printf("ID %s, not found\n", v->val.id);
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
  return -1; //compiler warning
}

void expTypeTravExps(SymbolTable *t, EXP_LIST *eList){
  expTypeTravExp(t, eList->exp);
  if(eList->expList != NULL){
    expTypeTravExps(t, eList->expList);
  }
}


/**
 * Checks if expression types match variable and context types
*/
void checkTypes(SymbolTable *t, BODY *body){
  checkTypeTravBody(t, body);
}

/*
løb over alle statements og check om expressions passer til statements
*/

void checkTypeTravBody(SymbolTable *t,  BODY *body){
  checkTypeTravStmts(t, body->sList);
}

void checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList){
  printf("checkTypeTravStmts\n");
  checkTypeTravStmt(t, sList->statement);
  if(sList->statementList != NULL){
    checkTypeTravStmts(t, sList->statementList);
  }
}

void checkTypeTravStmt(SymbolTable *t, STATEMENT *s){
  printf("checkTypeTravStmt\n");
  SYMBOL *sym;
  Typekind type;
  switch(s->kind){
    case returnK:
      ; //empty statement
      //check if type matches return type
      SymbolTable *parentScope = t->next; //this function is defined in parent scope
      if(parentScope == NULL){
        //We are in the outermost scope
        //we assume the return type is int
        type = intK;
      }
      //SYMBOL *sym = getSymbol(parentScope, id) //what is the name of this function
      printf("CheckTypeTravStmt: Typecheck of return not implemented\n");
      //expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      //What to do?????
      printf("CheckTypeTravStmt: Typecheck of write not implemented\n");
      //expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      //check if variable.id is a var or a record not a function
      sym = getSymbol(t, s->val.allocate->val.id);
      if(s == NULL){
        printf("Symbol '%s' was not found\n", s->val.allocate->val.id);
      }
      if(s->kind == funcK){
        printf("Cannot allocate a function\n");
        break;
      }
      break;
    case allocateLengthK:
      //check if variable.id is a var or a record not a function
      //check if expression is a INT
      sym = getSymbol(t, s->val.allocatelength.var->val.id);
      if(s == NULL){
        printf("Symbol '%s' was not found\n", s->val.allocatelength.var->val.id);
      }
      if(s->kind == funcK){
        printf("Cannot allocate a function\n");
        break;
      }
      type = s->val.allocatelength.exp->type;
      if(type != intK){
        printf("Amount to be allocated is not a number");
      }
      break;
    case assiK:
      printf("checkTypeTravStmt: assiK\n");
      //check if expression type is the same as variable type
      sym = getSymbol(t, s->val.assign.var->val.id);
      if(s == NULL){
        printf("Symbol '%s' was not found\n", s->val.assign.var->val.id);
      }
      type = sym->type;
      if(type != s->val.assign.exp->type){
        printf("Variable %s with type %d, does not match type %d of expression", s->val.assign.var->val.id, type, s->val.assign.exp->type);
      }
      break;
    case ifK:
      //check if the expression is bool
      type = s->val.ifthenelse.cond->type;
      if(type != boolK){
        printf("Type of condition in if-statmemt should be boolean");
      }
      //traverse body
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody);
      break;
    case thenK:
      //check if the expression is bool
      type = s->val.ifthenelse.cond->type;
      if(type != boolK){
        printf("Type of condition in if-statmemt should be boolean");
      }
      //traverse both bodies
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody);
      checkTypeTravStmt(t, s->val.ifthenelse.elsebody);
      break;
    case whileK:
      //check if the expression is bool
      type = s->val.while_.cond->type;
      if(type != boolK){
        printf("Type of condition in if-statmemt should be boolean");
      }
      //traverse body
      checkTypeTravStmt(t, s->val.while_.body);
      break;
    case listStmtK:
      //traverse statements
      checkTypeTravStmts(t, s->val.list);
      break;
  }
  printf("\n");
}







bodyList* initBodyList(){
  bodyList* l = Malloc(sizeof(BODY));
  l->head = NULL;
  l->tail = NULL;
  l->next = NULL;
  return l;
}

void saveBody(bodyList *list, BODY *body){
  bodyListElm *ble = Malloc(sizeof(bodyListElm));
  ble->next = NULL;
  if(list->head == NULL){
    ble->prev = NULL;
    list->head = ble;
    list->tail = ble;
    list->next = ble;
  }
  else{
    list->tail->next = ble;
    list->tail->next->prev = list->tail;
    list->tail = list->tail->next;
  }
  list->tail->body = body;
}

BODY* getBody(bodyList *list){
  bodyListElm *ble = list->next;
  if(ble != NULL){
    list->next = ble->next;
    return ble->body;
  }
  return NULL;
}

void resetbodyListIndex(bodyList *list){
  list->next = list->head;
}
