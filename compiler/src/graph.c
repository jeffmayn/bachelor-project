#include "internalASM.h"


/*******TODO*****/
/*
Implement stack
implement IGgetNeighbors
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
    graphNodes = MALLOC(sizeof(GraphNode)*graphLimit);
  }
  else if(graphSize == graphLimit){
    GraphNode *graphNodesTemp = MALLOC(sizeof(GraphNode)*graphLimit*2);
    memset(graphNodesTemp, 0, sizeof(GraphNode)*graphLimit*2);
    memcpy(graphNodesTemp, graphNodes, sizeof(GraphNode)*graphLimit);
    free(graphNodes);
    graphNodes = graphNodesTemp;
    for(int i = 0; i<graphSize; i++){
      //TODO: free map
      graphNodes[i].neigbors = bitMapUnion(graphNodes[i].neigbors, bitMapMakeBitMap(graphLimit*2));
    }
    graphLimit = graphLimit*2;
  }
  graphNodes[graphSize].ID = graphSize;
  graphNodes[graphSize].reg = NA;
  graphNodes[graphSize].isMarked = 0;
  graphNodes[graphSize].neigbors = bitMapMakeBitMap(graphLimit);
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
  if(!bitMapBitIsSet(graphNodes[nodeID].neighbors, neighbor)){
    bitMapSetBit(graphNodes[nodeID].neighbors, neighbor);
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
  if(bitMapBitIsSet(graphNodes[nodeID].neighbors, neighbor)){
    bitMapResetBit(graphNodes[nodeID].neighbors, neighbor);
    graphNodes[nodeID].outDegree--;
    graphNodes[neighborID].inDegree--;
  }
  return 0;
}

/**
 * Returns the neighbors as a list of integer IDs
 * First element is the number of integers in the list excluding that lenght
 */
int* IGgetNeighbors(int *nodeID);


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
  lowestID = -2;
  int lowestID = 0;
  int degree = -2
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

/**
 * uses the graphNodes pointer as graph and colors all nodes
 */
int IGcolorGraph(int colorCount){
  //Uses coloring by simplification
  //This is gonna be fuuuuuuuuuuun
  int lowestID = IGlowestOutDegree();
  GraphNode *lnode = GraphNodes[lowestID];
  if(lnode.outDegree >= colorCount){
    lnode.reg = SPILL; //potential spill
  }
  //The spilled node is also removed from the graph
  for(int i = 0; i < graphSize; i++){
    if(i == lowestID){
      continue;
    }
    IGremoveNeighbor(i, lowestID);
    //TODO: Put i on a stack
  }

  //TODO: pop k from the stack
  int[] neighbors = IGgetNeighbors(i);
  int colorFound = 1;
  for(registers reg = (registers)RAX; reg < (registers) R15; reg = (registers) (reg+1)){
    colorFound = 1;
    for(j = 1; j<neighbors[0]; j++){
      if(graphNodes[neighbors[j]].reg == reg){
        colorFound = 0;
        break;
      }
    }
    if(colorFound){
      graphNodes[k].reg = reg;
      break;
    }
  }
  if(!colorFound){
    graphNodes[k].reg = SPILL;
  }
}
