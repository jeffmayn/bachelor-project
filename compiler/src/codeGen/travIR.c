#include "internalASM.h"

const char* regNames[] = {"error: na", "%rax", "%rcx", "%rdx",\
                          "%rbx", "%rsp", "%rbp", "%rsi",\
                           "%rdi", "%r8", "%r9", "%r10", "%r11",\
                            "%r12", "%r13", "%r14", "%r15", "error: spill"};



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
    if(op != NULL && op->operandKind != commentO){
      printf(", ");
    }
  }
  return 0;
}

int IRtravPARAM(OPERAND *op){
  if(op == NULL){
    return -1;
  }
  switch(op->operandKind){
    case constantO:
      printf("$%d", op->val.constant);
      break;
    case temporaryO:
      // TODO
      //printf("t%d", op->val.temp->tempId);
      travTemporary(op->val.temp);
      break;
    case heapAddrO:
      //printf("%x", op->val.address);
      break;
    case labelIDO:
      printf("%s", op->val.label);
      break;
    case registerO:
      regMapping(op->val.reg);
      break;
    case addrLabelO:
      printf("$%s", op->val.label);
      break;
    case textO:
      printf("%s", op->val.label);
      break;
    case commentO:
      printf("#%s", op->val.label);
      break;
    case derefO://we only dereference registers for now.
      printf("(");
      regMapping(op->val.reg);
      printf(")");
      break;
    case tempDeRefO:
      printf("(%%rcx)");
      //travTemporary(op->val.temp);
  }
}

int travTemporary(TEMPORARY *temp){
  switch(temp->temporarykind){
    case actualTempT:
      //printf("notPlaceYet ");
      //printf("mov -%d, %%rdx\n", temp->placement.offset);
      printf("(%%rbp,%%rdx,8)");
      break;
    case paramT:
      //printf("mov %d, %%rdx\n", temp->placement.offset);
      printf("(%%rdi,%%rdx,8)");
      break;
    case localT:
      //printf("mov -%d, %%rdx\n", temp->placement.offset);
      printf("(%%rdi,%%rdx,8)");
      break;
    case regT:
      printf("%s", regNames[temp->placement.reg]);
      break;
  }
  return 0;
}

/**
 * Flytter offset over i %rdx, hvis hukommelse skal tilgås
 * Det her er måske lidt hacket
 */
int checkOffsetOperand(INSTR *in){
  OPERAND *op = in->paramList;
  while(op != NULL){
    if(op->operandKind == temporaryO || op->operandKind == tempDeRefO){
      if(op->val.temp->temporarykind == paramT){
        printf("\tmovq $%d, %%rdx\n", (op->val.temp->placement.offset+3)); //return og static link
      }
      else if(op->val.temp->temporarykind == localT || op->val.temp->temporarykind == actualTempT){
        printf("\tmovq $-%d, %%rdx\n", (op->val.temp->placement.offset+6)); //callee save
      }
    }
    if(op->operandKind == tempDeRefO){
      printf("\tmovq (%%rbp,%%rdx,8), %%rcx\n");
      //TODO: %rdi is probably a bad choice
      //TODO: compile to a.s
    }
    op = op->next;
  }
  return 0;
}


int IRtravINSTR(INSTR *in){
  int error = 0;
  checkOffsetOperand(in);
  switch(in->instrKind){
    case addI:
      printf("\taddq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case subI:
      printf("\tsubq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case mulI:
      printf("\timulq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case divI:
      printf("\tidivq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case andI:
      printf("\tand ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case orI:
      printf("\tor ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case xorI:
      printf("\txor ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case lshiftI:
      printf("\tshl ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case rshiftI:
      printf("\tshr ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case cmpI:
      printf("\tcmp ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jumpI:
      printf("\tjmp ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmplessI:
      printf("\tjl ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpgreatI:
      printf("\tjg ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpleI:
      printf("\tjle ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpgeI:
      printf("\tjge ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpeqI:
      printf("\tje ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case jmpneqI:
      printf("\tjne ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case movI:
      printf("\tmovq ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case labelI:
      //printf("label ");
      error = IRtravOPERANDlist(in->paramList);
      printf(":");
      break;
    case pushI:
      printf("\tpush ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case popI:
      printf("\tpop ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case callI:
      printf("\tcall ");
      error = IRtravOPERANDlist(in->paramList);
      break;
    case retI:
      printf("\tret ");
      error = IRtravOPERANDlist(in->paramList);
      printf("\n\n\n");
      break;
    case textI:
      error = IRtravOPERANDlist(in->paramList);
      break;
    case commentI:
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
