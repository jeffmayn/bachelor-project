#include "internalASM.h"
#include "memory.h"
//#include "symbol.h"
#include "tree.h"
#include "typecheck.h"
#include <string.h>


/**
 * Creating next temporary in order
 * It gets an unique ID and associated integer value
 */
TEMPORARY* IRcreateNextTemp(int offset){
  TEMPORARY* tmp = NEW(TEMPORARY);
  tmp->temporarykind = actualTempT;
  tmp->tempId = tempIdVal;
  tempIdVal++;
  tmp->graphNodeId = -1;
  tmp->placement.offset = offset;

  //for liveness analysis
  // int error = IGmakeGraphNode(tmp);
  // if(error == -1){
  //   fprintf(stderr, "INTERNAL ERROR in IRcreateNextTemp occurred when making graphNode\n");
  // }
  // tmp->graphNodeId = error;
  tmp->next = livenessTempList;
  livenessTempList = tmp;
  return tmp;
  //maybe they should be added to a collection containing all
  //non-placed temporaries
}


/**
 * Creates new local-variabel temp
 * The offset is the distance above the basepointer
 */
TEMPORARY* IRcreateNextLocalTemp(int offset){
  TEMPORARY* tmp = NEW(TEMPORARY);
  // char *str = Malloc(sizeof(char)*10);
  // sprintf(str, "t%d\0", tempCounter);
  // tmp->tempName = str;
  tmp->temporarykind = localT;
  tmp->tempId = tempIdVal;
  //tempIdVal++; //only if we want to do liveness analysis on locals
  tmp->graphNodeId = -1;
  tmp->placement.offset = offset;
  return tmp;
}


/**
 * Creates new param-variabel temp
 * The offset is the distance below the basepointer
 */
TEMPORARY* IRcreateParamTemp(int offset){
  TEMPORARY* tmp = NEW(TEMPORARY);
  tmp->temporarykind = paramT;
  tmp->tempId = tempIdVal;
  //tempIdVal++; //only if we want to do liveness analysis on params
  tmp->graphNodeId = -1;
  tmp->placement.offset = offset;
  return tmp;
}

//****AST TRAVERSE functions*****//
/**
 * Traverse all the bodies of the bodyList created in the typeChecker
 * In this way we go through alle bodies, that is functions, in a bread-first
 * starting with the main-body.
 */
int IRcreateInternalRep(bodyList *mainBody){
  //TODO call all the stuff and shit and things.
  /* for each body first traverse declerations to count local
   * variables and shit, then traverse statements creating the
   * instructions and so on.
   */
  labelCounter = 1;
  intermediateInstrCount = 0;
  labelINSTRTable = initInstrHashTable();
  dummyTemp = IRcreateNextTemp(-1);
  beginHeapLabel = Malloc(5);
  sprintf(beginHeapLabel, "heap%d", labelCounter);
  labelCounter++;
  freeHeapLabel = Malloc(10);
  sprintf(freeHeapLabel, "freeHeap%d", labelCounter);
  labelCounter++;
  endHeapLabel = Malloc(10);
  sprintf(endHeapLabel, "endHeap%d", labelCounter);
  labelCounter++;
  mainSPointLabel = malloc(15);
  sprintf(mainSPointLabel, "mainSPoint%d", labelCounter);
  labelCounter++;
  mainBPointLabel = malloc(15);
  sprintf(mainBPointLabel, "mainBPoint%d", labelCounter);
  labelCounter++;
  errorCleanupLabel = malloc(15);
  sprintf(errorCleanupLabel, "errorCleanup%d", labelCounter);
  labelCounter++;
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND("format")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".string	\"%d\\n\"")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".data")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".align 8")));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(beginHeapLabel)));
  char *str = Malloc(20);
  sprintf(str, ".space %d", HEAPSIZE);
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(str)));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(freeHeapLabel)));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".space 8")));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endHeapLabel)));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".space 8")));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(mainSPointLabel)));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".space 8")));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(mainBPointLabel)));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".space 8")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".text")));
  if(mainBody == NULL){
    return 0; //i guess no bodies gives rise to no errors
  }
  tempLocalCounter = 1;
  int error = 0;
  resetbodyListIndex(mainBody);
  bodyListElm *bElm = getBody(mainBody);
  //TODO something to treat the first body specially.



  while(bElm != NULL){
    error = IRinitParams(bElm->defScope, bElm);
    if(error == -1){
      return -1;
    }
    bElm = getBody(mainBody);
  }

  resetbodyListIndex(mainBody);
  bElm = getBody(mainBody);
  while(bElm != NULL){

    error = IRtravBody(bElm->scope, bElm);
    if(error == -1){
      return -1;
    }
    bElm = getBody(mainBody);
  }
  IRruntimeErrorCleanupCode();
  return 0;
}

void IRruntimeErrorCleanupCode(){
  //here i assume the right error value is already found in %rax;
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(mainSPointLabel), IRmakeRegOPERAND(RSP))));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(mainBPointLabel), IRmakeRegOPERAND(RBP))));
  //IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(mainEndLabel),IRmakeRegOPERAND(RSP))));
  //IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(8), IRappendOPERAND(IRmakeRegOPERAND(RBP), IRmakeCommentOPERAND("this is to avoid removing main-locals twice")))));
  IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(mainEndLabel)));
  //IRappendINSTR(IRmakeJumpINSTR(IRmakeRegOPERAND(RBX)));
}


int IRinitParams(SymbolTable *table, bodyListElm *element){

  int paramCount = 0;
  ParamSymbol *pSym = element->scope->ParamHead;
  char* mainName = NULL;
  SYMBOL *func;
  char* labelName;
  if(element->funcId == NULL){
    //naming main scope
    mainName = Malloc(sizeof(char)*6);
    sprintf(mainName, "%s", "$main");
    putSymbol(table, mainName, 0, funcK, intK, table, NEW(TYPE));
    //element->funcId = mainName;
    char* glblmain = Malloc(sizeof(char)*20);
    sprintf(glblmain, ".globl main");
    IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(glblmain)));
    func = getSymbol(table, "$main");
  } else {
    func = getSymbol(table, element->funcId);
  }
  if(func->cgu == NULL){ //er det her godt nok til at tjekke om der er en label instrution?
    func->cgu = IRmakeNewCGU();
    if(element->funcId == NULL){
      labelName = Malloc(sizeof(char)*10);
      element->funcId = mainName;
      sprintf(labelName, "main");
    } else {
      labelName = Malloc(strlen(element->funcId)+6);
      sprintf(labelName, "%s%d", element->funcId, labelCounter);
    }
    labelCounter++;
    func->cgu->val.funcInfo.funcLabel = IRmakeLabelINSTR(IRmakeLabelOPERAND(labelName));

  }
  SYMBOL *sym;
  while(pSym != NULL){
    sym = pSym->data;
    if(sym->cgu == NULL){
      sym->cgu = IRmakeNewCGU();
      sym->cgu->val.temp = IRcreateParamTemp(paramCount);
      paramCount++;
    }
    pSym = pSym->next;
  }
  return 0;
}

