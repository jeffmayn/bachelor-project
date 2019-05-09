#ifndef __internalASM_h
#define __internalASM_h

#include "tree.h"
#include <stdlib.h>
#include <stdio.h>
#include "symbol.h"
#include "bitmap.h"

#define HASHSIZE2 517
#define UNUSED_GRAPH_ID  0//use this when comparing if graphNodeId is unused
#define HEAPSIZE 1048576//oldvalue = 16384
#define OUTOFMEMORYCODE 6
#define INDEXOUTOFBOUNDSCODE 2
#define NONPOSITIVEALLOCCODE 4
#define DEVISIONBYZERO 3
#define DEREFNULLCODE 5

extern const char* regNames[];
/*kinds of assembler instrucktions we have*/
typedef enum {addI, incI, decI, subI, mulI, divI, 
              andI, orI, xorI, lshiftI, rshiftI,
              cmpI, jumpI, jmplessI, jmpgreatI, 
              jmpleI, jmpgeI, jmpeqI, jmpneqI, 
              movI, labelI, pushI, popI, callI, 
              retI, textI, commentI} INSTRkind;

/*kinds for operands for instrucktions*/
typedef enum {constantO, temporaryO, heapAddrO, 
              labelIDO, registerO, addrLabelO,
              textO, commentO, tempDeRefO, derefO} OPERANDkind;

/*enumeration for registers*/
typedef enum {NA, RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI,
              R8, R9, R10, R11, R12, R13, R14, R15, SPILL} registers;

/*kinds for temporaries, to keep track of where they are placed*/
typedef enum {actualTempT, paramT, localT, regT} TEMPORARYkind;

typedef struct TEMPORARY {
  TEMPORARYkind temporarykind;
  int tempId;
  int graphNodeId;
  struct TEMPORARY *next; //used for liveness
  union {
    int offset; //used by paramT og localT
    registers reg;
  } placement;
} TEMPORARY;

typedef struct OPERAND {
  OPERANDkind operandKind;
  struct OPERAND *next;
  union{
    int constant;
    char *label;
    TEMPORARY *temp;
    registers reg;

  } val;
} OPERAND;

typedef struct INSTR {
  int id;
  INSTRkind instrKind;
  struct OPERAND *paramList;
  struct INSTR *next;
} INSTR;


typedef struct CODEGENUTIL {
  int size; //only relevant for records
  union {
    struct {INSTR *funcLabel; int paramCount;} funcInfo;
    TEMPORARY *temp;
  } val;
} CODEGENUTIL;

/*global variables*/
typedef struct bodyListElm bodyListElm;
typedef struct bodyList bodyList;

extern const char *instrNames[];
extern const char *regNames[];

int regCount; //amount of multipurpose registers
INSTR* intermediateHead;
INSTR* intermediateTail;
int changeMade; //for peephole, if a change was made, run again.

int tempLocalCounter; //the next temp and local offset in current scope
int labelCounter; //the next label value
int tempIdVal; //used to give each temp a unique ID

char* beginHeapLabel; //points to the beginning of the heap
char* freeHeapLabel; //contains the next free heap space
char* endHeapLabel; //contains the heapEndAddress
char* mainSPointLabel; //for error correction
char* mainBPointLabel;

char* mainEndLabel;
char* errorCleanupLabel;

int intermediateInstrCount;

TEMPORARY *livenessTempList;

TEMPORARY *dummyTemp; //used to test whether content of user-record has already been traversed

//should return the next tempID;
TEMPORARY* IRcreateNextTemp();
CODEGENUTIL *IRmakeNewCGU();

int IRcreateInternalRep(bodyList *mainBody);

int IRtravBody(SymbolTable *table, bodyListElm *body);
int IRmakeCalleeProlog();
int IRmakeCalleeEpilog();

int travTemporary(TEMPORARY *temp);

int IRinitParams(SymbolTable *table, bodyListElm *element);

int IRtravDecl(SymbolTable *table, DECLARATION *decl);

int IRtravStmtList(SymbolTable *table, STATEMENT_LIST *statements, char* funcEndLabel, char* startLabel, char* endLabel);

int IRtravDeclList(SymbolTable *table, DECL_LIST *declerations);

int IRtravDecl(SymbolTable *table, DECLARATION *decl);
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList, int offset); //, int calledFromParDeclList removed
int IRtravVarType(SymbolTable *table, VAR_TYPE *varType, int offset); //, int isParam removed

int IRtravStmt(SymbolTable *t, STATEMENT *stmt, char* funcEndLabel, char* startLabel, char* endLabel);

OPERAND* IRtravVar(SymbolTable *t, VARIABLE *var);

int IRtravVarRecursive(SymbolTable *t, VARIABLE *var, SYMBOL **sym, TYPE **ty, OPERAND **op);

OPERAND* IRtravExp(SymbolTable *t, EXP *exp);

OPERAND* IRtravTerm(SymbolTable *t, TERM *term);

