/*
 * This file should implement liveness analysis
 */
 #include "internalASM.h"
 #include "memory.h"

 LivenessInstructionArray *lia;

 int liveness(){
   int error = 0;
   error = initLiveness();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: initLiveness\n");
     return -1;
   }
   error = livenessTravIR(intermediateHead);
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: livenessTravIR\n");
     return -1;
   }
   error = livenessAnalysis();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: livenessAnalysis\n");
     return -1;
   }

   error = buildInterferenceGraph();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: buildInterferenceGraph\n");
     return -1;
   }
   return 0;
 }


int initLiveness(){
  lia = Malloc(sizeof(LivenessInstructionArray)*intermediateInstrCount);
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

int livenessTravIR(INSTR *instr){
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
          fprintf(stderr, "return -1 1\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          fprintf(stderr, "return -1 2\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case cmpI: //use both
        if(op == NULL){
          fprintf(stderr, "return -1 3\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          fprintf(stderr, "return -1 4\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case movI: //use first; def second
        lia[index].isMove = 1;
        if(op == NULL){
          fprintf(stderr, "return -1 5\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          fprintf(stderr, "return -1 6\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case pushI: //use one
        if(op == NULL){
          fprintf(stderr, "return -1 7\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case popI: //def one
        if(op == NULL){
          fprintf(stderr, "return -1 8\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        break;
      case jumpI: //primary succ is different
        jINSTR = instrHashGetINSTR(labelINSTRTable, instr->paramList->val.label);
        if(jINSTR == NULL){
          fprintf(stderr, "Error occurred when getting instruction with label %s\n", instr->paramList->val.label);
          return -1;
        }
        lia[index].succ[0] = jINSTR->id;
        break;
      case callI:
        //dont think I have to do anything
        break;
      case jmplessI: //secondary succ is different
      case jmpgreatI:
      case jmpleI:
      case jmpgeI:
      case jmpeqI:
      case jmpneqI:
        jINSTR = instrHashGetINSTR(labelINSTRTable, instr->paramList->val.label);
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
    listUnion(lia[index].use, lia[index].in);
    instr = instr->next;
  }
  return 0;
}

/**
 * Based on algorithm on page 221
 */
int livenessAnalysis(){
  int isChanged;
  int res;
  while(true){
    isChanged = 0;
    for(int n=intermediateInstrCount - 1; n>=0; n--){
      //TODO add use somewhere else
      TempList *diff = listDiff(lia[n].out, lia[n].def);
      res = listUnion(diff, lia[n].in);
      if(res == -1){
        fprintf(stderr, "Some error occurred\n");
        return -1;
      }
      isChanged += res;
      freeList(diff);
      for(int j=0; j<3; j++){
        if(lia[n].succ[j] != -1){
          res = listUnion(lia[n].in, lia[n].out);
          if(res == -1){
            fprintf(stderr, "Some error occurred\n");
            return -1;
          }
          isChanged += res;
        }
      }
    }
    if(!isChanged){
      break;
    }
  }
  return 0;
}


int buildInterferenceGraph(){
  TempListNode *listNode;
  for(n=0; n<intermediateInstrCount; n++){
    listNode = lia[n].def->head;
    while(listNode != NULL){
      if(!lia[n].isMove || listNode->temp != lia[n].use[0]){
        //add interference edge
      }
      listNode = listNode->next;
    }
  }
  fprintf(stderr, "UnsupportedOperationException: buildInterferenceGraph\n");
  return 0;
}
