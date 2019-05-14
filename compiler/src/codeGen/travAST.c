#include "internalASM.h"
#include "memory.h"
#include "tree.h"
#include "typecheck.h"
#include <string.h>

//TODO: remove sym-val
//TODO: cleanup in IRtraexp
//TODO: move hashfunction to utility folder
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
  tmp->next = livenessTempList;
  livenessTempList = tmp;
  return tmp;
}

/**
 * Creates new local-variabel temp
 * The offset is the distance above the basepointer
 */
TEMPORARY* IRcreateNextLocalTemp(int offset){
  TEMPORARY* tmp = NEW(TEMPORARY);
  tmp->temporarykind = localT;
  tmp->tempId = tempIdVal;
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
  int error = 0;
  labelCounter = 1;
  intermediateInstrCount = 0;
  tempLocalCounter = 1;
  labelINSTRTable = initInstrHashTable();
  dummyTemp = IRcreateNextTemp(-1);
  //**Fixed part in beginning of program**//
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
    return 0; //no bodies gives rise to no errors
  }
  resetbodyListIndex(mainBody);
  bodyListElm *bElm = getBody(mainBody);

  while(bElm != NULL){
    //initializes each function
    error = IRinitParams(bElm->defScope, bElm);
    if(error == -1){
      return -1;
    }
    bElm = getBody(mainBody);
  }

  resetbodyListIndex(mainBody);
  bElm = getBody(mainBody);
  while(bElm != NULL){
    //traverse each sub-body of this body
    error = IRtravBody(bElm->scope, bElm);
    if(error == -1){
      return -1;
    }
    bElm = getBody(mainBody);
  }

  IRruntimeErrorCleanupCode();
  return 0;
}

/**
 * Generates cleanupcode used in case of runtime error
 */
void IRruntimeErrorCleanupCode(){
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeLabelOPERAND(mainSPointLabel), IRmakeRegOPERAND(RSP))));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeLabelOPERAND(mainBPointLabel), IRmakeRegOPERAND(RBP))));
  IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(mainEndLabel)));
}

/**
 * Initializes each function symbol by giving the function a label
 * and each parameter an offset
 */
int IRinitParams(SymbolTable *table, bodyListElm *element){
  int paramCount = 0;
  ParamSymbol *pSym = element->scope->ParamHead;
  char *mainName = NULL;
  SYMBOL *func;
  char *labelName;
  if(element->funcId == NULL){ //main scope
    mainName = Malloc(sizeof(char)*6);
    sprintf(mainName, "$main"); //create main-scope symbol
    func = putSymbol(table, mainName, 0, funcK, intK, table, NEW(TYPE));
    element->funcId = mainName;
    char* glblmain = Malloc(sizeof(char)*15);
    sprintf(glblmain, ".globl main"); //add globl-thingy
    IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(glblmain)));
    labelName = Malloc(sizeof(char)*6);
    sprintf(labelName, "main"); //main label
  } else { //other scope
    labelName = Malloc(strlen(element->funcId)+6); //other label
    sprintf(labelName, "%s%d", element->funcId, labelCounter);
    labelCounter++;
  }
  func = getSymbol(table, element->funcId);
  func->cgu = IRmakeNewCGU(); //save the label
  func->cgu->val.funcInfo.funcLabel = IRmakeLabelINSTR(
    IRmakeLabelOPERAND(labelName));

  SYMBOL *sym;
  while(pSym != NULL){
    //create cgu for each parameter
    //with associated offset
    sym = pSym->data;
    if(sym->cgu == NULL){
      sym->cgu = IRmakeNewCGU();
      sym->cgu->val.temp = IRcreateParamTemp(paramCount);
      paramCount++;
    }
    pSym = pSym->next;
  }
  func->cgu->val.funcInfo.paramCount = paramCount;
  return 0;
}

/**
 * Traverse the body of a function
 * Generates code for function
 */
int IRtravBody(SymbolTable *table, bodyListElm *body){
  int error = 0;
  SYMBOL *sym = getSymbol(body->defScope, body->funcId);
  tempLocalCounter = 0; //number of temps and locals in current scope
  error = IRtravDeclList(table, body->body->vList); //find all local variables
  if(error == -1){
    return -1;
  }
  IRappendINSTR(sym->cgu->val.funcInfo.funcLabel);

  error = IRmakeCalleeProlog();
  if(error == -1){
    return -1;
  }

  INSTR * instrTempTail = intermediateTail;
  //create func end label
  char* endLabelName = Malloc(
    strlen(sym->cgu->val.funcInfo.funcLabel->paramList->val.label)+4);
  sprintf(endLabelName, "%s%s", 
    sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "end");
  labelCounter++;
  if(strcmp(sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "main") == 0){
    //Special stuff for beginning of main function
    mainEndLabel = endLabelName;
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RSP),IRmakeLabelOPERAND(mainSPointLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBP),IRmakeLabelOPERAND(mainBPointLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeAddrLabelOPERAND(beginHeapLabel),
      IRmakeLabelOPERAND(freeHeapLabel))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeAddrLabelOPERAND(beginHeapLabel),
      IRmakeLabelOPERAND(endHeapLabel))));
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(HEAPSIZE),IRmakeLabelOPERAND(endHeapLabel))));
  }

  error = IRtravStmtList(table, body->body->sList, endLabelName, NULL, NULL);
  if(error == -1){
    fprintf(stderr, "INTERNAL ERROR: while traversing statements of %s\n", 
      body->funcId);
    return -1;
  }
  //make room for locals and temps
  int nrTempsAndLocals = tempLocalCounter;
  IRinserINSTRhere(instrTempTail, IRmakeSubINSTR(IRappendOPERAND(
    IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP))));

  if(strcmp(sym->cgu->val.funcInfo.funcLabel->paramList->val.label, "main") == 0){
    //return 0 at end of main
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RAX))));
  }

  //function epilogue
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endLabelName)));
  //remove all temps and locals
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
    IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP))));
  return IRmakeCalleeEpilog();
}

