#include "internalASM.h"
#include "memory.h"
#include "symbol.h"
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
  tmp->tempId = tempLocalCounter;
  tempLocalCounter++;
  tmp->placement.offset = offset;
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
  tmp->tempId = tempLocalCounter;
  tempLocalCounter++; //only if we want to do liveness analysis on locals
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
  tmp->tempId = -1;
  //tempCounter++; //only if we want to do liveness analysis on params
  tmp->placement.offset = offset;
  return tmp;
}

//****AST TRAVERSE functions*****//
/**
 * Traverse all the bodies of the bodyList created in the typeChecker
 * In this way we go through alle bodies, that is functions, in a bread-first
 * starting with the main-body.
 */
int IRcreateInternalRep(SymbolTable *table, bodyList *mainBody){
  //TODO call all the stuff and shit and things.
  /* for each body first traverse declerations to count local
   * variables and shit, then traverse statements creating the
   * instructions and so on.
   */

  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND("format")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".string	\"%d\\n\"")));
  IRappendINSTR(IRmakeTextINSTR(IRmakeTextOPERAND(".text")));
  if(mainBody == NULL){
    return 0; //i guess no bodies gives rise to no errors
  }
  tempLocalCounter = 1;
  labelCounter = 1;
  int error = 0;
  resetbodyListIndex(mainBody);
  bodyListElm *bElm = getBody(mainBody);
  //TODO something to treat the first body specially.
  while(bElm != NULL){
    error = IRinitParams(bElm->scope, bElm);
    if(error == -1){
      return -1;
    }
    error = IRtravBody(bElm->scope, bElm);
    if(error == -1){
      return -1;
    }
    bElm = getBody(mainBody);
  }
  return 0;
}

int IRinitParams(SymbolTable *table, bodyListElm *element){

  int error = 0;
  int paramCount = 0;
  ParamSymbol *pSym = element->scope->ParamHead;
  char* mainName;
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
  SYMBOL *sym = getSymbol(body->scope, body->funcId); //todo, i think it should be table not body->scope
  sym->cgu->val.funcInfo.localStart = tempLocalCounter;
  localCounter = 0;
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
  currentLocalStart = sym->cgu->val.funcInfo.localStart;
  currentTemporaryStart = sym->cgu->val.funcInfo.temporaryStart;
  error = IRtravStmtList(table, body->body->sList, labelName);
  sym->cgu->val.funcInfo.temporaryEnd = tempLocalCounter; //first number after our last temp

  currentTemporaryEnd = sym->cgu->val.funcInfo.temporaryEnd;
  if(error == -1){
    return -1;
  }
  /*caution you enter the land of long lines of code for no reason at all!*/
  int nrTempsAndLocals = sym->cgu->val.funcInfo.temporaryEnd - sym->cgu->val.funcInfo.localStart;
  IRinserINSTRhere(instrTempTail, IRmakeSubINSTR(IRappendOPERAND(IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP))));
  IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(labelName)));
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(nrTempsAndLocals*8), IRmakeRegOPERAND(RSP)))); //newly added
  error = IRmakeCalleeEpilog();
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
  if(decl == NULL){
    return 0;
  }
  switch(decl->kind){
    case idDeclK:
      break;
    case funcK://assign numbers to parameters.
      break;
    case listK:
      ;//count number of variables
      return IRtravVarDeclList(table, decl->val.list);
      break;
  }
  return 0;
}


/**
 * traverse variable decleration list
 */
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList){
  int error = 0;
  error = IRtravVarType(table, varDeclList->vType);

  if((error == 0) && (varDeclList->vList != NULL)){
    error = IRtravVarDeclList(table, varDeclList->vList);
  }
  return error;
}

int IRtravVarType(SymbolTable *table, VAR_TYPE *varType){

  SYMBOL *sym = getSymbol(table, varType->id);
  if(sym == NULL){
    sprintf(stderr, "IRtravVarType: no symbol returned\n");
    return -1;
  }
  if(sym->cgu == NULL){
    sym->cgu = IRmakeNewCGU();
    sym->cgu->val.temp = IRcreateNextLocalTemp(localCounter);
    localCounter++; //maybe this should be dine inside localTemp creator

  } else {

    sprintf(stderr, "%s\n", "IRtravVarType: symbol already had operand \
                                  attatched, might be an error not sure");
    return -1;//dunno if we need this.
  }
  return 0;
}