/**
 * Traverse the body of a function
 */
int IRtravBody(SymbolTable *table, bodyListElm *body){
  int error = 0;
  //TODO create the INSTRlabel, to signify the beginning of the body.
  //TODO set counter for locale variabler start
  SYMBOL *sym = getSymbol(body->defScope, body->funcId); //todo, i think it should be table not body->scope
  sym->cgu->val.funcInfo.localStart = tempLocalCounter;
  //localCounter = 0;
  tempLocalCounter = 0;
  error = IRtravDeclList(table, body->body->vList);
  if(error == -1){
    return -1;
  }
  sym->cgu->val.funcInfo.temporaryStart = tempLocalCounter;
  //TODO set counter for locale variabler slut
  //TODO calleé saves,
  IRappendINSTR(sym->cgu->val.funcInfo.funcLabel); //does the label exist?

  error = IRmakeCalleeProlog();
  if(error == -1){
    return -1;
  }
  INSTR * instrTempTail = intermediateTail;
  char* labelName = Malloc(strlen(sym->cgu->val.funcInfo.funcLabel->paramList->val.label)+4);
  sprintf(labelName, "%s%s", sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "end");
  labelCounter++;
  if(strcmp(sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "main") == 0){
    //Special stuff for beginning of main function
    mainEndLabel = labelName;
    //IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBP),IRmakeRegOPERAND(RBX))));
    //IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(8),IRappendOPERAND(IRmakeRegOPERAND(RBX),IRmakeCommentOPERAND("Moving past the main-local removal")))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RSP),IRmakeLabelOPERAND(mainSPointLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBP),IRmakeLabelOPERAND(mainBPointLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeAddrLabelOPERAND(beginHeapLabel),IRmakeLabelOPERAND(freeHeapLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeAddrLabelOPERAND(beginHeapLabel),IRmakeLabelOPERAND(endHeapLabel))));
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(HEAPSIZE),IRmakeLabelOPERAND(endHeapLabel))));

  }



  currentLocalStart = sym->cgu->val.funcInfo.localStart;
  currentTemporaryStart = sym->cgu->val.funcInfo.temporaryStart;
  error = IRtravStmtList(table, body->body->sList, labelName, NULL, NULL);
  if(error == -1){
    fprintf(stderr, "ERROR while traversing statements of %s\n", body->funcId);
    return -1;
  }
  sym->cgu->val.funcInfo.temporaryEnd = tempLocalCounter; //first number after our last temp

  currentTemporaryEnd = sym->cgu->val.funcInfo.temporaryEnd;

  /*caution you enter the land of long lines of code for no reason at all!*/
  //int nrTempsAndLocals = sym->cgu->val.funcInfo.temporaryEnd - sym->cgu->val.funcInfo.localStart;
  int nrTempsAndLocals = tempLocalCounter;
  IRinserINSTRhere(instrTempTail, IRmakeSubINSTR(IRappendOPERAND(IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP))));

  if(strcmp(sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "main") == 0){
    //Special stuff for end of main function
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RAX))));
  }



  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(labelName)));
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP)))); //newly added
  error = IRmakeCalleeEpilog();
  return error;
}

int IRinserINSTRhere(INSTR *prev, INSTR* new){
  new->next = prev->next;
  prev->next = new;
  return 0;
}

int IRmakeCalleeProlog(){
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBP)));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RSP), IRmakeRegOPERAND(RBP))));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R12)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R13)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R14)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R15)));
  return 0;
}

int IRmakeCalleeEpilog(){
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R15)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R14)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R13)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R12)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RBX)));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBP), IRmakeRegOPERAND(RSP))));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RBP)));
  IRappendINSTR(IRmakeRetINSTR(NULL));
  return 0;
}


/**
 * only traverse the declerations immediately available
 * do not dive into functions etc.
 * Count the number of variables.
 */
CODEGENUTIL *IRmakeNewCGU(){
  CODEGENUTIL *newCGU = NEW(CODEGENUTIL);
  memset(newCGU, 0, sizeof(CODEGENUTIL));
  newCGU->size = -1;
  return newCGU;
}

int IRtravDeclList(SymbolTable *table, DECL_LIST *declarations){
  int error = 0;
  error = IRtravDecl(table, declarations->decl);
  if(error  == -1){
    return -1;
  }
  if(declarations->decl_list != NULL){
    return IRtravDeclList(table, declarations->decl_list);
  }
  return 0;
}

/**
 * do not enter declerations for functions,
 * as these are already in the bodylist!
 */
int IRtravDecl(SymbolTable *table, DECLARATION *decl){
  SYMBOL *sym;
  if(decl == NULL){
    return 0;
  }
  switch(decl->kind){
    case idDeclK:
      sym = getSymbol(table, decl->val.id.id);
      if(sym->cgu != NULL){
        return 0; //the size of the type already found
      }
      sym->cgu = IRmakeNewCGU();
      sym->cgu->val.temp = NULL;
      SYMBOL *sym2 = sym;
      TYPE *ty = sym2->typePtr;
      if(ty->kind == idK){
        //go to buttom of user types
        sym2 = recursiveSymbolRetrieval(table, ty->val.id, NULL);
        ty = sym2->typePtr;
      }
      if(sym2->cgu == NULL){
        sym2->cgu = IRmakeNewCGU();
        sym2->cgu->val.temp = NULL;
      }
      if(ty->kind == recordK){
        if(sym2->cgu->size == -1){
          int varCount = IRtravVarDeclList(sym2->content, sym2->typePtr->val.vList, 0);
          if(varCount == -1){
            fprintf(stderr, "Error while traversing record %s\n", sym2->name);
            return -1;
          }
          sym2->cgu->size = varCount;
        }
      }
      else if(ty->kind == boolK || ty->kind == intK || ty->kind == arrayK){
        // sym->cgu->val.temp = IRcreateNextTemp(offset);
        // offset++;
        sym2->cgu->size = 1;
        break;
      }
      else{
        fprintf(stderr, "IRtravVarType: how did i get here %d\n", ty->kind);
        return -1;
        break;
      }
      sym->cgu->size = sym2->cgu->size;
      break;
    case funcK://assign numbers to parameters.
      break;
    case listK:
      ;//count number of variables
      int varCount = IRtravVarDeclList(table, decl->val.list, tempLocalCounter);
      //fprintf(stderr, "tempLocalCounter %d : varCount %d\n", tempLocalCounter, varCount);
      if(varCount >= 0){
        //tempLocalCounter += (varCount-tempLocalCounter);
        tempLocalCounter = varCount;
        return 0;
      }
      return -1;
      break;
  }
  return 0;
}


