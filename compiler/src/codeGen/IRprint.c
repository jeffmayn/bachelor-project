#include "internalASM.h"
#include "IRprint.h"


void printINSTRnode(INSTR *instr){
  if(instr != NULL){
    fprintf(stderr, "Instruktion %d\n", instr->instrKind);
    printOPERANDs(instr->paramList);
    fprintf(stderr, "  |\n");
    fprintf(stderr, "  |\n");
    fprintf(stderr, "\\ | /\n");
    fprintf(stderr, " \\ /\n");
    printINSTRnode(instr->next);
  }
  fprintf(stderr, "***NULL***\n");
}

void printOPERANDs(OPERAND *op){
  while(op != NULL){
    printOPERANDnode(op);
    op = op->next;
  }
}

void printOPERANDnode(OPERAND *op){
  fprintf(stderr, "\tOperand %d\n", op->operandKind);
  switch(op->operandKind){
    case constantO:
      fprintf(stderr, "\t\t constant: %d\n", op->val.constant);
      break;
    case temporaryO:
      printTEMPORARYnode(op->val.temp);
      break;
    case heapAddrO:
      fprintf(stderr, "\t\t address: %d\n", op->val.address);
      break;
    case labelIDO:
      fprintf(stderr, "\t\t label: %s\n", op->val.label);
      break;
    case registerO:
      fprintf(stderr, "\t\t reguster: %d\n", op->val.reg);
      break;
  }

}

void printTEMPORARYnode(TEMPORARY *temp){
  switch (temp->temporarykind) {
    case addrT:
      fprintf(stderr, "\t\tTemporary %s with address %d\n", temp->tempName, temp->placement.address);
      break;
    case regT:
      fprintf(stderr, "\t\tTemporary %s register %d\n", temp->tempName, temp->placement.reg);
      break;
  }
}
