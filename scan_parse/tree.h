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
    struct TYPE *arrayType;
    struct VAR_DECL_LIST *vList;
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
  struct STATEMENT_LIST *statemantList;
  struct STATEMENT *statement;
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

typedef struct VAR_TYPE {
  int lineno;
  union {
    char *id;
    struct TYPE *type;
  } val;
} VAR_TYPE;

typedef struct DECLARATION {
  int lineno;
  union {
    struct FUNCTION *func;
    struct TYPE *id;
    struct VAR_DECL_LIST *var;
  } val;
} DECLARATION;

typedef struct STATEMENT {
  int lineno;
  enum {returnK, writeK, allocateK, allocateLengthK, ifK, thenK, elseK,\
        whileK, doK, listK} kind;
  union {
    struct EXP *return_;
    struct EXP *write;
    struct VARIABLE *allocate;
    struct VARIABLE *allocateLength;
    struct EXP *if_;
    struct EXP *then;
    struct EXP *else_;
    struct EXP *while_;
    struct EXP *do_;
    struct STATEMENT_LIST *list;
  } val;
} STATEMENT;

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

STATEMENT *makeSTMreturn(EXP *return_);
STATEMENT *makeSTMwrite(EXP *write);
STATEMENT *makeSTMallocate(VARIABLE *allocate);
STATEMENT *makeSTMallocateLength(VARIABLE *allocateLength);
STATEMENT *makeSTMif_(EXP *if_);
STATEMENT *makeSTMthen(EXP *then_);
STATEMENT *makeSTMelse_(EXP *else_);
STATEMENT *makeSTMwhile_(EXP *while_);
STATEMENT *makeSTMdo_(EXP *do_);
STATEMENT *makeSTMlist(STATEMENT_LIST *list);

#endif
