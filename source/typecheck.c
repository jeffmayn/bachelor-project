#include "tree.h"
#include "typecheck.h"
#include "symbol.h"
#include "memory.h"
#include <stdlib.h>
#include <stdio.h>

extern BODY *theexpression;
extern SymbolTable *childScopeForDebugging;

/*
  NOTE: 10/3-18
  epxressions should be able to save a pointer to the corresponding TYPE*
  representing that expression.
*/

SymbolTable* typeCheck(){//TODO error reporting, perhaps (int typeCheck(Symboltable* target){})
  SymbolTable *table = initSymbolTable();
  bodyList *bodies = initBodyList();
  idTypeFinder(table, bodies);
  bodyListElm *bElm = getBody(bodies);
  while(bElm != NULL){
    expTypeFinder(bElm->scope, bElm->body);
    bElm = getBody(bodies);
  }
  resetbodyListIndex(bodies);
  bElm = getBody(bodies);
  while(bElm != NULL){
    checkTypes(bElm->scope, bElm->body, bElm->funcId);
    bElm = getBody(bodies);
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
  saveBody(bList, theexpression, table, NULL);
  idTypeTravBody(table, theexpression, bList);
}

/**
 t is the root of the current scope
*/
void idTypeTravBody(SymbolTable *t, BODY *body, bodyList *bList){
  fprintf(stderr,"idFinderRec\n");
  idTypeTravDecls(t,body->vList, bList);
}

void idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList){
  if(decls == NULL){
    return;
  }
  //TODO things
  DECLARATION *d = decls->decl;
  if(d == NULL){
    fprintf(stderr,"null\n");
    return;
  }
  fprintf(stderr,"id of kind %d found in travDecls\n", d->kind);
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
      putSymbol(t, d->val.func->head->id, 0, func, d->val.func->head->type->kind, child, NULL); //add some shit for named types, records and arrays
      //add parametrs to that scope
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        VAR_DECL_LIST *vList = pList->vList;
        fprintf(stderr,"vList %p\n", (void*) vList);
        if(vList != NULL){
          while(vList != NULL){
            fprintf(stderr,"about to put params for %s\n", d->val.func->head->id);
            if(vList->vType->type->kind == arrayK){
              putParam(child, vList->vType->id, 0, var, vList->vType->type->kind, vList->vType->type); //can a parameter be anything different from a variable (func or type)
            }
            else{
              putParam(child, vList->vType->id, 0, var, vList->vType->type->kind, NULL); //can a parameter be anything different from a variable (func or type)
            }
            vList = vList->vList;
          }
        }
      }

      //I may use travVDecls instead of using this while loop
      //NO because its putParam and not Symbol, which is used.
      //segmentation fault right here/below (When there is no parameters)
      //Solved by if above

      //recursively call idFinderRec on body of function
      idTypeTravBody(child,d->val.func->body, bList);
      //save body for statement traversal
      saveBody(bList, d->val.func->body, child, d->val.func->head->id);
    break;
    case idDeclK:
      fprintf(stderr,"%s of type %d put into SymbolTable\n", d->val.id.id, d->val.id.type->kind);
      putSymbol(t, d->val.id.id, 0, type, d->val.id.type->kind, NULL, NULL);
    break;
  }

  idTypeTravDecls(t, decls->decl_list, bList);

}

void idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls){
  if(vDecls == NULL){
    return;
  }
  //TODO: may have been done
  VAR_TYPE *vty = vDecls->vType;
  SYMBOL *sym = NULL;
  //fprintf(stderr, "do i ever go here*********************************************************************************** \n");
  fprintf(stderr, "vty->type->kind: %d for id %s\n", vty->type->kind, vty->id );
  if(vty->type->kind == recordK){
    fprintf(stderr, "type 4: vty->type->kind: %d for id %s\n", vty->type->kind, vty->id );
    SYMBOL *sym = putSymbol(t, vty->id, 0, var, vty->type->kind, NULL, NULL); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
    //put all variables of record vty->id
    sym->content=initSymbolTable();
    idTypeTravVDecls(sym->content, vty->type->val.vList);
  }
  else if(vty->type->kind == arrayK){
    SYMBOL *sym = putSymbol(t, vty->id, 0, var, vty->type->kind, NULL, vty->type); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  }
  else{
    fprintf(stderr,"%s of type %d put into SymbolTable\n", vty->id, vty->type->kind);
    SYMBOL *sym = putSymbol(t, vty->id, 0, var, vty->type->kind, NULL, NULL); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  }
  if(sym == NULL){
    fprintf(stderr, "Line %d: The symbol '%s' already exist\n", vty->lineno, vty->id);
  }
  idTypeTravVDecls(t, vDecls->vList);
}

