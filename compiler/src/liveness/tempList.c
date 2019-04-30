#include "internalASM.h"
#include "memory.h"


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
 * adds an element to the list
 * returns the same list given
 */
TempList *addElement(TempList *list, TEMPORARY *temp){
  if(list == NULL){
    fprintf(stderr, "INTERNAL ERROR in addElement: no list given\n");
    return NULL;
  }
  TempListNode *node = NEW(TempListNode);
  node->temp = temp;
  node->next = NULL;
  node->prev = NULL;
  if(list->head == NULL){
    list->head = node;
    list->tail = node;
  }
  else{
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
          return list;
        }
        if(travNode->next == NULL){
          //insert last in list
          travNode->next = node;
          node->prev = travNode;
          list->tail = node;
        }
        if(travNode->next->temp->tempId > temp->tempId){
          //insert in middle of list
          node->next = travNode->next;
          node->prev = travNode->next->prev;
          travNode->next->prev = node;
          travNode->next = node;
        }
      }
    }
  }
  return list;
}

/**
 * Removes the element from the list
 * returns the same list as given
 */
TempList *removeElement(TempList *list, TEMPORARY *temp);

/**
 * Finds the union of the two lists and puts it into the destination
 * returns 0 if no change where made. Otherwise 1 is returned.
 */
int listUnion(TempList *src, TempList *dest);

/**
 * Finds the difference of the two lists
 * returns a new list
 */
TempList *listDiff(TempList *minuend, TempList *subtrahend);

int freeList(TempList *list);
