
#include "internalASM.h"
#include "memory.h"

//LivenessInstructionArray *lia; //in internalASM.h now

/*
 * Does liveness analysis
 */
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

/**
 * Initializes liveness analysis
 * Creates empty use, def, in and out sets for each instruction
 * Sets each instruction to have zero successors
 * Assumes all instructions to be non-move
 */
int initLiveness(){
  lia = Malloc(sizeof(LivenessInstructionArray)*intermediateInstrCount);
  for(int i=0; i<intermediateInstrCount; i++){
    lia[i].use = createList(tempIdVal);
    lia[i].def = createList(tempIdVal);
    lia[i].in = createList(tempIdVal);
    lia[i].out = createList(tempIdVal);
    for(int j = 0; j<3; j++){
      lia[i].succ[j] = -1;
    }
    lia[i].isMove = 0;
  }
  return 0;
}

/**
 * Analyzes each instruction
 */
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
      case andI:
      case orI:
      case xorI:
      case lshiftI:
      case rshiftI:
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp); //using first operand
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp); //using operand if deref
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp); //using and defining second operand
          addElement(lia[index].def, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp); //onlu using operand if deref
        }
        break;
      case cmpI: //use both
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case movI: //use first; def second
        lia[index].isMove = 1;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        op = op->next;
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case divI: //use one
      case pushI:
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case popI: //def one
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].def, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case incI:
      case decI: //use and define one
        if(op == NULL){
          return -1;
        }
        if(op->operandKind == temporaryO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
          addElement(lia[index].def, op->val.temp);
        }
        if(op->operandKind == tempDeRefO &&
          op->val.temp->temporarykind == actualTempT){
          addElement(lia[index].use, op->val.temp);
        }
        break;
      case jumpI: //primary succ is different
        jINSTR = instrHashGetINSTR(labelINSTRTable, instr->paramList->val.label);
        if(jINSTR == NULL){
          fprintf(stderr, "INTERNAL ERROR: \
            occurred when getting instruction with label %s\n",
            instr->paramList->val.label);
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
        jINSTR = instrHashGetINSTR(labelINSTRTable, instr->paramList->val.label);
        if(jINSTR == NULL){
          fprintf(stderr, "INTERNAL ERROR during livness\n");
          return -1;

        }
        lia[index].succ[1] = jINSTR->id;
      case callI:
      case labelI:
      case retI:
      case textI:
      case commentI:
        break;
    }
    if(lia[index].succ[0] == -1 && index < intermediateInstrCount-1){
      //standard successor is next instruction,
      //unless its already set or we reached the end of program
      lia[index].succ[0] = index+1;
    }
    listUnion(lia[index].use, lia[index].in); //Everything we use is liveIN
    instr = instr->next;
  }
  return 0;
}

/**
 * Finds liveIn and loveOut sets for all instructions
 * Traverses instructions in reverse order as speedup heuristic
 * Algorithm based on Appel, Modern Compiler Construction, page 221
 */
int livenessAnalysis(){
  int isChanged;
  int res;
  while(true){
    isChanged = 0;
    for(int n=intermediateInstrCount - 1; n>=0; n--){
      //live in = use U (liveOut - def)
      TempList *diff = listDiff(lia[n].out, lia[n].def);
      res = listUnion(diff, lia[n].in);
      freeList(diff);
      if(res == -1){ return -1; }
      isChanged += res;
      for(int j=0; j<3; j++){
        //liveOut = Union of liveIn of all successors
        if(lia[n].succ[j] != -1){
          res = listUnion(lia[lia[n].succ[j]].in, lia[n].out);
          if(res == -1){ return -1; }
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

/**
 * Builds the interfernce graph based on the liveness analysis
 * Based on Appel, Modern Compiler Construction, page ????
 */
int buildInterferenceGraph(){
  TempListNode *defNode;
  TempListNode *liveNode;
  //graph is build based on amount and list of temporaries
  int error = IGcreateGraph(tempIdVal, livenessTempList);
  if(error == -1){ return -1; }
  for(int n=0; n<intermediateInstrCount; n++){
    defNode = lia[n].def->head;
    while(defNode != NULL){ //for every temporary defined
      liveNode = lia[n].out->head;
      while(liveNode != NULL){ //for every temporary live out
        if((!lia[n].isMove) || defNode->temp != liveNode->temp){
          //if not move or if livenode is not destination
          //add interference edge in both directions
          error = IGinsertNeighbor(defNode->temp->graphNodeId,
            liveNode->temp->graphNodeId);
          if(error == -1){ return -1; }
          error = IGinsertNeighbor(liveNode->temp->graphNodeId,
            defNode->temp->graphNodeId);
          if(error == -1){ return -1; }
        }
        liveNode = liveNode->next;
      }
      defNode = defNode->next;
    }
  }
  return 0;
}




/**
 * Debug funciton
 */
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
