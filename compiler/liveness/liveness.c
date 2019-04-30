/*
 * This file should implement liveness analysis
 */
 #include "internalASM.h"

 LivenessInstructionArray *lia;

 int liveness(){
   initLiveness();

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
  while(instr != NULL){
    int index = instr.id;
    if(instr->kind = movI){
      lia[index].isMove = 1;
    }
    switch(instr->kind){
      case addI: //use both; define second
      case subI:
      case mulI:
      case divI:
      case andI:
      case orI:
      case xorI:
      case lshiftI:
      case rshiftI:
        instr.operand;
        break;
      case cmpI: //use both
        break;
      case movI: //use first; def second
        break;
      case pushI: //use one
      case popI:
        break;
      case jumpI:   //no relevant operands
      case jmplessI:
      case jmpgreatI:
      case jmpleI:
      case jmpgeI:
      case jmpeqI:
      case jmpneqI:
      case labelI:
      case callI:
      case retI:
      case textI:
      case commentI:
        break;
    }
  }
}