/**
 * traverse variable decleration list
 * Third parameter is the next offset to be used (in current scope)
 * Returns the number of variables indexed
 */
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList, int offset){
  offset = IRtravVarType(table, varDeclList->vType, offset);

  if((offset != -1) && (varDeclList->vList != NULL)){
    offset = IRtravVarDeclList(table, varDeclList->vList, offset);
  }
  return offset;
}

int IRtravVarType(SymbolTable *table, VAR_TYPE *varType, int offset){

  SYMBOL *sym = getSymbol(table, varType->id);
  if(sym == NULL){
    fprintf(stderr, "Line %s: IRtravVarType: no symbol found for %d\n", varType->id, varType->lineno);
    return -1;
  }
  if(sym->cgu == NULL){
    sym->cgu = IRmakeNewCGU();
    //fprintf(stderr, "%s %d\n", sym->name, offset);
    sym->cgu->val.temp = IRcreateNextLocalTemp(offset);
    offset++;
  } else {
    //after including user defined types, i think it is legal to go here some times
    fprintf(stderr, "IRtravVarType: symbol %s already had cgu \
attatched\n", sym->name);
    return ++offset;//dunno if we need this.
    //TODO: I guess we should just return offset here?
  }
  SYMBOL *sym2 = sym;
  TYPE *ty = sym2->typePtr;
  SymbolList *knownSyms = NULL;
  while(1){ //carefull
    if(ty->kind == idK){
      //go to buttom of user types
      sym2 = recursiveSymbolRetrieval(table, ty->val.id, NULL);
      if(containsSym(knownSyms, sym2)){
        break;
      }
      knownSyms = prependSymbol(knownSyms, sym2);
      ty = sym2->typePtr;
    }
    if(sym2->cgu == NULL){
      sym2->cgu = IRmakeNewCGU();
      sym2->cgu->val.temp = NULL;
      sym2->cgu->size = -1; //default size
    }
    if(ty->kind == recordK){
      if(sym2->cgu->val.temp == NULL || sym == sym2){//latter: anonymous record
        if(sym2->cgu->val.temp == NULL){
          sym2->cgu->val.temp = dummyTemp; //used to test whether content of user-record has already been traversed
        }
        int varCount = IRtravVarDeclList(sym2->content, sym2->typePtr->val.vList, 0);
        if(varCount == -1){
          fprintf(stderr, "Error while traversing record %s\n", sym2->name);
          return -1;
        }
        sym2->cgu->size = varCount;
      }
      sym->cgu->size = sym2->cgu->size;
      break;
    }
    else if(ty->kind == arrayK){
      ty = ty->val.arrayType;
    }
    else if(ty->kind == boolK || ty->kind == intK){
      sym->cgu->size = 1;
      break;
    }
    else{
      fprintf(stderr, "IRtravVarType: how did i get here %d\n", ty->kind);
      return -1;
      break;
    }
  }
  return offset;
}

/**
* this function assumes that declarations of all user types
* has been traversed
*/
int findVarSymSize(SYMBOL *sym){
  /*if(sym->kind != varS){
    fprintf(stderr, "INTERNAL ERROR: The symbol %s is not a variable\n", sym->name);
    return -1;
  }*/
  Typekind tk;
  int size;
  SYMBOL *sym2;
  if(sym->cgu->size == -1){
    tk = sym->typeVal;
    switch(tk){
      case idK:
        sym2 = recursiveSymbolRetrieval(sym->defScope, sym->typePtr->val.id, 0);
        if(sym2->cgu->size == -1){
          fprintf(stderr, "INTERNAL ERROR: The size of %s has not been specified\n", sym->name);
          return -1;
        }
        sym->cgu->size = sym2->cgu->size;
        break;
      case intK:
      case boolK:
      case arrayK:
        sym->cgu->size = 1;
        break;
      case recordK:
        size = IRtravVarDeclList(sym->content, sym->typePtr->val.vList, 0);
        if(size == -1){
          fprintf(stderr, "Hopefully error is already printed\n");
          return -1;
        }
        sym->cgu->size = size;
        break;
      case errorK:
        fprintf(stderr, "INTERNAL ERROR: findVarSymSize error during run\n");
        return -1;
      case nullKK:
        fprintf(stderr, "%s\n", "INTERNAL ERROR: findVarSymSize nullKK error");
        return -1;
    }
  }
  return sym->cgu->size;
}

/**
 * only traverse the statements immediately available
 * do not dive into functions etc.
 * Generate code for all statements.
 */
int IRtravStmtList(SymbolTable *table, STATEMENT_LIST *statements, char* funcEndLabel, char* startLabel, char* endLabel){
  int error = 0;
  error = IRtravStmt(table, statements->statement, funcEndLabel, startLabel, endLabel);
  if(error == -1){
    return -1;
  }
  if(statements->statementList != NULL){
    return IRtravStmtList(table, statements->statementList, funcEndLabel, startLabel, endLabel);
  }
  return 0;
}

/*
 * traversing the statement
 */
