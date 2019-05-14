#include "internalASM.h"
#include "stack.h"
#include <stdio.h>
#include "memory.h"
#include "string.h"
#include <stdlib.h>

/*******TODO*****/
/*
Husk at bruge maksimal grad ved spilling
*/

GraphNode *graphNodes = NULL; //only used internally in graph
int graphSize = 0; //the number of nodes in the graph
int graphLimit = 0;


/**
 * Creates size nodes of graph each containing temp from tempList
 * returns -1 on error and 0 otherwise
 */
int IGcreateGraph(int size, TEMPORARY *tempList){
  TEMPORARY *temp = tempList;
  graphLimit = size;
  graphSize = 0;
  graphNodes = Malloc(sizeof(GraphNode)*size);
  for(int i = 0; i < size; i++){
    if(temp==NULL){
      fprintf(stderr, "INTERNAL ERROR: \
        in createGraph: to few temporaries given\n");
      return -1;
    }
    //i is the same as graphSize
    graphNodes[i].id = graphSize;
    graphNodes[i].reg = NA;
    graphNodes[i].isMarked = 0;
    graphNodes[i].neighbors = bitMapMakeBitMap(size);
    graphNodes[i].inDegree = 0;
    graphNodes[i].outDegree = 0;
    graphNodes[i].temp = temp;
    temp->graphNodeId = graphSize;
    graphSize++;
    temp = temp->next;
  }
  return 0;
}

/**
 * makes the neighbor a neighbor of node
 * returns -1 if nodes does not exist
 * returs 0 on success
 */
int IGinsertNeighbor(int nodeID, int neighborID){
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", nodeID);
    return -1;
  }
  if(neighborID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", 
      neighborID);
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
 * returns -1 if nodes does not exist
 * returs 0 on success
 */
int IGremoveNeighbor(int nodeID, int neighborID){
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", nodeID);
    return -1;
  }
  if(neighborID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeIdD %d does not exists\n", 
      neighborID);
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
 * NULL is returned if an error occurred
 */
int* IGgetNeighbors(int nodeID){
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeID %d does not exists\n", nodeID);
    return NULL;
  }
  BITMAP *neighbors = graphNodes[nodeID].neighbors;
  int neighborCount = bitMap1Count(neighbors);
  if(neighborCount != graphNodes[nodeID].outDegree){ //double check
    fprintf(stderr, "INTERNAL ERROR: \
      in IGgetNeighbors: outdegree %d does not match number \
      of neighbors %d for node %d\n", 
      graphNodes[nodeID].outDegree, neighborCount, nodeID);
    return NULL;
  }
  neighborCount = graphNodes[nodeID].outDegree;
  if(neighborCount == -1){
    fprintf(stderr, "INTERNAL ERROR\n");
    return NULL;
  }
  int *neighborIDs = Malloc(sizeof(int)*neighborCount+1);
  neighborIDs[0] = neighborCount;
  int j = 1;
  for(int i=0; i < graphSize; i++){
    int val = bitMapBitIsSet(neighbors, i);
    switch(val){
      case -1:
        fprintf(stderr, "IGgetNeighbors: error when checking neighbor\n");
        return NULL;
        break;
      case 0: //nothing to do
        break;
      case 1:
        neighborIDs[j] = i;
        j++;
        break;
      default:
        fprintf(stderr, "IGgetNeighbors: got the weird value '%d'", val);
        return NULL;
        break;
    }
  }
  return neighborIDs;
}

/**
 * Lowest degree node among all unmarked nodes
 * returns -1 if there are no more such nodes
 */
int IGlowestOutDegree(){
  if(graphSize == 0){
    return -1;
  }
  int lowestID = -2;
  int degree = -2;
  for(int i = 0; i<graphSize; i++){
    if(graphNodes[i].isMarked){
      continue;
    }
    if((lowestID == -2) || (degree > graphNodes[i].outDegree)){
      lowestID = i;
      degree = graphNodes[i].outDegree;
    }
  }
  if(lowestID == -2){
    return -1;
  }
  return lowestID;
}

/**
 * Highest degree node among all unmarked nodes
 * returns -1 if there are no more such nodes
 */
int IGhighestOutDegree(){
  if(graphSize == 0){
    return -1;
  }
  //lowestID = -2;
  int highestID = -1;
  int degree = -1;
  for(int i = 0; i<graphSize; i++){
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
 * Color all nodes of graph using coloering by simplfication
 * colorering is fixed to use register R8-R15
 */
int IGcolorGraph(){
  int colorCount = R15-R8+1;
  Stack *graphStack = stackCreate();
  int lowestID = IGlowestOutDegree();
  while(lowestID != -1){ //as long as unmarked nodes exists
    GraphNode lnode = graphNodes[lowestID];
    if(lnode.outDegree >= colorCount){
      //TODO: det skal være noden med højst grad der bliver spilled
      lnode.reg = SPILL; //potential spill
    }
    //remove node from graph and move to stack
    int *neighbors = IGgetNeighbors(lowestID);
    for(int i = 1; i <= neighbors[0]; i++){
      if(neighbors[i] == lowestID){
        continue; //do not remove node from itself
      }
      //remove this node as neighbor of all other nodes
      IGremoveNeighbor(neighbors[i],lowestID);
    }
    //Put lowest id on a stack
    stackPush(graphStack, lowestID);
    graphNodes[lowestID].isMarked = 1; //cannot remove this node again
    lowestID = IGlowestOutDegree();
  }

  int i = stackPop(graphStack);
  while(i != -1){ //as long as we have elements on the stack
    int *neighbors = IGgetNeighbors(i);
    int colorFound = 1; //asume color is found
    for(registers reg = (registers)R8; 
      reg < (registers) R15; reg = (registers) (reg+1)){
      colorFound = 1;
      for(int j = 1; j<=neighbors[0]; j++){ //for each color
        if(graphNodes[neighbors[j]].reg == reg){  //check if any neighbor have this color
          colorFound = 0; //go to next color if collsion
          break;
        }
      }
      if(colorFound){ //if color is found, use it
        graphNodes[i].reg = reg;
        break;
      }
    }
    if(!colorFound){ //if no color was found at all
      graphNodes[i].reg = SPILL; //actual spill
    }
    i = stackPop(graphStack);
  }
  return 0;
}

/**
 * Returns the color of the given node
 */
registers IGgetColor(int nodeID){
  return graphNodes[nodeID].reg;
}


/**
 * Transfer colors from graph nodes to its temporaries
 */
int IGTransferColors(){
  TEMPORARY *temp;
  GraphNode node;
  registers color;
  for(int i = 0; i<graphSize; i++){
    node = graphNodes[i];
    color = node.reg;
    if(color == NA){
      fprintf(stderr, "INTERNAL ERROR: \
        found NA color while transfering to tempts\n");
      return -1;
    }
    if(color != SPILL){ //if temporary were not spilled
      temp = node.temp; //reflect the register
      temp->temporarykind = regT;
      temp->placement.reg = color;
    }
  }
  return 0;
}


/**
 * Debug function: Prints the graph
 */
int IGprintGraph(){
  int *neighbors;
  int neighborCount = 0;
  for(int i = 0; i<graphSize; i++){
    fprintf(stderr, "node %d -> ", i);
    neighbors = IGgetNeighbors(i);
    if(neighbors != NULL){
      neighborCount = neighbors[0];

    }
    for(int j = 0; j<neighborCount; j++){
      fprintf(stderr, "%d; ", neighbors[j+1]);
    }
    fprintf(stderr, "\nColor %s\n", regNames[IGgetColor(i)]);
    fprintf(stderr, "--------\n");
  }
  return 0;
}
