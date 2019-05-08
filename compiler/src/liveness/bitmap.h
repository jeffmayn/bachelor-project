#ifndef __bitmap_h
#define __bitmap_h
typedef struct BITMAP {
  unsigned int *bits;
  int size;
} BITMAP;

#define BITSPERINT 32

/**
 * Creates a bitmap with size number of bits
 * All bits are reset from start (set to 0)
 * returns the map created
 */
BITMAP* bitMapMakeBitMap(int size);

/**
 * Sets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapSetBit(BITMAP *map, int index);

/**
 * resets the index'th bit of map
 * Returns: -1 if bit is out of bounds
*/
int bitMapResetBit(BITMAP *map, int index);
//use UINT_MAX from limits.h to do the AND correctly
//alternatively use ~ to negate the string 00001000 to 11110111

/**
 * returns 1 if the index'th bit is set and 0 otherwise
 * returns -1 at index out of bounds
 */
int bitMapBitIsSet(BITMAP *map, int index);

int bitMap1Count(BITMAP *map);

// BITMAP* bitMapUnion(BITMAP *src, BITMAP *dest);
//
// /**
//  * Calculates first minus second and returns a new map
//  */
// BITMAP* bitMapDiff(BITMAP *first, BITMAP *second);
//
// int bitMapfree(BITMAP *map);
//
// /**
//  * returns 1 if the maps are the same
//  * returns 0 of the maps are not the same
// */
// int bitMapIsEqual(BITMAP *m1, BITMAP *m2);
#endif
