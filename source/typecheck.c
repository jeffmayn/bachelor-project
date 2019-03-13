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


/**
  Main function for type checking
  This function has three phases
  idTypeFinder collects all identifiers into the SymbolTable
  expTypeFinder collects the types of expressions
  checkTypes checks if expressions and variables fits
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
  First parameter is the current scope
  Second parameter is for saving bodies for later traversals

*/
int idTypeFinder(SymbolTable *table, bodyList *bList){
  saveBody(bList, theexpression, table, NULL);
  return idTypeTravBody(table, theexpression, bList);
}

/**
 Traverses the body of a given function
 First parameter is the current scope
 Second paramter is the body
 Third parameter is the list of bodies for later phases
*/
int idTypeTravBody(SymbolTable *t, BODY *body, bodyList *bList){
  fprintf(stderr,"idTypeTravBody\n");
  return idTypeTravDecls(t,body->vList, bList);
}

/**
  traverse declarations for collecting ids
*/
int idTypeTravDecls(SymbolTable *t, DECL_LIST *decls, bodyList *bList){
  SYMBOL *sym;
  if(decls == NULL){ //no more declarations
    return 0;
  }
  //TODO things
  DECLARATION *d = decls->decl;
  if(d == NULL){
    fprintf(stderr,"Line %d: The declaration list did not contain any declarations\n", decls->lineno);
    return 0;
  }
  //fprintf(stderr,"id of kind %d found in travDecls\n", d->kind);
  switch (d->kind) {
    case listK: //variables
      idTypeTravVDecls(t, d->val.list);
    break;
    case funcK: //function
      ; //empty statement
      //create new scope
      SymbolTable *child = scopeSymbolTable(t);
      //add function to current scope
      sym = putSymbol(t, d->val.func->head->id, 0, funcS, d->val.func->head->type->kind, child, d->val.func->head->type); //add some shit for named types, records and arrays
      if(sym == NULL){
        fprintf(stderr, "Line %d: The symbol '%s' already exists\n", d->lineno, d->val.func->head->id);
      }
      //add parameters to that scope
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        VAR_DECL_LIST *vList = pList->vList;
        if(vList != NULL){
          while(vList != NULL){
            fprintf(stderr,"about to put params for %s\n", d->val.func->head->id);
            if(vList->vType->type->kind == arrayK){
              putParam(child, vList->vType->id, 0, varS, vList->vType->type->kind, vList->vType->type); //can a parameter be anything different from a variable (func or type)
            }
            else{
              //redundant
              putParam(child, vList->vType->id, 0, varS, vList->vType->type->kind, vList->vType->type); //can a parameter be anything different from a variable (func or type)
            }
            vList = vList->vList;
          }
        }
      }
      //recursively traverse on body of function
      idTypeTravBody(child,d->val.func->body, bList);
      //save body for statement traversal
      saveBody(bList, d->val.func->body, child, d->val.func->head->id);
    break;
    case idDeclK: //userdefined types
      //TODO: may be copied from somewhere else
      //fprintf(stderr,"%s of type %d put into SymbolTable\n", d->val.id.id, d->val.id.type->kind);
      ;
      sym = putSymbol(t, d->val.id.id, 0, typeS, d->val.id.type->kind, NULL, d->val.id.type);
      //TODO: something more to add in case of struct
      //might be done
      if(d->val.id.type->kind == recordK){
        //put all variables of record vty->id
        sym->content = initSymbolTable();
        idTypeTravVDecls(sym->content, d->val.id.type->val.vList);
      }
    break;
  }
  //go onto next declaration
  return idTypeTravDecls(t, decls->decl_list, bList);

}