// int idTypeTravType(SymbolTable *t, TYPE *ty){
//   return 0;
// }





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
      fprintf(stderr,"expTypeTravStmt allocateK not implemented\n");
      break;
    case allocateLengthK:
      fprintf(stderr,"expTypeTravStmt allocateLengthK not implemented\n");
      break;
    case assiK:
      expTypeTravExp(t, s->val.assign.exp);
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
  fprintf(stderr,"\n");
}
//MADS TODO sørg for binære operatorer.
int expTypeTravExp(SymbolTable *t, EXP *exp){
  //error cheking needed from recursive calls
  switch(exp->kind){
    case termK:
      ; //empty statement
      TYPE *arrayType = NULL;
      enum Typekind type = expTypeTravTerm(t, exp->val.term, &arrayType);
      exp->type = type;
      exp->arrayType = arrayType;
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
      fprintf(stderr,"expTypeTravExp left and right not both integers.\n");
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
      fprintf(stderr,"expTypeTravExp left and right not both booleans.\n");
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
      fprintf(stderr,"expTypeTravExp left and right not same type.\n");
      return -1;

  }
  return -1; //compiler warning
}

int expTypeTravTerm(SymbolTable *t, TERM *term, TYPE **arrayType){
  switch(term->kind){
    case varK:
      ; //empty statement
      Typekind typekind = expTypeTravVar(t, term->val.var, arrayType);
      if((*arrayType) != NULL){
        return (*arrayType)->kind;
      }
      if(typekind == -1){
        //error message should be printed in expTypeTravVar
        return -1;
      }
      return typekind;
      break;
    case idTermK:
      ; //empty statement
      SYMBOL *s = getSymbol(t, term->val.idact.id);
      if(s == NULL){
        fprintf(stderr,"idtermK: Symbol '%s' where not found\n", term->val.idact.id);
      }
      //maybe i should check if this is a function or something else
      ACT_LIST *act = term->val.idact.list;
      if(act != NULL){
        int error = expTypeTravExps(s->scope, act->expList, s->scope->param);
        if(error){
          return -1; //error message should be printed in expTypeTravExps
        }
      }
      return s->type;
      fprintf(stderr,"expTypeTravTerm: maybe funktion calls not yet implemented\n");
      break;
    case expTermK:
      return expTypeTravExp(t, term->val.exp);
      break;
    case notTermK:
      ; //empty statement
      int type = expTypeTravTerm(t, term->val.notTerm, arrayType);
      if(type != boolK){
        fprintf(stderr,"Cannot negate something of different type than boolean\n");
        return -1;
      }
      return type;
      break;
    case expCardK:
      fprintf(stderr,"expTypeTravTerm: cardinality not yet fully supported\n");
      //check if term->val.expCard == array or int or maybe record
      return intK;
      //pEXP(t->val.expCard);
      break;
    case numK:
      return intK;
      //fprintf(stderr,"%d", t->val.num);
      break;
    case trueK:
      return boolK;
      break;
    case falseK:
      return boolK;
      break;
    case nullK:
      fprintf(stderr,"expTypeTravTerm: What type is a NULL?!?!?!\n");
      return -1;
      break;
  }
    return -1; //compiler warning
}

