#ifndef __internalASM_h
#define __internalASM_h
#include "tree.h"
#include "bitmap.h"
#define HASHSIZE2 517
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
typedef enum {addI, subI, mulI, divI, andI, orI, xorI, lshiftI, rshiftI, cmpI,
              jumpI, jmplessI, jmpgreatI, jmpleI, jmpgeI, jmpeqI, jmpneqI,
              movI, labelI, pushI, popI, callI, retI} INSTRkind;
typedef enum {constantP, temporaryP, heapAddrP, labelIDP} PARAMkind;
typedef enum {NA, RAX, RCX, RDX, RBX, RSP, RBP, RSI, RDI, R8, R9, R10, R11, R12, R13, R14, R15, SPILL} registers;

int regCount; //amount of multipurpose registers

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
int LabelCounterM; //the next label value

INSTR *internalINSTRList; //global list of instructions

INSTR* IRappendINSTR(INSTR *newINSTR);//appends instruction to the end of global list

//****Paramter constructors*****//
PARAM *IRmakeConstantPARAM(int conVal);

PARAM *IRmakeTemporaryPARAM(char *tempName);

PARAM *IRmakeAddrPARAM(int addrVal);

PARAM *IRmakeLabelPARAM(char *labelName);

PARAM *IRappendPARAM(PARAM *tail, PARAM *next);//append next to tail


//****Instruction constructors****//
INSTR* IRmakeMovINSTR(PARAM *params);

INSTR* IRmakeAddINSTR(PARAM *params);

INSTR *IRmakeLabelINSTR(PARAM *params);

INSTR *IRmakePushINSTR(PARAM *params);

INSTR *IRmakePopINSTR(PARAM *params);

INSTR *IRmakeCallINSTR(PARAM *params);

INSTR *IRmakeRetINSTR(PARAM *params);//might not need params

//****Abstract scheme constructors****//
int IRmakeFunctionScheme(FUNCTION *func);

int IRmakeBodyScheme(BODY *body);


//Insert temporary name into symboltable for variables
int IRtravDeclListScheme(DECL_LIST *decls);

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


BITMAP **IN;
BITMAP **OUT;
BITMAP **USE;
BITMAP **DEF;

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

//used to map temps to registers or adresses (locations)
typedef struct TempLocMap{
  struct TempNode *table[HASHSIZE2];
} TempLocMap;

//used within the TempLocMap
typedef struct {
  char *name;
  //int *number; //unique and in equivalence with the name
  registers reg; //the register to which this temp is assigned
  //struct GraphNode *node; //to associate this temporary with a graphnode
  int graphNodeId; //id representing graph node associated to this temporary
  struct tempNode *next; //collision handling in TempLocMap
} TempNode;





//Do liveness analyse



//####Interferens graph####//
//IG: Interferens Graph
//The graph is DIRECTED
//TODO: Somebody make graph representation
//We are using adjacency list representation
//better for graph colering
typedef struct{
  //enum with registers or addresses
  //char *tempName; //unique
  //char *tempNumber; //unique and in equivalence with tempName;
  int id; //used as an internal identifier
  registers reg;
  BITMAP *neighbors;
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
