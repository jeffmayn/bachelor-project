#ifndef __internalASM_h
#define __internalASM_h

#include "tree.h"
//#include "bitmap.h"
#include "stdlib.h"
#include "stdio.h"
//#include "typecheck.h" //this gives a cycle internalASM->typecheck->symbol->internalASM

#define HASHSIZE2 517
#define UNUSED_GRAPH_ID  0//use this when comparing if graphNodeId is unused

/**
 * NOTE TO SELF!
 * - create seperate .c files for each category of constructors
 * - dont do the same thing as in del3, that is: be smarter!
 * - Create map to map all ID's/variables to temporaries.
 * - funktioner bliver navngivet efter den fase de tilhører
 *                          - IR (internal representation)
 *                          - OPTMZ (optimize)
 *                          - ASM (assembler code generation)
 */
typedef enum {addI, subI, mulI, divI, andI, orI, xorI, lshiftI, rshiftI,
              cmpI, jumpI, jmplessI, jmpgreatI, jmpleI, jmpgeI, jmpeqI,
              jmpneqI, movI, labelI, pushI, popI, callI, retI} INSTRkind;
typedef enum {constantO, temporaryO, heapAddrO, labelIDO, registerO,
              paramO, localO} OPERANDkind;
typedef enum {NA, RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI,
              R8, R9, R10, R11, R12, R13, R14, R15, SPILL} registers;
typedef enum {addrT, regT} TEMPORARYkind;

typedef struct bodyListElm bodyListElm;
typedef struct bodyList bodyList;

typedef struct TEMPORARY {
  char* tempName; //is this usefull?
  int tempVal;
  TEMPORARYkind temporarykind;
  union {
    int address;
    registers reg;
  } placement;
} TEMPORARY;

typedef struct OPERAND {
  OPERANDkind operandKind;
  struct OPERAND *next;
  union{
    int constant;
    int address; //offset??
    char *label;
    TEMPORARY *temp;
    registers reg;
    int tempIDnr; //used by paramO og localO
  } val;
} OPERAND;

typedef struct INSTR {
  INSTRkind instrKind;
  struct OPERAND *paramList;
  struct INSTR *next;
} INSTR;


typedef struct CODEGENUTIL {
  union {
    struct {INSTR *funcLabel; int temporaryStart; int temporaryEnd;} funcInfo ;
    OPERAND *operand;
  } val;
} CODEGENUTIL;

int regCount; //amount of multipurpose registers
INSTR* intermediateHead;
INSTR* intermediateTail;

int tempCounter; //the next tempvalue
int labelCounter; //the next label value

//should return the next tempID;
TEMPORARY* IRcreateNextTemp();

INSTR* IRappendINSTR(INSTR *newINSTR);//appends instruction to the end of global list

int IRtravStatementList(STATEMENT_LIST *statements, SymbolTable *table);

int IRcreateInternalRep(SymbolTable *table, bodyList *mainBody);

OPERAND* IRtravTerm(SymbolTable *t, TERM *term);

int IRtravBody(SymbolTable *table, BODY *body);

int IRtravDeclList(SymbolTable *table, DECL_LIST *declerations);

int IRtravDecl(SymbolTable *table, DECLARATION *decl);
int IRtravVarDeclList(SymbolTable *table, VAR_DECL_LIST *varDeclList, int calledFromParDeclList);
int IRtravVarType(SymbolTable *table, VAR_TYPE *varType, int isParam);

int IRtravStmt(SymbolTable *t, STATEMENT *stmt);

OPERAND* IRtravVar(SymbolTable *t, VARIABLE *var);

OPERAND* IRtravExp(SymbolTable *t, EXP *exp);

OPERAND* IRtravActList(SymbolTable *t, ACT_LIST *actlist);

OPERAND* IRtravExpList(SymbolTable *t, EXP_LIST *exps);

//****Paramter constructors*****//
OPERAND *IRmakeConstantOPERAND(int conVal);

OPERAND *IRmakeTemporaryOPERAND(TEMPORARY *temp);

OPERAND *IRmakeLocalOPERAND(int number);

OPERAND *IRmakeParamOPERAND(int number);

OPERAND *IRmakeAddrOPERAND(int addrVal);

OPERAND *IRmakeLabelOPERAND(char *labelName);

OPERAND *IRmakeRegOPERAND(registers reg);

OPERAND *IRappendOPERAND(OPERAND *tail, OPERAND *next);//append next to tail


//****Instruction constructors****//
INSTR* IRmakeMovINSTR(OPERAND *params);

INSTR* IRmakeAddINSTR(OPERAND *params);

INSTR *IRmakeLabelINSTR(OPERAND *params);

INSTR *IRmakePushINSTR(OPERAND *params);

INSTR *IRmakePopINSTR(OPERAND *params);

INSTR *IRmakeCallINSTR(OPERAND *params);


INSTR *IRmakeRetINSTR(OPERAND *params);//might not need params

INSTR* IRappendINSTR(INSTR *newINSTR);//appends instruction to the end of global list

//****Abstract scheme constructors****//
int IRmakeFunctionScheme(FUNCTION *func);

int IRmakeBodyScheme(BODY *body);

/**
 * Makes a function call
 * The first parameter is the instruction giving the label to where to jump
 * The Second paramater is the list of parameters to this function
 *  - This list may be arbitrarily long
 */
int IRmakeFunctionCallScheme(INSTR *labelINSTR, OPERAND *paramList);

int IRmakeFunctionAssiScheme();


