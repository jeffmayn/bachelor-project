#include "internalASM.h"
#include "memory.h"

/*****************
 * This file contains the implementaiton of temporary lists
 * These lists are used as sets in the livneness analysis algorithm
 * These lists are sorted on the temporaries ID's as key
 *****************/

/**
 * returns a new list
 */
TempList *createList(){
  TempList *list = NEW(TempList);
  list->head = NULL;
  list->tail = NULL;
  return list;
}

/**
 * Creates a new tempList node with default values
 * returns the new node
 */
TempListNode *createTempListNode(TEMPORARY *temp){
  TempListNode *node = NEW(TempListNode);
  node->temp = temp;
  node->next = NULL;
  node->prev = NULL;
  return node;
}

/**
 * adds the temporary to the list
 * returns 0 if the element already were in the list
 * returns 1 if the element was added
 * returns -1 if an error occurred
 */
int addElement(TempList *list, TEMPORARY *temp){
  if(list == NULL){
    fprintf(stderr, "INTERNAL ERROR in addElement: no list given\n");
    return -1;
  }
  if(temp == NULL){
    fprintf(stderr, "INTERNAL ERROR: Tried to insert the NULL pointer\n");
    return -1;
  }
  TempListNode *node = createTempListNode(temp);
  if(list->head == NULL){ //list empty
    list->head = node;
    list->tail = node;
  }
  else{ //list not empty
    TempListNode *travNode = list->head;
    if(travNode->temp->tempId > temp->tempId){
      //insert first in list
      travNode->prev = node;
      node->next = travNode;
      list->head = node;
    }
    else{
      while(travNode != NULL){
        if(travNode->temp == temp){
          //element already there
          return 0;
        }
        if(travNode->next == NULL){
          //insert last in list
          travNode->next = node;
          node->prev = travNode;
          list->tail = node;
          break;
        }
        if(travNode->next->temp->tempId > temp->tempId){
          //insert in middle of list
          node->next = travNode->next;
          node->prev = travNode->next->prev;
          travNode->next->prev = node;
          travNode->next = node;
          break;
        }
        travNode = travNode->next;
      }
    }
  }
  return 1;
}

/**
 * Finds the union of the two lists and puts it into the destination
 * returns 0 if no change where made. Otherwise 1 is returned.
 * returns -1 if error occurred
 */
int listUnion(TempList *src, TempList *dest){
  if(src == NULL){
    fprintf(stderr, "INTERNAL ERROR in listUnion: no src given\n");
    return -1;
  }
  if(src == NULL){
    fprintf(stderr, "INTERNAL ERROR in listUnion: no dest given\n");
    return -1;
  }
  int isChanged = 0;
  TempListNode *srcNode = src->head;
  while(srcNode != NULL){ //adds each node in source list to destination list
    isChanged += addElement(dest, srcNode->temp);
    srcNode = srcNode->next;
  }
  if(isChanged){ return 1; }
  return 0;
}

/**
 * Finds the difference of the two lists
 * returns a new list
 */
TempList *listDiff(TempList *minuend, TempList *subtrahend){
  TempList *diff = createList();
  if(minuend == NULL){
    return diff; //minuend is empty -> diff is empty
  }
  TempListNode *subNode = NULL;
  TempListNode *minNode = minuend->head;
  if(subtrahend != NULL){
    subNode = subtrahend->head;
  }
  while(minNode != NULL){
    if(subNode == NULL || minNode->temp->tempId < subNode->temp->tempId){
      //minuend element not in subtrahend: add to diff
      addElement(diff, minNode->temp);
      minNode = minNode->next;
    }
    else if(minNode->temp->tempId == subNode->temp->tempId){
      minNode = minNode->next; //do not add element
    }
    else if(minNode->temp->tempId > subNode->temp->tempId){
      subNode = subNode->next; //subtrahend is behind
    }
  }
  return diff;
}


/**
 * Frees a list
 * If the list is NULL, then it is trivially freed
 * Always returns 0
 */
int freeList(TempList *list){
  if(list == NULL){
    return 0;
  }
  TempListNode *node = list->head;
  TempListNode *node2;
  while(node != NULL){
    node2 = node;
    node = node->next;
    free(node2);
  }
  free(list);
  return 0;
}
