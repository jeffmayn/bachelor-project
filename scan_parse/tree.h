#ifndef __tree_h
#define __tree_h
typedef enum {false, true} bool;

/*
 * TODO:
 *  - var_type
 *  - declaration
 *  - statement_list
 *  - statement
*/

typedef struct FUNCTION {
  int lineno;
  struct HEAD *head;
  struct BODY *body;
  struct TAIL *tail;
} FUNCTION;

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
  char *id;
} TAIL;

typedef struct TYPE {
  int lineno;
  enum {idK, intK, boolK, arrayK, recordK} kind;
  union{
    char *id;
    TYPE *arrayType;
    VAR_DECL_LIST *vList;
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

typedef struct STATEMENT_LIST {arrayType
  int lineno;
  struct STATEMENT *sList;
} STATEMENT_LIST;

typedef struct EXP {
  int lineno;
  enum {binOPK, termK, minusK, plusK, timesK, divK,\
        leK, eqK, geK, greatK, lessK, neK, andK, orK} kind;
  union {
    struct {struct EXP *left; struct EXP *right;} binOP;
    struct TERM *term;
  } val;
} EXP;

typedef struct TERM {
  int lineno;
  enum {varK, idTermK, expK, notTermK, expCardK, numK, trueK, falseK, nullK} kind;
  union {
    char *var;
    struct ACT_LIST * id;
    struct EXP *exp;
    struct TERM *notTerm;
    struct EXP *expCard;
    int *num;
    bool *true;
    bool *false;
  } val;
} TERM;

typedef struct ACT_LIST {
  int lineno;
  struct EXP_LIST *expList;
} ACT_LIST;

typedef struct EXP_LIST {
  int lineno;
  struct EXP *exp;
  struct EXP_LIST *expList;
} EXP_LIST;

typedef struct VARIABLE {
  int lineno;
  union {
    char *id;
    struct VARIABLE *var;
    struct EXP *exp;
  } val;
} VARIABLE;

FUNCTION *makeFUNCTION(HEAD *head, BODY *body, TAIL *tail);
HEAD *makeHEAD(char *id, PAR_DECL_LIST *pList, TYPE *type);
BODY *makeBODY(VAR_DECL_LIST *vList, STATEMENT_LIST *sList);
TAIL *makeTAIL(char *id);

TYPE *makeID(char *id);
TYPE *makeINT();
TYPE *makeBOOL();
TYPE *makeARRAY(TYPE *arrayType);
TYPE *makeRECORD(VAR_DECL_LIST *vList);

EXP *makeEXPminus(EXP *left, EXP *right);
EXP *makeEXPtimes(EXP *left, EXP *right);
EXP *makeEXPdiv(EXP *left, EXP *right);
EXP *makeEXPeq(EXP *left, EXP *right);
EXP *makeEXPne(EXP *left, EXP *right);
EXP *makeEXPle(EXP *left, EXP *right);
EXP *makeEXPge(EXP *left, EXP *right);
EXP *makeEXPless(EXP *left, EXP *right);
EXP *makeEXPgreat(EXP *left, EXP *right);
EXP *makeEXPand(EXP *left, EXP *right);
EXP *makeEXPor(EXP *left, EXP *right);
EXP *makeEXPterm(EXP *term);

TERM *makeTERMvar(char *var);
TERM *makeTERMact_list(struct ACT_LIST *id);
TERM *makeTERMexp(struct EXP *exp);
TERM *makeTERMnotTerm(struct TERM *notTerm);
TERM *makeTERMexpCard(struct EXP *expCard);
TERM *makeTERMnum(int *num);
TERM *makeTERMtrue(bool *true);
TERM *makeTERMfalse(bool *false);

#endif