int IRtravStmt(SymbolTable *t, STATEMENT *stmt, char* funcEndLabel, char* startLabel, char* endLabel){
  OPERAND *op1;
  OPERAND *op2;
  OPERAND *op3;
  TEMPORARY *temp;
  SYMBOL *sym;
  TYPE *ty;
  char *elseLabel;
  char *endifLabel;
  char *allocSuccLabel;
  char *startwhileLabel;
  char *endwhileLabel;
  int error;
  int size;
  char* commentString;
  switch(stmt->kind){
    case returnK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d return statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      op1 = IRtravExp(t, stmt->val.return_);
      op2 = IRmakeRegOPERAND(RAX);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op2)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(funcEndLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: return\n");
      break;
    case writeK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d write statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      op1 = IRtravExp(t, stmt->val.write);
      if(op1 == NULL){
        fprintf(stderr, "OP1 line: %d\n", stmt->lineno);
      }
      //check for NULL??
      IRappendINSTR(IRmakePushINSTR(
        IRmakeRegOPERAND(RDI)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RSI))));                                                             //!!local string!!
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeAddrLabelOPERAND("format"), IRmakeRegOPERAND(RDI))));

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(0),IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeCallINSTR(IRmakeLabelOPERAND("printf")));
      // movq $form,%rdi		# Passing string address (1. argument)
      // movq %rax,%rsi		# Passing %rax (2. argument)
      // movq $0, %rax           # No floating point registers used
      // call printf		# Automatically pushes return address
      IRappendINSTR(IRmakePopINSTR(
        IRmakeRegOPERAND(RDI)));
      return 0;
      break;
    case allocateK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d allocate statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));

      error = IRtravVarRecursive(t, stmt->val.allocate, &sym, &ty, &op1);
      if(error == -1){
        fprintf(stderr, "IRtravStmt: didn't successfully find operand of variable\n");
        return -1;
      }
      //op1 = IRmakeTemporaryOPERAND(sym->cgu->val.temp);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),op1)));
      IRresetBasePointer();
      //size = sym->cgu->size; //1; //TODO: how much space to allocate??????????????????
      if(ty != sym->typePtr){ //this is a bit hacked
        if(ty->kind == idK){
          sym = recursiveSymbolRetrieval(ty->scope, ty->val.id, NULL);
          size = findVarSymSize(sym);
        }
        else{
          size = 1; //Guess
        }
      }
      else{
        size = findVarSymSize(sym); //ODOTO

      }
      if(size == -1){
        fprintf(stderr, "Alloc: Hopefully error is already printed\n");
        return -1;
      }
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(size*8),IRmakeLabelOPERAND(freeHeapLabel))));
      //out of memory check
      allocSuccLabel = Malloc(10);
      sprintf(allocSuccLabel, "allocSucc%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeLabelOPERAND(endHeapLabel), IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeCommentOPERAND("may be out of order")))));
      IRappendINSTR(IRmakeJlINSTR(IRmakeLabelOPERAND(allocSuccLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(OUTOFMEMORYCODE), IRappendOPERAND(IRmakeRegOPERAND(RAX), IRmakeCommentOPERAND("outofMemory")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("Here some kind of error should  be returned"))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocSuccLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: variabel allocation\n");
      break;
    case allocateLengthK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d allocate of length statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));

      error = IRtravVarRecursive(t, stmt->val.allocatelength.var, &sym, &ty, &op1);
      if(error == -1){
        fprintf(stderr, "IRtravStmt: didn't successfully find operand of variable\n");
        return -1;
      }
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      //saving the allocation in the given operand
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),op1)));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),IRmakeTemporaryOPERAND(temp))));


      //size = sym->cgu->size; //1; //TODO: how much space to allocate??????????????????
      //size = findVarSymSize(sym);
      size = 1; //size of pointer
      if(size == -1){
        fprintf(stderr, "AllocLen: Hopefully error is already printed\n");
        return -1;
      }
      op2 = IRtravExp(t,stmt->val.allocatelength.exp);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2,IRmakeRegOPERAND(RBX))));
      //postive allocation size check
      char *allocPosLabel = Malloc(10);
      sprintf(allocPosLabel, "allocPos%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJgINSTR(IRmakeLabelOPERAND(allocPosLabel)));
      //negative allocation error
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(NONPOSITIVEALLOCCODE), IRappendOPERAND(IRmakeRegOPERAND(RAX), IRmakeCommentOPERAND("negative allocation size")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocPosLabel)));

      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(1),IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeCommentOPERAND("making room for arraySize")))));
      IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(IRmakeConstantOPERAND(8), IRmakeRegOPERAND(RBX))));
      //IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(IRmakeConstantOPERAND(size),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),IRmakeLabelOPERAND(freeHeapLabel))));
      //out of memory check
      allocSuccLabel = Malloc(10);
      sprintf(allocSuccLabel, "allocSucc%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeLabelOPERAND(endHeapLabel), IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeCommentOPERAND("may be out of order")))));
      //IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRappendOPERAND(IRmakeLabelOPERAND(endHeapLabel), IRmakeCommentOPERAND("may be out of order")))));
      IRappendINSTR(IRmakeJlINSTR(IRmakeLabelOPERAND(allocSuccLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(OUTOFMEMORYCODE), IRappendOPERAND(IRmakeRegOPERAND(RAX), IRmakeCommentOPERAND("outofMemory")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));

      //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("Here some kind of error should  be returned"))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocSuccLabel)));


      //putting arraySize into first indeks of array
      op3 = NEW(OPERAND);
      memcpy(op3, op2, sizeof(OPERAND));
      op3->next = NULL;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op3, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),IRmakeTempDeRefOPERAND(temp)))); //ODOT PROBLEMS appears here

      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: variabel array-allocation\n");
      break;
    case assiK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d assign statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      //op1 = IRmakeTemporaryOPERAND(sym->cgu->val.temp);
      op2 = IRtravExp(t, stmt->val.assign.exp);
      //move expression into variabel -> source->destination
      //op3 = IRmakeRegOPERAND(RBX);
      //localCounter++;

      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
      // op4 = NEW(OPERAND);
      // memcpy(op4, op3, sizeof(OPERAND));
      // op4->next = NULL; //newly added 180419

      op1 = IRtravVar(t, stmt->val.assign.var);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(temp), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), op1)));
      IRresetBasePointer();
      //IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, op1)));
      return 0;
      break;
    case ifK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d if then statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RBX)))); //a bit stupid but necessary for if(true)
      IRresetBasePointer();
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(endifLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel, startLabel, endLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: if-statement\n");
      break;
    case thenK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d if then else statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      elseLabel = Malloc(10);
      sprintf(elseLabel, "else%d", labelCounter);
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RBX)))); //a bit stupid but necessary for if(true)
      IRresetBasePointer();
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(elseLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel, startLabel, endLabel);
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(endifLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(elseLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.elsebody, funcEndLabel, startLabel, endLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: if-statement\n");
      break;
    case listStmtK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d list statement statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      return IRtravStmtList(t, stmt->val.list, funcEndLabel, startLabel, endLabel);
    case whileK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d while statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      startwhileLabel = Malloc(10);
      sprintf(startwhileLabel, "while%d", labelCounter);
      endwhileLabel = Malloc(10);
      sprintf(endwhileLabel, "endwhile%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(startwhileLabel)));
      op1 = IRtravExp(t,stmt->val.while_.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(endwhileLabel)));
      IRtravStmt(t, stmt->val.while_.body, funcEndLabel, startwhileLabel, endwhileLabel);
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(startwhileLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endwhileLabel)));
      break;
    case breakK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d break statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(endLabel)));
      break;
    case continueK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d continue statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(startLabel)));
      break;
    default:
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("something we didn't support was supposed to be here statement")));

      fprintf(stderr, "IRtravStmt: UnsupportedStatementException: %d\n", stmt->kind);
      return -1;
      break;
  }
}

/**
 * Traversing variabel
 */
