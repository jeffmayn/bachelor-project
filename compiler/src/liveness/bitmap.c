#include "bitmap.h"
#include "memory.h"
#include <stdio.h>

/**
 * Creates a bitmap with size number of bits
 * All bits are reset from start (set to 0)
 * returns the map created
 */
BITMAP* bitMapMakeBitMap(int size){
  BITMAP *map = NEW(BITMAP);
  //amount of intergers needed
  int sectionCount = size/BITSPERINT;
  if(size%BITSPERINT > 0){
    sectionCount++;
  }
  map->bits = Malloc(sizeof(int)*sectionCount);
  for(int i=0; i<sectionCount; i++){
    map->bits[i] = 0; //resets all bits
  }
  map->size = size;
  return map;
}

/**
 * Sets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapSetBit(BITMAP *map, int index){
  if(index > map->size){ return -1; }
  int offset = index%BITSPERINT;
  map->bits[index/BITSPERINT] |= 1 << offset;
  return 0;
}

/**
 * resets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapResetBit(BITMAP *map, int index){
  if(index > map->size){ return -1; }
  int offset = index%BITSPERINT;
  map->bits[index/BITSPERINT] &= ~(1 << offset);
  return 0;
}

/**
 * returns 1 if the index'th bit is set and 0 otherwise
 * returns -1 at index out of bounds
 */
int bitMapBitIsSet(BITMAP *map, int index){
  if(index > map->size){ return -1; }
  int offset = index%BITSPERINT;
  return (map->bits[index/BITSPERINT] >> offset) & 1;
}

/**
 * Counts and returns the number of 1's in map
 */
int bitMap1Count(BITMAP *map){
  int blockCount = map->size/BITSPERINT;
  if(map->size%BITSPERINT > 0){
    blockCount++;
  }
  unsigned int n;
  int count = 0;
  for(int i=0; i<blockCount; i++){
    n = map->bits[i];
    while(n){
      count += n & 1;
      n >>= 1;
    }
  }
  return count;
}