/**
  Traverses all variables defined by the same 'var' keyword
  Saves the variables in the symboltable t
*/
int idTypeTravVDecls(SymbolTable *t, VAR_DECL_LIST *vDecls){
  if(vDecls == NULL){ //no variables
    return 0;
  }
  //TODO: may have been done
  VAR_TYPE *vty = vDecls->vType;
  SYMBOL *sym = NULL;
  if(vty->type->kind == recordK){
    SYMBOL *sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
    //put all variables of record vty->id
    sym->content=initSymbolTable();
    idTypeTravVDecls(sym->content, vty->type->val.vList);
  }
  else if(vty->type->kind == arrayK){
    //redundant
    fprintf(stderr, "Line %d: putting id (of type array) %s into symboltable\n", vty->lineno, vty->id);
    sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  }
  else{
    fprintf(stderr, "Line %d: putting id %s into symboltable\n", vty->lineno, vty->id);
    sym = putSymbol(t, vty->id, 0, varS, vty->type->kind, NULL, vty->type); //next to last param is the type of the variable //further shit to be added for named types, records and arrays
  }
  if(sym == NULL){
    fprintf(stderr, "Line %d: The symbol '%s' already exist\n", vty->lineno, vty->id);
    return -1;
  }
  return idTypeTravVDecls(t, vDecls->vList);
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
  expTypeTravStmt(t, sList->statement);
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
  switch(s->kind){
    case returnK:
      return expTypeTravExp(t, s->val.return_);
      break;
    case writeK:
      return expTypeTravExp(t, s->val.write);
      break;
    case allocateK:
      fprintf(stderr,"expTypeTravStmt allocateK not implemented\n");
      return 0;
      break;
    case allocateLengthK:
      fprintf(stderr,"expTypeTravStmt allocateLengthK not implemented\n");
      return expTypeTravExp(t, s->val.allocatelength.exp);
      return 0;
      break;
    case assiK:
      return expTypeTravExp(t, s->val.assign.exp);
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
      i = expTypeTravExp(t, s->val.while_.cond);
      if(i == 0){
        return expTypeTravStmt(t, s->val.while_.body);
      }
      return i;
      break;
    case listStmtK:
      return expTypeTravStmts(t, s->val.list);
      break;
  }
  return -1; //compiler warning
}

/**
  Traversing expressions
  Saves the type of an expression in that expression
*/
int expTypeTravExp(SymbolTable *t, EXP *exp){
  //error cheking needed from recursive calls
  switch(exp->kind){
    case termK:
      ; //empty statement
      TYPE *type = NULL;
      Typekind ty = expTypeTravTerm(t, exp->val.term, &type);
      exp->typekind = ty; // =type->kind ?
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
      Typekind type1 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type2 = expTypeTravExp(t, exp->val.binOP.right);
      if(type1 == type2 && type1 == intK){
        exp->typekind = intK;
        return 0;
      }
      fprintf(stderr,"Line %d: expTypeTravExp left and right not both integers.\n", exp->lineno);
      exp->typekind = errorK;
      return -1;
    case andK:
    case orK:
      ; //empty statement
      Typekind type3 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type4 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type3 == type4 && type3== boolK){
        exp->typekind = boolK;
        return 0;
      }
      fprintf(stderr,"Line %d: expTypeTravExp left and right not both booleans.\n", exp->lineno);
      exp->typekind = errorK;
      return -1;
    case leK: //TODO er det ok at left og right bare er ens og vi så returnere en bool
    case eqK:
    case geK:
    case greatK:
    case lessK:
    case neK:
      ; //empty statement
      //TODO: need to check for user types here also
      Typekind type5 = expTypeTravExp(t, exp->val.binOP.left);
      Typekind type6 = expTypeTravExp(t, exp->val.binOP.right);
      //Here we could check if the two types are the same
      if(type5 == type6){
        exp->typekind = boolK;
        return 0;
      }
      fprintf(stderr,"expTypeTravExp left and right not same type.\n");
      exp->typekind = errorK;
      return -1;
  }
  return -1; //compiler warning
}