OPERAND* IRtravVar(SymbolTable *t, VARIABLE *var){
  SYMBOL *sym;
  TYPE *ty;
  OPERAND *op;
  int error = 0;
  error = IRtravVarRecursive(t, var, &sym, &ty, &op);

  if(error == -1){
    fprintf(stderr, "DO we go here alot\n");
    return NULL;
  }

  return op;
}

int IRtravVarRecursive(SymbolTable *t, VARIABLE *var, SYMBOL **sym, TYPE **ty, OPERAND **op){
  OPERAND *op1;
  TEMPORARY *t1;
  int error = 0;
  int *nrJumps = Calloc(sizeof(int));
  *nrJumps = 0;
  char *nonNullDerefLabel1;
  char *nonNullDerefLabel2;
  switch (var->kind) {
  case idVarK:
    *sym = IRgetSymbol(t, var->val.id, nrJumps);//TODOMADS should be IRgetSymbol
    if((*sym)->cgu == NULL){
      fprintf(stderr, "IRtravVar: How do I know if %s is a parameter or local\n", (*sym)->name);
      return -1;
    }
    // if((*sym)->typeVal == idK){
    //   *sym = recursiveSymbolRetrieval((*sym)->defScope, (*sym)->typePtr->val.id, NULL);
    // }
    *ty = (*sym)->typePtr;
    *op = IRmakeTemporaryOPERAND((*sym)->cgu->val.temp);
    /*
     * IRsetstaticbase følger static link baseret på nrJumps
     * og lægger derefereret værdi i RDI.
     */
    IRsetStaticBase(nrJumps);
    return 0; //op and sym is alread set and everything is fine
    //TODO: check if the type is a (userdefined) record or array type
    //i dont know if this works
    //recursiveSymbolRetrieval(sym->defScope, sym->val.id, NULL);
    break;
  case expK:
    t1 = IRcreateNextTemp(tempLocalCounter);  //array address
    tempLocalCounter++;
    char *indeksAllowedLabel = Malloc(10);
    sprintf(indeksAllowedLabel, "indeksAllowed%d", labelCounter);
    labelCounter++;
    char *indeksErrorLabel = Malloc(10);
    sprintf(indeksErrorLabel, "indeksError%d", labelCounter);
    labelCounter++;
    nonNullDerefLabel1 = Malloc(10);
    sprintf(nonNullDerefLabel1, "nonNullDeref%d", labelCounter);
    labelCounter++;
    nonNullDerefLabel2 = Malloc(10);
    sprintf(nonNullDerefLabel2, "nonNullDeref%d", labelCounter);
    labelCounter++;

    error = IRtravVarRecursive(t, var->val.varexp.var, sym, ty, op);
    if(error == -1){
      return -1;
    }
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(*op,IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
    IRresetBasePointer();//RESET VALUE IN RDI TO BASEPOINTER

    op1 = IRtravExp(t, var->val.varexp.exp);
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
    IRresetBasePointer();

    //check if array is null
    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(IRmakeLabelOPERAND(nonNullDerefLabel1), IRmakeCommentOPERAND("not NULL"))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
    IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel1)));

    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTempDeRefOPERAND(t1),IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeJgeINSTR(IRappendOPERAND(IRmakeLabelOPERAND(indeksErrorLabel), IRmakeCommentOPERAND("indexOutOfBounds"))));
    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0),IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeJgeINSTR(IRappendOPERAND(IRmakeLabelOPERAND(indeksAllowedLabel), IRmakeCommentOPERAND("not indexOutOfBounds"))));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(indeksErrorLabel)));
    IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("Exit program with error here")));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(INDEXOUTOFBOUNDSCODE), IRappendOPERAND(IRmakeRegOPERAND(RAX), IRmakeCommentOPERAND("IndexOutOfBounds")))));
    IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(indeksAllowedLabel)));

    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(1), IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeCommentOPERAND("moving past array-size-value")))));
    IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(IRmakeConstantOPERAND(8), IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

    //check if array index is null
    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(IRmakeLabelOPERAND(nonNullDerefLabel2), IRmakeCommentOPERAND("not NULL"))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
    IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel2)));


    *op = IRmakeTempDeRefOPERAND(t1);
    //TODO:update symbol??
    //*ty = (*sym)->typePtr->val.arrayType;
    //if((*sym)->typeVal == idK){
    if((*ty)->kind == idK){
      *sym = recursiveSymbolRetrieval((*sym)->defScope, (*ty)->val.id, NULL);
      *ty = (*sym)->typePtr;
    }
    *ty = (*ty)->val.arrayType;
    //fprintf(stderr, "IRtravVar: UnsupportedArrayVarException\n");
    return 0;
  case dotK:
    nonNullDerefLabel1 = Malloc(10);
    sprintf(nonNullDerefLabel1, "nonNullDeref%d", labelCounter);
    labelCounter++;
    nonNullDerefLabel2 = Malloc(10);
    sprintf(nonNullDerefLabel2, "nonNullDeref%d", labelCounter);
    labelCounter++;

    error = IRtravVarRecursive(t, var->val.vardot.var, sym, ty, op);
    if(error == -1){
      return -1;
    }
    if((*ty)->kind == idK){
      *sym = recursiveSymbolRetrieval((*sym)->defScope, (*ty)->val.id, NULL);
      *ty = (*sym)->typePtr;
    }
    *sym = getSymbol((*sym)->content, var->val.vardot.id); //recursiveSymbolRetrieval??
    //now symbol type and type does not match
    *ty = (*sym)->typePtr;
    t1 = IRcreateNextTemp(tempLocalCounter);
    tempLocalCounter++;
    IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("creating record dereferencing")));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(*op, IRmakeRegOPERAND(RBX))));
    IRresetBasePointer();

    //check if record is null
    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeNullOPERAND(),IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(IRmakeLabelOPERAND(nonNullDerefLabel1), IRmakeCommentOPERAND("not NULL"))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
    IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel1)));

    int offset = (*sym)->cgu->val.temp->placement.offset;
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(offset*8),
      IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX),
      IRmakeTemporaryOPERAND(t1))));


    //check of deref variable is NULL
    IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(IRmakeLabelOPERAND(nonNullDerefLabel2), IRmakeCommentOPERAND("not NULL"))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
    IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
    IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel2)));

    *op = IRmakeTempDeRefOPERAND(t1);
    //fprintf(stderr, "IRtravVar: UnsupportedRecordVarException\n");
    return 0;
  }
}

/**
 * Traverse expression, for most of these we evaluate the tree right first.
 * this was done because for division and multiplication the left operand
 * needed to be in a specific register so then it was nice to just be able
 * to move it straight there without moving into a temporary.
 */
