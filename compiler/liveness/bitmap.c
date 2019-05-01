

#define BITSPERINT 32;
/**
 * Creates a bitmap with size number of bits
 * All bits are reset from start (set to 0)
 */
BITMAP* bitMapMakeBitMap(int size){
  BITMAP *map = NEW(BITMAP);
  int sectionCount = size/BITSPERINT //sizeofint()
  if(size%BITSPERINT > 0){
    sectionCount++;
  }
  map.bits = Malloc(sizeof(int)*sectionCount);
  for(i=0; i<sectionCount; i++){
    map.bits[i] = 0;
  }
  map.size = size;
  return map;
}

/**
 * Sets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapSetBit(BITMAP *map, int index){
  if(size > map.size){
    return -1;
  }
  int offset = index%map.size;
  map.bits[index/BITSPERINT] |= 1 << offset;
  return 0;
}

/**
 * resets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapResetBit(BITMAP *map, int index){
  if(size > map.size){
    return -1;
  }
  int offset = index%map.size;
  map.bits[index/BITSPERINT] &= ~(1 << offset);
  return 0;
}
//use UINT_MAX from limits.h to do the AND correctly
//alternatively use ~ to negate the string 00001000 to 11110111

/**
 * returns 1 if the index'th bit is set and 0 otherwise
 * returns -1 at index out of bounds
 */
int bitMapBitIsSet(BITMAP *map, int index){
  if(size > map.size){
    return -1;
  }
  int offset = index%map.size;
  return (map.bits[index/BITSPERINT] >> offset) & 1;
}

BITMAP* bitMapUnion(BITMAP *src, BITMAP *dest){
  fprintf(stderr, "UnsupportedException: bitMapUnion\n");
  return NULL;
}

/**
 * Calculates first minus second and returns a new map
 */
BITMAP* bitMapDiff(BITMAP *first, BITMAP *second){
  fprintf(stderr, "UnsupportedException: bitMapUnion\n");
  return NULL;
}

int bitMapfree(BITMAP *map){
  fprintf(stderr, "UnsupportedException: bitMapDiff\n");
  return 0;
}

/**
 * returns 1 if the maps are the same
 * returns 0 of the maps are not the same
*/
int bitMapIsEqual(BITMAP *m1, BITMAP *m2){
  fprintf(stderr, "UnsupportedException: bitMapIsEqual\n");
  return -1;
}

int bitMap1Count(BITMAP *map){
  fprintf(stderr, "UnsupportedException: bitMap1Count\n");
  return -1;
}
