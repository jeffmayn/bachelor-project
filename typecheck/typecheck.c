#include "../scan_parse/tree.h"
#include "typecheck.h"
#include "../scan_parse"

extern BODY *theexpression;

/**
  Finds the types of all declared types

  måske denne skal returnere symboltabellen
  Eller skal den være global
  Nej, den må hellere være lokal i de rekursive funktioner, så vi kan bestemme roden
*/
void idTypeFinder(){
  SymbolTable *table = initSymbolTable();
  idFinderRec(table, theexpression);
}

/**
 t is the root of the current scope
*/
void idFinderRec(symbolTable *t, BODY node){
  travDecls(t,node->vList);
}

void travDecls(symbolTable *t, DECL_LIST* decls){
  if(decls == NULL){
    return;
  }
  //TODO things
  DECLARATION *d = decls->decl;
  if(d == NULL){
    return;
  }
  switch (d->kind) {
    case listK:
      travVDecls(t, d)
    break;
    case funcK:
      //add function to current scope
      putSymbol(t, d->func->head->id, 0, func, d->func->head->id->type); //add some shit for named types, records and arrays
      //create new scope
      symbolTable child = scopeSymbolTable(t);
      //add parametrs to that scope
      PAR_DECL_LIST pList = d->func->head->pList;
      if(pList == NULL){
        break;
      }
      VAR_DECL_LIST vList = pList->vList;
      //I may use travVDecls instead of using this while loop
      //NO because its putParam and not Symbol, which is used.
      while(vList->vList != NULL){
        vlist->vType->id
        putParam(child, vlist->vType->id, 0, var, vlist->vType->type->kind); //can a parameter be anything different from a variable (func or type)
        vList = vList->vList;
      }
      //recursively call idFinderRec on body of function
      idFinderRec(child,d->func->body);
    break;
    case idDeclK:
      putSymbol(t, d.id.id, 0, type, d.id.type->kind);
    break;
  }

  travDecls(t, DECL_LIST decls->decl_list);

}

void travVDecls(symbolTable *t, VAR_DECL_LIST vDecls){
  if(vDecls == NULL){
    return;
  }
  //TODO: may be done
  VAR_TYPE vty = t->vType;
  putSymbol(t, vty->id, 0, var, vty->type->kind); //last param is the type of the variable //further shit to be added for named types, records and arrays
  travVDecls(t, vDecls->vList);
}





/**
 * Finds the types of expressions
*/
void expTypeFinder();

/**
 * Checks if expression types match variable and context types
*/
void checkTypes();