/**
 * only traverse the statements immediately available
 * do not dive into functions etc.
 * Generate code for all statements.
 */
int IRtravStmtList( SymbolTable *table, STATEMENT_LIST *statements, char* funcEndLabel){
  int error = 0;
  error = IRtravStmt(table, statements->statement, funcEndLabel);
  if(error == -1){
    return -1;
  }
  if(statements->statementList != NULL){
    return IRtravStmtList(table, statements->statementList, funcEndLabel);
  }
  return 0;
}

/*
 * traversing the statement
 */
int IRtravStmt(SymbolTable *t, STATEMENT *stmt, char* funcEndLabel){
  OPERAND *op1;
  OPERAND *op2;
  OPERAND *op3;
  OPERAND *op4;
  char *elseLabel;
  char *endifLabel;
  switch(stmt->kind){
    case returnK:
      //TODO ODOT
      //how the hell do we know which function we are in?? label??
      op1 = IRtravExp(t, stmt->val.return_);
      op2 = IRmakeRegOPERAND(RAX);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op2)));
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(funcEndLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: return\n");
      break;
    case writeK:
      op1 = IRtravExp(t, stmt->val.write);
      //check for NULL??                                                              //!!local string!!
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeAddrLabelOPERAND("format"),IRmakeRegOPERAND(RDI))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RSI))));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeConstantOPERAND(0),IRmakeRegOPERAND(RAX))));
      IRappendINSTR(IRmakeCallINSTR(IRmakeLabelOPERAND("printf")));
      // movq $form,%rdi		# Passing string address (1. argument)
      // movq %rax,%rsi		# Passing %rax (2. argument)
      // movq $0, %rax           # No floating point registers used
      // call printf		# Automatically pushes return address
      return 0;
      break;
    case assiK:
      op1 = IRtravVar(t, stmt->val.assign.var);
      op2 = IRtravExp(t, stmt->val.assign.exp);
      //move expression into variabel -> source->destination
      op3 = IRmakeRegOPERAND(RBX);
      localCounter++;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, op3)));
      op4 = NEW(OPERAND);
      memcpy(op4, op3, sizeof(OPERAND));
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op4, op1)));

      //IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, op1)));
      return 0;
      break;
    case ifK:
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RBX)))); //a bit stupid but necessary for if(true)
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(endifLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: if-statement\n");
      break;
    case thenK:
      elseLabel = Malloc(10);
      sprintf(elseLabel, "else%d", labelCounter);
      endifLabel = Malloc(10);
      sprintf(endifLabel, "endif%d", labelCounter);
      labelCounter++;
      op1 = IRtravExp(t,stmt->val.ifthenelse.cond);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,IRmakeRegOPERAND(RBX)))); //a bit stupid but necessary for if(true)
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),IRmakeRegOPERAND(RBX))));
      IRappendINSTR(IRmakeJneINSTR(IRmakeLabelOPERAND(elseLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.thenbody, funcEndLabel);
      IRappendINSTR(IRmakeJumpINSTR(IRmakeLabelOPERAND(endifLabel)));
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(elseLabel)));
      IRtravStmt(t, stmt->val.ifthenelse.elsebody, funcEndLabel);
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(endifLabel)));
      //fprintf(stderr, "IRtravStmt: UnsupportedStatementException: if-statement\n");
      break;

    default:
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
  OPERAND *op1, *op2;
  switch (var->kind) {
  case idVarK:
    sym = getSymbol(t, var->val.id);
    //check if operand already exists: if not make one
    if(sym->cgu == NULL){
      //todo: create and save operand
      sym->cgu = IRmakeNewCGU();
      fprintf(stderr, "IRtravVar: How do I know if %s is a parameter or local\n", sym->name);
      //sym->cgu->val.temp = IRcreateNext????();
      return NULL;
    }
    //op = sym->cgu->val.operand;
    op1 = IRmakeTemporaryOPERAND(sym->cgu->val.temp);
    //op2 = IRmakeTemporaryOPERAND(IRcreateNextTemp());
    //IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1,op2)));
    return op1;
INSTR* intermediateTail;
    //TODO: check if the type is a (userdefined) record or array type
    //i dont know if this works
    //recursiveSymbolRetrieval(sym->defScope, sym->val.id, NULL);
    break;
  case expK:
    printf("not yet implemented 12\n");
    break;
  case dotK:
    printf("not yet implemented 232\n");
    break;

  }
}