int IRinserINSTRhere(INSTR *prev, INSTR* new){
  new->next = prev->next;
  prev->next = new;
  return 0;
}

int IRmakeCalleeProlog(){
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBP)));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RSP), IRmakeRegOPERAND(RBP))));
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
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBP), IRmakeRegOPERAND(RSP))));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RBP)));
  IRappendINSTR(IRmakeRetINSTR(NULL));
  return 0;
}



CODEGENUTIL *IRmakeNewCGU(){
  CODEGENUTIL *newCGU = NEW(CODEGENUTIL);
  memset(newCGU, 0, sizeof(CODEGENUTIL));
  newCGU->size = -1;
  return newCGU;
}

/**
 * only traverse the declerations immediately available
 * do not dive into functions etc.
 * Count the number of variables.
 */
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
  SYMBOL *sym, *sym2;
  TYPE *ty = NULL;
  int varCount;
  if(decl == NULL){
    return 0;
  }
  switch(decl->kind){
    case idDeclK: //userdefined type
      sym = getSymbol(table, decl->val.id.id);
      if(sym->cgu != NULL){
        return 0; //type already investigated
      }
      sym->cgu = IRmakeNewCGU();
      sym->cgu->val.temp = NULL;
      sym2 = sym;
      if(sym2->typePtr->kind == idK){ //go to buttom of user types
        sym2 = recursiveSymbolRetrieval(table, sym2->typePtr->val.id, NULL);
      }
      ty = sym2->typePtr;
      if(sym2->cgu == NULL){
        sym2->cgu = IRmakeNewCGU();
        sym2->cgu->val.temp = NULL;
      }
      if(ty->kind == recordK){
        if(sym2->cgu->size == -1){ //not yet investiated
          varCount = IRtravVarDeclList(sym2->content, ty->val.vList, 0);
          if(varCount == -1){
            fprintf(stderr, "INTERNAL ERROR: while traversing record %s\n", 
              sym2->name);
            return -1;
          }
          sym2->cgu->size = varCount;
        }
      }
      else if(ty->kind == boolK || ty->kind == intK || ty->kind == arrayK){
        sym2->cgu->size = 1;
        break;
      }
      else{
        fprintf(stderr, "INTERNAL ERROR: how did i get here %d\n", ty->kind);
        return -1;
        break;
      }
      sym->cgu->size = sym2->cgu->size;
      break;
    case funcK:
      //functions are handled breadth first in IRinitParams()
      break;
    case listK: //count number of variables
      varCount = IRtravVarDeclList(table, decl->val.list, tempLocalCounter);
      if(varCount >= 0){
        tempLocalCounter = varCount;
        return 0;
      }
      return -1;
      break;
  }
  return 0;
}


/**
 * traverse variable declaration list
 * Third parameter is the next offset to be used (in current scope)
 * For each variable found the offset is incremented
 * The offset is returned as it is after all variables are found
 */
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList, 
                                                                int offset){
  offset = IRtravVarType(table, varDeclList->vType, offset);
  if((offset != -1) && (varDeclList->vList != NULL)){
    offset = IRtravVarDeclList(table, varDeclList->vList, offset);
  }
  return offset;
}

/**
 * Creates a CGU for each variable traversed and increments the offset
 * returns incremented offset
 */
