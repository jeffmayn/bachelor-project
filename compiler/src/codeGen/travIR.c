#include "internalASM.h"

const char* regNames[] = {"error: na", "%RAX ", "%RCX ", "%RDX ",\
                          "%RBX ", "%RSP ", "%RBP ", "%RSI ",\
                           "%RDI ", "%R8 ", "%R9 ", "%R10 ", "%R11 ",\
                            "%R12 ", "%R13 ", "%R14 ", "%R15 ", "error: spill"};

int IRtravInternalRep(INSTR *instr){
  int error = 0;
  while(instr != NULL){
    error = IRtravINSTR(instr);
    if(error == -1){
      fprintf(stderr, "IRtravInternalRep: error\n");
      return -1;
    }
    instr = instr->next;
  }
  return 0;
}


int IRtravOPERANDlist(OPERAND *op){
  int error = 0;
  while(op != NULL){
    error = IRtravPARAM(op);
    if(error == -1){
      fprintf(stderr, "IRtravOPERANDlist: error\n");
      return -1;
    }
    op = op->next;
  }
  return 0;
}

int IRtravPARAM(OPERAND *op){
  if(op == NULL){
    return -1;
  }
  switch(op->operandKind){
    case constantO:
      printf("$%d ", op->val.constant);
      break;
    case temporaryO:
      // TODO
      //printf("t%d ", op->val.temp->tempId);
      travTemporary(op->val.temp);
      break;
    case heapAddrO:
      fprintf(stderr, "ITtravPARAM: WHAT is a heapAddrO\n");
      //printf("%x ", op->val.address);
      break;
    case labelIDO:
      printf("%s", op->val.label);
      break;
    case registerO:
      regMapping(op->val.reg);
      break;
    case addrLabelO:
      printf("$%s ", op->val.label);
      break;
  }
}

int travTemporary(TEMPORARY *temp){
  switch(temp->temporarykind){
    case notPlacedT:
      printf("notPlaceYet ");
      break;
    case paramT:
      printf("(%%rbp,%d,8) ", temp->placement.offset);
      break;
    case localT:
      printf("(%%rbp,%d,-8) ", temp->placement.offset);
      break;
    case regT:
      printf("%s ", regNames[temp->placement.reg]);
      break;
  }
  return 0;
}



int IRtravINSTR(INSTR *in){
  int error = 0;
  switch(in->instrKind){
    case addI:
      printf("add ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case subI:
      printf("sub ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case mulI:
      printf("imul ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case divI:
      printf("divq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case andI:
      printf("and ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case orI:
      printf("or ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case xorI:
      printf("xor ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case lshiftI:
      printf("shl ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case rshiftI:
      printf("shr ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case cmpI:
      printf("cmp ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jumpI:
      printf("jmp ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmplessI:
      printf("jl ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpgreatI:
      printf("jg ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpleI:
      printf("jl ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpgeI:
      printf("jge ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpeqI:
      printf("je ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpneqI:
      printf("jne ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case movI:
      printf("mov ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case labelI:
      //printf("label ");
      error = IRtravOPERANDlist(in->paramList);
      printf(":");
      break;
    case pushI:
      printf("push ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case popI:
      printf("pop ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case callI:
      printf("call ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case retI:
      printf("ret ");
      error = IRtravOPERANDlist(in->paramList);
      break;
  }
  printf("\n");
  return error;
}


int regMapping(registers reg){
  printf("%s", regNames[reg]);
  return 0;
}