/**
 * Traverse expression
 */
OPERAND* IRtravExp(SymbolTable *t, EXP *exp){
  OPERAND *op1, *op2, *op3, *op4, *op5, *op6;
  switch(exp->kind){
    case termK:
      return IRtravTerm(t, exp->val.term);
      break;
    case minusK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.right);
      op3 = IRmakeRegOPERAND(RBX); //aritmetic operation register
      op4 = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter-currentLocalStart)); //result temporary
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op3)));
      IRappendINSTR(IRmakeSubINSTR(IRappendOPERAND(op2, op3)));
      op5 = NEW(OPERAND);
      memcpy(op5, op3, sizeof(OPERAND));
      op5->next = NULL;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op5, op4)));
      op6 = NEW(OPERAND);
      memcpy(op6, op4, sizeof(OPERAND));
      op6->next = NULL;
      return op6;
      //operand 4 and 6 are the same, but with different next pointers
    case plusK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.right);
      op3 = IRmakeRegOPERAND(RBX); //aritmetic operation register
      op4 = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter-currentLocalStart)); //result temporary
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op3)));
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(op2, op3)));
      op5 = NEW(OPERAND);
      memcpy(op5, op3, sizeof(OPERAND));
      op5->next = NULL;
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op5, op4)));
      op6 = NEW(OPERAND);
      memcpy(op6, op4, sizeof(OPERAND));
      op6->next = NULL;
      return op6;
      //operand 4 and 6 are the same, but with different next pointers
    case divK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeDivINSTR(IRappendOPERAND(op1, op2)));
    case timesK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeTimINSTR(IRappendOPERAND(op1, op2)));
    case andK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeAndINSTR(IRappendOPERAND(op1, op2)));
    case orK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeOrINSTR(IRappendOPERAND(op1, op2)));
    case leK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeLeINSTR(IRappendOPERAND(op1, op2)));
    case eqK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.right);
      op3 = IRmakeRegOPERAND(RBX); //aritmetic operation register
      op4 = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter-currentLocalStart)); //result temporary
      char *eqLabel = Malloc(10);
      sprintf(eqLabel, "eq%d", labelCounter);
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeTrueOPERAND(),op4))); //assuming true
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op1, op3)));
      IRappendINSTR(IRmakeCmpINSTR(IRappendOPERAND(op2, op3)));
      IRappendINSTR(IRmakeJeINSTR(IRmakeLabelOPERAND(eqLabel))); //if true, skip next
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(IRmakeFalseOPERAND(),op4))); //turned out to be false
      IRappendINSTR(IRmakeLabelINSTR(IRmakeLabelOPERAND(eqLabel)));
      op5 = NEW(OPERAND);
      memcpy(op5, op4, sizeof(OPERAND));
      op5->next = NULL;
      return op5;
      //operand 4 and 5 are the same, but with different next pointers
    case geK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeGeINSTR(IRappendOPERAND(op1, op2)));
    case greatK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeGreINSTR(IRappendOPERAND(op1, op2)));
    case lessK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeLesINSTR(IRappendOPERAND(op1, op2)));
    case neK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeNeINSTR(IRappendOPERAND(op1, op2)));
      break;
  }
}

/**
 * Traversing term
 */
OPERAND* IRtravTerm(SymbolTable *t, TERM *term){
  OPERAND *op, *op2;
  int error = 0;
  switch(term->kind){
    case varK:
      op = IRtravVar(t, term->val.var);
      return op;
      break;
    case idTermK: //function call
    ;
      //slå id i symbol-table
      SYMBOL *sym = getSymbol(t, term->val.idact.id);
      //find function-body-scope ???
      //find CODEGENUTIL
      //tjek om label findes -> brug eller lav label
      //if(cgu->val.funcInfo.funcLabel == NULL){
      if(sym->cgu == NULL){
        //create and save funcLabel
        sym->cgu = IRmakeNewCGU();
        char* labelName = Malloc(strlen(term->val.idact.id)+6);
        sprintf(labelName, "%s%d", term->val.idact.id, labelCounter);
        labelCounter++;
        sym->cgu->val.funcInfo.funcLabel = IRmakeLabelINSTR(IRmakeLabelOPERAND(labelName));
      }
      CODEGENUTIL *cgu = sym->cgu;
      INSTR *label = cgu->val.funcInfo.funcLabel;
      //slå symboler i actionlist op i symboltable
      //for ting der ikke er symboler: lav temporaries og operander
      //link operander sammen (evt. i omvendt rækkefølge)
      op = IRtravActList(t, term->val.idact.list); //param list
      //kald IRmakeFunctionCallScheme
      error = IRmakeFunctionCallScheme(label, op);
      if(error == -1){
        return NULL;
      }
      //return NULL;
      //what to return? the result of function call? Where? %rax?
      op = IRmakeTemporaryOPERAND(IRcreateNextTemp(tempLocalCounter - currentLocalStart)); //todo: wrong offset
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
      fprintf(stderr, "IRtravTerm: UnsupportedTermException: notTermK\n");
      break;
    case expCardK:
      fprintf(stderr, "IRtravTerm: UnsupportedTermException: expCardK\n");
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
      fprintf(stderr, "IRtravTerm: UnsupportedTermException: nullK\n");
      break;
    default:
      fprintf(stderr, "IRtravTerm ERROR, term has no valid kind\n");
  }
  return NULL;
}