int IRtravVarType(SymbolTable *table, VAR_TYPE *varType, int offset){
  SYMBOL *sym = getSymbol(table, varType->id);
  if(sym == NULL){
    fprintf(stderr, "INTERNAL ERROR: Line %s: \
      IRtravVarType: no symbol found for %d\n", varType->id, varType->lineno);
    return -1;
  }
  if(sym->cgu == NULL){
    sym->cgu = IRmakeNewCGU();
    sym->cgu->val.temp = IRcreateNextLocalTemp(offset);
    offset++;
  } else {
    //even if the symbol already have cgu
    //we still have to count the element
    return ++offset;
  }
  SYMBOL *sym2 = sym;
  TYPE *ty = sym2->typePtr;
  SymbolList *knownSyms = NULL; //for circulation detection
  int varCount;
  while(1){ //carefull
    if(ty->kind == idK){ //go to buttom of user types
      sym2 = recursiveSymbolRetrieval(table, ty->val.id, NULL);
      if(containsSym(knownSyms, sym2)){
        break; //already visited symbol
      }
      knownSyms = prependSymbol(knownSyms, sym2);
      ty = sym2->typePtr;
    }
    if(sym2->cgu == NULL){ //symbol not visited
      sym2->cgu = IRmakeNewCGU();
      sym2->cgu->val.temp = NULL;
      sym2->cgu->size = -1; //default size
    }
    if(ty->kind == recordK){
      if(sym2->cgu->val.temp == NULL || sym == sym2){//latter: anonymous record
        if(sym2->cgu->val.temp == NULL){
          //usertypes does not need af temporary
          //dummy used to test whether content of user-record has already been traversed
          sym2->cgu->val.temp = dummyTemp;
        }
        varCount = IRtravVarDeclList(sym2->content, sym2->typePtr->val.vList, 0);
        if(varCount == -1){
          fprintf(stderr, "INTERNAL ERROR: while traversing record %s\n", 
            sym2->name);
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
      fprintf(stderr, "INTERNAL ERROR: how did i get here %d\n", ty->kind);
      return -1;
      break;
    }
  }
  return offset;
}

/**
* finds the size of the given symbol
* Assumes that declarations of all user types
* have been traversed and its sizes found
* returns -1 on error
*/
int findVarSymSize(SYMBOL *sym){
  Typekind tk;
  int size;
  SYMBOL *sym2;
  if(sym->cgu->size == -1){
    tk = sym->typeVal;
    switch(tk){
      case idK:
        sym2 = recursiveSymbolRetrieval(sym->defScope, sym->typePtr->val.id, 0);
        if(sym2->cgu->size == -1){
          fprintf(stderr, "INTERNAL ERROR: The size of %s \
            has not been specified\n", sym->name);
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
        fprintf(stderr, "INTERNAL ERROR: findVarSymSize\n");
        return -1;
      case nullKK:
        fprintf(stderr, "%s\n", "INTERNAL ERROR: findVarSymSize nullKK error");
        return -1;
    }
  }
  return sym->cgu->size;
}

/**
 * Generates code for the statements in the given list
 * start and end labels are for loop jumping when using contine and break
 * returns -1 on error
 */
int IRtravStmtList(SymbolTable *table, STATEMENT_LIST *statements, 
                      char* funcEndLabel, char* startLabel, char* endLabel){
  int error = 0;
  error = IRtravStmt(table, statements->statement, 
    funcEndLabel, startLabel, endLabel);
  if(error == -1){
    return -1;
  }
  if(statements->statementList != NULL){
    return IRtravStmtList(table, statements->statementList, 
      funcEndLabel, startLabel, endLabel);
  }
  return 0;
}

/**
 * Generates code for the given statement
 */
int IRtravStmt(SymbolTable *t, STATEMENT *stmt, char* funcEndLabel, 
                                          char* startLabel, char* endLabel){
  OPERAND *op1, *op2, *op3;
  TEMPORARY *temp;
  SYMBOL *sym;
  TYPE *ty;
  char *elseLabel, *endifLabel, *allocSuccLabel, *startwhileLabel,
        *endwhileLabel, *commentString;
  int error, size;
  switch(stmt->kind){
    case returnK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d return statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      op1 = IRtravExp(t, stmt->val.return_);
      op2 = IRmakeRegOPERAND(RAX);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op2)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(funcEndLabel)));
      return 0;
    case writeK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d write statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      op1 = IRtravExp(t, stmt->val.write);
      if(op1 == NULL){
        fprintf(stderr, "INTERNAL ERROR: OP1 line: %d\n", stmt->lineno);
      }
      IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RDI)));

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RSI))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeAddrLabelOPERAND("format"), IRmakeRegOPERAND(RDI))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(0),IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeCallINSTR(IRmakeLabelOPERAND("printf")));

      IRappendINSTR(IRmakePopINSTR(IRmakeRegOPERAND(RDI)));
      return 0;
    case allocateK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d allocate statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));

      //finds location of variable to be allocated
      error = IRtravVarRecursive(t, stmt->val.allocate, &sym, &ty, &op1);
      if(error == -1){
        fprintf(stderr, "INTERNAL ERROR: IRtravStmt: \
          didn't successfully find operand of variable\n");
        return -1;
      }
      //lets the variable point to the next free heap space
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),op1)));
      if(ty != sym->typePtr){
        //only when arrays are traversed
        if(ty->kind == idK){
          sym = recursiveSymbolRetrieval(ty->scope, ty->val.id, NULL);
          size = findVarSymSize(sym);
        }
        else{ //if not idK then int, bool or array
          size = 1;
        }
      }
      else{
        size = findVarSymSize(sym);
      }
      if(size == -1){
        fprintf(stderr, "INTERNAl ERROR: Alloc: Hopefully \
          error is already printed\n");
        return -1;
      }
      //expand heap
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(size*8),IRmakeLabelOPERAND(freeHeapLabel))));
      //check if out of memory
      allocSuccLabel = Malloc(10);
      sprintf(allocSuccLabel, "allocSucc%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(endHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJlINSTR(IRmakeLabelOPERAND(allocSuccLabel))); //not out of memory
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(OUTOFMEMORYCODE),
        IRappendOPERAND(IRmakeRegOPERAND(RAX),
        IRmakeCommentOPERAND("outofMemory")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocSuccLabel)));
      return 0;
    case allocateLengthK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d allocate of length statement", 
        stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));

      //finds location of variable to be allocated
      error = IRtravVarRecursive(t, stmt->val.allocatelength.var, 
                                                        &sym, &ty, &op1);
      if(error == -1){
        fprintf(stderr, "INTERNAL ERROR: IRtravStmt: \
          didn't successfully find operand of variable\n");
        return -1;
      }
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      //saving the allocation in the found operand
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeRegOPERAND(RBX),op1)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX),IRmakeTemporaryOPERAND(temp))));
      size = 1; //size of pointer
      //find result of allocation size expression
      op2 = IRtravExp(t,stmt->val.allocatelength.exp);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2,IRmakeRegOPERAND(RBX))));
      //postive allocation size check
      char *allocPosLabel = Malloc(10);
      sprintf(allocPosLabel, "allocPos%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJgINSTR(IRmakeLabelOPERAND(allocPosLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(NONPOSITIVEALLOCCODE),
        IRappendOPERAND(IRmakeRegOPERAND(RAX),
        IRmakeCommentOPERAND("negative allocation size")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocPosLabel)));

      //find total size of array
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(1),
        IRappendOPERAND(IRmakeRegOPERAND(RBX),
        IRmakeCommentOPERAND("making room for arraySize")))));
      IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(8), IRmakeRegOPERAND(RBX))));
      //allocate the array
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX),IRmakeLabelOPERAND(freeHeapLabel))));

      //out of memory check
      allocSuccLabel = Malloc(10);
      sprintf(allocSuccLabel, "allocSucc%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(freeHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(endHeapLabel), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJlINSTR(IRmakeLabelOPERAND(allocSuccLabel))); //not out of memory
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(OUTOFMEMORYCODE),
        IRappendOPERAND(IRmakeRegOPERAND(RAX),
        IRmakeCommentOPERAND("outofMemory")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(allocSuccLabel)));

      //TODO: what if op2 is a variable (base pointer)?
      //putting arraySize into first indeks of array
      op3 = NEW(OPERAND);
      memcpy(op3, op2, sizeof(OPERAND));
      op3->next = NULL;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op3, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX),IRmakeTempDeRefOPERAND(temp)))); //ODOT PROBLEMS appears here
      return 0;
    case assiK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d assign statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      //find result of right hand side
      op2 = IRtravExp(t, stmt->val.assign.exp);
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));

      //Find destination location and move result
      op1 = IRtravVar(t, stmt->val.assign.var);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(temp), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), op1)));
      return 0;
    case ifK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d if then statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      //find result of condition
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RBX))));
      //check if condition is true
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(endifLabel))); //if not: skip
      //generate code for then-body
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel, 
                                                    startLabel, endLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      return 0;
    case thenK:
      commentString = Calloc(45);
      sprintf(commentString, "line: %d if then else statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      elseLabel = Malloc(10);
      sprintf(elseLabel, "else%d", labelCounter);
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      //get result of condtion
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1,IRmakeRegOPERAND(RBX))));
      //check if condition is true
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(elseLabel))); //if not: goto else
      //generate code for then-body
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel, 
                                                    startLabel, endLabel);
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(endifLabel))); //skip else
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(elseLabel)));
      //generate code for else-body
      IRtravStmt(t, stmt->val.ifthenelse.elsebody, funcEndLabel, 
                                                    startLabel, endLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      return 0;
    case listStmtK: //generate code for stmt list
      commentString = Calloc(45);
      sprintf(commentString, "line: %d list statement statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      return IRtravStmtList(t, stmt->val.list, funcEndLabel, 
                                                    startLabel, endLabel);
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
      //get result of condition
      op1 = IRtravExp(t,stmt->val.while_.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      //check if condition is true
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(endwhileLabel))); //not true: skip loop
      //generate code for loop-body
      IRtravStmt(t, stmt->val.while_.body, funcEndLabel, 
                                    startwhileLabel, endwhileLabel);
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(startwhileLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endwhileLabel)));
      return 0;
    case breakK: //jump to end of loop
      commentString = Calloc(45);
      sprintf(commentString, "line: %d break statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(endLabel)));
      return 0;
    case continueK: //jump to beginning of loop
      commentString = Calloc(45);
      sprintf(commentString, "line: %d continue statement", stmt->lineno);
      IRappendINSTR(IRmakeCommentINSTR(IRmakeCommentOPERAND(commentString)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(startLabel)));
      return 0;
    default:
      fprintf(stderr, "INTENRAL ERROR: \
        IRtravStmt: UnsupportedStatementException: %d\n", stmt->kind);
      return -1;
  }
}