OPERAND* IRtravExp(SymbolTable *t, EXP *exp){
  OPERAND *op1, *op2, *op4;
  TEMPORARY *t1, *t2;
  switch(exp->kind){
    case termK:
      return IRtravTerm(t, exp->val.term);
      break;
    case minusK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      return IRmakeTemporaryOPERAND(t1);

    case plusK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op1 = IRtravExp(t, exp->val.binOP.left);

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      op2 = IRtravExp(t, exp->val.binOP.right);

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      return IRmakeTemporaryOPERAND(t1);

    case divK://TODOMADS THIS IS YOUR JOB YOU SLACKER! - mads to mads
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRappendOPERAND(IRmakeTemporaryOPERAND(t1), IRmakeCommentOPERAND("first operand in t1")))));//left op in t1

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();//alle de her reset basepointer er måske overflødige! - mads
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));//right op in t2 and rbx

      // check divsion by zero
      IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RAX)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(DEVISIONBYZERO), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RBX))));//cmp right op with 0
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RAX)));

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t2), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RDX))));

      IRappendINSTR(IRmakeDivINSTR(IRmakeRegOPERAND(RBX)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RAX), IRmakeTemporaryOPERAND(t1))));
      return IRmakeTemporaryOPERAND(t1);

    case timesK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      // IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      //   IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RAX))));


      IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1),IRmakeRegOPERAND(RBX))));

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      return IRmakeTemporaryOPERAND(t1);

    case andK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *lazyAndLabel = Malloc(10);
      sprintf(lazyAndLabel, "ge%d", labelCounter);
      labelCounter++;

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      //TODO LAZY CHECK if first operand is false we just return false.
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeFalseOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(lazyAndLabel)));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeAndINSTR(IRappendOPERAND(//bitwise and, should only ever work on 0 or 1 so we should only ever get 0 or 1 back
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));

      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(lazyAndLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));


      return IRmakeTemporaryOPERAND(t1);

    case orK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *lazyOrLabel = Malloc(10);
      sprintf(lazyOrLabel, "ge%d", labelCounter);
      labelCounter++;

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));//right operand in t1

      //TODO LAZY CHECK if first operand is false we just return false.
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(lazyOrLabel)));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));//left operand in rbx
      IRresetBasePointer();

      IRappendINSTR(IRmakeOrINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));

      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(lazyOrLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      return IRmakeTemporaryOPERAND(t1);

    case leK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *leLabel = Malloc(10);
      sprintf(leLabel, "ge%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(t2)))); //assuming true

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJleINSTR(IRmakeLabelOPERAND(leLabel))); //if true, skip next

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t2)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(leLabel)));


      return IRmakeTemporaryOPERAND(t2);

    case eqK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op4 = IRmakeTemporaryOPERAND(t1); //result temporary
      char *eqLabel = Malloc(10);
      sprintf(eqLabel, "eq%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeTemporaryOPERAND(t1)))); //assuming true
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(eqLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t1)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(eqLabel)));

      return IRmakeTemporaryOPERAND(t1);

    case geK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *geLabel = Malloc(10);
      sprintf(geLabel, "ge%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(t2)))); //assuming true

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJgeINSTR(IRmakeLabelOPERAND(geLabel))); //if true, skip next

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t2)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(geLabel)));


      return IRmakeTemporaryOPERAND(t2);

    case greatK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *greatLabel = Malloc(10);
      sprintf(greatLabel, "ge%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(t2)))); //assuming true

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJgINSTR(IRmakeLabelOPERAND(greatLabel))); //if true, skip next

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t2)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(greatLabel)));


      return IRmakeTemporaryOPERAND(t2);

    case lessK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *lessLabel = Malloc(10);
      sprintf(lessLabel, "ge%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(t2)))); //assuming true

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJlINSTR(IRmakeLabelOPERAND(lessLabel))); //if true, skip next

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t2)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(lessLabel)));


      return IRmakeTemporaryOPERAND(t2);

    case neK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op4 = IRmakeTemporaryOPERAND(t1); //result temporary
      char *neLabel = Malloc(10);
      sprintf(neLabel, "eq%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeTemporaryOPERAND(t1)))); //assuming true
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      IRresetBasePointer();

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();

      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(neLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t1)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(neLabel)));

      return IRmakeTemporaryOPERAND(t1);
  }
}

/**
 * Traversing term
 */
