#include "internalASM.h"
#include "memory.h"
#include "symbol.h"
#include "tree.h"
#include "typecheck.h"

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








/*
 * comfort space for mads
 * just because my editor removes extra white space
 * and I like my whitespace
 *
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

//****Instruction functions****//
INSTR* IRmakeMovINSTR(PARAM *params){
  INSTR *ins = NEW(INSTR);
  ins->instrKind = movI;
  ins->paramList = param;
  ins->next = NULL;
  return ins;
}


INSTR* IRmakeAddINSTR(PARAM *params){
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


int IRmakeFunctionCallScheme(INSTR *labelINSTR){
  if(labelINSTR->instrKind != labelI){
    fprintf(stderr, "IRmakeFunctionCallScheme%s\n", );
  }
  INSTR *ins;
  //Caller save registers
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(RCX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(RDX)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(RSI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(RDI)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(R8)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(R9)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(R10)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(R11)));
  IRappendINSTR(IRmakePushINSTR(IRmakeRegPARAM(RCX)));

  IRappendINSTR(IRmakeCallINSTR(labelINSTR->paramList))


  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(R11)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(R10)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(R9)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(R8)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(RDI)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(RSI)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(RDX)));
  IRappendINSTR(IRmakePopINSTR(IRmakeRegPARAM(RCX)));










  ins = IRmakePushINSTR(IRmakeRegPARAM(RAX));


}









 //comfort space
