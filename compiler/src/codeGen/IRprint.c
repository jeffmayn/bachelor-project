#include "internalASM.h"
#include "IRprint.h"

const char* instrNames[] = {"add", "sub", "mul", "div", "and", "or",
              "xor", "lshift", "rshift", "cmp", "jump", "jmpless",
              "jmpgreat", "jmple", "jmpge", "jmpeq", "jmpneq", "mov",
              "label", "push", "pop", "call", "ret"};

void printINSTRnode(INSTR *instr){
  if(instr != NULL){
    fprintf(stderr, "Instruction: %s\n", instrNames[instr->instrKind]);
    printOPERANDs(instr->paramList);
    fprintf(stderr, "\t  |\n");
    fprintf(stderr, "\t  |\n");
    fprintf(stderr, "\t\\ | /\n");
    fprintf(stderr, "\t \\ /\n");
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
    case heapAddrO:
      fprintf(stderr, "address: %d\n", op->val.address);
      break;
    case labelIDO:
      fprintf(stderr, "label: %s\n", op->val.label);
      break;
    case registerO:
      fprintf(stderr, "register: %s\n", regNames[op->val.reg]);
      break;
    case localO:
      //something print the address of loval variable??
      break;
    case paramO:
      break;
  }

}

void printTEMPORARYnode(TEMPORARY *temp){
  switch (temp->temporarykind) {
    case addrT:
      fprintf(stderr, "Temporary %s with address %d\n", temp->tempNr, temp->placement.address);
      break;
    case regT:                                                         //use regNames[temp->placement.reg]
      fprintf(stderr, "Temporary %s in register %s\n", temp->tempNr, regNames[temp->placement.reg]);
      break;
  }
}
