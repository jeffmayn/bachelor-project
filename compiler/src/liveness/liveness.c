/*
 * This file should implement liveness analysis
 */
 #include "internalASM.h"
 #include "memory.h"

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

   //printLIA();

   error = buildInterferenceGraph();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: buildInterferenceGraph\n");
     return -1;
   }

   //IGprintGraph();

   error = IGcolorGraph();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: colorGraph\n");
     return -1;
   }

   //IGprintGraph();

   error = IGTransferColors();
   if(error == -1){
     fprintf(stderr, "INTERNAL ERROR: TransferColors\n");
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
      //case divI:
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case divI: //use one
      case pushI:
        if(op == NULL){
          fprintf(stderr, "return -1 7\n");
          return -1;
        }
        if(op->operandKind == temporaryO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
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
        if(op->operandKind == tempDeRefO && op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
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
        lia[index].succ[1] = jINSTR->id;
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
    listUnion(lia[index].use, lia[index].in); //when we use its also liveIn
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
      freeList(diff);
      if(res == -1){
        fprintf(stderr, "Some error occurred\n");
        return -1;
      }
      isChanged += res;
      for(int j=0; j<3; j++){
        if(lia[n].succ[j] != -1){
          res = listUnion(lia[lia[n].succ[j]].in, lia[n].out);
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
  TempListNode *defNode;
  TempListNode *liveNode;
  int error = IGcreateGraph(tempIdVal, livenessTempList);
  if(error == -1){
    fprintf(stderr, "Error while building graph\n");
    return -1;
  }
  for(int n=0; n<intermediateInstrCount; n++){

    defNode = lia[n].def->head;
    while(defNode != NULL){
      //fprintf(stderr, "instr %d with liveOut %p\n", n, lia[n].out->head);
      //fprintf(stderr, "defNode->temp->id %d, offset %d\n", defNode->temp->tempId, defNode->temp->placement.offset);
      liveNode = lia[n].out->head;
      while(liveNode != NULL){
        if((!lia[n].isMove) || defNode->temp != liveNode->temp){
          //HUGE MISTAKE HERE OR small
          int error;
          error = IGinsertNeighbor(defNode->temp->graphNodeId, liveNode->temp->graphNodeId);
          if(error == -1){
            fprintf(stderr, "INTERNAL ERROR\n");
            return 0;
          }
          error = IGinsertNeighbor(liveNode->temp->graphNodeId, defNode->temp->graphNodeId);
          if(error == -1){
            fprintf(stderr, "INTERNAL ERROR\n");
            return 0;
          }
        }
        liveNode = liveNode->next;
      }
      defNode = defNode->next;
    }
  }
  //fprintf(stderr, "UnsupportedOperationException: buildInterferenceGraph\n");
  return 0;
}





void printLIA(){
  for(int n = 0; n<intermediateInstrCount; n++){
    if(    (lia[n].use->head == NULL)
        && (lia[n].def->head == NULL)
        && (lia[n].in->head == NULL)
        && (lia[n].out->head == NULL)){
          continue;
        }
    fprintf(stderr, "INSTR %d ", n);
    if(lia[n].isMove){
      fprintf(stderr, "isMove ");
    }fprintf(stderr, "with successors ");
    for(int j=0; j<3; j++){
      if(lia[n].succ[j] != -1)
      fprintf(stderr, "%d ", lia[n].succ[j]);
    }
    fprintf(stderr, "\n");
    TempListNode *node;
    fprintf(stderr, "USE: ");
    node = lia[n].use->head;
    while(node != NULL){
      fprintf(stderr, "%d; ", node->temp->tempId);
      node = node->next;
    }
    fprintf(stderr, "\n");
    fprintf(stderr, "DEF: ");
    node = lia[n].def->head;
    while(node != NULL){
      fprintf(stderr, "%d; ", node->temp->tempId);
      node = node->next;
    }
    fprintf(stderr, "\n");
    fprintf(stderr, "IN: ");
    node = lia[n].in->head;
    while(node != NULL){
      fprintf(stderr, "%d; ", node->temp->tempId);
      node = node->next;
    }
    fprintf(stderr, "\n");
    fprintf(stderr, "OUT: ");
    node = lia[n].out->head;
    while(node != NULL){
      fprintf(stderr, "%d; ", node->temp->tempId);
      node = node->next;
    }
    fprintf(stderr, "\n--------------------------\n");
  }
}
