#include "internalASM.h"

const char* regNames[] = {"error: na", "%%RAX ", "%%RCX ", "%%RDX ",\
                          "%%RBX ", "%%RSP ", "%%RBP ", "%%RSI ",\
                           "%%RDI ", "%%R8 ", "%%R9 ", "%%R10 ", "%%R11 ",\
                            "%%R12 ", "%%R13 ", "%%R14 ", "%%R15 ", "error: spill"};

int IRtravPARAM(OPERAND *op){
  switch(op->operandKind){
    case constantO:
      printf("$%d ", op->val.constant);
      break;
    case temporaryO:
      // TODO
      printf("%d ", op->val.temp);
      break;
    case heapAddrO:
      printf("%x ", op->val.address);
      break;
    case labelIDO:
      printf("%d ", op->val.label);
      break;
    case registerO:
      regMapping(op->val.reg);
      break;
  }
}

int IRtravINSTR(INSTR *in){
  switch(in->instrKind){
    case addI:
      printf("add ");
      IRtravPARAM(in->paramList);
      break;
    case subI:
      printf("sub ");
      IRtravPARAM(in->paramList);
      break;
    case mulI:
      printf("imul ");
      IRtravPARAM(in->paramList);
      break;
    case divI:
      printf("divq ");
      IRtravPARAM(in->paramList);
      break;
    case andI:
      printf("and ");
      IRtravPARAM(in->paramList);
      break;
    case orI:
      printf("or ");
      IRtravPARAM(in->paramList);
      break;
    case xorI:
      printf("xor ");
      IRtravPARAM(in->paramList);
      break;
    case lshiftI:
      printf("shl ");
      IRtravPARAM(in->paramList);
      break;
    case rshiftI:
      printf("shr ");
      IRtravPARAM(in->paramList);
      break;
    case cmpI:
      printf("cmp ");
      IRtravPARAM(in->paramList);
      break;
    case jumpI:
      printf("jmp ");
      IRtravPARAM(in->paramList);
      break;
    case jmplessI:
      printf("jl ");
      IRtravPARAM(in->paramList);
      break;
    case jmpgreatI:
      printf("jg ");
      IRtravPARAM(in->paramList);
      break;
    case jmpleI:
      printf("jl ");
      IRtravPARAM(in->paramList);
      break;
    case jmpgeI:
      printf("jge ");
      IRtravPARAM(in->paramList);
      break;
    case jmpeqI:
      printf("je ");
      IRtravPARAM(in->paramList);
      break;
    case jmpneqI:
      printf("jne ");
      IRtravPARAM(in->paramList);
      break;
    case movI:
      printf("mov ");
      IRtravPARAM(in->paramList);
      break;
    case labelI:
      printf("label ");
      IRtravPARAM(in->paramList);
      break;
    case pushI:
      printf("push ");
      IRtravPARAM(in->paramList);
      break;
    case popI:
      printf("pop ");
      IRtravPARAM(in->paramList);
      break;
    case callI:
      printf("call ");
      IRtravPARAM(in->paramList);
      break;
    case retI:
      printf("ret ");
      IRtravPARAM(in->paramList);
      break;
  }
}

int regMapping(registers reg){


  printf("%s", regNames[reg]);

/*
  switch (reg) {
    case 0:
      printf("error: na");
      break;
    case 1:
      printf("%%RAX ");
      break;
    case 2:
      printf("%%RCX ");
      break;
    case 3:
      printf("%%RDX ");
      break;
    case 4:
      printf("%%RBX ");
      break;
    case 5:
      printf("%%RSP ");
      break;
    case 6:
      printf("%%RBP ");
      break;
    case 7:
      printf("%%RSI ");
      break;
    case 8:
      printf("%%RDI ");
      break;
    case 9:
      printf("%%R8 ");
      break;
    case 10:
      printf("%%R9 ");
      break;
    case 11:
      printf("%%R10 ");
      break;
    case 12:
      printf("%%R11 ");
      break;
    case 13:
      printf("%%R12 ");
      break;
    case 14:
      printf("%%R13 ");
      break;
    case 15:
      printf("%%R14 ");
      break;
    case 16:
      printf("%%R15 ");
      break;
    case 17:
      printf("error: spill");
      break;
  }
  */
}