Typekind expTypeTravTerm(SymbolTable *t, TERM *term, TYPE **type){
  //TYPE *type;
  Typekind ty;
  switch(term->kind){
    case varK: //variable
      ; //empty statement
      SYMBOL *sym = NULL; //to avoid dereferencing null
      ty = expTypeTravVar(t, term->val.var, &sym, type); //the symbol is not used
      if((*type) == NULL){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", term->lineno);
        return errorK; //Hopefully error is already printed;
      }
      return (*type)->kind; //=ty?
      // if(typekind == -1){
      //   //error message should be printed in expTypeTravVar
      //   return -1;
      // }
      // return typekind;
      break;
    case idTermK: //function call
      ; //empty statement
      SYMBOL *s = getSymbol(t, term->val.idact.id);
      if(s == NULL){
        fprintf(stderr,"Line %d: idtermK: Symbol '%s' where not found\n", term->lineno, term->val.idact.id);
        return errorK;
      }
      //maybe i should check if this is a function or something else
      if(s->kind != funcK){
        fprintf(stderr, "Line %d: The symbol '%s' is not a function\n",  term->lineno, term->val.idact.id);
        return errorK;
      }
      ACT_LIST *act = term->val.idact.list;
      if(act != NULL){
        int error = expTypeTravExps(s->scope, act->expList, s->scope->param);
        if(error){
          return errorK; //error message should be printed in expTypeTravExps
        }
      }
      *type = s->typePtr;
      return s->typePtr->kind;
      //fprintf(stderr,"expTypeTravTerm: maybe funktion calls not yet implemented\n");
      break;
    case expTermK: //parentheses
    ;
      int error = expTypeTravExp(t, term->val.exp);
      if(error == -1){
        return errorK;
      }
      *type = term->val.exp->type;
      return term->val.exp->typekind;
      break;
    case notTermK: //negation
      ; //empty statement
      ty = expTypeTravTerm(t, term->val.notTerm, type);
      if(*type == NULL){
        fprintf(stderr, "Line %d: Hopefully error is already printed\n", term->lineno);
        *type = NULL;
        return errorK; //Hopefully error is already printed;
      }
      if((*type)->kind != boolK){
        fprintf(stderr,"Line %d: Cannot negate something of different type than boolean\n", term->lineno);
        *type = NULL;
        return errorK;
      }
      return ty;
      break;
    case expCardK: //cardinality
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
      fprintf(stderr,"expTypeTravTerm: Assuming a NULL is a record with no type\n");
      return recordK;
      break;
  }
    return -1; //compiler warning
}

Typekind expTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym, TYPE **type){
  SYMBOL *s;
  Typekind ty;
  switch(v->kind){
    case idVarK:
      ; //empty statement
      s = getSymbol(t, v->val.id);
      if(s == NULL){
        fprintf(stderr,"Line %d: ID %s, not found\n", v->lineno, v->val.id);
        return errorK;

      }
      if(s->kind == typeS){
        fprintf(stderr, "Line %d: cannot assign type to variable '%s'\n", v->lineno, v->val.id);
        return errorK;
      }
      *sym = s; //may be relevant in some cases
      *type = s->typePtr;
      return s->typeVal;
      break;
    case expK:
      fprintf(stderr,"Line %d: expTypeTravVar: Arrays not yet supported\n", v->lineno);
      int error = expTypeTravExp(t, v->val.varexp.exp);
      if(error == -1){
        fprintf(stderr, "Line %d: Hopefully the error was already printed\n", v->lineno);
        return errorK;
      }
      Typekind ty = expOfType(t, v->val.varexp.exp);
      if(ty != intK){
        fprintf(stderr, "Line %d: the index-expression have type %d, and does not cohere with type %d, expected here\n", v->lineno, ty, intK);
        return errorK;
      }
      // s = getSymbol(t, v->val.varexp.var->val.id);
      // if(s == NULL){
      //   fprintf(stderr,"Line %d: ID %s, not found\n", v->lineno, v->val.id);
      //   return errorK;
      // }
      ty = expTypeTravVar(t, v->val.varexp.var, sym, type);
      if(ty == errorK){
        fprintf(stderr, "Line %d: Hopefully the error has already been printed\n", v->lineno);
        return ty;
      }
      //TODO: check for user defined types
      if(ty != arrayK){
        fprintf(stderr, "Line %d: the variable was not found to be an array\n", v->lineno);
        return errorK;
      }
      //(*sym) = s;
      (*type) = (*type)->val.arrayType;
      return (*sym)->typeVal;
      // TYPE* ty = expTypeTravType(t, v->val.varexp.var, sym);
      // return ty->val.arrayType;
      // TYPE *ty = expTypeTravType(t,v,s);
      // if(ty == NULL){
      //   //Some error in expTypeTravType
      //   fprintf(stderr, "Line %d: Hopefully error is already printed\n", v->lineno);
      //   return errorK;
      // }
      // (*type) = ty;
      // return s->typeVal;
      //********We are in deep shit trouble right now*******//
      break;
    case dotK:
      //fprintf(stderr,"expTypeTravVar: records not yet supported\n");
      ; //empty statement
      ty = expTypeTravVar(t, v->val.vardot.var, sym, type);
      // if(type == arrayK){
      //   if(*type != NULL){
      //     printf("Line %d: expTypeTravVar: case dotk: array found??", v->lineno);
      //     //arrayType->kind;
      //     return -1;
      //     break;
      //   }
      // }
      if(*sym == NULL){
        fprintf(stderr, "Line %d: The record was not found\n", v->lineno);
        return errorK;
      }
      //TODO: check if it is a userdefined record type
      //Probably need this check a lot of other places for all kindes of types
      if(type != recordK){
        fprintf(stderr, "Line %d: the symbol '%s' is not a record\n", v->lineno, (*sym)->name);
        return errorK;
      }
      *sym = getSymbol((*sym)->content, v->val.vardot.id);
      if(*sym == NULL){
        fprintf(stderr, "Unfortunately '%s' was not found insides '%s'\n", v->val.vardot.id, (*sym)->name);
        return -1;
      }
      return (*sym)->typeVal;
      break;
  }
  return errorK; //compiler warning
}