/**
 * Traversing actionlist
 */
OPERAND* IRtravActList(SymbolTable *t, ACT_LIST *actlist){
  if(actlist == NULL){
    return NULL;
  }
  return IRtravExpListReverse(t, actlist->expList);
}

/**
 * Traversing expression list
 */
OPERAND* IRtravExpList(SymbolTable *t, EXP_LIST *exps){
  int error = 0;
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

OPERAND* IRtravExpListReverse(SymbolTable *t, EXP_LIST *exps){
  int error = 0;
  if(exps != NULL){
    //OPERAND* op = IRtravExp(t, exps->exp);
    OPERAND* op = IRtravExpListReverse(t, exps->expList);
    if(op == NULL){
      return IRtravExp(t, exps->exp);
    }
    //return IRtravExpList(t, exps->expList);
    //opposite order may be achieved by switching arguments: not that simple
    IRappendOPERAND(op, IRtravExp(t, exps->exp));
    return op;
  }
  return NULL;
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

OPERAND *IRmakecommentOPERAND(char *text){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = commentO;
  par->val.label = text;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeTrueOPERAND(){
  return IRmakeConstantOPERAND(1);
}

OPERAND *IRmakeFalseOPERAND(){
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

INSTR* IRmakeTimINSTR(OPERAND *params){
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

INSTR* IRmakeLeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpleI;
  return instr;
}

INSTR* IRmakeJeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpeqI;
  return instr;
}

INSTR* IRmakeGeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpgeI;
  return instr;
}

INSTR* IRmakeGreINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpgreatI;
  return instr;
}

INSTR* IRmakeLesINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmplessI;
  return instr;
}

INSTR* IRmakeNeINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpneqI;
  return instr;
}

INSTR* IRmakeLabelINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = labelI;
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

INSTR *IRmakeJneINSTR(OPERAND *params){
  INSTR* instr = IRmakeINSTR(params);
  instr->instrKind = jmpneqI;
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
 return newINSTR;
}

/**
 * Makes a function call
 * The first parameter is the instruction giving the label to where to jump
 * The Second paramater is the list of parameters to this function
 *  - This list may be arbitrarily long
 */
int IRmakeFunctionCallScheme(INSTR *labelINSTR, OPERAND *paramList){
  if(labelINSTR->instrKind != labelI){
    fprintf(stderr, "IRmakeFunctionCallScheme%s\n");
  }
  INSTR *ins; //Is this thingy used - Maybe I should jus delete things instead of making weird comments - but naaah
  //Caller save registers
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RCX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RDX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RSI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RDI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R8)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R9)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R10)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(R11)));
  int ParamCount = 1; //static link already inkluded
  while(paramList != NULL){//maybe change to recursive form?
    //this migh be the wrong order
    OPERAND *tempOp = paramList->next;
    paramList->next = NULL; //a little hack
    IRappendINSTR(IRmakePushINSTR(paramList));
    paramList = tempOp;
    ParamCount += 1;
  }
  IRappendINSTR(IRmakePushINSTR(IRmakeConstantOPERAND(0))); //Static link field
  //do the actual call
  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList));

  //remove static link and parameters
  IRappendINSTR(IRmakeCommentINSTR(IRmakecommentOPERAND("remove static link and parameters")));
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(ParamCount*8),IRappendOPERAND(IRmakeRegOPERAND(RSP),IRmakecommentOPERAND("remove static link and parameters")))));


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


//comfort space
