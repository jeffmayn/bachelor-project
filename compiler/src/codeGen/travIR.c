#include "internalASM.h"

int blah(){
  IRtravINSTR(intermediateHead)
}

int IRtravPARAM(OPERAND *op){
  switch(op->operandKind){
    case constantO:
      printf("$%d ", op->val.constant);
      break;
    case temporaryO:
      printf("%d ", op->val.temp);
      break;
    case heapAddr0:
      printf("%d ", op->val.address);
      break;
    case labelID0:
      printf("%d ", op->val.label);
      break;
    case register0:
      printf("%%%d ", op->val.reg);
      break;
  }
}

int IRtravINSTR(INSTR *in){
  switch(in->instrKIND){
    case addI:
      printf("add ");
      call IRtravPARAM()
      break;
    case subI
      printf("sub ");
      break;
      //
    case mulI
      printf("imul ");
      break;
      //
    case divI
      printf("divq ");
      break;
    //
    case andI
      printf("and ");
      break;
    //
    case orI
      printf("or ");
      break;
    //
    case xorI
      printf("xor ");
      break;
    //
    case lshiftI
      printf("shl ");
      break;
    //
    case rshiftI
      printf("shr ");
      break;
      //
    case cmpI:
      printf("cmp ");
      break;
      //
    case jumpI
      printf("jmp ");
      break;
      //
    case jmplessI
      printf("jl ");
      break;
      //
    case jmpgreatI
      printf("jg ");
      break;
    //
    case jmpleI
      printf("jl ");
      break;
    //
    case jmpgeI
      printf("jge ");
      break;
    //
    case jmpeqI
      printf("je ");
      break;
    //
    case jmpneqI
      printf("jne ");
      break;
    //
    case movI
      printf("mov ");
      break;
    //
    case labelI
      printf("label ");
      break;
    //
    case pushI
      printf("push ");
      break;
    //
    case popI
      printf("pop ");
      break;
    //
    case callI
      printf("call ");
      break;
    //
    case retI
      printf("ret ");
      break;
  }
}
