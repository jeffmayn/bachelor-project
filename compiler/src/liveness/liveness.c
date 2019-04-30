/*
 * This file should implement liveness analysis
 */
 #include "internalASM.h"

 LivenessInstructionArray *lia;

 int liveness(){
   initLiveness();
   livenessTravAST();

 }


int initLiveness(){
  lia = Calloc(sizeof(LivenessInstructionArray)*intermediateInstrCount);
  for(int i=0; i<intermediateInstrCount; i++){
    lia[i].use = createList(tempIdVal);
    lia[i].def = createList(tempIdVal);
    lia[i].in = createList(tempIdVal);
    lia[i].out = createList(tempIdVal);
    for(int j = 0; j<3; j++){  //carefull about limits
      lia[i].succ[j] = -1;
    }
    lia[i].isMove = 0;
  }
  return 0;
}

int livenessTravAST(INSTR *instr){
  OPERAND* op;
  int index;
  INSTR *jINSTR;
  while(instr != NULL){
    index = instr->id;
    op = instr->paramList;
    switch(instr->instrKind){
      case addI: //use both; define second
      case subI:
      case mulI:
      case divI:
      case andI:
      case orI:
      case xorI:
      case lshiftI:
      case rshiftI:
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case cmpI: //use both
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case movI: //use first; def second
        lia[index].isMove = 1;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case pushI: //use one
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
      case popI: //def one
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case jumpI: //primary succ is different
      case callI:
        jINSTR = instrHashGetINSTR(labelINSTRTabel, instr->paramList->val.label);
        if(jINSTR == NULL){
          return -1;
        }
        lia[index].succ[0] = jINSTR->id;
        break;
      case jmplessI: //secondary succ is different
      case jmpgreatI:
      case jmpleI:
      case jmpgeI:
      case jmpeqI:
      case jmpneqI:
        jINSTR = instrHashGetINSTR(labelINSTRTabel, instr->paramList->val.label);
        if(jINSTR == NULL){
          fprintf(stderr, "INTERNAL ERROR during livness\n");
          return -1;
        }
        lia[index].succ[0] = jINSTR->id;
      case labelI:
      case retI:
      case textI:
      case commentI:
        break;
    }
    if(lia[index].succ[0] == -1 && index < intermediateInstrCount-1){
      //standard successor is next instruction,
      //unless we reached the end of program
      lia[index].succ[0] = index+1;
    }
    instr = instr->next;
  }
  return 0;
}

/**
 * Based on algorithm on page 221
 */
int livnessAnalysis(){
  int isChanged;
  while(true){
    isChanged = 0;
    for(int n=intermediateInstrCount - 1; n>=0; n--){
      //TODO add use somewhere else
      TempList *diff = listDiff(lia[n].out, lia[n].def);
      isChanged += listUnion(diff, lia[n].in);
      freeList(diff);
      for(int j=0; j<3; j++){
        if(lia[n].succ[j] != -1){
          isChanged += listUnion(lia[n].in, lia[n].out);
        }
      }
    }
    if(!isChanged){
      break;
    }
  }
}
