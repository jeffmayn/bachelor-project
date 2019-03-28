#include "internalASM.h"
#include "memory.h"
#include "symbol.h"
#include "tree.h"
#include "typecheck.h"



int IRcreateInternalRep(BODY *mainBody, SymbolTable *table){
  //TODO
  return 0;
}

int IRtravStmtList(STATEMENT_LIST *statements, SymbolTable *table){
  //TODO
  return 0;
}

int IRtravTerm(TERM *term){
  switch(term-kind){
    case varK:
      break;
    case idTermK:
      break;
    case expTermK:
      break;
    case notTermK:
      break;
    case expCardK:
      break;
    case numK:
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



















/**
 * create hash index value for the string
 *
 * - note: something fishy with the .h files, created my own stuff.
 */
int IRtemporaryHash(char *str){
  unsigned int sum = 0;
  for (unsigned int i = 0; i < strlen(str); i++){
    char c = str[i];
    sum += c;
    if(i < strlen(str)-1){
      sum <<= 1;
    }
  } return sum % HashSize;
}

TempLocMap *IRinitTempLocMap(){
  TempLocMap* table = NEW(TempLocMap);
  memset(table->table, 0, sizeof(table->table));
  return table;
}

/**
 * create new TempNode and put into table
 */
TempNode *IRputTempNode(TempLocMap *t, char *tempName){
  TempNode *newNode = NEW(TempNode);
  newNode->name = Malloc(strlen(name)+1);
  memcpy(newNode->name, name, strlen(name)+1);
  newNode->next = NULLL;
  newNode->graphNodeId = UNUSED_GRAPH_ID;
  newNode->reg = NA; //NA = not assigned

  //find index via hash value
  int hashIndex = IRtemporaryHash(name);

  //insert into table
  TempLocMap **table = t->table;
  if(table[hashIndex] == NULL){
    table[hashIndex] = newNode;
  } else {
    TempNode *temp = table[hashIndex];
    while(temp != NULL){
      if(!strcmp(name,temp->name)){
        //name is already in this table
        fprintf(stderr, "IRputTempNode: Node already in table\n", name);
        free(newNode->name);
        free(newNode);
        return NULL;
      }
      if(temp->next != NULL){//as long as there is a next, check the next one.
        temp = temp->next;
      }
    }
    temp->next = newNode;
  }
  return newNode;
}

TempLocMap* IRsetupTemporaries(bodyListElm *bodyList, SymbolTable *mainSymbolTable){
  //TODO setup map
  //TODO call traverse of declarations
  //TODO possibly traverse statements
}

/**
 * traverse decleration list to find variables
 * and insert into TempNodeMap
 */
int IRtraverseDeclerationList(DECL_LIST *declerations){
  //TODO
}



int IRtravStmt(STATEMENT *stmt){
  switch(stmt->kind){
    case assi:
        stmt->val.
      break;
    default:
      break;
  }
}

OPERAND IRtravVariabel(STATEMENT *stmt){

}



/*
 * comfort space for mads
 * just because my editor removes extra white space
 * and I like my whitespace
 * I LIKE TRAINS
 */

//****Paramter functions*****//
PARAM *IRmakeConstantPARAM(int conVal){
  PARAM *par = NEW(PARAM);
  par->paramKind = constantP;
  par->val.constant = conVal;
  par->next = NULL;
}

PARAM *IRmakeTemporaryPARAM(char tempName){
  PARAM *par = NEW(PARAM);
  par->paramKind = temporaryP;
  par->val.temporary = tempName;
  par->next = NULL;
}

PARAM *IRmakeAddrPARAM(int addrVal){
  PARAM *par = NEW(PARAM);
  par->paramKind = heapAddrP;
  par->val.address = addrVal;
  par->next = NULL;
}

PARAM *IRmakeLabelPARAM(char labelName){
  PARAM *par = NEW(PARAM);
  par->paramKind = labelIDP;
  par->val.label = labelName;
  par->next = NULL;
}

PARAM *IRmakeRegPARAM(registers reg){
  PARAM *par = NEW(PARAM);
  par->paramKind = regP;
  par->val.reg = reg;
  par->next = NULL;
}

PARAM *IRappendPARAM(PARAM *tail, PARAM *next){
  if(tail->next = NULL){
    fprintf(stderr, "tail->next is NULL\n");
  }
  tail->next = next;
}

INSTR* IRmakeMovINSTR(OPERAND *params){
  INSTR *ins = NEW(INSTR);
  ins->instrKind = movI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}


INSTR* IRmakeAddINSTR(OPERAND *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = addI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeLabelINSTR(PARAM *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = labelI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakePushINSTR(PARAM *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = pushI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakePopINSTR(PARAM *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = popI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeCallINSTR(PARAM *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = callI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

INSTR* IRmakeRetINSTR(PARAM *params){
  INSTR* ins = NEW(INSTR);
  ins->instrKind = retI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}

IRappendINSTR(INSTR *newINSTR){
  if(intermedateTail==NULL){
    intermedateTail = newINSTR;
  }
}

/**
 * Makes a function call
 * The first parameter is the instruction giving the label to where to jump
 * The Second paramater is the list of parameters to this function
 *  - This list may be arbitrarily long
 */
int IRmakeFunctionCallScheme(INSTR *labelINSTR, OPERAND paramList){
  if(labelINSTR->instrKind != labelI){
    fprintf(stderr, "IRmakeFunctionCallScheme%s\n", );
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
  IRappendINSTR(IRmakePushINSTR(IRmakeRegOPERAND(RCX)));
  int ParamCount = 1; //static link already inkluded
  while(paramList != NULL){
    IRappendINSTR(IRmakePushINSTR(paramList));
    paramList = paramList->next;
    paramCount += 1;
  }
  IRappendINSTR(IRmakePushINSTR(IRmakeConstantOPERAND(0))); //Static link field
  //do the actual call
  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList))

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
