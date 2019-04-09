#include "internalASM.h"
#include "memory.h"
#include "symbol.h"
#include "tree.h"
#include "typecheck.h"
#include <string.h>



int IRcreateInternalRep( SymbolTable *table, bodyList *mainBody){
  //TODO call all the stuff and shit and things.
  /* for each body first traverse declerations to count local
   * variables and shit, then traverse statements creating the
   * instructions and so on.
   */
  if(mainBody == NULL){
    return 0; //i guess no bodies gives rise to no errors
  }
  int error = 0;
  resetbodyListIndex(mainBody);
  bodyListElm *bElm = getBody(mainBody);
  //TODO something to treat the first body specially.
  while(bElm != NULL){
    error = IRtravBody(bElm->scope, bElm->body);
    if(error = -1){
      return -1;
    }
  }
  return 0;
}

/**
 * Traverse the body of a function
 */
int IRtravBody(SymbolTable *table, BODY *body){
  int error = 0;
  //TODO set counter for locale variabler start
  error = IRtravDeclList(table, body->vList);
  if(error = -1){
    return -1;
  }
  //TODO set counter for locale variabler slut
  return IRtravStmtList(table, body->sList);
}

/**
 * only traverse the statements immediately available
 * do not dive into functions etc.
 */
int IRtravStmtList( SymbolTable *table, STATEMENT_LIST *statements){
  IRtravStmt(table, statements->statement);
  if(statements->statementList != NULL){
    return IRtravStmtList(table, statements->statementList);
  }
  return 0;
}

/**
 * only traverse the declerations immediately available
 * do not dive into functions etc.
 */
int IRtravDeclList(SymbolTable *table, DECL_LIST *declerations){
  IRtravDecl(table, declerations->decl);
  if(declerations->decl_list != NULL){
    return IRtravDeclList(table, declerations->decl_list);
  }
  return 0;
}

OPERAND* IRtravTerm(SymbolTable *t, TERM *term){
  OPERAND *op;
  switch(term->kind){
    case varK:
      op = IRtravVar(t, term->val.var);
      return op;
      break;
    case idTermK:
      //TODO call create function call Scheme
      //slå op id i symbol-table
      //find function-body-scope
      //find CODEGENUTIL
      //tjek om label finds -> brug eller lav label
      //slå symboler i actionlist op i symboltable
      //for ting der ikke er symboler: lav temporaries og operander
      //link operander sammen (evt. i omvendt rækkefølge)
      //kald IRmakeFunctionCallScheme
      //hvad gør vi med parametre
      break;
    case expTermK:
      break;
    case notTermK:
      break;
    case expCardK:
      break;
    case numK:
      op = IRmakeConstantOPERAND(term->val.num);
      return op;
      break;
    case trueK:
      break;
    case falseK:
      break;
    case nullK:
      break;
    default:
      fprintf(stderr, "IRtravTerm ERROR, term has no kind\n");
  }
}

CODEGENUTIL *IRmakeNewCGU(){
  CODEGENUTIL *newCGU = NEW(CODEGENUTIL);
  memset(newCGU, 0, sizeof(CODEGENUTIL));
  return newCGU;
}

/**
 * do not enter declerations for functions,
 * as these are already in the bodylist!
 */
int IRtravDecl(SymbolTable *table, DECLARATION *decl){

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
 * traverse variable decleration list, the integer parameter
 * is set to 0 if this is a regular decleration or 1 if this
 * is called from a parameter decleration list.
 */
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList, int calledFromParDeclList){
  int error = 0;
  if(calledFromParDeclList){
    error = IRtravVarType(table, varDeclList->vType, calledFromParDeclList);
    calledFromParDeclList++;
  } else {
    error = IRtravVarType(table, varDeclList->vType, calledFromParDeclList);
  }
  if((error == 0) && (varDeclList->vLst != NULL)){
    error = IRtravVarDeclList(table, varDeclList->vList);
  }
  return error;
}

int IRtravVarType(SymbolTable *table, VAR_TYPE *varType, int isParam){

  SYMBOL sym = getSymbol(table, varType->id);
  if(sym->cgu == NULL && !isParam){
    sym->cgu = IRmakeNewCGU();
    sym->cgu.val->operand = IRmakeLocalOPERAND(tempCounter);
  } else if (sym->cgu == NULL && isParam) {
    sym->cgu = IRmakeNewCGU();
    sym->cgu.val->operand = IRmakeParamOPERAND(isParam-1);
  } else {
    sprintf(stderr, "%s\n", "IRtravVarType: symbol already had operand attatched, might be an error not sure");
    error = -1;
  }

  return error;
}