// TYPE* expTypeTravType(SymbolTable *t, VARIABLE *v, SYMBOL *sym){ //used to traverse types for arrays
//   if(v->kind == expK){
//     int type = expTypeTravExp(t, v->val.varexp.exp);
//     if(type != 1){
//       fprintf(stderr, "Line %d: the index-expression have type %d, and does not cohere with type %d, expected here\n", v->lineno, type, intK);
//       return NULL;
//     }
//     TYPE* ty = expTypeTravType(t, v->val.varexp.var, sym);
//     return ty->val.arrayType;
//   }
//   else{
//     SYMBOL *sym = NULL;
//     TYPE *type = NULL;
//     Typekind typekind = expTypeTravVar(t, v, &sym, &type);
//     if(sym == NULL){
//       fprintf(stderr, "Line %d: ExpTypeTravType: no symbol found\n", v->lineno);
//       return NULL;
//     }
//     return sym->arrayType;
//   }
// }

int expTypeTravExps(SymbolTable *t, EXP_LIST *eList, SYMBOL* param){
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
      if(type != param->typeVal){
        fprintf(stderr, "Line %d: The type %d of the argument, does not match expected type %d of parameter\n", eList->lineno, type, param->typeVal );
        return -1;
      }
      return expTypeTravExps(t, eList->expList, param->next);
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
løb over alle statements og check om expressions passer til statements
*/

int  checkTypeTravBody(SymbolTable *t,  BODY *body, char* funcId){
  return checkTypeTravStmts(t, body->sList, funcId);
}

int checkTypeTravStmts(SymbolTable *t, STATEMENT_LIST *sList, char* funcId){
  fprintf(stderr, "checkTypeTravStmts\n");
  int error = checkTypeTravStmt(t, sList->statement, funcId);
  if(error == -1){
    return error;
  }
  if(sList->statementList != NULL){
    return checkTypeTravStmts(t, sList->statementList, funcId);
  }
  return 0;
}

int checkTypeTravStmt(SymbolTable *t, STATEMENT *s, char* funcId){
  fprintf(stderr, "checkTypeTravStmt\n");
  SYMBOL *sym;
  TYPE *type;
  int error;
  Typekind tk;
  switch(s->kind){
    case returnK:
      ; //empty statement
      //check if type matches return type
      SymbolTable *parentScope = t->next; //this function is defined in parent scope
      if(parentScope == NULL){
        //We are in the outermost scope
        //we assume the return type is int
        //type = intK;
        if(expOfType(t, s->val.return_) != intK){
          fprintf(stderr, "Line %d: Return type of main scope should be an integer\n", s->lineno);
        }
      }
      else{
        sym = getSymbol(parentScope, funcId);
        if(sym == NULL){
          fprintf(stderr, "The surrounding function '%s' was not found", funcId);
        }

        error = compareSymNExp(t, sym, s->val.return_);
        if(error){
          fprintf(stderr, "Line %d: checkTypeTravStmt: return type error\n", s->lineno);
          return -1;
        }
        return 0;
      }
      break;
    case writeK:
      tk = expOfType(t, s->val.write);
      if(tk != intK && tk != boolK){
        fprintf(stderr, "type of expression to be written is not int og bool");
      }
      break;
    case allocateK:
      //check if variable.id is a var or a record not a function
      sym = getSymbol(t, s->val.allocate->val.id);
      if(sym == NULL){
        fprintf(stderr,"Symbol '%s' was not found\n", s->val.allocate->val.id);
      }
      if(sym->kind == funcK){
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
      tk = expOfType(t, s->val.allocatelength.exp);
      //type = s->val.allocatelength.exp->type;
      if(tk != intK){
        fprintf(stderr,"Amount to be allocated is not a number\n");
      }
      break;
    case assiK:
      fprintf(stderr,"Line '%d': checkTypeTravStmt: assiK\n", s->lineno);
      //check if expression type is the same as variable type
      //sym = getSymbol(t, s->val.assign.var->val.id);
      SYMBOL *sym = NULL;
      type = checkTypeTravVar(t, s->val.assign.var, &sym);
      //TODO: check for NULL type and symbol
      if(type == NULL){
        fprintf(stderr, "Line %d: Unfortunately no type where found\n", s->lineno);
        return -1;
      }
      if(type->kind != recordK){ //Changed this from == to != ***********************************
        error = compareTypeNExp(t, type, s->val.assign.exp);
      }
      else{
        error = compareSymNExp(t, sym, s->val.assign.exp);
      }
      if(error == -1){
        fprintf(stderr, "Line %d: The two sides of the assignment does not have the same type\n", s->lineno);
        return -1;
      }
      return 0;
      break;
    case ifK:
      //check if the expression is bool
      tk = expOfType(t, s->val.ifthenelse.cond);
      //typekind = s->val.ifthenelse.cond->type;
      if(tk != boolK){
        fprintf(stderr,"Type of condition in if-statmemt should be boolean\n");
      }
      //traverse body
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      break;
    case thenK:
      //check if the expression is bool
      tk = expOfType(t, s->val.ifthenelse.cond);
      //typekind = s->val.ifthenelse.cond->type;
      if(tk != boolK){
        fprintf(stderr,"Type of condition in if-statmemt should be boolean\n");
      }
      //traverse both bodies
      checkTypeTravStmt(t, s->val.ifthenelse.thenbody, funcId);
      checkTypeTravStmt(t, s->val.ifthenelse.elsebody, funcId);
      break;
    case whileK:
      //check if the expression is bool
      tk = expOfType(t, s->val.ifthenelse.cond);
      //typekind = s->val.while_.cond->type;
      if(tk != boolK){
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
  return 0;
}



TYPE* checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym){
  fprintf(stderr, "checkTypeTravVar: going into\n");
  SYMBOL *sym2;
  Typekind typekind;
  switch (v->kind) {
    case idVarK:
      sym2 = getSymbol(t, v->val.id);
      if(sym2 == NULL){
        fprintf(stderr, "Line %d: idVarK: Symbol '%s' was not found\n",v->lineno, v->val.id);
        return NULL;
      }
      //fprintf(stderr, "Line %d: Variable '%s' was found\n",v->lineno, v->val.id);
      (*sym) = sym2;
      return sym2->typePtr;
      break;
    case expK:
      //sym = getSymbol(t, s->val.assign.var->val.varexp.id);
      fprintf(stderr, "Line %d: Cannot typecheck array assignment yet\n", v->lineno);
      if(expOfType(t, v->val.varexp.exp) != intK){
        fprintf(stderr, "Line %d: The index expression is not an integer type\n", v->lineno);
      }
       TYPE *type = checkTypeTravVar(t, v->val.varexp.var, sym);
       if(type->kind != recordK){
         fprintf(stderr, "Line %d: Tried to index something not an array\n", v->lineno);
       }
       return type->val.arrayType;
    case dotK:
      ;
      type = checkTypeTravVar(t, v->val.vardot.var, sym);
      if(*sym == NULL){
        fprintf(stderr, "Line %d: checkTypeTravVar: something went wrong\n", v->lineno);
        fprintf(stderr, "Line %d: Could not find struct containing '%s'\n", v->lineno, v->val.vardot.id );
        return NULL;
        break;
      }

      //TODO: check if symbol os of type id
      //following only valid if type is recordk
      if((*sym)->content == NULL){
        fprintf(stderr, "Line %d: holy shit, the struct '%s' does not have any content\n", v->lineno, (*sym)->name);
        return NULL;
      }
      *sym = getSymbol((*sym)->content, v->val.vardot.id);
      if(*sym == NULL){
        fprintf(stderr, "Line %d: dotK: Symbol '%s' was not found\n",v->lineno, v->val.vardot.id);
        return NULL;
      }
      //sym already updated
      return (*sym)->typePtr;
      break;
  }
  return NULL; //compiler warning
}



// int checkTypeTravVar(SymbolTable *t, VARIABLE *v, SYMBOL **sym, TYPE **type){
//   fprintf(stderr, "checkTypeTravVar: going into\n");
//   SYMBOL *symVal;
//   Typekind typekind;
//   switch (v->kind) {
//     case idVarK:
//       symVal = getSymbol(t, v->val.id);
//       if(symVal == NULL){
//         fprintf(stderr, "Line %d: idVarK: Symbol '%s' was not found\n",v->lineno, v->val.id);
//         return -1;
//       }
//       //fprintf(stderr, "Line %d: Variable '%s' was found\n",v->lineno, v->val.id);
//       *sym = symVal;
//       return (*sym)->type;
//       break;
//     case expK:
//       //sym = getSymbol(t, s->val.assign.var->val.varexp.id);
//       fprintf(stderr, "Line %d: Cannot typecheck array assignment yet\n", v->lineno);
//       if(v->val.varexp.exp->type != intK){
//
//       }
//       typekind = checkTypeTravVar(t, v->val.varexp.var, sym, type);
//       if(typekind == arrayK){
//         *type = (*type)->val.arrayType;
//         return (*type)->kind;
//       }
//       else{
//         (*type) = (*sym)->arrayType;
//         return (*sym)->type; //eller (*type)->kind
//       }
//       break;
//     case dotK:
//       //sym = getSymbol(t, NameOfStruct);
//       ;
//       typekind = checkTypeTravVar(t, v->val.vardot.var, sym, type);
//       if(*sym == NULL){
//         fprintf(stderr, "Line %d: checkTypeTravVar: something went wrong\n", v->lineno);
//         fprintf(stderr, "Line %d: Could not find struct containing '%s'\n", v->lineno, v->val.vardot.id );
//         return -1;
//         break;
//       }
//       if((*sym)->content == NULL){
//         fprintf(stderr, "Line %d: holy shit, the struct '%s' does not have any content", v->lineno, (*sym)->name);
//         return -1;
//       }
//       *sym = getSymbol((*sym)->content, v->val.vardot.id);
//       if(*sym == NULL){
//         fprintf(stderr, "Line %d: dotK: Symbol '%s' was not found\n",v->lineno, v->val.vardot.id);
//         return -1;
//       }
//       return (*sym)->type;
//       break;
//   }
//   return -1; //compiler warning
// }









Typekind expOfType(SymbolTable *t, EXP *exp){
  if(exp->typekind == idK){
    TYPE *type = exp->type;
    return typeOfType(t, type);
  }
  else
    return exp->typekind;
}

Typekind typeOfType(SymbolTable *t, TYPE *type){
  if(type->kind == idK){
    SYMBOL *sym = getSymbol(t, type->val.id);
    if(sym == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", type->lineno, type->val.id);
    }
    return typeOfType(t, sym->typePtr);
  }
  else
    return type->kind;
}

int compareSymNExp(SymbolTable *t, SYMBOL *sym, EXP *exp){
  Typekind tk1 = sym->typeVal;
  Typekind tk2 = exp->typekind;
  TYPE *type;
  SYMBOL *sym2;
  if(tk1 == idK){
    type = sym->typePtr;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: Symbol '%s' does not specify a valid type\n", exp->lineno, sym->name);
      return -1;
    }
    sym2 = getSymbol(t, type->val.id);
    if(sym2 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", exp->lineno, type->val.id);
      return -1;
    }
    return compareSymNExp(t, sym2, exp);
  }
  if(tk2 == idK){
    type = exp->type;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: expression does not specify a valid type\n", exp->lineno);
      return -1;
    }
    sym2 = getSymbol(t, type->val.id);
    if(sym2 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", exp->lineno, type->val.id);
      return -1;
    }
    return compareSymNSym(t, sym, sym2);
  }
  if(sym->typeVal == recordK && sym->kind == varS){
    fprintf(stderr, "Line %d: The symbol '%s' has anonymous record type\n", exp->lineno, sym->name);
    return -1;
  }
  if(exp->typekind == recordK){
    fprintf(stderr, "Line %d: The expression has anonymous record type\n", exp->lineno);
    return -1;
  }
  if(tk1 == tk2){
    switch(tk1){
      case recordK:
        //not relevant
      break;
      case intK:
        return 0;
      break;
      case boolK:
        return 0;
      break;
      case arrayK:
        return compareTypeNType(t, sym->typePtr, exp->type);
        break;
      default:
      break;
    }
    fprintf(stderr, "Line %d: Types does not match\n", exp->lineno);
    return -1;
  }
  return -1; //compiler warning
}

int compareSymNSym(SymbolTable *t, SYMBOL *sym1, SYMBOL *sym2){
  Typekind tk1 = sym1->typeVal;
  Typekind tk2 = sym2->typeVal;
  SYMBOL *sym3;
  TYPE *type;
  if(tk1 == idK){
    type = sym1->typePtr;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: Symbol '%s' does not specify a valid type\n", type->lineno, sym1->name);
      return -1;
    }
    sym3 = getSymbol(t, type->val.id);
    if(sym3 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", type->lineno, type->val.id);
      return -1;
    }
    return compareSymNSym(t, sym3, sym2);
  }
  if(tk2 == idK){
    type = sym2->typePtr;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: expression does not specify a valid type\n", type->lineno);
      return -1;
    }
    sym3 = getSymbol(t, type->val.id);
    if(sym3 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", type->lineno, type->val.id);
      return -1;
    }
    return compareSymNSym(t, sym1, sym3);
  }
  if(sym1->typeVal == recordK && sym1->kind == varS){
    fprintf(stderr, "Line %d: The symbol '%s' has anonymous record type\n", -1, sym1->name);
    return -1;
  }
  if(sym2->typeVal == recordK && sym2->kind == varS){
    fprintf(stderr, "Line %d: The expression has anonymous record type\n", -1);
    return -1;
  }
  if(tk1==tk2){
    switch(tk1){
      case recordK:
        if(sym1->content == sym2->content){
          return 0;
        }
        fprintf(stderr, "Line %d: Record '%s' does not match record '%s'\n", -1, sym1->name, sym2->name);
        return -1;
      break;
      case intK:
        return 0;
      break;
      case boolK:
        return 0;
      break;
      case arrayK:
        return compareTypeNType(t, sym1->typePtr, sym2->typePtr);
        break;
      default:
      break;
    }
    fprintf(stderr, "Line %d: Types does not match\n", -1);
    return -1;
  }
  return -1; //compiler warning
}


