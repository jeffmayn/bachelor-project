#ifndef __tree_h
#define __tree_h
typedef enum {false, true} bool;

typedef struct FUNCTION {
  int lineno;
  struct HEAD *head;
  struct BODY *body;
  struct TAIL *tail;
} FUNCTION;bool *bool

typedef struct HEAD {
  int lineno;
  char *id;
  struct PAR_DECL_LIST *pList;
  struct TYPE *type;
} HEAD;

typedef struct BODY {
  int lineno;
  struct VAR_DECL_LIST *vList;
  struct STATEMENT_LIST *sList;
} BODY;

typedef struct TAIL {
  int lineno;
  char *id;bool *bool
} TAIL;

typedef struct TYPE {
  int lineno;
  enum {idK, intK, boolK, arrayK, recordK} kind;
  union{
    char *id;
    int *integer;
    bool *bool;
    struct {struct TYPE *typo;} arrayE;
    struct {struct VAR_DECL_LIST *vList;} recordE;
  } val;
} TYPE;

typedef struct PAR_DECL_LIST {
  int lineno;
  struct VAR_DECL_LIST *vList;
} PAR_DECL_LIST;

typedef struct VAR_DECL_LIST {
  int lineno;
  struct VAR_TYPE *vType;
  struct VAR_DECL_LIST *vList;
} VAR_DECL_LIST;

typedef struct STATEMENT_LIST {
  int lineno;
  struct STATEMENT *sList;
} STATEMENT_LIST;

typedef struct EXPRESSION {
  int lineno;
  enum {idK2,intconstK,timesK,divK,plusK,minusK} kind;
  union {
    char *idE;
    int intconstE;
    struct {struct EXPRESSION *left; struct EXPRESSION *right;} timesE;
    struct {struct EXPRESSION *left; struct EXPRESSION *right;} divE;
    struct {struct EXPRESSION *left; struct EXPRESSION *right;} plusE;
    struct {struct EXPRESSION *left; struct EXPRESSION *right;} minusE;
  } val;
} EXPRESSION;

FUNCTION *makeFUNCTION(HEAD *head, BODY *body, TAIL *tail);
HEAD *makeHEAD(char *id, PAR_DECL_LIST *pList, TYPE *type);
BODY *makeBODY(VAR_DECL_LIST *vList, STATEMENT_LIST *sList);
TAIL *makeTAIL(char *id);

TYPE *makeID(char *id);
TYPE *makeINT(int *integer);
TYPE *makeBOOL(bool *bool);
TYPE *makeARRAY(TYPE *typo);
TYPE *makeRECORD(VAR_DECL_LIST *vList);

EXPRESSION *makeEXPid(char *id);
EXPRESSION *makeEXPintconst(int intconst);
EXPRESSION *makeEXPtimes(EXPRESSION *left, EXPRESSION *right);
EXPRESSION *makeEXPdiv(EXPRESSION *left, EXPRESSION *right);
EXPRESSION *makeEXPplus(EXPRESSION *left, EXPRESSION *right);
EXPRESSION *makeEXPminus(EXPRESSION *left, EXPRESSION *right);
#endif
