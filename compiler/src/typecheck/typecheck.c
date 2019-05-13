#pragma GCC diagnostic ignored "-Wimplicit-fallthrough"
#include "tree.h"
#include "typecheck.h"
#include "symbol.h"
#include "memory.h"
#include <stdlib.h>
#include <stdio.h>

extern BODY *theexpression;
extern SymbolTable *childScopeForDebugging;
bodyList *bodies = NULL;
int anonymousRecordCounter = 0;
int whileLoopCounter = 0;

/**
  Main function for type checking
  This function has three phases
  idTypeFinder collects all identifiers into the SymbolTable
  expTypeFinder collects the types of expressions
  checkTypes checks if expressions and variables fits
*/
int typeCheck(SymbolTable *table){
  int error = 0;
  bodies = initBodyList();
  fprintf(stderr, "   |--> Symbol collection\n");
  error = idTypeFinder(table, bodies);
  if(error == -1){
    fprintf(stderr, "Error: Symbol collection did not complete\n");
    return -1;
  }

  fprintf(stderr, "   |--> Expression type collection\n");
  error = 0;
  bodyListElm *bElm = getBody(bodies);
  while(bElm != NULL){
    error = expTypeFinder(bElm->scope, bElm->body);
    if(error == -1){
      break;
    }
    bElm = getBody(bodies);
  }
  if(error == -1){
    fprintf(stderr, "Error: Expression type collection did not complete\n");
    return -1;
  }

  fprintf(stderr, "   |--> Typechecking\n");
  error = 0;
  resetbodyListIndex(bodies);
  bElm = getBody(bodies);
  while(bElm != NULL){
    error = checkTypes(bElm->scope, bElm->body, bElm->funcId);
    if(error == -1){
      fprintf(stderr, "ERROR: Something went totally wring in %s, but we just skip to the next thing and prentend everything is fine. No we don't\n", bElm->funcId);
      break;
    }
    bElm = getBody(bodies);
  }
  if(error == -1){
    fprintf(stderr, "ERROR: Expression type checking did not complete\n");
    return -1;
  }
  return 0;
}

/**
  Finds the types of all declared types
  First parameter is the current scope
  Second parameter is for saving bodies for later traversals
*/
int idTypeFinder(SymbolTable *table, bodyList *bList){
  saveBody(bList, theexpression, table, NULL, table);
  return idTypeTravBody(table, theexpression, bList);
}

/**
 Traverses the body of a given function
 First parameter is the current scope
 Second paramter is the body
 Third parameter is the list of bodies for later phases
*/
int idTypeTravBody(SymbolTable *t, BODY *body, bodyList *bList){
  return idTypeTravDecls(t,body->vList, bList);
}

/**
  traverse declarations for collecting ids
*/
int idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList){
  SYMBOL *sym;
  int error;
  if(decls == NULL){ //no more declarations
    return 0;
  }
  DECLARATION *d = decls->decl;
  if(d == NULL){
    return 0;
  }
  switch (d->kind) {
    case listK: //variables
      idTypeTravVDecls(t, d->val.list, 0);
    break;
    case funcK:
      ; //empty statement
      //create new scope
      SymbolTable *child = scopeSymbolTable(t);
      //add function to current scope
      sym = putSymbol(t, d->val.func->head->id, 0, funcS, d->val.func->head->type->kind, child, d->val.func->head->type); //add some shit for named types, records and arrays
      if(sym == NULL){
        fprintf(stderr, "Line %d: The symbol '%s' already exists\n", d->lineno, d->val.func->head->id);
        return -1;
      }

      //add parameters to that scope
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        VAR_DECL_LIST *vList = pList->vList;
        error = idTypeTravVDecls(child, vList, 1);
        if(error == -1){
          fprintf(stderr, "Line %d: error orcurred while collecting paramters of %s\n", vList->lineno, d->val.func->head->id);
          return -1;
        }
        // while(vList != NULL){
        //   VAR_TYPE *vty = vList->vType;
        //   TYPE *ty = vty->type;
        //   TYPE *prev = NULL;
        //   while(ty->kind == arrayK){
        //     prev = ty;
        //     ty = ty->val.arrayType;
        //   }
        //
        //   if(ty->kind == recordK){
        //     char *name = Malloc(10);
        //     sprintf(name, "$%d", anonymousRecordCounter);
        //     anonymousRecordCounter++;
        //     TYPE *newType = makeID(name);
        //     newType->scope = t;
        //     prev->val.arrayType = newType;
        //     sym = putSymbol(t, name, 0, typeS, ty->kind, NULL, ty);
        //     if(sym == NULL){
        //       fprintf(stderr, "Line %d: The symbol '%s' already exists\n", d->lineno, name);
        //       return -1;
        //     }
        //     sym->content=scopeSymbolTable(t);
        //     idTypeTravVDecls(sym->content, ty->val.vList, 0);
        //   }
        //   putParam(child, vList->vType->id, 0, varS, vList->vType->type->kind, vList->vType->type);
        //   vList = vList->vList;
        // }
      }
      //save body for statement traversal
      saveBody(bList, d->val.func->body, child, d->val.func->head->id, t);
      //recursively traverse on body of function
      idTypeTravBody(child,d->val.func->body, bList);
    break;
    case idDeclK: //usetype
      sym = putSymbol(t, d->val.id.id, 0, typeS, d->val.id.type->kind, NULL, d->val.id.type);
      if(sym == NULL){
        fprintf(stderr, "Line %d: The symbol '%s' already exists\n", d->lineno, d->val.id.id);
        return -1;
      }

      if(d->val.id.type->kind == recordK){
        //put all variables of record vty->id
        sym->content = scopeSymbolTable(t);
        int error123 =  idTypeTravVDecls(sym->content, d->val.id.type->val.vList, 0);
        if(error123 == -1){
          return -1;
        }
      }
      else if(d->val.id.type->kind == arrayK){
        //Copied from idTypeTravVDecls()
        TYPE *ty = d->val.id.type;
        TYPE *prev = NULL;
        while(ty->kind == arrayK){
          prev = ty;
          ty = ty->val.arrayType;
        }
        if(ty->kind == recordK){
          char *name = Malloc(10);
          sprintf(name, "$%d", anonymousRecordCounter);
          anonymousRecordCounter++;
          TYPE *newType = makeID(name);
          newType->scope = t;
          prev->val.arrayType = newType;
          sym = putSymbol(t, name, 0, typeS, ty->kind, NULL, ty);
          sym->content=scopeSymbolTable(t);
          idTypeTravVDecls(sym->content, ty->val.vList, 0);
        }
      }
    break;
  }
  //go on to next declaration
  return idTypeTravDecls(t, decls->decl_list, bList);

}