OPERAND* IRtravTerm(SymbolTable *t, TERM *term){
  OPERAND *op, *op2, *staticLinkOP;
  SYMBOL *sym;
  TYPE *type;
  Typekind tk;
  int error = 0;
  TEMPORARY *temp;
  switch(term->kind){
    case varK:
      op = IRtravVar(t, term->val.var);
      if(op == NULL){
        fprintf(stderr, "OP line: %d\n", term->lineno);
      }
      //op = IRmakeTemporaryOPERAND(sym->cgu->val.temp);
      return op;
      break;
    case idTermK: //function call
    ;
      //slå id i symbol-table
      int *nrJumps = Calloc(sizeof(int));//new function in compiler/src/utility/memory.c
      sym = IRgetSymbol(t, term->val.idact.id, nrJumps);
      //find function-body-scope ???
      //find CODEGENUTIL
      //tjek om label findes -> brug eller lav label
      //if(cgu->val.funcInfo.funcLabel == NULL){
      if(sym->cgu == NULL){
        fprintf(stderr, "%s\n", "should be a mistake");
        return NULL;
      }
      CODEGENUTIL *cgu = sym->cgu;
      INSTR *label = cgu->val.funcInfo.funcLabel;
      //slå symboler i actionlist op i symboltable
      //for ting der ikke er symboler: lav temporaries og operander
      //link operander sammen (evt. i omvendt rækkefølge)
      ////////////////////////////////////////////////////////////////////op = IRtravActList(t, term->val.idact.list); //param list

      //TODO - Generate code to put static link in rdx;
      staticLinkOP = IRsetCalleeStaticLink(*nrJumps);
      if(staticLinkOP == NULL){
        return NULL;
      }
      //kald IRmakeFunctionCallScheme
      error = IRmakeFunctionCallScheme(t, label, term->val.idact.list, staticLinkOP);
      if(error == -1){
        return NULL;
      }
      //return NULL;
      //what to return? the result of function call? Where? %rax?
      op = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter));
      tempLocalCounter++;
      //op = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter - cgu->val.funcInfo.localStart)); //todo: wrong offset
      //localCounter++;
      op2 = NEW(OPERAND);
      op2->next = NULL;
      memcpy(op2, op, sizeof(OPERAND));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RAX),op2)));
      //todo check return of append
      //return op;
      return op;
      break;
    case expTermK:
      return IRtravExp(t, term->val.exp);
      //fprintf(stderr, "IRtravTerm: UnsupportedTermException: expTermK\n");
      break;
    case notTermK:
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *falseLabel = Malloc(10);
      sprintf(falseLabel, "false%d", labelCounter);
      labelCounter++;
      op = IRtravTerm(t, term->val.notTerm);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op, IRmakeRegOPERAND(RBX))));
      IRresetBasePointer();
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(temp))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(falseLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(), IRmakeTemporaryOPERAND(temp))));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(falseLabel)));
      return IRmakeTemporaryOPERAND(temp);
      break;
    case expCardK:
      sym = NULL;
      op = IRtravExp(t, term->val.expCard);
      type = term->val.expCard->type;
      tk = term->val.expCard->typekind;
      if(tk == idK){
        sym = recursiveSymbolRetrieval(term->val.expCard->type->scope, term->val.expCard->type->val.id, NULL);
        type = sym->typePtr;
        tk = sym->typeVal;
      }
      switch(tk){
        case idK:
          fprintf(stderr, "How the hell did this happen\n");
          break;
        case intK:
          temp = IRcreateNextTemp(tempLocalCounter);
          tempLocalCounter++;
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op, IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0), IRmakeTemporaryOPERAND(temp))));
          char *positiveLabel = Malloc(10);
          sprintf(positiveLabel, "posi%d", labelCounter);
          labelCounter++;
          IRappendINSTR(IRmakeJgeINSTR(IRmakeLabelOPERAND(positiveLabel)));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(IRmakeTemporaryOPERAND(temp), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(positiveLabel)));
          return IRmakeTemporaryOPERAND(temp);
        case boolK:
          return op;
        case arrayK:
          temp = IRcreateNextTemp(tempLocalCounter);
          tempLocalCounter++;
          char *nullLabel = Malloc(10);
          sprintf(nullLabel, "null%d", labelCounter);
          labelCounter++;
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op, IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeNullOPERAND(), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(nullLabel)));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeTempDeRefOPERAND(temp), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nullLabel)));
          return IRmakeTemporaryOPERAND(temp);
        case recordK:
          if(sym == NULL){
            //This is going to be a very naive approach
            VAR_DECL_LIST *vdl = type->val.vList;
            int i = 0;
            while(vdl!=NULL){
              i++;
              vdl = vdl->vList;
            }
            fprintf(stderr, "Here something naive is done\n");
            return IRmakeConstantOPERAND(i);
          }
          int size = findVarSymSize(sym);
          if(size == -1){
            fprintf(stderr, "cardinalty: Hopefully error is already printed\n");
            return NULL;
          }
          return IRmakeConstantOPERAND(size);
          break;
        case nullKK:
          return IRmakeNullOPERAND();
          break;
        case errorK:
          fprintf(stderr, "What is the cardinalty of a type-error\n");
          break;
      }

      fprintf(stderr, "IRtravTerm: SOME INTERNAL ERROR\n");
      break;
    case numK:
      op = IRmakeConstantOPERAND(term->val.num);
      return op;
      break;
    case trueK:
      //true is represented by a 1
      op = IRmakeTrueOPERAND();
      return op;
      break;
    case falseK:
      //false is represented by a 0;
      op = IRmakeFalseOPERAND();
      return op;
      break;
    case nullK:
      //fprintf(stderr, "IRtravTerm: UnsupportedTermException: nullK\n");
      op = IRmakeConstantOPERAND(0);
      return op;
      break;
    default:
      fprintf(stderr, "IRtravTerm ERROR, term has no valid kind\n");
  }
  return NULL;
}

/**
 * Traversing actionlist
 */
int IRtravActList(SymbolTable *t, ACT_LIST *actlist){
  if(actlist == NULL){
    return 0;
  }
  return IRtravExpListReverse(t, actlist->expList);
}

/**
 * Traversing expression list
 */
OPERAND* IRtravExpList(SymbolTable *t, EXP_LIST *exps){
  if(exps != NULL){
    OPERAND* op = IRtravExp(t, exps->exp);
    if(op == NULL){
      fprintf(stderr, "OPERAND IS NULL\n");
      return NULL;
    }
    //return IRtravExpList(t, exps->expList);
    //opposite order may be achieved by switching arguments: not that simple
    IRappendOPERAND(op, IRtravExpList(t, exps->expList));
    return op;
  }
  return NULL;
}

int IRtravExpListReverse(SymbolTable *t, EXP_LIST *exps){
  int i=0;
  OPERAND *op;
  if(exps != NULL){
    i = IRtravExpListReverse(t, exps->expList);
    if(i==-1){
      return -1;
    }
    op = IRtravExp(t, exps->exp);
    if(op == NULL){
      return -1;
    }
    IRappendINSTR(IRmakePushINSTR(op));
    IRresetBasePointer();
    i++;
  }
    //IRappendOPERAND(op, IRtravExp(t, exps->exp));
    //return op;
  return i;
}


//****OPERAND constructors*****//
OPERAND *IRmakeConstantOPERAND(int conVal){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = constantO;
  par->val.constant = conVal;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeTemporaryOPERAND(TEMPORARY *temp){
  if(temp == NULL){
    fprintf(stderr, "break\n");
  }
  OPERAND *par = NEW(OPERAND);
  par->operandKind = temporaryO;
  par->val.temp = temp;
  par->next = NULL;
  return par;
}

//is this still relevant??
// OPERAND *IRmakeAddrOPERAND(int addrVal){
//   OPERAND *par = NEW(OPERAND);
//   par->operandKind = heapAddrO;
//   par->val.address = addrVal;
//   par->next = NULL;
//   return par;
// }

OPERAND *IRmakeLabelOPERAND(char *labelName){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = labelIDO;
  par->val.label = labelName;
  par->next = NULL;
  return par;
}

// OPERAND *IRmakeLocalOPERAND(int number){
//   OPERAND *par = NEW(OPERAND);
//   par->operandKind = localO;
//   par->val.tempIDnr = number;
//   par->next = NULL;
//   return par;
// }
//
// OPERAND *IRmakeParamOPERAND(int number){
//   OPERAND *par = NEW(OPERAND);
//   par->operandKind = paramO;
//   par->val.tempIDnr = number;
//   par->next = NULL;
//   return par;
// }

OPERAND *IRmakeRegOPERAND(registers reg){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = registerO;
  par->val.reg = reg;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeDeRefOPERAND(registers reg){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = derefO;
  par->val.reg = reg;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeAddrLabelOPERAND(char *addrlabel){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = addrLabelO;
  par->val.label = addrlabel;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeTextOPERAND(char *text){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = textO;
  par->val.label = text;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeCommentOPERAND(char *text){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = commentO;
  par->val.label = text;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeTempDeRefOPERAND(TEMPORARY *temp){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = tempDeRefO;
  par->val.temp = temp;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeTrueOPERAND(){
  return IRmakeConstantOPERAND(1);
}

OPERAND *IRmakeFalseOPERAND(){
  return IRmakeConstantOPERAND(0);
}

OPERAND *IRmakeNullOPERAND(){
  return IRmakeConstantOPERAND(0);
}

OPERAND *IRappendOPERAND(OPERAND *tail, OPERAND *next){
  if(tail == NULL){
    fprintf(stderr, "IRappendOPERAND: tail is NULL\n");
    return next; //maybe??????
  }
  tail->next = next;
  return tail;
}



INSTR* IRmakeINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeMovINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = movI;
  return instr;
}


INSTR* IRmakeAddINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = addI;
  return instr;
}

INSTR* IRmakeSubINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = subI;
  return instr;
}

INSTR* IRmakeDivINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = divI;
  return instr;
}

INSTR* IRmakeMulINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = mulI;
  return instr;
}

INSTR* IRmakeAndINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = andI;
  return instr;
}

INSTR* IRmakeOrINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = orI;
  return instr;
}

