#include "internalASM.h"

const char* regNames[] = {"error: na", "%rax ", "%rcx ", "%rdx ",\
                          "%rbx ", "%rsp ", "%rbp ", "%rsi ",\
                           "%rdi ", "%r8 ", "%r9 ", "%r10 ", "%r11 ",\
                            "%r12 ", "%r13 ", "%r14 ", "%r15 ", "error: spill"};

const char* insNames[] = {"addq ", "subq ", "imulq ", "divq ", "andq ", "orq ",\
                          "xorq ", "shlq ", "shrq ", "cmp ", "jmp ", "jl ",\
                          "jg ", "jl ", "jge ", "je ", "jne ", "movq ",\
                          "push ", "pop ", "ret "};

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
    if(op != NULL){
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
      //printf("t%d ", op->val.temp->tempId);
      travTemporary(op->val.temp);
      break;
    case heapAddrO:
      //printf("%x ", op->val.address);
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
      printf("(%%rbp,%%rdx,8)");
      break;
    case localT:
      //printf("mov -%d, %%rdx\n", temp->placement.offset);
      printf("(%%rbp,%%rdx,8)");
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
    if(op->operandKind == temporaryO){
      if(op->val.temp->temporarykind == paramT){
        printf("mov $%d, %%rdx\n", (op->val.temp->placement.offset+2)); //return og static link
      }
      else if(op->val.temp->temporarykind == localT || op->val.temp->temporarykind == actualTempT){
        printf("mov $-%d, %%rdx\n", (op->val.temp->placement.offset+8)); //callee save
      }
    }
    op = op->next;
  }
  return 0;
}


int IRtravINSTR(INSTR *in){
  checkOffsetOperand(in);
  elPrinto(in);
}

int elPrinto(INSTR *in){
  int error = 0;
  if (in->instrKind != "textI"){
  printf("%s", insNames[in->instrKind]);
  }
  error = IRtravOPERANDlist(in->paramList);
  printf("\n");
  return error;
}

int regMapping(registers reg){
  printf("%s", regNames[reg]);
  return 0;
}
