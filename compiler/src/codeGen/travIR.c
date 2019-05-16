#include "internalASM.h"

const char* regNames[] = {"error: na", "%rax", "%rcx", "%rdx",\
                          "%rbx", "%rsp", "%rbp", "%rsi",\
                           "%rdi", "%r8", "%r9", "%r10", "%r11",\
                            "%r12", "%r13", "%r14", "%r15", "error: spill"};

/**
 * funktioner i dette program går over vores interne representation
 * og skriver fra intern representation til assembler kode
 * skriver til stdout. fejl bliver printet i stderr.
 */

int BPRESET = 0;

int IRtravInternalRep(INSTR *instr){
  int error = 0;
  while(instr != NULL){
    error = IRtravINSTR(instr);
    if(error == -1){
      fprintf(stderr, "IRtravInternalRep: error\n");
      return -1;
    }
    if(BPRESET){
      printf("\tmovq %%rbp, %%rdi\t\t#resetting basepointer\n");
      BPRESET = 0;
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
      travTemporary(op->val.temp);
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
      break;
  }
  return 0;
}

int travTemporary(TEMPORARY *temp){
  switch(temp->temporarykind){
    case actualTempT:
      printf("(%%rbp,%%rdx,8)");
      break;
    case paramT:
      printf("(%%rdi,%%rdx,8)");
      BPRESET = 1;
      break;
    case localT:
      printf("(%%rdi,%%rdx,8)");
      BPRESET = 1;
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
      else if(op->val.temp->temporarykind == localT ||
                      op->val.temp->temporarykind == actualTempT){
        printf("\tmovq $-%d, %%rdx\n", (op->val.temp->placement.offset+6)); //callee save
      }
    }
    if(op->operandKind == tempDeRefO){
      if( op->val.temp->temporarykind == regT){
        printf("\tmovq %s, %%rcx\n", regNames[op->val.temp->placement.reg]);

      }
      else{
        printf("\tmovq (%%rbp,%%rdx,8), %%rcx\n");
      }
    }
    op = op->next;
  }
  return 0;
}

const char* instrNames2[] = {"\taddq ", "\tincq ", "\tdecq ", "\tsubq ","\timulq ",
                            "\tidivq ", "\tand ", "\tor ", "\txor ", "\tshl ",
                            "\tshr ", "\tcmp ", "\tjmp ", "\tjl ", "\tjg ",
                            "\tjle ", "\tjge ", "\tje ", "\tjne ", "\tmovq ",
                            "", "\tpush ", "\tpop ", "\tcall ", "\tret ", "", ""};

int IRtravINSTR(INSTR *in){
  int error = 0;
  checkOffsetOperand(in);
  printf("%s", instrNames2[in->instrKind]);
  error = IRtravOPERANDlist(in->paramList);
  if(in->instrKind == labelI){
    printf(":");
  }
  if(in->instrKind == retI){
    printf("\n\n\n");
  }
  
  printf("\n");
  return error;
}


int regMapping(registers reg){
  printf("%s", regNames[reg]);
  return 0;
}