int compareTypeNExp(SymbolTable *t, TYPE *ty, EXP *exp){
  Typekind tk1 = ty->kind;
  Typekind tk2 = exp->typekind;
  TYPE *type;
  SYMBOL *sym2;
  if(tk1 == idK){
    sym2 = getSymbol(t, ty->val.id);
    if(sym2 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", exp->lineno, ty->val.id);
      return -1;
    }
    return compareSymNExp(t, sym2, exp);
  }
  if(tk2 == idK){
    type = exp->type;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: expression does not specify a valid type\n", exp->lineno);
      return -1;
    }
    sym2 = getSymbol(t, type->val.id);
    if(sym2 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", exp->lineno, type->val.id);
      return -1;
    }
    return compareTypeNSym(t, ty, sym2);
  }
  //TODO: need check for functions also??
  if(ty->kind == recordK){
    fprintf(stderr, "Line %d: The symbol '%s' has anonymous record type\n", exp->lineno, sym2->name);
    return -1;
  }
  if(exp->typekind == recordK){
    fprintf(stderr, "Line %d: The expression has anonymous record type\n", exp->lineno);
    return -1;
  }
  if(tk1 == tk2){
    switch(tk1){
      case recordK:
        //not relevant
      break;
      case intK:
        return 0;
      break;
      case boolK:
        return 0;
      break;
      case arrayK:
        return compareTypeNType(t, ty, exp->type);
        break;
      default:
      break;
    }
    fprintf(stderr, "Line %d: Types does not match\n", exp->lineno);
    return -1;
  }
  return -1; //compiler warning
}

