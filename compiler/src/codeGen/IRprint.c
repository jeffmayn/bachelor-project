#include "internalASM.h"
#include "IRprint.h"

const char* instrNames[] = {"add", "sub", "mul", "div", "and", "or",
              "xor", "lshift", "rshift", "cmp", "jump", "jmpless",
              "jmpgreat", "jmple", "jmpge", "jmpeq", "jmpneq", "mov",
              "label", "push", "pop", "call", "ret"};

void printINSTRnode(INSTR *instr){
  if(instr != NULL){
    fprintf(stderr, "Instr: %s\n", instrNames[instr->instrKind]);
    printOPERANDs(instr->paramList);
    //fprintf(stderr, "\t ||\n");
    //fprintf(stderr, "_______________________________________\n");
    fprintf(stderr, "--------------------------------------------\n");
    //fprintf(stderr, "\t \\/\n");
    printINSTRnode(instr->next);
  }
  else {
    fprintf(stderr, "***NULL***\n");
  }
}

void printOPERANDs(OPERAND *op){
  while(op != NULL){
    printOPERANDnode(op);
    op = op->next;
  }
}

void printOPERANDnode(OPERAND *op){
  fprintf(stderr, "\tOperand %d: ", op->operandKind);
  switch(op->operandKind){
    case constantO:
      fprintf(stderr, "constant: %d\n", op->val.constant);
      break;
    case temporaryO:
      printTEMPORARYnode(op->val.temp);
      break;
    // case heapAddrO:
    //   fprintf(stderr, "address: %d\n", op->val.address);
    //   break;
    case labelIDO:
      fprintf(stderr, "label: %s\n", op->val.label);
      break;
    case registerO:
      fprintf(stderr, "register: %s\n", regNames[op->val.reg]);
      break;
    case addrLabelO:
      fprintf(stderr, "addrLabel: %s\n", op->val.label);
      break;
  }

}

void printTEMPORARYnode(TEMPORARY *temp){
  fprintf(stderr, "TEMPORARY %d: ", temp->tempId);
  switch (temp->temporarykind) {
    case notPlacedT:
      fprintf(stderr, "not placed yet\n");
      break;
    case localT:
      //something print the address of local variable??
      fprintf(stderr, "local offset %d\n", temp->placement.offset);
      break;
    case paramT:
      fprintf(stderr, "param offset %d\n", temp->placement.offset);
      break;
    case regT:
      fprintf(stderr, "in register %s\n", regNames[temp->placement.reg]);
      break;
  }
}