/**
 * Traversing variable to find its operand
 * returns the operand and NULL on error
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

/**
 * Recursively traverses a variable to find the corresponding operand
 */
int IRtravVarRecursive(SymbolTable *t, VARIABLE *var, SYMBOL **sym, 
                                                  TYPE **ty, OPERAND **op){
  OPERAND *op1;
  TEMPORARY *t1;
  int error = 0;
  int *nrJumps = Calloc(sizeof(int));
  *nrJumps = 0;
  char *nonNullDerefLabel2, *nonNullDerefLabel1, *indeksAllowedLabel, 
                                                        *indeksErrorLabel;
  switch (var->kind) {
    case idVarK: //Simple variable
      *sym = IRgetSymbol(t, var->val.id, nrJumps);
      if((*sym)->cgu == NULL){
        fprintf(stderr, "INTERNAL ERROR: \
          IRtravVar: How do I know if %s is a parameter or local\n", 
          (*sym)->name);
        return -1;
      }
      *ty = (*sym)->typePtr;
      *op = IRmakeTemporaryOPERAND((*sym)->cgu->val.temp);
      IRsetStaticBase(nrJumps); //sets the base-pointeer for this operand
      return 0; //op, ty and sym is already set
    case expK: //array indexing
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      indeksAllowedLabel = Malloc(10);
      sprintf(indeksAllowedLabel, "indeksAllowed%d", labelCounter);
      labelCounter++;
      indeksErrorLabel = Malloc(10);
      sprintf(indeksErrorLabel, "indeksError%d", labelCounter);
      labelCounter++;
      nonNullDerefLabel1 = Malloc(10);
      sprintf(nonNullDerefLabel1, "nonNullDeref%d", labelCounter);
      labelCounter++;
      nonNullDerefLabel2 = Malloc(10);
      sprintf(nonNullDerefLabel2, "nonNullDeref%d", labelCounter);
      labelCounter++;

      //find the operand for the variable
      error = IRtravVarRecursive(t, var->val.varexp.var, sym, ty, op);
      if(error == -1){
        return -1;
      }
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        *op,IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      //check if array is null
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(nonNullDerefLabel1), IRmakeCommentOPERAND("not NULL"))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel1)));

      //find result of index expression
      op1 = IRtravExp(t, var->val.varexp.exp);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      //check if index is out of bounds for array
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeTempDeRefOPERAND(t1),IRmakeRegOPERAND(RBX)))); //too large check
      IRappendINSTR(IRmakeJgeINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(indeksErrorLabel),
        IRmakeCommentOPERAND("indexOutOfBounds"))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(0),IRmakeRegOPERAND(RBX)))); //positive check
      IRappendINSTR(IRmakeJgeINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(indeksAllowedLabel),
        IRmakeCommentOPERAND("not indexOutOfBounds"))));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(indeksErrorLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(INDEXOUTOFBOUNDSCODE),
        IRappendOPERAND(IRmakeRegOPERAND(RAX),
        IRmakeCommentOPERAND("IndexOutOfBounds")))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(indeksAllowedLabel)));

      //find the actual offset and address
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(1),
        IRappendOPERAND(IRmakeRegOPERAND(RBX),
        IRmakeCommentOPERAND("moving past array-size-value")))));
      IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(8), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      //check if array index is null
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(nonNullDerefLabel2), IRmakeCommentOPERAND("not NULL"))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel2)));


      *op = IRmakeTempDeRefOPERAND(t1); //operand found
      //updating type (and symbol if necessay)
      if((*ty)->kind == idK){
        *sym = recursiveSymbolRetrieval((*sym)->defScope, (*ty)->val.id, NULL);
        *ty = (*sym)->typePtr;
      }
      *ty = (*ty)->val.arrayType;
      return 0;
    case dotK: //record field access
      nonNullDerefLabel1 = Malloc(10);
      sprintf(nonNullDerefLabel1, "nonNullDeref%d", labelCounter);
      labelCounter++;
      nonNullDerefLabel2 = Malloc(10);
      sprintf(nonNullDerefLabel2, "nonNullDeref%d", labelCounter);
      labelCounter++;
      //find operand of variable
      error = IRtravVarRecursive(t, var->val.vardot.var, sym, ty, op);
      if(error == -1){
        return -1;
      }
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(*op, IRmakeRegOPERAND(RBX))));
      //check if record is null
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeNullOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(nonNullDerefLabel1), IRmakeCommentOPERAND("not NULL"))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel1)));

      //update symbol if necessary
      if((*ty)->kind == idK){
        *sym = recursiveSymbolRetrieval((*sym)->defScope, (*ty)->val.id, NULL);
        *ty = (*sym)->typePtr;
      }
      //find the symbol representing field of the record
      *sym = getRecordSymbol((*sym)->content, var->val.vardot.id);
      *ty = (*sym)->typePtr;
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      //symbol contains offset
      //find absolute address
      int offset = (*sym)->cgu->val.temp->placement.offset;
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(offset*8),
        IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX),
        IRmakeTemporaryOPERAND(t1))));

      //check if deref variable (field) is NULL
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeNullOPERAND(),IRmakeTemporaryOPERAND(t1))));
      IRappendINSTR(IRmakeJneINSTR(IRappendOPERAND(
        IRmakeLabelOPERAND(nonNullDerefLabel2), IRmakeCommentOPERAND("not NULL"))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeConstantOPERAND(DEREFNULLCODE), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(errorCleanupLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nonNullDerefLabel2)));

      *op = IRmakeTempDeRefOPERAND(t1);
      return 0;
    default:
      fprintf(stderr, "INTENRAL ERROR\n");
      return -1;
  }
}