int IRtravActList(SymbolTable *t, ACT_LIST *actlist);

int IRtravExpList(SymbolTable *t, EXP_LIST *exps, int i);

int IRtravExpListReverse(SymbolTable *t, EXP_LIST *exps);



void IRruntimeErrorCleanupCode();

int findVarSymSize(SYMBOL *sym);
//****Paramter constructors*****//
OPERAND *IRmakeConstantOPERAND(int conVal);

OPERAND *IRmakeTemporaryOPERAND(TEMPORARY *temp);

OPERAND *IRmakeLocalOPERAND(int number);

OPERAND *IRmakeParamOPERAND(int number);

OPERAND *IRmakeAddrOPERAND(int addrVal);

OPERAND *IRmakeLabelOPERAND(char *labelName);

OPERAND *IRmakeRegOPERAND(registers reg);

OPERAND *IRmakeAddrLabelOPERAND(char *addrlabel);

OPERAND *IRmakeTextOPERAND(char *text);

OPERAND *IRmakeCommentOPERAND(char *text);

OPERAND *IRmakeTempDeRefOPERAND(TEMPORARY *temp);

OPERAND *IRmakeTrueOPERAND();

OPERAND *IRmakeFalseOPERAND();

OPERAND *IRmakeNullOPERAND();

OPERAND *IRappendOPERAND(OPERAND *tail, OPERAND *next);//append next to tail

OPERAND *IRmakeDeRefOPERAND(registers reg);

//****Instruction constructors****//
INSTR* IRmakeMovINSTR(OPERAND *params);

INSTR* IRmakeAddINSTR(OPERAND *params);

INSTR* IRmakeIncINSTR(OPERAND *params);

INSTR* IRmakeDecINSTR(OPERAND *params);

INSTR* IRmakeSubINSTR(OPERAND *params);

INSTR* IRmakeDivINSTR(OPERAND *params);

INSTR* IRmakeMulINSTR(OPERAND *params);

INSTR* IRmakeAndINSTR(OPERAND *params);

INSTR* IRmakeOrINSTR(OPERAND *params);

INSTR* IRmakeJleINSTR(OPERAND *params);

INSTR* IRmakeJgeINSTR(OPERAND *params);

INSTR* IRmakeJgINSTR(OPERAND *params);

INSTR *IRmakeJlINSTR(OPERAND *params);

INSTR* IRmakeJneINSTR(OPERAND *params);

INSTR *IRmakeJeINSTR(OPERAND *params);

INSTR *IRmakeLabelINSTR(OPERAND *params);

INSTR *IRmakePushINSTR(OPERAND *params);

INSTR *IRmakePopINSTR(OPERAND *params);

INSTR *IRmakeCallINSTR(OPERAND *params);

INSTR *IRmakeRetINSTR(OPERAND *params);//might not need params

INSTR *IRmakeJumpINSTR(OPERAND *params);

INSTR *IRmakeCmpINSTR(OPERAND *params);

INSTR* IRmakeTextINSTR(OPERAND *params);

INSTR* IRmakeCommentINSTR(OPERAND *params);

INSTR* IRappendINSTR(INSTR *newINSTR);//appends instruction to the end of global list
int IRinserINSTRhere(INSTR *prev, INSTR* new);

//****Abstract scheme constructors****//
int IRmakeFunctionScheme(FUNCTION *func);

int IRmakeBodyScheme(BODY *body);

/**
 * Makes a function call
 * The first parameter is the instruction giving the label to where to jump
 * The Second paramater is the list of parameters to this function
 *  - This list may be arbitrarily long
 */
int IRmakeFunctionCallScheme(SymbolTable *t, INSTR *labelINSTR, ACT_LIST *paramList, OPERAND* staticLinkOP, int paramCount);
OPERAND *IRsetCalleeStaticLink(int nrJumps);
int IRmakeFunctionAssiScheme();
OPERAND *IRsetStaticBase(int *nrJumps);
int IRresetBasePointer();


//Insert temporary name into symboltable for variables
int IRtravDeclListScheme(DECL_LIST *decls);

/**
 * Associate varibles to a temporary and add to map
 * Associate functions to a label
*/
int IRmakeDeclScheme(DECLARATION *decl);

//##################Optimization#################//
/*liveness - mostly*/
//used within the TempLocMap
typedef struct TempNode {
  char *name;
  registers reg; //the register to which this temp is assigned
  int graphNodeId; //id representing graph node associated to this temporary
  struct TempNode *next; //collision handling in TempLocMap
} TempNode;

/*used to map temps to registers or adresses (locations)*/
typedef struct TempLocMap {
  struct TempNode *table[HASHSIZE2];
} TempLocMap;

/******AST traversal and TempNodeMap setup*******/
int IRtemporaryHash(char *str);
TempLocMap *IRinitTempLocMap();
TempNode *IRputTempNode(TempLocMap *t, char *tempName);
TempLocMap* IRsetupTemporaries(bodyListElm *bodyList, SymbolTable *mainSymbolTable);
int IRtraverseDeclerationList(DECL_LIST *declerations);

