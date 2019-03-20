#ifndef __internalASM_h
#define __internalASM_h
/**
 * NOTE TO SELF!
 * - create seperate .c files for each category of constructors
 * - dont do the same thing as in del3, that is: be smarter!
 * Create map to map all ID's/variables to temporaries.
 */
typedef enum {addI, subI, mulI, divI, andI, orI, xorI, lshiftI, rshiftI, cmpI,
              jumpI, jmplessI, jmpgreatI, jmpleI, jmpgeI, jmpeqI, jmpneqI,
              movI, labelI, pushI, popI, callI, retI} INSTRkind;
typedef enum {constantP, temporaryP, heapAddrP, labelIDP} PARAMkind

typedef struct {
  INSTRkind opKind;
  struct PARAM *paramList;
  struct INSTR *next;
} INSTR;

typedef struct {
  PARAMkind paramKind;
  struct PARAM *next;
  union{
    int constant;
    char *temporary;
    int address;
    char *label;
  } val;
} PARAM;

int TempCounter; //the next tempvalue

INSTR *internalINSTRList; //global list of instructions

INSTR* appendINSTR(INTS *newINSTR);//appends instruction to the end of global list

//****Paramter constructors*****//
PARAM *makeConstantPARAM(int conVal);

PARAM *makeTemporaryPARAM(char *tempName);

PARAM *makeAddrPARAM(int addrVal);

PARAM *makeLabelPARAM(char *labelName);

PARAM *appendPARAM(PARAM *tail, PARAM *next);//append next to tail


//****Instruction constructors****//
INSTR* makeMovINSTR(PARAM *params);

INSTR* makeAddINSTR(PARAM *params);

INSTR *makeLabelINSTR(PARAM *params);

INSTR *makePushINSTR(PARAM *params);

INSTR *makePopINSTR(PARAM *params);

INSTR *makeCallINSTR(PARAM *params)

INSTR *makeRetINSTR(PARAM *params);//might not need params

//****Abstract scheme constructors****//
int makeFunctionScheme(FUNCTION *func);

int makeBodyScheme(BODY *body);



#endif
