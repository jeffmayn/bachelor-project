#include "tree.h"
#include "typecheck.h"
#include "symbol.h"
#include "symbol.c" //does not work without this??
#include <stdlib.h>

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
      //add function to current scope
      putSymbol(t, d->val.func->head->id, 0, func, d->val.func->head->type->kind); //add some shit for named types, records and arrays
      //create new scope
      SymbolTable *child = scopeSymbolTable(t);
      childScopeForDebugging = child;
      //add parametrs to that scope
      PAR_DECL_LIST *pList = d->val.func->head->pList;
      if(pList != NULL){
        VAR_DECL_LIST *vList = pList->vList;
        printf("vList %d\n", vList);
        if(vList != NULL){
          while(vList->vList != NULL){
            printf("about to put params\n");
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
      putSymbol(t, d->val.id.id, 0, type, d->val.id.type->kind);
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
