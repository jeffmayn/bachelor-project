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



int IGcreateGraph(int size, TEMPORARY *tempList){
  TEMPORARY *temp = tempList;
  graphLimit = size;
  graphSize = 0;
  graphNodes = Malloc(sizeof(GraphNode)*size);
  for(int i = 0; i < size; i++){
    if(temp==NULL){
      fprintf(stderr, "INTERNAL ERROR in createGraph: to few temporaries given\n");
      return -1;
    }
    //i should be the same as graphSize
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

// /**
//  * Creates a new graph node and returns its ID
// */
// int IGmakeGraphNode(TEMPORARY *temp){
//   //TODO: errorchecking
//   if(graphNodes == NULL){
//     graphLimit = 32; //size of integer: full bitmap
//     //graphNodes = NEW(GraphNode);
//     graphNodes = Malloc(sizeof(GraphNode)*graphLimit);
//   }
//   else if(graphSize == graphLimit){
//     fprintf(stderr, "WARNING: DOUBLES GRAPH - MOST LIKELY CAUSES HARM TO SOMEBODY\n");
//     //GraphNode *graphNodesTemp = NEW(GraphNode);
//     GraphNode *graphNodesTemp = Malloc(sizeof(GraphNode)*graphLimit*2);
//     memset(graphNodesTemp, 0, sizeof(GraphNode)*graphLimit*2);
//     memcpy(graphNodesTemp, graphNodes, sizeof(GraphNode)*graphLimit);
//     free(graphNodes);
//     graphNodes = graphNodesTemp;
//     for(int i = 0; i<graphSize; i++){
//       //TODO: free map
//       graphNodes[i].neighbors = bitMapUnion(graphNodes[i].neighbors, bitMapMakeBitMap(graphLimit*2));
//     }
//     graphLimit = graphLimit*2;
//   }
//   graphNodes[graphSize].id = graphSize;
//   graphNodes[graphSize].reg = NA;
//   //graphNodes[graphSize].color = -1;
//   graphNodes[graphSize].isMarked = 0;
//   graphNodes[graphSize].neighbors = bitMapMakeBitMap(graphLimit);
//   graphNodes[graphSize].inDegree = 0;
//   graphNodes[graphSize].outDegree = 0;
//   graphNodes[graphSize].temp = temp;
//   graphSize++;
//   return graphSize-1;
// }

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
 * NULL is returned if an error occurred
 */
int* IGgetNeighbors(int nodeID){
  //TODO: do not return pointers to local variables!?!!??!?
  if(nodeID >= graphSize){
    fprintf(stderr, "IGinsertNeighbor: nodeID %d does not exists\n", nodeID);
    //int ret = -1;
    return NULL;
  }
  BITMAP *neighbors = graphNodes[nodeID].neighbors;
  int neighborCount = bitMap1Count(neighbors);
  if(neighborCount != graphNodes[nodeID].outDegree){ //double check: may be removed later
    fprintf(stderr, "INTERNAL ERROR in IGgetNeighbors: outdegree %d does not match number of neighbors %d for node %d\n", graphNodes[nodeID].outDegree, neighborCount, nodeID);
    return NULL;
  }
  neighborCount = graphNodes[nodeID].outDegree;
  if(neighborCount == -1){
    //error print needed?
    //return &neighborCount;
    return NULL;
  }
  //int neighborIDs[neighborCount];
  int *neighborIDs = Malloc(sizeof(int)*neighborCount+1);
  neighborIDs[0] = neighborCount;
  int j = 1;
  for(int i=0; i < graphSize; i++){
    int val = bitMapBitIsSet(neighbors, i);
    switch(val){
      case -1:
        fprintf(stderr, "IGgetNeighbors: error when checking neighbor\n");
        //return &val;
        return NULL;
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
        return NULL;
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
 * returns -1 if there are no more such nodes
*/
int IGlowestOutDegree(){
  if(graphSize == 0){
    return -1;
  }
  //lowestID = -2;
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
 * uses the graphNodes pointer as graph and colors all nodes
 */
int IGcolorGraph(){
  int colorCount = R15-R8+1;
  Stack *graphStack = stackCreate();
  //Uses coloring by simplification
  int lowestID = IGlowestOutDegree();
  while(lowestID != -1){

    GraphNode lnode = graphNodes[lowestID];
    if(lnode.outDegree >= colorCount){
      //TODO: det skal være noden med højst grad der bliver spilled
      lnode.reg = SPILL; //potential spill
    }
    //The spilled node is also removed from the graph
    int *neighbors = IGgetNeighbors(lowestID);
    for(int i = 1; i <= neighbors[0]; i++){
      if(neighbors[i] == lowestID){
        continue;
      }
      //remove this node as neighbor of all other nodes
      IGremoveNeighbor(neighbors[i],lowestID);
    }
    //Put lowest id on a stack
    stackPush(graphStack, lowestID);
    graphNodes[lowestID].isMarked = 1;
    lowestID = IGlowestOutDegree();

  }

  //pop i from the stack
  int i = stackPop(graphStack);
  while(i != -1){
    //fprintf(stderr, "%d\n", i);

    if(i == -1){
      fprintf(stderr, "IGcolorGraph: error popping from stack\n");
      return -1;
    }
    int *neighbors = IGgetNeighbors(i);
    int colorFound = 1;
    for(registers reg = (registers)R8; reg < (registers) R15; reg = (registers) (reg+1)){
      colorFound = 1;
      for(int j = 1; j<=neighbors[0]; j++){
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
      fprintf(stderr, "INTERNAL ERROR: found NA color while transfering to tempts\n");
      return -1;
    }
    if(color != SPILL){
      temp = node.temp;
      temp->temporarykind = regT;
      temp->placement.reg = color;
    }
  }
  return 0;
}


/**
 * Prints the graph
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