int compareTypeNSym(SymbolTable *t, TYPE *ty, SYMBOL *sym){
  Typekind tk1 = ty->kind;
  Typekind tk2 = sym->typeVal;
  TYPE *type;
  SYMBOL *sym2;
  if(tk1 == idK){
    sym2 = getSymbol(t, ty->val.id);
    if(sym2 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", ty->lineno, ty->val.id);
      return -1;
    }
    return compareSymNSym(t, sym2, sym);
  }
  if(tk2 == idK){
    type = sym->typePtr;
    if(type->kind != idK){
      fprintf(stderr, "Line %d: expression does not specify a valid type\n", ty->lineno);
      return -1;
    }
    SYMBOL *sym3 = getSymbol(t, type->val.id);
    if(sym3 == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", ty->lineno, type->val.id);
      return -1;
    }
    return compareTypeNSym(t, ty, sym3);
  }
  //TODO: need check for functions also??
  if(ty->kind == recordK){
    fprintf(stderr, "Line %d: The type is an anonymous record type\n", ty->lineno);
    return -1;
  }
  if(sym->typeVal == recordK && sym->kind == varS){
    fprintf(stderr, "Line %d: The symbol '%s' has anonymous record type\n", ty->lineno, sym->name);
    return -1;
  }
  if(tk1 == tk2){
    switch(tk1){
      case recordK:
        //not relevant
      break;
      case intK:
        return 0;
      break;
      case boolK:
        return 0;
      break;
      case arrayK:
        return compareTypeNType(t, ty, sym->typePtr);
        break;
      default:
      break;
    }
    fprintf(stderr, "Line %d: Types does not match\n", ty->lineno);
    return -1;
  }
  return -1; //compiler warning
}