/*
 * traversing the statement
 */
int IRtravStmt(SymbolTable *t, STATEMENT *stmt){
  OPERAND *op1;
  OPERAND *op2;
  switch(stmt->kind){
    case assiK:
      op1 = IRtravVar(t, stmt->val.assign.var);
      op2 = IRtravExp(t, stmt->val.assign.exp);
      //move expression into variabel -> source->destination
      IRappendINSTR(IRmakeMovINSTR(IRappendOPERAND(op2, op1)));
      break;
    default:
      break;
  }
}

OPERAND* IRtravVar(SymbolTable *t, VARIABLE *var){
  SYMBOL *sym;
  OPERAND *op;
  switch (var->kind) {
  case idVarK:
    sym = getSymbol(t, var->val.id);
    //todo check if operand already exists: if not make one

    if(sym->operand == NULL){
      //todo: create and save operand
      sym->operand = IRmakeTemporaryOPERAND(IRcreateNextTemp());
    }
    op = sym->operand;
    return op;
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

OPERAND* IRtravExp(SymbolTable *t, EXP *exp){
  OPERAND *op1, *op2;
  switch(exp->kind){
    case termK:
      IRtravTerm(t, exp->val.term);
      break;
    case minusK:
    //TODO: jeff: some of these other cases
    case plusK:
      op1 = IRtravExp(t, exp->val.binOP.left);
      op2 = IRtravExp(t, exp->val.binOP.left);
      IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(op1, op2)));
    case divK:
    case timesK:
    case andK:
    case orK:
    case leK:
    case eqK:
    case geK:
    case greatK:
    case lessK:
    case neK:
      break;
  }
}



















TEMPORARY* IRcreateNextTemp(){
  TEMPORARY* tmp = NEW(TEMPORARY);
  char str[10];
  sprintf(str, "t%d", tempCounter);
  tmp->tempName = str;
  tmp->tempVal = tempCounter;
  tempCounter++;
  tmp->temporarykind = regT; //should this be undefined by now?
}



/*
 * comfort space for mads
 * just because my editor removes extra white space
 * and I like my whitespace
 * I LIKE TRAINS
 */

//****Paramter functions*****//
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

OPERAND *IRmakeAddrOPERAND(int addrVal){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = heapAddrO;
  par->val.address = addrVal;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeLabelOPERAND(char *labelName){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = labelIDO;
  par->val.label = labelName;
  par->next = NULL;
}

OPERAND *IRmakeLocalOPERAND(int number){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = localO;
  par->val.tempIDnr = number;
  par->next = NULL;
  return par;
}

OPERAND *IRmakeParamOPERAND(int number){
  OPERAND *par = NEW(OPERAND);
  par->operandKind = paramO;
  par->val.tempIDnr = number;
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

OPERAND *IRappendOPERAND(OPERAND *tail, OPERAND *next){
  if(tail->next = NULL){
    fprintf(stderr, "tail->next is NULL\n");
  }
  tail->next = next;
}

INSTR* IRmakeMovINSTR(OPERAND *params){
  INSTR *ins = NEW(INSTR);
  ins->instrKind = movI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}


INSTR* IRmakeAddINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = addI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeLabelINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = labelI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakePushINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = pushI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakePopINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = popI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeCallINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = callI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeRetINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = retI;
  ins->paramList = params;
  ins->next = NULL;
  return ins;
}

INSTR* IRappendINSTR(INSTR *newINSTR){
  if(intermediateTail==NULL){
    intermediateTail = newINSTR;
  }
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
    IRappendINSTR(IRmakePushINSTR(paramList));
    paramList = paramList->next;
    ParamCount += 1;
  }
  IRappendINSTR(IRmakePushINSTR(IRmakeConstantOPERAND(0))); //Static link field
  //do the actual call
  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList));

  //remove static link and parameters
  IRappendINSTR(IRmakeAddINSTR(IRappendOPERAND(IRmakeConstantOPERAND(ParamCount),IRmakeRegOPERAND(RSP))));


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