/**
 * Traverse expression, for most of these we evaluate the tree right first.
 * this was done because for division and multiplication the left operand
 * needed to be in a specific register so then it was nice to just be able
 * to move it straight there without moving into a temporary.
 * TODO: Is this up to date mads
 */
OPERAND* IRtravExp(SymbolTable *t, EXP *exp){
  OPERAND *op1, *op2;
  TEMPORARY *t1, *t2;
  switch(exp->kind){
    case termK: //get oprand of term
      return IRtravTerm(t, exp->val.term);
    case minusK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      //finds and saves result of left child
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      //finds result of right child
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do the subtraction
      IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      //return result
      return IRmakeTemporaryOPERAND(t1);
    case plusK:
      //same as for minus
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      op1 = IRtravExp(t, exp->val.binOP.left);

      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do the addition
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      return IRmakeTemporaryOPERAND(t1);
    case divK:
      t1 = IRcreateNextTemp(tempLocalCounter); //first operand container
      tempLocalCounter++;
      t2 = IRcreateNextTemp(tempLocalCounter); //second operand container
      tempLocalCounter++;
      //find and save left child
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX),
        IRappendOPERAND(IRmakeTemporaryOPERAND(t1),
        IRmakeCommentOPERAND("first operand in t1")))));//left op in t1
      //find and save right child
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
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
      //get ready for the division
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t2), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RDX))));
      //do the division
      IRappendINSTR(IRmakeDivINSTR(IRmakeRegOPERAND(RBX)));
      //return result
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RAX), IRmakeTemporaryOPERAND(t1))));
      return IRmakeTemporaryOPERAND(t1);
    case timesK:
      t1 = IRcreateNextTemp(tempLocalCounter); //left operand container
      tempLocalCounter++;
      //find left operand
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      //find right operand
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do the multiplication
      IRappendINSTR(IRmakeMulINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1),IRmakeRegOPERAND(RBX))));
      //return result
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      return IRmakeTemporaryOPERAND(t1);
    case andK:
      t1 = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *lazyAndLabel = Malloc(10);
      sprintf(lazyAndLabel, "lazyAnd%d", labelCounter);
      labelCounter++;
      //find first operand
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));


      //lazy and: first operand is false we just return false.
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(lazyAndLabel)));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do and
      IRappendINSTR(IRmakeAndINSTR(IRappendOPERAND(//bitwise and, should only ever work on 0 or 1 so we should only ever get 0 or 1 back
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));
      //return result
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
      //find right operand
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));//right operand in t1

      //lazy or: if first operand is true we just return true.
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(lazyOrLabel)));

      //find right operand
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));//left operand in rbx
      //do the or
      IRappendINSTR(IRmakeOrINSTR(IRappendOPERAND(
        IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));
      //return the result
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
      //find left operand
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));
      //find right operand
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do comparison
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
      char *eqLabel = Malloc(10);
      sprintf(eqLabel, "eq%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(),IRmakeTemporaryOPERAND(t1)))); //assuming true
      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      //do comparison
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(eqLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t1)))); //turned out to be false
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
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do comparison
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
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do comparison
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
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op2, IRmakeRegOPERAND(RBX))));
      //do comparison
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
      char *neLabel = Malloc(10);
      sprintf(neLabel, "eq%d", labelCounter);
      labelCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeTrueOPERAND(),IRmakeTemporaryOPERAND(t1)))); //assuming true

      op1 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      op2 = IRtravExp(t, exp->val.binOP.right);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, IRmakeRegOPERAND(RBX))));
      //do comparison
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t2))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(neLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(),IRmakeTemporaryOPERAND(t1)))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(neLabel)));
      return IRmakeTemporaryOPERAND(t1);
    default:
      fprintf(stderr, "INTENRAL ERROR\n");
      return NULL;
  }
}