/**
  Traverses all variables defined by the same 'var' keyword
  Saves the variables in the symboltable t
*/
int idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls, int isParamList){
  if(vDecls == NULL){ //no variables
    return 0;
  }
  VAR_TYPE *vty = vDecls->vType;
  SYMBOL *sym = NULL;
  if(vty->type->kind == recordK){
    if(isParamList){
      sym = putParam(t, vty->id, 0, varS, vty->type->kind, vty->type);
    }
    else{
      sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type);
    }
    //put all variables of record vty->id
    sym->content=scopeSymbolTable(t);
    idTypeTravVDecls(sym->content, vty->type->val.vList, 0);
  }
  else if(vty->type->kind == nullKK){
    fprintf(stderr, "Line %d: The type of symbol '%s' cannot be null\n", vty->lineno, vty->id);
    return -1;
  }
  else if(vty->type->kind == arrayK){
    if(isParamList){
      sym = putParam(t, vty->id, 0, varS, vty->type->kind, vty->type);
    }
    else{
      sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type);
    }
    if(sym == NULL){
      return -1;
    }
    TYPE *ty = vty->type;
    TYPE *prev = NULL;
    while(ty->kind == arrayK){
      prev = ty;
      ty = ty->val.arrayType;
    }
    if(ty->kind == recordK){
      char *name = Malloc(10);
      sprintf(name, "$%d", anonymousRecordCounter);
      anonymousRecordCounter++;
      TYPE *newType = makeID(name);
      newType->scope = t;
      prev->val.arrayType = newType;
      sym = putSymbol(t, name, 0, typeS, ty->kind, NULL, ty);
      sym->content=scopeSymbolTable(t);
      idTypeTravVDecls(sym->content, ty->val.vList, 0);
    }
  }
  else{ //int or bool
    if(isParamList){
      sym = putParam(t, vty->id, 0, varS, vty->type->kind, vty->type);
    }
    else{
      sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type);
    }
  }
  if(sym == NULL){
    fprintf(stderr, "Line %d: The symbol '%s' already exist\n", vty->lineno, vty->id);
    return -1;
  }
  return idTypeTravVDecls(t, vDecls->vList, isParamList);
}

//**********************************PHASE 2*********************//
/**
 * Finds the types of expressions
*/
int expTypeFinder(SymbolTable *table, BODY *body){
  return expTypeTravBody(table,  body);
}

/**
  traversing bodies to find expressions
*/
int expTypeTravBody(SymbolTable *t,  BODY *body){
  return expTypeTravStmts(t, body->sList);
}

/**
  traversing statements to find types of expressions
*/
int expTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList){
  int error = expTypeTravStmt(t, sList->statement);
  if(error == -1){
    return -1;
  }
  if(sList->statementList != NULL){
    return expTypeTravStmts(t, sList->statementList);
  }
  return 0;
}

/**
  investigating a statement to save type of expressions
*/
int expTypeTravStmt(SymbolTable *t, STATEMENT *s){
  int i;
  SYMBOL *sym;
  TYPE *type;

  switch(s->kind){
    case returnK:
      return expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      return expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      sym = NULL;
      type = NULL;
      Typekind tk = expTypeTravVar(t, s->val.allocate, &sym, &type);
      if(tk == errorK){
        fprintf(stderr, "Line %d: Error happened while searching variable of allocate\n", s->lineno);
        return -1;
      }
      return 0;
      break;
    case allocateLengthK:
      sym = NULL;
      type = NULL;
      tk = expTypeTravVar(t, s->val.allocatelength.var, &sym, &type);
      if(tk != errorK){
        return expTypeTravExp(t, s->val.allocatelength.exp);
      }
      return -1;
      break;
    case assiK:
      sym = NULL;
      type = NULL;
      tk = expTypeTravVar(t, s->val.assign.var, &sym, &type);

      if(tk != errorK){
        return expTypeTravExp(t, s->val.assign.exp);
      }
      break;
    case ifK:
      i = expTypeTravExp(t, s->val.ifthenelse.cond);
      if(i == 0){
        return expTypeTravStmt(t, s->val.ifthenelse.thenbody);
      }
      return i;
      break;
    case thenK:
      i = expTypeTravExp(t, s->val.ifthenelse.cond);
      if(i == 0){
        i = expTypeTravStmt(t, s->val.ifthenelse.thenbody);
        if(i == 0){
          return expTypeTravStmt(t, s->val.ifthenelse.elsebody);
        }
        return i;
      }
      break;
    case whileK:
      whileLoopCounter++;
      i = expTypeTravExp(t, s->val.while_.cond);
      if(i == 0){
        i = expTypeTravStmt(t, s->val.while_.body);
      }
      whileLoopCounter--;
      return i;
      break;
    case listStmtK:
      return expTypeTravStmts(t, s->val.list);
      break;
    case breakK:
    case continueK:
      ;
      if(whileLoopCounter >= 1){
        return 0;
      } else {
        fprintf(stderr, "%s\n", "expTypeTravStmt: you are not allowed to break or continue outside loops");
        return -1;
      }
      break;
  }
  return -1;
}