INSTR* IRmakeJeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpeqI;
  return instr;
}


INSTR* IRmakeJneINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpneqI;
  return instr;
}

INSTR* IRmakeJleINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpleI;
  return instr;
}

INSTR* IRmakeJgeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpgeI;
  return instr;
}

INSTR* IRmakeJgINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpgreatI;
  return instr;
}

INSTR* IRmakeJlINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmplessI;
  return instr;
}

INSTR* IRmakeLabelINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = labelI;
  int error = 0;
  error = instrHashPutInstr(labelINSTRTable, instr);
  if(error == -1){
    fprintf(stderr, "INTERNAL ERROR occurred putting instruction\n");
  }
  return instr;
}

INSTR* IRmakePushINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = pushI;
  return instr;
}

INSTR* IRmakePopINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = popI;
  return instr;
}

INSTR* IRmakeCallINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = callI;
  return instr;
}

INSTR* IRmakeRetINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = retI;
  return instr;
}

INSTR *IRmakeJumpINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jumpI;
  return instr;
}

INSTR *IRmakeCmpINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = cmpI;
  return instr;
}

INSTR* IRmakeTextINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = textI;
  return instr;
}

INSTR* IRmakeCommentINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = commentI;
  return instr;
}

INSTR* IRappendINSTR(INSTR *newINSTR){
  if(intermediateTail == NULL){
   intermediateHead = newINSTR;
   intermediateTail = newINSTR;
 }
 else{
   intermediateTail->next = newINSTR;
   intermediateTail = newINSTR;
 }
 newINSTR->id = intermediateInstrCount;
 intermediateInstrCount++;
 return newINSTR;
}

/**
 * Makes a function call
 * The first parameter is the instruction giving the label to where to jump
 * The Second paramater is the list of parameters to this function
 *  - This list may be arbitrarily long
 */
int IRmakeFunctionCallScheme(SymbolTable *t, INSTR *labelINSTR, ACT_LIST *paramList, OPERAND* staticLinkOP){
  if(labelINSTR->instrKind != labelI){
    fprintf(stderr, "ERROR: IRmakeFunctionCallScheme, no label or whatever\n");
  }
  //Caller save registers
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RCX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RDX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RSI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RDI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R8)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R9)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R10)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R11)));
  //int ParamCount = 1; //static link already inkluded
  int paramCount = IRtravActList(t, paramList);
  if(paramCount == -1){
    fprintf(stderr, "INTERNAL ERROR: IRmakeFunctionCallScheme\n");
  }
  paramCount++; //static link included

  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(staticLinkOP, IRmakeRegOPERAND(RBX))));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBX))); //Static link field
  //do the actual call
  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList));

  //remove static link and parameters
  IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("remove static link and parameters")));
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
    IRmakeConstantOPERAND(paramCount*8),
    IRappendOPERAND(IRmakeRegOPERAND(RSP),
    IRmakeCommentOPERAND("remove static link and parameters")))));


  //caller save registers
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R11)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R10)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R9)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(R8)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RDI)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RSI)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RDX)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RCX)));

  return 0;

  //ins = IRmakePushINSTR(IRmakeRegOPERAND(RAX)); //dafuq s this??


}

/**
 * creates code to find the static link
 * of the function we are about to call
 * put it in rbx !!!(this may change later)!!!
 *                        CHANGE IT TO return an operand blahblah
 */
OPERAND *IRsetCalleeStaticLink(int nrJumps){
  TEMPORARY *t1, *t2;
  OPERAND *o2;
  //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("STARTMYSHIT")));
  if(nrJumps == 0){//we are accessing a function in our own scope
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBP),
      IRmakeRegOPERAND(RBX))));
  } else {
    t1 = IRcreateNextTemp(tempLocalCounter);
    tempLocalCounter++;
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBP),
      IRmakeTemporaryOPERAND(t1))));

    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(16),
      IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1),
      IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeDeRefOPERAND(RBX),
      IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX),
      IRmakeTemporaryOPERAND(t1))));

    while((nrJumps-1) > 0){
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(16),
      IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1),
      IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeDeRefOPERAND(RBX),
      IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX),
      IRmakeTemporaryOPERAND(t1))));

      nrJumps = nrJumps-1;
    }
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1),
      IRmakeRegOPERAND(RBX))));
  }
  t2 = IRcreateNextTemp(tempLocalCounter);
  tempLocalCounter++;
  o2 = IRmakeTemporaryOPERAND(t2);
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBX),
    o2)));
  //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("ENDMYSHIT")));

  return IRmakeTemporaryOPERAND(t2);
}

/**
 * take name of variable and return the operand
 * with the position of the variable
 * place variables scopes basepointer in RDI
 */
OPERAND *IRsetStaticBase(int *nrJumps){
  OPERAND *o1, *o2;
  //TEMPORARY *t1;
  //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("STARTMYOTHERSHIT")));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBX)));
  //t1 = IRcreateNextTemp(tempLocalCounter);
  //tempLocalCounter++;
  o1 = IRsetCalleeStaticLink(*nrJumps);
  o2 = IRmakeRegOPERAND(RBX);
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(o1, o2)));
  o2 = IRmakeRegOPERAND(RDI);
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBX), o2)));

  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RBX)));
  //IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND("ENDMYOTHERSHIT")));
  return o2;
}

int IRresetBasePointer(){
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBP),
    IRappendOPERAND(
      IRmakeRegOPERAND(RDI),
      IRmakeCommentOPERAND("resetting basepointer")
      ))));
  return 0;
}





//comfort space