/**
 * Traversing term
 * returns the operand contaning the result of the term
 * returns NULL if an error orcurred
 */
OPERAND* IRtravTerm(SymbolTable *t, TERM *term){
  OPERAND *op, *staticLinkOP;
  SYMBOL *sym;
  TYPE *type;
  Typekind tk;
  int error = 0;
  int *nrJumps = Calloc(sizeof(int));
  TEMPORARY *temp;
  CODEGENUTIL *cgu = NULL;
  INSTR *label;
  switch(term->kind){
    case varK: //variable
      //find operand for variable
      op = IRtravVar(t, term->val.var);
      if(op == NULL){
        fprintf(stderr, "INTERNAL ERROR: OP line: %d\n", term->lineno);
      }
      return op;
      break;
    case idTermK: //function call
      //find function symbol
      sym = IRgetSymbol(t, term->val.idact.id, nrJumps);
      if(sym->cgu == NULL){
        fprintf(stderr, "%s\n", "INTERNAL ERROR: \
          no cgu found: should be a mistake");
        return NULL;
      }
      cgu = sym->cgu;
      label = cgu->val.funcInfo.funcLabel;
      staticLinkOP = IRsetCalleeStaticLink(*nrJumps);
      if(staticLinkOP == NULL){
        return NULL;
      }
      //build the stack
      error = IRmakeFunctionCallScheme(t, label, term->val.idact.list, 
                        staticLinkOP, sym->cgu->val.funcInfo.paramCount);
      if(error == -1){
        return NULL;
      }
      //after function call the return value is in RAX
      //return that value
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        IRmakeRegOPERAND(RAX),IRmakeTemporaryOPERAND(temp))));
      return IRmakeTemporaryOPERAND(temp);
    case expTermK: //return result of expression
      return IRtravExp(t, term->val.exp);
    case notTermK:
      temp = IRcreateNextTemp(tempLocalCounter);
      tempLocalCounter++;
      char *falseLabel = Malloc(10);
      sprintf(falseLabel, "false%d", labelCounter);
      labelCounter++;
      //find result of the boolean term
      op = IRtravTerm(t, term->val.notTerm);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
        op, IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND( //asume false: negation is true
        IRmakeTrueOPERAND(), IRmakeTemporaryOPERAND(temp))));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(
        IRmakeFalseOPERAND(), IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(falseLabel)));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND( //was true: negation is false
        IRmakeFalseOPERAND(), IRmakeTemporaryOPERAND(temp))));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(falseLabel)));
      return IRmakeTemporaryOPERAND(temp);
    case expCardK:
      sym = NULL;
      //find operand for result of expression
      op = IRtravExp(t, term->val.expCard);
      type = term->val.expCard->type; //lookup expression type
      tk = term->val.expCard->typekind;
      if(tk == idK){
        sym = recursiveSymbolRetrieval(term->val.expCard->type->scope, 
          term->val.expCard->type->val.id, NULL);
        type = sym->typePtr;
        tk = sym->typeVal;
      }
      switch(tk){
        case idK:
          fprintf(stderr, "INTENAL ERROR: How the hell did this happen\n");
          break;
        case intK: //find absolute value
          temp = IRcreateNextTemp(tempLocalCounter);
          tempLocalCounter++;
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            op, IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          char *positiveLabel = Malloc(10);
          sprintf(positiveLabel, "posi%d", labelCounter);
          labelCounter++;
          IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND( //if positive: return expression
            IRmakeConstantOPERAND(0), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeJgeINSTR(IRmakeLabelOPERAND(positiveLabel)));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeConstantOPERAND(0), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(
            IRmakeTemporaryOPERAND(temp), IRmakeRegOPERAND(RBX)))); //negative: negate
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeRegOPERAND(RBX),IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(positiveLabel)));
          return IRmakeTemporaryOPERAND(temp);
        case boolK:
          return op;
        case arrayK: //return array length
          temp = IRcreateNextTemp(tempLocalCounter);
          tempLocalCounter++;
          char *nullLabel = Malloc(10);
          sprintf(nullLabel, "null%d", labelCounter);
          labelCounter++;
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            op, IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeConstantOPERAND(0), IRmakeTemporaryOPERAND(temp)))); //if null: return 0
          IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND( //check NULL
            IRmakeNullOPERAND(), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(nullLabel)));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND( //find length
            IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeTempDeRefOPERAND(temp), IRmakeRegOPERAND(RBX))));
          IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
            IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(temp))));
          IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(nullLabel)));
          return IRmakeTemporaryOPERAND(temp);
        case recordK: //we don't care if the symbol is allocated
          if(sym == NULL){ //anonymmous record variable
            //count the size
            VAR_DECL_LIST *vdl = type->val.vList;
            int i = 0;
            while(vdl!=NULL){
              i++;
              vdl = vdl->vList;
            }
            //fprintf(stderr, "Here something naive is done\n");
            return IRmakeConstantOPERAND(i);
          }
          int size = findVarSymSize(sym);
          if(size == -1){
            fprintf(stderr, "INTERNAL ERRORcardinalty: \
              Hopefully error is already printed\n");
            return NULL;
          }
          return IRmakeConstantOPERAND(size);
        case nullKK: //size of NULL is null
          return IRmakeConstantOPERAND(0);//IRmakeNullOPERAND();
        case errorK:
          fprintf(stderr, "INTERNAL ERROR: \
            What is the cardinalty of a type-error\n");
          break;
      }
      fprintf(stderr, "INTERNAL ERROR: IRtravTerm: SOME INTERNAL ERROR\n");
      break;
    case numK:
      return IRmakeConstantOPERAND(term->val.num);
    case trueK:
      return IRmakeTrueOPERAND();
    case falseK:
      return IRmakeFalseOPERAND();
    case nullK:
      return IRmakeNullOPERAND(); //IRmakeConstantOPERAND(0);
    default:
      fprintf(stderr, "IRtravTerm ERROR, term has no valid kind\n");
  }
  return NULL;
}