/**
  Traversing expressions
  Saves the type of an expression in that expression
*/
int expTypeTravExp(SymbolTable *t, EXP *exp){
  int error1;
  int error2;
  SYMBOL *sym1, *sym2;
  Typekind type1, type2;
  switch(exp->kind){
    case termK:
      ; //empty statement
      TYPE *type = NULL;
      Typekind ty = expTypeTravTerm(t, exp->val.term, &type);
      exp->typekind = ty;
      exp->type = type;
      if(ty == errorK){
        return -1;
      }
      return 0;
      break;
    case minusK:
    case plusK:
    case divK:
    case timesK:
      ; //empty statement
      error1 = expTypeTravExp(t, exp->val.binOP.left);
      error2 = expTypeTravExp(t, exp->val.binOP.right);
      if(error1 == 0 && error2 == 0){
        type1 = exp->val.binOP.left->typekind;
        type2 = exp->val.binOP.right->typekind;
        if(type1 == idK){
          sym1 = recursiveSymbolRetrieval(exp->val.binOP.left->type->scope, exp->val.binOP.left->type->val.id, NULL);
          type1 = sym1->typePtr->kind;
          fprintf(stderr, "%d\n", type1);
        }
        if(type2 == idK){
          sym2 = recursiveSymbolRetrieval(exp->val.binOP.right->type->scope, exp->val.binOP.right->type->val.id, NULL);
          type2 = sym2->typePtr->kind;
        }
        if(type1 == type2 && type1 == intK){
          exp->typekind = intK;
          return 0;
        }
        fprintf(stderr,"Line %d: expTypeTravExp left and right not both integers.\n", exp->lineno);
        exp->typekind = errorK;
        return -1;
      } else {
        fprintf(stderr, "%s\n", "expTypeTravExp: error in either left or right operand traversal");
      }
      fprintf(stderr, "Line %d: error happened in binary expression\n", exp->lineno);
      exp->typekind = errorK;
      return -1;
    case andK:
    case orK:
      ; //empty statement
      error1 = expTypeTravExp(t, exp->val.binOP.left);
      error2 = expTypeTravExp(t, exp->val.binOP.right);
      //check if the two types are the same
      if(error1 == 0 && error2 == 0){
        Typekind type3 = exp->val.binOP.left->typekind;
        Typekind type4 = exp->val.binOP.right->typekind;
        if(type3 == idK){
          SYMBOL *sym1 = recursiveSymbolRetrieval(exp->val.binOP.left->type->scope, exp->val.binOP.left->type->val.id, NULL);
          type3 = sym1->typePtr->kind;
        }
        if(type4 == idK){
          SYMBOL *sym2 = recursiveSymbolRetrieval(exp->val.binOP.right->type->scope, exp->val.binOP.right->type->val.id, NULL);
          type4 = sym2->typePtr->kind;
        }
        if(type3 == type4 && type3 == boolK){
          exp->typekind = boolK;
          return 0;
        }
        fprintf(stderr,"Line %d: expTypeTravExp left and right not both booleans.\n", exp->lineno);
        exp->typekind = errorK;
        return -1;
      }
      fprintf(stderr, "Line %d: error happened in binary expression\n", exp->lineno);
      exp->typekind = errorK;
      return -1;
    case leK:
    case eqK:
    case geK:
    case greatK:
    case lessK:
    case neK:
      ; //empty statement
      error1 = expTypeTravExp(t, exp->val.binOP.left);
      error2 = expTypeTravExp(t, exp->val.binOP.right);
      //check if the two types are the same
      if(error1 == 0 && error2 == 0){
        Typekind type5 = exp->val.binOP.left->typekind;
        Typekind type6 = exp->val.binOP.right->typekind;
        if(type5 == idK){
          SYMBOL *sym1 = recursiveSymbolRetrieval(exp->val.binOP.left->type->scope, exp->val.binOP.left->type->val.id, NULL);
          type5 = sym1->typePtr->kind;
        }
        if(type6 == idK){
          SYMBOL *sym2 = recursiveSymbolRetrieval(exp->val.binOP.right->type->scope, exp->val.binOP.right->type->val.id, NULL);
          type6 = sym2->typePtr->kind;
        }
        if((type5 == type6) || ((type5 == recordK || type5 == arrayK) && type6 == nullKK)){
          exp->typekind = boolK;
          return 0;
        }
        fprintf(stderr,"Line %d: expTypeTravExp left and right not same type.\n", exp->lineno);
        exp->typekind = errorK;
        return -1;
      }
        fprintf(stderr, "Line %d: error happened in binary expression\n", exp->lineno);
      exp->typekind = errorK;
      return -1;

  }
  return -1;
}

Typekind expTypeTravTerm(SymbolTable *t, TERM *term, TYPE **type){
  Typekind ty;
  SYMBOL *sym;
  int error;
  switch(term->kind){
    case varK:
      sym = NULL; //to avoid dereferencing null
      ty = expTypeTravVar(t, term->val.var, &sym, type); //the symbol is not used
      if((*type) == NULL){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", term->lineno);
        return errorK;
      }
      if(ty == idK){
        sym = recursiveSymbolRetrieval((*type)->scope, (*type)->val.id, NULL);
        if(sym == NULL){
          fprintf(stderr, "Line %d: The type of the symbol %s could not be expanded\n", term->lineno, (*type)->val.id);
          return errorK;
        }
        *type = sym->typePtr;
      }
      return (*type)->kind;
      break;
    case idTermK: //function call
      sym = getSymbol(t, term->val.idact.id, 0);
      if(sym == NULL){
        fprintf(stderr,"Line %d: idtermK: Symbol '%s' where not found\n", term->lineno, term->val.idact.id);
        return errorK;
      }
      if(sym->kind != funcS){
        fprintf(stderr, "Line %d: The symbol '%s' is not a function\n",  term->lineno, term->val.idact.id);
        return errorK;
      }
      ACT_LIST *act = term->val.idact.list;
      if(act != NULL){
        int error = expTypeTravExps(t, act->expList, sym->scope->ParamHead);
        if(error){
          return errorK;
        }
      }
      *type = sym->typePtr;
      return sym->typePtr->kind;
      break;
    case expTermK: //parenthese
      error = expTypeTravExp(t, term->val.exp);
      if(error == -1){
        return errorK;
      }
      *type = term->val.exp->type;
      return term->val.exp->typekind;
      break;
    case notTermK: //negation
      ty = expTypeTravTerm(t, term->val.notTerm, type);
      if(ty == errorK){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", term->lineno);
        *type = NULL;
        return errorK;
      }
      //Check userdefined types
      if(ty == idK){
        sym = recursiveSymbolRetrieval((*type)->scope, (*type)->val.id, NULL);
        if(sym == NULL){
          fprintf(stderr, "Line %d: The type of the symbol %s could not be expanded\n", term->lineno, (*type)->val.id);
          return errorK;
        }
        *type=sym->typePtr;
      }
      if(ty != boolK){
        fprintf(stderr,"Line %d: Cannot negate something of different type than boolean\n", term->lineno);
        *type = NULL;
        return errorK;
      }
      return ty;
      break;
    case expCardK: //cardinality
      error = expTypeTravExp(t, term->val.expCard);
      if(error == -1){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", term->lineno);
        return errorK;
      }
      *type = NULL;
      return intK;
      fprintf(stderr,"expTypeTravTerm: cardinality not yet fully supported\n");
      return intK;
      break;
    case numK:
      return intK;
      break;
    case trueK:
      return boolK;
      break;
    case falseK:
      return boolK;
      break;
    case nullK:
      return nullKK;
      break;
  }
    return -1;
}