int expTypeTravVar(SymbolTable *t, VARIABLE *v, TYPE **arrayType){
  SYMBOL *s;
  switch(v->kind){
    case idVarK:
      ; //empty statement
      s = getSymbol(t, v->val.id);
      if(s == NULL){
        fprintf(stderr,"ID %s, not found\n", v->val.id);
        return -1;

      }
      return s->type;
      break;
    case expK:
      fprintf(stderr,"expTypeTravVar: Arrays not yet supported\n");
      s = getSymbol(t, v->val.varexp.var->val.id);
      if(s == NULL){
        fprintf(stderr,"ID %s, not found\n", v->val.id);
        return -1;
      }
      TYPE *ty = expTypeTravType(t,v,s);
      if(ty == NULL){
        //Some error in expTypeTravType
        return -1;
        //fprintf(stderr, "%s\n", );
      }
      //return ty; //This is the thing i want to put in the expression
      (*arrayType) = ty;
      return s->type;
      //return NULL;
      //********We are in deep shit trouble right now*******//
      return -1;
      // pVARIABLE(v->val.varexp.var);
      // fprintf(stderr,"[");
      // pEXP(v->val.varexp.exp);
      // fprintf(stderr,"]");
      break;
    case dotK:
      //fprintf(stderr,"expTypeTravVar: records not yet supported\n");
      ; //empty statement
      SYMBOL *sym = NULL;
      TYPE *arrayType = NULL;
      Typekind type = expTypeTravVar(t, v->val.vardot.var, &arrayType);
      if(type == arrayK){
        if(arrayType != NULL){
          printf("Line %d: expTypeTravVar: case dotk: array found??", v->lineno);
          //arrayType->kind;
          return -1;
          break;
        }
      }
      if(type == recordK){
        if(sym == NULL){
          fprintf(stderr, "Line %d: The record '%s' was not found\n", v->lineno, v->val.vardot.var->val.id);
          return -1;
        }
        SYMBOL *sym2 = getSymbol(sym->content, v->val.vardot.id);
        if(sym2 == NULL){
          fprintf(stderr, "Unfortunately '%s' was not found insides '%s'\n", v->val.vardot.id, sym2->name);
          return -1;
        }
        return sym2->type;
        break;
      }
  }
  return -1; //compiler warning
}

TYPE* expTypeTravType(SymbolTable *t, VARIABLE *v, SYMBOL *sym){ //used to traverse types for arrays
  if(v->kind == expK){
    int type = expTypeTravExp(t, v->val.varexp.exp);
    if(type != 1){
      fprintf(stderr, "Line %d: the index-expression have type %d, and does not cohere with type %d, expected here\n", v->lineno, type, intK);
      return NULL;
    }
    TYPE* ty = expTypeTravType(t, v->val.varexp.var, sym);
    return ty->val.arrayType;
  }
  else{
    SYMBOL *sym = expTypeTravVar(t, v, NULL);
    return sym->arrayType;
  }
}

int expTypeTravExps(SymbolTable *t, EXP_LIST *eList, SYMBOL* param){
  //Dette virker vist ikke korrekt****************************************
  //printer altid more arguments than needed
  //tror der er noget galt med param argumentet
  if(eList == NULL){
    //No arguments
    if(param == NULL){
      //no more parameters and arguments
      return 0; //everything is good
    }
    else{
      //still more parameters
      fprintf(stderr, "Line 'unknown': The function was not given enough arguments");
      return -1;
    }
  }
  else{
    //still more arguments given
    if(param == NULL){
      //but no more parameters found
      fprintf(stderr, "Line %d: The function was given more arguments than needed", eList->lineno);
      return -1;
    }
    else{
      //still more parameters
      int type = expTypeTravExp(t, eList->exp);
      if(type == -1){
        fprintf(stderr, "Line %d: expTypeTravExps: type error in argument\n", eList->lineno);
        return -1; //error in argument
      }
      if(type != param->type){
        fprintf(stderr, "Line %d: The type %d of the argument, does not match expected type %d of parameter\n", eList->lineno, type, param->type );
        return -1;
      }
      return expTypeTravExps(t, eList->expList, param->next);
    }
  }
  // fprintf(stderr, "Line %d: expTypeTravExps\n", eList->lineno);
  // int type = expTypeTravExp(t, eList->exp);
  // if(type == -1){
  //   fprintf(stderr, "Line %d: expTypeTravExps: type Error\n", eList->lineno);
  //   return -1; //error in argument
  // }
  // if(param == NULL){
  //   //no parameters left
  //   if(eList != NULL){
  //     //But still more arguments
  //     fprintf(stderr, "Line %d: The function was given more arguments than needed", eList->lineno);
  //     return -1;
  //   }
  //   else{
  //     //no more parameters and arguments
  //     return 0; //everything is good
  //   }
  // }
  // else{
  //   //still more Parameters
  //   if(eList == NULL){
  //     //but no more arguments given
  //     fprintf(stderr, "Line %d: The function was not given enough arguments", eList->lineno);
  //     return -1;
  //   }
  // }
  // if(type != param->type){
  //   fprintf(stderr, "Line %d: The type %d of the argument, does not match expected type %d of parameter\n", eList->lineno, type, param->type );
  //   return -1;
  // }
  // //if(eList->expList != NULL){
  //   return expTypeTravExps(t, eList->expList, param->next);
  // //}
  // return 0;
}