/**
 * Traversing actionlist
 * This is used to traverse arguments in function call
 */
int IRtravActList(SymbolTable *t, ACT_LIST *actlist){
  if(actlist == NULL){
    return 0;
  }
  return IRtravExpList(t, actlist->expList, 0);
  //return IRtravExpListReverse(t, actlist->expList);
}

/**
 * Traversing expression list
 * This is used to traverse arguments in function call
 */
int IRtravExpList(SymbolTable *t, EXP_LIST *exps, int i){
  if(exps != NULL){
    OPERAND* op = IRtravExp(t, exps->exp);
    if(op == NULL){
      fprintf(stderr, "OPERAND IS NULL\n");
      return -1;
    }
    TEMPORARY *temp = IRcreateNextTemp(tempLocalCounter);
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RSP), IRmakeTemporaryOPERAND(temp))));
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(i*8),IRmakeTemporaryOPERAND(temp))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      op, IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX), IRmakeTempDeRefOPERAND(temp))));
    return IRtravExpList(t, exps->expList, i+1);
  }
  return 0;
}

/**
 * NOT USED
 * Traversing expression list in reverse order
 * This is used to traverse arguments in function call
 * returns the number of arguments traversed
 */
int IRtravExpListReverse(SymbolTable *t, EXP_LIST *exps){
  int i=0;
  OPERAND *op;
  if(exps != NULL){
    //go to end of list
    i = IRtravExpListReverse(t, exps->expList);
    if(i==-1){
      return -1;
    }
    //find result of i'th argument
    op = IRtravExp(t, exps->exp);
    if(op == NULL){
      return -1;
    }
    IRappendINSTR(IRmakePushINSTR(op));
    i++;
  }
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


OPERAND *IRmakeLabelOPERAND(char *labelName){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = labelIDO;
  par->val.label = labelName;
  par->next = NULL;
  return par;
}

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

/**
 * Append operand next to list (tail)
 * If the tail is NULL, then next is returned
 */
OPERAND *IRappendOPERAND(OPERAND *tail, OPERAND *next){
  if(tail == NULL){
    return next;
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

INSTR* IRmakeIncINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = incI;
  return instr;
}

INSTR* IRmakeDecINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = decI;
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
int IRmakeFunctionCallScheme(SymbolTable *t, INSTR *labelINSTR, 
              ACT_LIST *paramList, OPERAND* staticLinkOP, int paramCount){
  if(labelINSTR->instrKind != labelI){
    fprintf(stderr, "INTERNAL ERROR: IRmakeFunctionCallScheme, no label\n");
    return -1;
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
  //Put arguments
  IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(
    IRmakeConstantOPERAND(paramCount*8), IRmakeRegOPERAND(RSP))));
  int error = IRtravActList(t, paramList);
  if(error == -1){
    fprintf(stderr, "INTERNAL ERROR: IRmakeFunctionCallScheme\n");
    return -1;
  }
  paramCount++; //static link included
  //push static link
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    staticLinkOP, IRmakeRegOPERAND(RBX))));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RBX))); //Static link field
  //do the actual call
  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList));

  //remove static link and parameters
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
}