/**
  This function finds the closet direct type associated to a variabler
  The type returned may be an ID-type.
*/
Typekind expTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym, TYPE **type){
  SYMBOL *s;
  Typekind ty;
  int error;
  switch(v->kind){
    case idVarK:
      s = getSymbol(t, v->val.id, 0);
      if(s == NULL){
        fprintf(stderr,"Line %d: ID %s, not found\n", v->lineno, v->val.id);
        return errorK;

      }
      if(s->kind == typeS){
        fprintf(stderr, "Line %d: cannot use type %s as a variable\n", v->lineno, s->name);
        return errorK;
      }
      if(s->kind == funcS){
        fprintf(stderr, "Line %d: cannot use function %s as a variable\n", v->lineno, s->name);
        return errorK;
      }
      *sym = s;
      *type = s->typePtr;
      return s->typeVal;
      break;
    case expK:
      error = expTypeTravExp(t, v->val.varexp.exp);
      if(error == -1){
        fprintf(stderr, "Line %d: Hopefully the error was already printed\n", v->lineno);
        return errorK;
      }
      ty = expOfType(v->val.varexp.exp);
      if(ty != intK){
        fprintf(stderr, "Line %d: the index-expression have type %d, and does not cohere with type %d, expected here\n", v->lineno, ty, intK);
        return errorK;
      }
      //seaching type of array
      ty = expTypeTravVar(t, v->val.varexp.var, sym, type);
      if(ty == errorK){
        fprintf(stderr, "Line %d: Hopefully the error has already been printed\n", v->lineno);
        return ty;
      }
      if((*type) == NULL){
        fprintf(stderr, "Line %d: The array type does not exist\n", v->lineno);
        return errorK;
      }
      //check for user defined types
      if(ty == idK){
        *sym = recursiveSymbolRetrieval((*type)->scope, (*type)->val.id, NULL);
        if(*sym == NULL){
          fprintf(stderr, "Line %d: The symbol '%s' was not found", v->lineno, (*type)->val.id);
          return errorK;
        }
        if((*sym)->typeVal != arrayK || (*sym)->typePtr->kind != arrayK){
          fprintf(stderr, "Line %d: the symbol '%s' of type '%d' or '%d' was not found to be an array\n", v->lineno, (*sym)->name, (*sym)->typeVal, (*type)->kind);
          return errorK;
        }
        (*type) = (*sym)->typePtr;
      }
      (*type) = (*type)->val.arrayType;
      return (*type)->kind;
      break;
    case dotK:
      ty = expTypeTravVar(t, v->val.vardot.var, sym, type);
      if(ty == errorK){
        fprintf(stderr, "%s\n", "expTypeTravVar: error traversing variable.");
        return errorK;
      }
      //check if it is a userdefined record type
      if((*type)->kind == idK){
        *sym = recursiveSymbolRetrieval((*type)->scope, (*type)->val.id, NULL);
      }
      if(*sym == NULL){
        fprintf(stderr, "Line %d: The record was not found\n", v->lineno);
        return errorK;
      }
      if((*sym)->typeVal != recordK){
        fprintf(stderr, "Line %d: the symbol '%s' is not a record\n", v->lineno, (*sym)->name);
        return errorK;
      }
      SYMBOL *s = *sym;
      *sym = getRecordSymbol((*sym)->content, v->val.vardot.id);
      if(*sym == NULL){
        fprintf(stderr, "Unfortunately '%s' was not found insides '%s'\n", v->val.vardot.id, s->name);
        return errorK;
      }
      *type = (*sym)->typePtr;
      return (*sym)->typeVal;
      break;
  }
  return errorK;
}


/**
  Checks if all the arguments given at a function call match the parameter
  list of that function. Also the amount of arguments are verified.
*/
int expTypeTravExps(SymbolTable *t, EXP_LIST *eList, ParamSymbol* pSym){

  if(eList == NULL){
    //No arguments
    if(pSym == NULL){
      //no more parameters and arguments
      return 0;
    }
    else{
      //still more parameters
      fprintf(stderr, "Line %d: The function was not given enough arguments\n", -1);
      return -1;
    }
  }
  else{
    //still more arguments given
    if(pSym == NULL){
      //but no more parameters found
      fprintf(stderr, "Line %d: The function was given more arguments than needed\n", eList->lineno);
      return -1;
    }
    else{
      //still more parameters
      int error = expTypeTravExp(t, eList->exp);
      if(error == -1){
        fprintf(stderr, "Line %d: expTypeTravExps: type error in argument\n", eList->lineno);
        return -1;
      }
      SYMBOL *param = pSym->data;
      error = cmpTypeSymExp(t, param, eList->exp);
      if(error == -1){
        fprintf(stderr, "Line %d: The type %d of the argument, does not match expected type %d of parameter\n", eList->lineno, eList->exp->typekind, param->typeVal );
        return -1;
      }
      return expTypeTravExps(t, eList->expList, pSym->next);
    }
  }
}

//**********************************PHASE 3*********************//
/**
 * Checks if expression types match variable and context types
*/
int checkTypes(SymbolTable *t, BODY *body, char* funcId){
  return checkTypeTravBody(t, body, funcId);
}

/*
  Checks that all the statmenets in the given body has correct types
*/
int  checkTypeTravBody(SymbolTable *t,  BODY *body, char* funcId){
  int error = checkTypeTravDecls(t, body->vList);
  if(error == -1){
    return -1;
  }
  return checkTypeTravStmts(t, body->sList, funcId);
}