/**
 * Checks if expression types match variable and context types
*/
void checkTypes(SymbolTable *t, BODY *body, char* funcId){
  checkTypeTravBody(t, body, funcId);
}

/*
løb over alle statements og check om expressions passer til statements
*/

void checkTypeTravBody(SymbolTable *t,  BODY *body, char* funcId){
  checkTypeTravStmts(t, body->sList, funcId);
}

void checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList, char* funcId){
  fprintf(stderr, "checkTypeTravStmts\n");
  checkTypeTravStmt(t, sList->statement, funcId);
  if(sList->statementList != NULL){
    checkTypeTravStmts(t, sList->statementList, funcId);
  }
}

void checkTypeTravStmt(SymbolTable *t, STATEMENT *s, char* funcId){
  fprintf(stderr, "checkTypeTravStmt\n");
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
      else{
        sym = getSymbol(parentScope, funcId);
        if(sym == NULL){
          fprintf(stderr, "The surrounding function '%s' was not found", funcId);
        }
        type = sym->type;
      }
      if(type != s->val.return_->type){
        fprintf(stderr, "The type %d, does not match the return type %d of %s", s->val.return_->type, type, sym->name);
      }
      //SYMBOL *sym = getSymbol(parentScope, id) //what is the name of this function
      //fprintf(stderr, "CheckTypeTravStmt: Typecheck of return not implemented\n");
      //expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      //What to do?????
      if(s->val.write->type != intK && s->val.write->type != boolK){
        fprintf(stderr, "type of expression to be written is not int og bool");
      }
      //fprintf(stderr, "CheckTypeTravStmt: Typecheck of write not implemented\n");
      //expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      //check if variable.id is a var or a record not a function
      sym = getSymbol(t, s->val.allocate->val.id);
      if(s == NULL){
        fprintf(stderr,"Symbol '%s' was not found\n", s->val.allocate->val.id);
      }
      if(s->kind == funcK){
        fprintf(stderr,"Cannot allocate a function\n");
        break;
      }
      break;
    case allocateLengthK:
      //check if variable.id is a var or a record not a function
      //check if expression is a INT
      sym = getSymbol(t, s->val.allocatelength.var->val.id);
      if(s == NULL){
        fprintf(stderr,"Symbol '%s' was not found\n", s->val.allocatelength.var->val.id);
      }
      if(s->kind == funcK){
        fprintf(stderr,"Cannot allocate a function\n");
        break;
      }
      type = s->val.allocatelength.exp->type;
      if(type != intK){
        fprintf(stderr,"Amount to be allocated is not a number\n");
      }
      break;
    case assiK:
      fprintf(stderr,"Line '%d': checkTypeTravStmt: assiK\n", s->lineno);
      //check if expression type is the same as variable type
      //sym = getSymbol(t, s->val.assign.var->val.id);
      SYMBOL *sym = NULL;
      TYPE *type = NULL;
      Typekind typekind = checkTypeTravVar(t, s->val.assign.var, &sym, &type);
      //dumpSymbolTable(t);
      // if(sym == NULL){
      //   fprintf(stderr, "Line %d: Symbol '%s' in function '%s' was not found\n",s->lineno, s->val.assign.var->val.id, funcId);
      //   break;
      // }
      // type = sym->type;
      if(typekind != s->val.assign.exp->type){
        fprintf(stderr,"Line %d: Variable %s with type %d, does not match type %d of expression\n", s->lineno, sym->name, type, s->val.assign.exp->type);
      }
      break;
    case ifK:
      //check if the expression is bool
      typekind = s->val.ifthenelse.cond->type;
      if(type != boolK){
        fprintf(stderr,"Type of condition in if-statmemt should be boolean\n");
      }
      //traverse body
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      break;
    case thenK:
      //check if the expression is bool
      typekind = s->val.ifthenelse.cond->type;
      if(typekind != boolK){
        fprintf(stderr,"Type of condition in if-statmemt should be boolean\n");
      }
      //traverse both bodies
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      checkTypeTravStmt(t, s->val.ifthenelse.elsebody, funcId);
      break;
    case whileK:
      //check if the expression is bool
      typekind = s->val.while_.cond->type;
      if(typekind != boolK){
        fprintf(stderr,"Type of condition in if-statmemt should be boolean\n");
      }
      //traverse body
      checkTypeTravStmt(t, s->val.while_.body, funcId);
      break;
    case listStmtK:
      //traverse statements
      checkTypeTravStmts(t, s->val.list, funcId);
      break;
  }
  fprintf(stderr,"\n");
}

int checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym, TYPE **type){
  fprintf(stderr, "checkTypeTravVar: going into\n");
  SYMBOL *symVal;
  Typekind typekind;
  switch (v->kind) {
    case idVarK:
      symVal = getSymbol(t, v->val.id);
      if(symVal == NULL){
        fprintf(stderr, "Line %d: idVarK: Symbol '%s' was not found\n",v->lineno, v->val.id);
        return -1;
      }
      //fprintf(stderr, "Line %d: Variable '%s' was found\n",v->lineno, v->val.id);
      *sym = symVal;
      return (*sym)->type;
      break;
    case expK:
      //sym = getSymbol(t, s->val.assign.var->val.varexp.id);
      fprintf(stderr, "Line %d: Cannot typecheck array assignment yet\n", v->lineno);
      if(v->val.varexp.exp->type != intK){

      }
      typekind = checkTypeTravVar(t, v->val.varexp.var, sym, type);
      if(typekind == arrayK){
        *type = (*type)->val.arrayType;
        return (*type)->kind;
      }
      else{
        (*type) = (*sym)->arrayType;
        return (*sym)->type; //eller (*type)->kind
      }
      break;
    case dotK:
      //sym = getSymbol(t, NameOfStruct);
      ;
      typekind = checkTypeTravVar(t, v->val.vardot.var, sym, type);
      if(*sym == NULL){
        fprintf(stderr, "Line %d: checkTypeTravVar: something went wrong\n", v->lineno);
        fprintf(stderr, "Line %d: Could not find struct containing '%s'\n", v->lineno, v->val.vardot.id );
        return -1;
        break;
      }
      if((*sym)->content == NULL){
        fprintf(stderr, "Line %d: holy shit, the struct '%s' does not have any content", v->lineno, (*sym)->name);
        return -1;
      }
      *sym = getSymbol((*sym)->content, v->val.vardot.id);
      if(*sym == NULL){
        fprintf(stderr, "Line %d: dotK: Symbol '%s' was not found\n",v->lineno, v->val.vardot.id);
        return -1;
      }
      //fprintf(stderr, "Line %d: Struct '%s' wasfound\n",v->lineno, v->val.vardot.id);
      return (*sym)->type;
      break;
  }
  return -1; //compiler warning
}







bodyList* initBodyList(){
  bodyList* l = Malloc(sizeof(BODY));
  l->head = NULL;
  l->tail = NULL;
  l->next = NULL;
  return l;
}

void saveBody(bodyList *list, BODY *body, SymbolTable* scope, char* funcId){
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
  list->tail->scope = scope;
  list->tail->funcId = funcId;
}

bodyListElm* getBody(bodyList *list){
  bodyListElm *ble = list->next;
  if(ble != NULL){
    list->next = ble->next;
    return ble;
  }
  return NULL;
}

void resetbodyListIndex(bodyList *list){
  list->next = list->head;
}