//#############LIVENESS ANALYSIS#################
int liveness();
int initLiveness();
int livenessTravIR(INSTR *instr);
int livenessAnalysis();
int buildInterferenceGraph();
void printLIA();

//####Interferens graph####//
typedef struct GraphNode {
  int id; //used as an internal identifier
  registers reg;
  BITMAP *neighbors; //this one should stay here
  int isMarked;
  int inDegree;
  int outDegree;
  TEMPORARY *temp;
} GraphNode;

GraphNode *graphNodes; //only used internally in graph
int graphSize; //the number of nodes in the graph

/**
 * Creates size nodes of graph each containing temp from tempList
 * returns -1 on error and 0 otherwise
 */
int IGcreateGraph(int size, TEMPORARY *tempList);

/**
 * makes the neighbor a neighbor of node
 * returns -1 if nodes does not exist
 * returs 0 on success
 */
int IGinsertNeighbor(int nodeID, int neighborID);

/**
 * removes the link between the two nodes
 * However, the link is only removed from the node and not the neighbor
 * returns -1 if nodes does not exist
 * returs 0 on success
 */
int IGremoveNeighbor(int nodeID, int neighborID);

/**
 * Returns the neighbors as a list of integer IDs
 * First element is the number of integers in the list excluding that lenght
 * NULL is returned if an error occurred
 */
int* IGgetNeighbors(int nodeID);

/**
 * Lowest degree node among all unmarked nodes
 * returns -1 if there are no more such nodes
 */
int IGlowestOutDegree();

/**
 * Highest degree node among all unmarked nodes
 * returns -1 if there are no more such nodes
 */
int IGhighestOutDegree();

/**
 * Color all nodes of graph using coloering by simplfication
 * colorering is fixed to use register R8-R15
 */
int IGcolorGraph();

/**
 * Returns the color of the given node
 */
registers IGgetColor(int nodeID);

/**
 * Transfer colors from graph nodes to its temporaries
 */
int IGTransferColors();

/**
 * Debug function: Prints the graph
 */
int IGprintGraph();

//#########label instruction hash table###############
#define HASHSIZE2 517

typedef struct InstrUnit {
  INSTR *instr;
  struct InstrUnit *next;
} InstrUnit;

typedef struct InstrTable {
    InstrUnit *table[HASHSIZE2]; //**table
} InstrTable;

int Hash2(char *str);

/**
 * Creates and returns the instruction hash table
 */
InstrTable *initInstrHashTable();

/**
 * Puts label instruction int hash table
 * Returns -1 if instruction is not a label
 */
int instrHashPutInstr(InstrTable *t, INSTR *instr);

/**
 * Returns the label instruction having the given label
 * Returns NULL if the label was nut found in the given table
 */
INSTR *instrHashGetINSTR(InstrTable *t, char *label);

//#######Sorted linked list containing temporaries###########
typedef struct TempList{
  struct TempListNode *head;
  struct TempListNode *tail;
} TempList;

typedef struct TempListNode{
  TEMPORARY *temp;
  struct TempListNode *next;
  struct TempListNode *prev;
} TempListNode;

/**
 * returns a new list
 */
TempList *createList();

/**
 * Creates a new tempList node with default values
 * returns the new node
 */
TempListNode *createTempListNode(TEMPORARY *temp);

/**
 * adds the temporary to the list
 * returns 0 if the element already were in the list
 * returns 1 if the element was added
 * returns -1 if an error occurred
 */
int addElement(TempList *list, TEMPORARY *temp);

/**
 * Removes the element from the list
 * returns the same list as given
 */
TempList *removeElement(TempList *list, TEMPORARY *temp);

/**
 * Finds the union of the two lists and puts it into the destination
 * returns 0 if no change where made. Otherwise 1 is returned.
 * returns -1 if error occurred
 */
int listUnion(TempList *src, TempList *dest);

/**
 * Finds the difference of the two lists
 * returns a new list
 */
TempList *listDiff(TempList *minuend, TempList *subtrahend);

/**
 * Frees a list
 * If the list is NULL, then it is trivially freed
 * Always returns 0
 */
int freeList(TempList *list);

typedef struct LivenessInstructionArray{
  TempList *in;
  TempList *out;
  TempList *use;
  TempList *def;
  int succ[3];
  int isMove;
} LivenessInstructionArray;

InstrTable *labelINSTRTable;
LivenessInstructionArray *lia;


//################### peephole Optimization ###############

int peephole();
int loopInternalRep();
int loopPatterns(INSTR *instr);

//######################assembler generation############//

int IRtravInternalRep(INSTR *instr);

int ASMinternalNodeToString();

int IRtravPARAM(OPERAND *op);

int IRtravINSTR(INSTR *in);

int regMapping(registers reg);



#endif