/**
 * Runs over all statements and returns if type error occurred
 * in any statement
*/
int checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList, char* funcId){
  int error = checkTypeTravStmt(t, sList->statement, funcId);
  if(error == -1){
    return error;
  }
  if(sList->statementList != NULL){
    return checkTypeTravStmts(t, sList->statementList, funcId);
  }
  return 0;
}


/**
 * Checks types of a given statement
 */
int checkTypeTravStmt(SymbolTable *t, STATEMENT *s, char* funcId){
  SYMBOL *sym;
  TYPE *type;
  int error;
  Typekind tk;
  VARIABLE *var;
  char *name;
  switch(s->kind){
    case returnK:
      ; //empty statement
      //check if type matches return type
      SymbolTable *parentScope = t->next; //this function is defined in parent scope
      if(parentScope == NULL){ //outeermost scope
        if(expOfType(s->val.return_) != intK){ //return type us int
          fprintf(stderr, "Line %d: Return type of main scope should be an integer\n", s->lineno);
          return -1;
        }
        return 0;
      }
      else{
        sym = getSymbol(parentScope, funcId, 0);
        if(sym == NULL){
          fprintf(stderr, "The surrounding function '%s' was not found", funcId);
          return -1;
        }
        //TODO: what if symbol is not a function?
        error = cmpTypeSymExp(t, sym, s->val.return_);
        if(error){
          fprintf(stderr, "Line %d: checkTypeTravStmt: return type error\n", s->lineno);
          return -1;
        }
        return 0;
      }
      break;
    case writeK:
      tk = expOfType(s->val.write);
      if(tk != intK && tk != boolK){
        fprintf(stderr, "Line %d: type of expression to be written is not int or bool\n", s->lineno);
        return -1;
      }
      return 0;
      break;
    case allocateK:
      type = checkTypeTravVar(t, s->val.allocate, &sym);
      if(sym == NULL){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", s->lineno);
        return -1;
      }
      name = sym->name;
      if(type->kind == idK){
        sym = recursiveSymbolRetrieval(sym->defScope, type->val.id, NULL);
        type = sym->typePtr;
      }
      if(type->kind != recordK){
        fprintf(stderr, "Line %d: The (indexing of) variabel %s of type %d cannot be allocated as it is not a record\n", s->lineno, name, type->kind);
        return -1;
      }
      // if(sym->typeVal == idK){
      //   if(sym->typePtr->kind != idK){
      //     fprintf(stderr, "Line %d: Type %d does not coehere with type %d for symbol %s", s->lineno, sym->typeVal, sym->typePtr->kind, sym->name);
      //     return -1;
      //   }
      // }
      return 0;
      break;
    case allocateLengthK:
      //check user type
      sym = NULL;
      type = checkTypeTravVar(t, s->val.allocatelength.var, &sym);
      if(sym == NULL){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", s->lineno);
        return -1;
      }
      name = sym->name;
      if(type->kind == idK){
        sym = recursiveSymbolRetrieval(sym->defScope, type->val.id, NULL);
        type = sym->typePtr;
      }
      if(type->kind != arrayK){
        fprintf(stderr, "Line %d: The (indexing of) variabel %s of type %d cannot be length allocated as it is not an array\n", s->lineno, name, type->kind);
        return -1;
      }
      // if(sym->typeVal == idK){
      //   if(sym->typePtr->kind != idK){
      //     fprintf(stderr, "Line %d: Type %d does not coehere with type %d for symbol %s", s->lineno, sym->typeVal, sym->typePtr->kind, sym->name);
      //     return -1;
      //   }
      // }
      // if(sym->kind != varS){
      //   fprintf(stderr,"Line %d: can only allocate variables\n", s->lineno);
      //   fprintf(stderr, "Something weird here: pretend everything is fine\n");
      // }
      tk = expOfType(s->val.allocatelength.exp);
      if(tk != intK){
        fprintf(stderr,"Line %d: Amount to be allocated is not a number\n", s->lineno);
        return -1;
      }
      return 0;
      break;
    case assiK:
    ;
      SYMBOL *sym = NULL;
      type = checkTypeTravVar(t, s->val.assign.var, &sym);
      if(type == NULL){
        fprintf(stderr, "Line %d: Unfortunately no type where found\n", s->lineno);
        return -1;
      }
      if(sym == NULL){
        fprintf(stderr, "Line %d: Unfortunately no symbol where found\n", s->lineno);
        return -1;
      }
      error = cmpTypeTyExp(t, type, s->val.assign.exp);
      if(error == -1){
        fprintf(stderr, "Line %d: The two sides of the assignment does not have the same type\n", s->lineno);
        return -1;
      }
      return 0;
      break;
    case ifK:
      //check if the expression is bool
      tk = expOfType(s->val.ifthenelse.cond);
      if(tk != boolK){
        fprintf(stderr,"Line %d: Type of condition in if-statmemt should be boolean\n", s->lineno);
      }
      //traverse body
      error = checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      if(error == -1){
        return -1;
      }
      break;
    case thenK:
      //check if the expression is bool
      tk = expOfType(s->val.ifthenelse.cond);
      if(tk != boolK){
        fprintf(stderr,"Line %d: Type of condition in if-statmemt should be boolean\n", s->lineno);
      }
      //traverse both bodies
      error = checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      if(error == -1){
        return -1;
      }
      error = checkTypeTravStmt(t, s->val.ifthenelse.elsebody, funcId);
      if(error == -1){
        return -1;
      }
      return 0;
      break;
    case whileK:
      whileLoopCounter++;
      //check if the expression is bool
      tk = expOfType(s->val.ifthenelse.cond);
      if(tk != boolK){
        fprintf(stderr,"Line %d: Type of condition in if-statmemt should be boolean\n", s->lineno);
        whileLoopCounter--;
        return -1;
      }
      //traverse body
      error = checkTypeTravStmt(t, s->val.while_.body, funcId);
      if(error == -1){
        whileLoopCounter--;
        return -1;
      }
      whileLoopCounter--;
      return 0;
      break;
    case listStmtK:
      //traverse statements
      error =checkTypeTravStmts(t, s->val.list, funcId);
      if(error == -1){
        return -1;
      }
      return 0;
      break;
    case breakK:
    case continueK:
      ;
      if(whileLoopCounter >= 1){
        return 0;
      } else {
        fprintf(stderr, "%s\n", "checkTypeTravStmt: you are not allowed to break or continue outside loops");
        return -1;
      }
      break;
  }
  return 0;
}