/**
 * creates code to find the static link
 * of the function we are about to call
 * based on the number of scopes jumped (parameter)
 * returns the operand giving the value of the static link
 * put it in rbx !!!(this may change later)!!!
 */
OPERAND *IRsetCalleeStaticLink(int nrJumps){
  TEMPORARY *t1, *t2;
  OPERAND *o2;
  if(nrJumps == 0){//we are accessing a function in our own scope
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBP),
      IRmakeRegOPERAND(RBX))));
  } else {
    t1 = IRcreateNextTemp(tempLocalCounter);
    tempLocalCounter++;
    //find static link based on base-pointer
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBP), IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(16), IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND( //find what static link points to
      IRmakeDeRefOPERAND(RBX), IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

    while((nrJumps-1) > 0){
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(
      IRmakeConstantOPERAND(16), IRmakeTemporaryOPERAND(t1))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND( //find what static link points to
      IRmakeDeRefOPERAND(RBX), IRmakeRegOPERAND(RBX))));
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeRegOPERAND(RBX), IRmakeTemporaryOPERAND(t1))));

      nrJumps = nrJumps-1;
    }
    IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
      IRmakeTemporaryOPERAND(t1), IRmakeRegOPERAND(RBX))));
  }
  t2 = IRcreateNextTemp(tempLocalCounter);
  tempLocalCounter++;
  o2 = IRmakeTemporaryOPERAND(t2);
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBX), o2)));
  return IRmakeTemporaryOPERAND(t2);
}

/**
 * Follow the static link nrJumps times and
 * put the result into RDI
 * returns register operand representing RDI
 */
OPERAND *IRsetStaticBase(int *nrJumps){
  OPERAND *o1;

  o1 = IRsetCalleeStaticLink(*nrJumps);
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(o1, IRmakeRegOPERAND(RBX))));
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBX), IRmakeRegOPERAND(RDI))));

  return IRmakeRegOPERAND(RDI);
}
/**
 * NOT USED
 * Used to reset the basepointer from RDI to RBP
 * BLAHBLAHBLAH DEN HER FUNKTION ER OVERFLØDIG!
 */
int IRresetBasePointer(){
  IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(
    IRmakeRegOPERAND(RBP),
    IRappendOPERAND(
      IRmakeRegOPERAND(RDI),
      IRmakeCommentOPERAND("resetting basepointer")
      ))));
  return 0;
}
//2002 lines before cleanup