//Insert temporary name into symboltable for variables
int IRtravDeclListScheme(DECL_LIST *decls);

//int IRtravStmtList(STATEMENT *stmt);

//int IRtravStmt(STATEMENT *stmt);
/**
 * Associate varibles to a temporary and add to map
 * Associate functions to a label
*/
int IRmakeDeclScheme(DECLARATION *decl);



//##################Optimization#################//
//Liveness analysis: find in og ud mængder
//Data strukturer til at gemme use, def, og ud mængder?
//skal kunne indeholde temporaries
//Interferens graf: Metode på side 228-229
//Lav register allokering: farvning ved simplificering: kapitel 11 (se kims noter)
//Vi skal have en graf opbygget af grafknuder. Hver knude repræsentere en
//temporary og indeholder også dets register eller addresse på stakken


// BITMAP **IN;
// BITMAP **OUT;
// BITMAP **USE;
// BITMAP **DEF;

//Umiddelbart ikke nødvendigt
// //used to map variables to temps
// typedef struct {
//     VarNode *table[HashSize]; //**table
// } VarTempMap;
//
// typedef struct {
//   SYMBOL *sym;
//   char *tempName;
//   varNode *next;
// } VarNode;


//used within the TempLocMap
typedef struct TempNode {
  char *name;
  //int *number; //unique and in equivalence with the name
  registers reg; //the register to which this temp is assigned
  //struct GraphNode *node; //to associate this temporary with a graphnode
  int graphNodeId; //id representing graph node associated to this temporary
  struct TempNode *next; //collision handling in TempLocMap
} TempNode;


//used to map temps to registers or adresses (locations)

typedef struct TempLocMap {
  struct TempNode *table[HASHSIZE2];
} TempLocMap;




/******AST traversal and TempNodeMap setup*******/
int IRtemporaryHash(char *str);
TempLocMap *IRinitTempLocMap();
TempNode *IRputTempNode(TempLocMap *t, char *tempName);
TempLocMap* IRsetupTemporaries(bodyListElm *bodyList, SymbolTable *mainSymbolTable);
int IRtraverseDeclerationList(DECL_LIST *declerations);

//*****ALL of the below is in bitmap.h****/
//Where should it be ??
//Do liveness analyse
// typedef struct BITMAP {
//   uint *bits;
//   int size;
// } BITMAP;
//
//

// /**
//  * Creates a bitmap with size number of bits
//  * All bits are reset from start (set to 0)
//  */
// BITMAP bitMapMakeBitMap(int size);
//
// /**
//  * Sets the index'th bit of map
//  * Returns: -1 if bit is out of bounds
// */
// int bitMapSetBit(BITMAP *map, int index);
//
// /**
//  * resets the index'th bit of map
//  * Returns: -1 if bit is out of bounds
// */
// int bitMapResetBit(BITMAP *map, int index);
// //use UINT_MAX from limits.h to do the AND correctly
// //alternatively use ~ to negate the string 00001000 to 11110111
//
// /**
//  * returns 1 if the index'th bit is set and 0 otherwise
//  * returns -1 at index out of bounds
//  */
// int bitMapBitIsSet(BITMAP *map, int index);
//
// BITMAP* bitMapUnion(BITMAP *src, BITMAP *dest);
//
// /**
//  * Calculates first minus second and returns a new map
//  */
// BITMAP* bitMapDiff(BITMAP *first, BITMAP *second);
//
// int BitMapfree(BITMAP *map);
//
// /**
//  * returns 1 if the maps are the same
//  * returns 0 of the maps are not the same
// */
// int BitMapIsEqual(BITMAP *m1, BITMAP *m2);


//####Interferens graph####//
//IG: Interferens Graph
//The graph is DIRECTED
//TODO: Somebody make graph representation
//We are using adjacency list representation
//better for graph colering
typedef struct GraphNode {
  //enum with registers or addresses
  //char *tempName; //unique
  //char *tempNumber; //unique and in equivalence with tempName;
  int id; //used as an internal identifier
  registers reg;
  //BITMAP *neighbors; this one should stay here
  int isMarked;
  int inDegree;
  int outDegree;
  //GraphNode *next //Only used within internal management of graph
} GraphNode;

//if we want to make another graph we would have to make a struct for these two
GraphNode *graphNodes; //only used internally in graph
int graphSize; //the number of nodes in the graph

/**
 * Creates a new graph node and returns its ID
*/
int IGmakeGraphNode();

/**
 * makes the neighbor a neighbor of node
 */
int IGinsertNeighbor(int nodeID, int neighborID);

/**
 * removes the link between the two nodes
 * However, the link is only removed from the node and not the neighbor
 */
int IGremoveNeighbor(int nodeID, int neighborID);

/**
 * Returns the neighbors as a list of integer IDs
 * First element is the number of integers in the list excluding that lenght
 */
int* IGgetNeighbors(int nodeID);


// /**
//  * Returns the graphNode represented by the given ID
//  * If ID does not exists NULL is returned
//  */
// GraphNode* IGgetNodeFromID(int id);

/**
 * returns true (1) if neighbor is adjacent to node
 * returns false (0) otherwise
 */
int IGisNeighbor(int nodeID, int neighborID);

int IGlowestOutDegree();

int IGhighestOutDegree();

/**
 * uses the graphNodes pointer as graph and colors all nodes
 */
int IGcolorGraph();


//######################assembler generation############//

int ASMinternalNodeToString();





#endif