TYPE* checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym){
  SYMBOL *sym2;
  TYPE *type;
  switch (v->kind) {
    case idVarK:
      sym2 = getSymbol(t, v->val.id, 0);
      if(sym2 == NULL){
        fprintf(stderr, "Line %d: Symbol '%s' was not found\n",v->lineno, v->val.id);
        return NULL;
      }
      (*sym) = sym2;
      return sym2->typePtr;
      break;
    case expK:
      //checking index expression
      if(expOfType(v->val.varexp.exp) != intK){
        fprintf(stderr, "Line %d: The index expression is not an integer type\n", v->lineno);
      }
      //searching
      type = checkTypeTravVar(t, v->val.varexp.var, sym);
      if(type == NULL){
        fprintf(stderr, "Line %d: The array type does not exist\n", v->lineno);
        return NULL;
      }
      if(type->kind == errorK){
        fprintf(stderr, "Line %d: checkTypeTravVar ERROR.\n", v->lineno);
        return NULL;
      }
      //check for user defined types
      if(type->kind == idK){
        *sym = recursiveSymbolRetrieval(type->scope, type->val.id, NULL);
        if(*sym == NULL){
          fprintf(stderr, "Line %d: The symbol '%s' was not found", v->lineno, type->val.id);
          return NULL;
        }
        if((*sym)->typeVal != arrayK){
          fprintf(stderr, "Line %d: the symbol '%s' of type '%d' was not found to be an array\n", v->lineno, (*sym)->name, (*sym)->typeVal);
          return NULL;
        }
        type = (*sym)->typePtr;
      }
      if(type->kind != arrayK){
        fprintf(stderr, "Line %d: the symbol '%s' of type '%d' was not found to be an array\n", v->lineno, (*sym)->name, type->kind);
        return NULL;
      }
      return type->val.arrayType;
      break;
    case dotK:
      ;
      SYMBOL* newSym = NULL;
      type = checkTypeTravVar(t, v->val.vardot.var, sym);
      if(type->kind == idK){
        newSym = recursiveSymbolRetrieval(type->scope, type->val.id, NULL);
      }
      else if (type->kind == recordK){
        newSym = *sym;

      }
      if(newSym == NULL){
        fprintf(stderr, "Line %d: checkTypeTravVar: something went wrong\n", v->lineno);
        fprintf(stderr, "Line %d: Could not find struct containing '%s'\n", v->lineno, v->val.vardot.id );
        return NULL;
        break;
      }
      if(newSym->typeVal != recordK){
        fprintf(stderr, "Line %d: checkTypeTravVar: returned symbol was not recordK type!\n", v->lineno);
        return NULL;
      }
      if(newSym->content == NULL){
        fprintf(stderr, "%d\n", (*sym)->typeVal);
        fprintf(stderr, "Line %d: holy shit, the struct '%s' does not have any content\n", v->lineno, (*sym)->name);
        return NULL;
      }
      *sym = getRecordSymbol(newSym->content, v->val.vardot.id);
      if(*sym == NULL){
        fprintf(stderr, "Line %d: dotK: Symbol '%s' was not found\n",v->lineno, v->val.vardot.id);
        return NULL;
      }
      //sym already updated
      return (*sym)->typePtr;
      break;
  }
  return NULL;
}

/**
  This function expands the user type until a simple type is found.
  rename:expandUserType
*/
SYMBOL* recursiveSymbolRetrieval(SymbolTable *t, char* symbolID, SymbolList *knownSyms){
  SYMBOL* sym = getSymbol(t, symbolID, 1);
  if(sym == NULL){
    fprintf(stderr, "Line %d: recursiveSymbolRetrieval: symbol id: %s not in scope\n", -1, symbolID);
    return NULL;
  }
  if(knownSyms != NULL){
    if(sym->kind != typeS){
      fprintf(stderr, "Line %d: The id with kind %d is not a type\n", sym->typePtr->lineno, sym->kind);
      return NULL;
    }
  }
  t = sym->typePtr->scope;
  SymbolList *nextSym = knownSyms;
  while(nextSym != NULL){
    if(sym == nextSym->symbol){
      fprintf(stderr, "Circular typedefinition for symbol '%s'\n", sym->name);
      return NULL;
    }
    nextSym = nextSym->next;
  }
  if(sym->typeVal == idK) {
    if(sym->typePtr->kind == idK){
      if(knownSyms == NULL){
        knownSyms = NEW(SymbolList);
        knownSyms->symbol = sym;
        knownSyms->next = NULL;
      }
      else{
        nextSym = knownSyms;
        while(nextSym->next != NULL){
          nextSym = nextSym->next;
        }
        nextSym->next = NEW(SymbolList);
        nextSym->next->symbol = sym;
        nextSym->next->next = NULL;
      }
      sym = recursiveSymbolRetrieval(sym->typePtr->scope, sym->typePtr->val.id, knownSyms);
    } else {
      fprintf(stderr, "Line %d: COMPILEERROR: typePtr of symbol not idK\n", -1);
      return NULL;
    }
  }
  return sym;
}

Typekind expOfType(EXP *exp){
  if(exp->typekind == idK){
    TYPE *type = exp->type;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: Expression of type '%d' does not match its type of type '%d'\n", exp->lineno, idK, type->kind);
      return errorK;
    }
    SYMBOL *sym = recursiveSymbolRetrieval(type->scope, type->val.id, NULL);
    if(sym == NULL){
      fprintf(stderr, "Line %d: Error happened while expanding the type of '%s'\n", exp->lineno, type->val.id);
      return -1;
    }
    return sym->typeVal;
  }
  else
    return exp->typekind;
}

