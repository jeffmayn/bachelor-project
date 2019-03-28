#include "internalASM.h"
#include "stack.h"
#include <stdio.h>
#include "memory.h"
#include "string.h"
#include <stdlib.h>

/*******TODO*****/
/*
Husk at bruge maksimal grad ved spilling
Think about how to change program (kitty) when temporary is spilled
*/

GraphNode *graphNodes = NULL; //only used internally in graph
int graphSize = 0; //the number of nodes in the graph
int graphLimit = 0;

/**
 * Creates a new graph node and returns its ID
*/
int IGmakeGraphNode(){
  //TODO: errorchecking
  if(graphNodes == NULL){
    graphLimit = 32; //size of integer: full bitmap
    graphNodes = NEW(GraphNode); //MALLOC(sizeof(GraphNode)*graphLimit);
  }
  else if(graphSize == graphLimit){
    GraphNode *graphNodesTemp = NEW(GraphNode); //MALLOC(sizeof(GraphNode)*graphLimit*2);
    memset(graphNodesTemp, 0, sizeof(GraphNode)*graphLimit*2);
    memcpy(graphNodesTemp, graphNodes, sizeof(GraphNode)*graphLimit);
    free(graphNodes);
    graphNodes = graphNodesTemp;
    for(int i = 0; i<graphSize; i++){
      //TODO: free map
      graphNodes[i].neighbors = bitMapUnion(graphNodes[i].neighbors, bitMapMakeBitMap(graphLimit*2));
    }
    graphLimit = graphLimit*2;
  }
  graphNodes[graphSize].id = graphSize;
  graphNodes[graphSize].reg = NA;
  graphNodes[graphSize].isMarked = 0;
  graphNodes[graphSize].neighbors = bitMapMakeBitMap(graphLimit);
  graphNodes[graphSize].inDegree = 0;
  graphNodes[graphSize].outDegree = 0;
  graphSize++;
  return graphSize-1;
}

/**
 * makes the neighbor a neighbor of node
 */
int IGinsertNeighbor(int nodeID, int neighborID){
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", nodeID);
    return -1;
  }
  if(neighborID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", neighborID);
    return -1;
  }
  if(!bitMapBitIsSet(graphNodes[nodeID].neighbors, neighborID)){
    bitMapSetBit(graphNodes[nodeID].neighbors, neighborID);
    graphNodes[nodeID].outDegree++;
    graphNodes[neighborID].inDegree++;
  }
  return 0;
}

/**
 * removes the link between the two nodes
 * However, the link is only removed from the node and not the neighbor
 */
int IGremoveNeighbor(int nodeID, int neighborID){
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", nodeID);
    return -1;
  }
  if(neighborID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", neighborID);
    return -1;
  }
  if(bitMapBitIsSet(graphNodes[nodeID].neighbors, neighborID)){
    bitMapResetBit(graphNodes[nodeID].neighbors, neighborID);
    graphNodes[nodeID].outDegree--;
    graphNodes[neighborID].inDegree--;
  }
  return 0;
}

/**
 * Returns the neighbors as a list of integer IDs
 * First element is the number of integers in the list excluding that lenght
 * If the first value is -1, then an error occured
 */
int* IGgetNeighbors(int nodeID){
  //TODO: do not return pointers to local variables!?!!??!?
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeID %d does not exists\n", nodeID);
    int ret = -1;
    return &ret;
  }
  BITMAP *neighbors = graphNodes[nodeID].neighbors;
  int neighborCount = bitMap1Count(neighbors);
  if(neighborCount == -1){
    //error print needed?
    return &neighborCount;
  }
  int neighborIDs[neighborCount];
  neighborIDs[0] = neighborCount;
  int j = 1;
  for(int i=0; i < graphSize; i++){
    int val = bitMapBitIsSet(neighbors, i);
    switch(val){
      case -1:
        fprintf(stderr, "IGgetNeighbors: error when checking neighbor\n");
        return &val;
        break;
      case 0:
        //I guess we should do nothing here
        break;
      case 1:
        neighborIDs[j] = i;
        j++;
        break;
      default:
        fprintf(stderr, "IGgetNeighbors: got the weird value '%d'", val);
        val = -1;
        return &val;
        break;
    }
  }
  return neighborIDs;
}


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

/**
 * Lowest degree node among all unmarked nodes
*/
int IGlowestOutDegree(){
  if(graphSize == 0){
    return -1;
  }
  //lowestID = -2;
  int lowestID = -2;
  int degree = -2;
  for(int i = 1; i<graphSize; i++){
    if(graphNodes[i].isMarked){
      continue;
    }
    if((lowestID == -2) || (degree > graphNodes[i].outDegree)){
      lowestID = i;
      degree = graphNodes[i].outDegree;
    }
  }
  return lowestID;
}

int IGhighestOutDegree(){
  if(graphSize == 0){
    return -1;
  }
  //lowestID = -2;
  int highestID = -1;
  int degree = -1;
  for(int i = 1; i<graphSize; i++){
    if(graphNodes[i].isMarked){
      continue;
    }
    if((degree < graphNodes[i].outDegree)){
      highestID = i;
      degree = graphNodes[i].outDegree;
    }
  }
  return highestID;
}

/**
 * uses the graphNodes pointer as graph and colors all nodes
 */
int IGcolorGraph(int colorCount){
  Stack *graphStack = stackCreate();
  //Uses coloring by simplification
  int lowestID = IGlowestOutDegree();
  GraphNode lnode = graphNodes[lowestID];
  if(lnode.outDegree >= colorCount){
    //TODO: det skal være noden med højst grad der bliver spilled
    lnode.reg = SPILL; //potential spill
  }
  //The spilled node is also removed from the graph
  for(int i = 0; i < graphSize; i++){
    if(i == lowestID){
      continue;
    }
    IGremoveNeighbor(i, lowestID);
    //Put i on a stack
    stackPush(graphStack, i);
  }

  //pop i from the stack
  int i = stackPop(graphStack);
  if(i == -1){
    fprintf(stderr, "IGcolorGraph: error popping from stack\n");
    return -1;
  }
  int *neighbors = IGgetNeighbors(i);
  int colorFound = 1;
  for(registers reg = (registers)RAX; reg < (registers) R15; reg = (registers) (reg+1)){
    colorFound = 1;
    for(int j = 1; j<neighbors[0]; j++){
      if(graphNodes[neighbors[j]].reg == reg){
        colorFound = 0;
        break;
      }
    }
    if(colorFound){
      graphNodes[i].reg = reg;
      break;
    }
  }
  if(!colorFound){
    graphNodes[i].reg = SPILL; //actual spill
  }
}
