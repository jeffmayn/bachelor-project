#ifndef __patterns_h
#define __patterns_h

#include "internalASM.h"

#define NRPATTERNS 7
#define WINDOWSIZE 5

int incPattern(INSTR* instr);
int decPattern(INSTR* instr);
int wastedMovq(INSTR* instr);
int wastedMovqSeq(INSTR* instr);
int addZero(INSTR *instr);
int addOne(INSTR *instr);
int moveToSelf(INSTR *instr);

#endif