int cmpTypeSymExp(SymbolTable *t, SYMBOL *sym, EXP *exp){
  if(exp == NULL){
    fprintf(stderr, "No expression given\n");
    return -1;
  }
  if(sym == NULL){
    fprintf(stderr, "No symbol given\n");
    return -1;
  }
  if(sym->typeVal == idK){                              //sym->name
    sym = recursiveSymbolRetrieval(sym->typePtr->scope, sym->typePtr->val.id, NULL);
    if(sym == NULL){
      return -1;
    }
  }
  if(sym->typePtr == exp->type){
    return 0;
  }
  int error = cmpTypekind(sym->typeVal, exp->typekind);
  if(error == 0){ return 0; }
  if(exp->typekind == arrayK || exp->typekind == recordK || exp->typekind == idK){
    return cmpTypeSymTy(t, sym, exp->type);
  }
  fprintf(stderr, "Line %d: The type %d of the expression does not match the type %d of the symbol %s\n", exp->lineno, exp->typekind, sym->typeVal, sym->name);
  return -1;
}

int cmpTypeTyExp(SymbolTable *t, TYPE *ty, EXP *exp){
  if(exp == NULL){
    fprintf(stderr, "No expression given\n");
    return -1;
  }
  if(ty->kind == idK){
    SYMBOL *sym = recursiveSymbolRetrieval(ty->scope, ty->val.id, NULL);
    if(sym == NULL){
      return -1;
    }
    return cmpTypeSymExp(t, sym, exp);
  }
  int error = cmpTypekind(ty->kind, exp->typekind);
  if(error == 0){ return 0; }

  if(exp->typekind == arrayK || exp->typekind == recordK || exp->typekind == idK){
    return cmpTypeTyTy(t, ty, exp->type);
  }
  fprintf(stderr, "Line %d: The type %d of the expression does not match the type %d\n", exp->lineno, exp->typekind, ty->kind);
  return -1;
}

int cmpTypekind(Typekind tk1, Typekind tk2){
  if(tk1 == tk2){
    switch(tk1){
      case errorK:
      case recordK:
      case idK:
      case nullKK:
      case arrayK:
        fprintf(stderr, "Equal types %d not valid\n",  tk1);
        return -1;
      case intK:
      case boolK:
        return 0;
    }
  }
  if(((tk1 == recordK) || (tk1 == arrayK)) && tk2 == nullKK){
    return 0;
  }
  if(((tk2 == recordK) || (tk2 == arrayK)) && tk1 == nullKK){
    return 0;
  }
  return -1;
}

int cmpTypeTyTy(SymbolTable *t, TYPE *ty1, TYPE *ty2){
  if(ty1 == NULL){
    fprintf(stderr, "Missing first type\n");
    return -1;
  }
  if(ty2 == NULL){
    fprintf(stderr, "Missing second type\n");
    return -1;
  }
  if(ty1 == ty2){
    return 0;
  }
  Typekind tk1 = ty1->kind;
  Typekind tk2 = ty2->kind;
  SYMBOL *sym1 = NULL;
  SYMBOL *sym2 = NULL;
  if(tk1 == idK){
    sym1 = recursiveSymbolRetrieval(ty1->scope, ty1->val.id, NULL);
    if(sym1 == NULL){
      fprintf(stderr, "The symbol '%s' was not found\n", ty1->val.id);
      return -1;
    }
    return cmpTypeSymTy(t, sym1, ty2);

    tk1 = sym1->typeVal;
    if(tk1 != sym1->typePtr->kind){
      fprintf(stderr, "Types of symbol '%s' and its type doesn't match\n", sym1->name);
      return -1;
    }
  }
  if(tk2 == idK){
    sym2 = recursiveSymbolRetrieval(ty2->scope, ty2->val.id, NULL);
    if(sym2 == NULL){
      fprintf(stderr, "The symbol '%s' was not found\n", ty2->val.id);
      return -1;
    }
    tk2 = sym2->typeVal;
    if(tk2 != sym2->typePtr->kind){
      fprintf(stderr, "Types of symbol '%s' and its type doesn't match\n", sym2->name);
      return -1;
    }
    return cmpTypeSymTy(t, sym2, ty1);
  }
  if(tk1 == tk2 && tk1 == arrayK){
    return cmpTypeTyTy(t,ty1->val.arrayType, ty2->val.arrayType);
  }
  return cmpTypekind(tk1,tk2);
}


int cmpTypeSymTy(SymbolTable *t, SYMBOL *sym, TYPE *ty){
  if(sym == NULL){
    fprintf(stderr, "Missing symbol\n");
    return -1;
  }
  if(ty == NULL){
    fprintf(stderr, "Missing type\n");
    return -1;
  }
  Typekind tk1 = sym->typeVal;
  Typekind tk2 = ty->kind;
  SYMBOL *sym2 = NULL;
  if(tk1 == idK){                                 //sym->name
    sym = recursiveSymbolRetrieval(sym->defScope, sym->typePtr->val.id, NULL);
    if(sym == NULL){
      fprintf(stderr, "The symbol '%s' was not found\n", sym->name);
      return -1;
    }
    tk1 = sym->typeVal;
    if(tk1 != sym->typePtr->kind){
      fprintf(stderr, "Types of symbol '%s' and its type doesn't match\n", sym->name);
      return -1;
    }
  }
  if(tk2 == idK){
    sym2 = recursiveSymbolRetrieval(ty->scope, ty->val.id, NULL);
    if(sym2 == NULL){
      fprintf(stderr, "The symbol '%s' was not found\n", ty->val.id);
      return -1;
    }
    tk2 = sym2->typeVal;
    if(tk2 != sym2->typePtr->kind){
      fprintf(stderr, "Types of symbol '%s' and its type doesn't match\n", sym2->name);
      return -1;
    }
    return cmpTypeSymSym(t, sym, sym2);
  }
  if(tk1 == tk2 && tk1 == arrayK){
    return cmpTypeTyTy(t,sym->typePtr, ty);
  }
  return cmpTypekind(tk1,tk2);
}


