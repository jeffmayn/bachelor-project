#include "internalASM.h"
#include "IRprint.h"

const char* instrNames[] = {"add", "sub", "mul", "div", "and", "or",
              "xor", "lshift", "rshift", "cmp", "jump", "jmpless",
              "jmpgreat", "jmple", "jmpge", "jmpeq", "jmpneq", "mov",
              "label", "push", "pop", "call", "ret", "text"};

void printINSTRnode(INSTR *instr){
  if(instr != NULL){
    fprintf(stderr, "Instr %d: %s\n", instr->id, instrNames[instr->instrKind]);
    printOPERANDs(instr->paramList);
    fprintf(stderr, "--------------------------------------------\n");
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
    case labelIDO:
      fprintf(stderr, "label: %s\n", op->val.label);
      break;
    case registerO:
      fprintf(stderr, "register: %s\n", regNames[op->val.reg]);
      break;
    case addrLabelO:
      fprintf(stderr, "addrLabel: %s\n", op->val.label);
      break;
    case textO:
      fprintf(stderr, "%s\n", op->val.label);
      break;
    case derefO:
      fprintf(stderr, "dereference register: %s\n", regNames[op->val.reg]);
      break;
    case commentO:
      fprintf(stderr, "#%s\n", op->val.label);
      break;
    case tempDeRefO:
      fprintf(stderr, "deref");
      printTEMPORARYnode(op->val.temp);
      break;
  }

}

void printTEMPORARYnode(TEMPORARY *temp){
  fprintf(stderr, "TEMPORARY %d: ", temp->tempId);
  switch (temp->temporarykind) {
    case actualTempT:
      fprintf(stderr, "temp offset %d\n", temp->placement.offset);
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