//this function is exclusively meant to check the types of Arrays
int compareTypeNType(SymbolTable *t, TYPE *t1, TYPE* t2){
  SYMBOL *sym;
  if(t1->kind != arrayK && t2->kind != arrayK){
    fprintf(stderr, "Line %d: Tried to compare types '%d' and '%d' which are not both of type '%d' (array)\n", t1->lineno, t1->kind, t2->kind, arrayK);
    return -1;
  }
  t1 = t1->val.arrayType;
  t2 = t2->val.arrayType;
  if(t1->kind == idK){
    sym = getSymbol(t, t1->val.id);
    if(sym == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", t1->lineno, t1->val.id);
      return -1;
    }
    return compareTypeNSym(t, t2, sym);
  }
  if(t2->kind == idK){
    sym = getSymbol(t, t2->val.id);
    if(sym == NULL){
      fprintf(stderr, "Line %d: The symbol '%s' was not found\n", t2->lineno, t1->val.id);
      return -1;
    }
    return compareTypeNSym(t, t1, sym);
  }
  //TODO: need check for functions also??
  if(t1->kind == recordK){
    fprintf(stderr, "Line %d: The type is an anonymous record type\n", t1->lineno);
    return -1;
  }
  if(t2->kind == recordK){
    fprintf(stderr, "Line %d: The type is an anonymous record type\n", t2->lineno);
    return -1;
  }
  if(t1->kind == t2->kind){
    switch(t1->kind){
      case recordK:
        //not relevant
      break;
      case intK:
        return 0;
      break;
      case boolK:
        return 0;
      break;
      case arrayK:
        return compareTypeNType(t, t1, t2);
        break;
      default:
      break;
    }
  }

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