int cmpTypeSymSym(SymbolTable *t, SYMBOL *sym1, SYMBOL *sym2){
  if(sym1 == NULL){
    fprintf(stderr, "Missing symbol 1\n");
    return -1;
  }
  if(sym2 == NULL){
    fprintf(stderr, "Missing symbol 2\n");
    return -1;
  }
  char* name1 = sym1->name;
  char* name2 = sym2->name;
  if(sym1->typeVal == idK){                               //sym1->name
    sym1 = recursiveSymbolRetrieval(sym1->typePtr->scope, sym1->typePtr->val.id, NULL);
    if(sym1 == NULL){
      fprintf(stderr, "Couldn't expand type for symbol %s\n", name1);
      return -1;
    }
  }
  if(sym2->typeVal == idK){                               //sym2->name
    sym2 = recursiveSymbolRetrieval(sym2->typePtr->scope, sym2->typePtr->val.id, NULL);
    if(sym2 == NULL){
      fprintf(stderr, "Couldn't expand type for symbol %s\n", name2);
      return -1;
    }
  }
  Typekind tk1 = sym1->typeVal;
  Typekind tk2 = sym2->typeVal;
  if(tk1 == nullKK){
    fprintf(stderr, "Symbol '%s' has disallowed null type\n", name1);
    return -1;
  }
  if(tk2 == nullKK){
    fprintf(stderr, "Symbol '%s' has disallowed null type\n", name2);
    return -1;
  }
  if(tk1 == tk2 && tk1 == recordK){
    if(sym1->content != sym2->content){
      fprintf(stderr, "The two symbols %s and %s does not have same record type\n", name1, name2);
      return -1;
    }
    return 0;
  }
  if(tk1 == tk2 && tk1 == arrayK){
    return cmpTypeTyTy(t,sym1->typePtr, sym2->typePtr);
  }
  return cmpTypekind(tk1, tk2);
}

int checkTypeTravDecls(SymbolTable *t, DECL_LIST *decls){
  SYMBOL *sym;
  if(decls == NULL){ //no more declarations
    return 0;
  }
  DECLARATION *d = decls->decl;
  if(d == NULL){
    return 0;
  }
  switch (d->kind) {
    case listK:
      if(checkTypeTravVDecls(t, d->val.list) == -1){
        return -1;
      }
    break;
    case funcK:
      if(d->val.func->head->type->kind == idK){
        sym = recursiveSymbolRetrieval(t, d->val.func->head->type->val.id, NULL);
        if(sym == NULL){
          return -1;
        }
      }
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        sym = getSymbol(t, d->val.func->head->id, 0);
        if(sym == NULL){
          fprintf(stderr, "Line %d: The function %s was not found in current scope\n", d->val.func->head->lineno, d->val.func->head->id);
          return -1;
        }
        SymbolTable *childScope = sym->scope;
        if(childScope == NULL){
          fprintf(stderr, "Line %d: The function %s does not seem to define a scope\n", d->val.func->head->lineno, d->val.func->head->id);
          return -1;
        }
        //checking that types of all parameters exists
        //TODO: is childScope the right scope?
        VAR_DECL_LIST *vList = pList->vList;
        while(vList != NULL){
          sym = getSymbol(childScope, vList->vType->id, 0);
          if(sym == NULL){
            return -1;
          }
          if(sym->typeVal == idK){
            sym = recursiveSymbolRetrieval(childScope, sym->typePtr->val.id, NULL);
          }
          if(sym == NULL){
            return -1;
          }
          vList = vList->vList;
        }
      }
    break;
    case idDeclK: //userdefined types
      /*
       * visited bruges til at stoppe os fra at lave uendelig loop
       * ved brugerdefinerede typer der indeholder andre bruger definerede
       * typer
       */
      sym = recursiveSymbolRetrieval(t, d->val.id.id, NULL);
      if(sym == NULL){
        return -1;
      }
      if(sym->visited == true){
        sym->visited = false;
        return 0;
      }
      else{
        sym->visited = true;
      }
      if(d->val.id.type->kind == recordK){
        int error = checkTypeTravVDecls(sym->content, d->val.id.type->val.vList);
        sym->visited = false;
        if(error == -1){
          return -1;
        }
      }
    }
    return checkTypeTravDecls(t, decls->decl_list);
  }

/**
  Traverses all variables defined by the same 'var' keyword
  Saves the variables in the symboltable t
*/
int checkTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls){
  if(vDecls == NULL){ //no variables
    return 0;
  }
  VAR_TYPE *vty = vDecls->vType;
  SYMBOL *sym = getSymbol(t, vty->id, 0);
  Typekind tk = vty->type->kind;
  TYPE *ty = vty->type;
    switch(tk){
      case arrayK:
        while(tk == arrayK){
          ty = ty->val.arrayType;
          tk = ty->kind;
        }
        //fall into default
      default:
        switch(tk){
          case arrayK:
            fprintf(stderr, "Line %d: Type %d error \n", vty->lineno, tk);
            return -1;
            break;
          case nullKK:
            fprintf(stderr, "Line %d: Type %d error \n", vty->lineno, tk);
            return -1;
            break;
          case errorK:
            fprintf(stderr, "Line %d: Type error\n", vty->lineno);
            return -1;
            break;
          case intK:
          case boolK:
            return 0;
            break;
          case recordK:
          ; //empty statement
            int error = checkTypeTravVDecls(sym->content, ty->val.vList);
            if(error == -1){
              return -1;
            }
            break;
          case idK:
            //sym = recursiveSymbolRetrieval(t, ty->val.id, NULL);
            //only go down one level
            //we should go further down when the type of that level
            //is itself investigated
            sym = getSymbol(t, ty->val.id, 1);
            if(sym == NULL){
              fprintf(stderr, "Line %d: The symbol %s was not found\n", ty->lineno, ty->val.id);
              return -1;
            }
            if(sym->kind == varS){
              fprintf(stderr, "Line %d: The variable %s cannot have the variable %s as type\n", vty->lineno, vty->id, sym->name);
              return -1;
            }
            if(sym->kind == funcK){
              fprintf(stderr, "Line %d: The variable %s cannot have the function %s as type\n", vty->lineno, vty->id, sym->name);
              return -1;
            }
            break;
      }
    }
    return checkTypeTravVDecls(t, vDecls->vList);
}

bodyList* initBodyList(){
  bodyList* l = Malloc(sizeof(BODY));
  l->head = NULL;
  l->tail = NULL;
  l->next = NULL;
  return l;
}

void saveBody(bodyList *list, BODY *body, SymbolTable* scope, char* funcId, SymbolTable* defScope){
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
  list->tail->defScope = defScope;
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
