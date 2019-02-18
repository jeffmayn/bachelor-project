#ifndef __tree_h
#define __tree_h
typedef enum {false, true} bool;

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
  struct DECL_LIST *vList;
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
  struct STATEMENT_LIST *statementList;
  struct STATEMENT *statement;
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
    struct VARIABLE *var; //changed from char*
    struct ACT_LIST * id;
    struct EXP *exp;
    struct TERM *notTerm;
    struct EXP *expCard;
    int num; //changed to int from *int
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
    struct STATEMENT *then;
    struct STATEMENT *else_;
    struct EXP *while_;
    struct STATEMENT *do_;
    struct STATEMENT_LIST *list;
  } val;
} STATEMENT;

typedef struct DECL_LIST {
  int lineno;
  enum {declarationK, decl_listK} kind;
  union {
    struct DECLARATION *decl;
    struct DECL_LIST *decl_list;
  } val;
} DECL_LIST;

FUNCTION *makeFUNCTION(HEAD *head, BODY *body, TAIL *tail);
HEAD *makeHEAD(char *id, PAR_DECL_LIST *pList, TYPE *type);
BODY *makeBODY(DECL_LIST *vList, STATEMENT_LIST *sList);
TAIL *makeTAIL(char *id);

TYPE *makeID(char *id);
TYPE *makeINT();
TYPE *makeBOOL();
TYPE *makeARRAY(TYPE *arrayType);
TYPE *makeRECORD(VAR_DECL_LIST *vList);

EXP *makeEXPplus(EXP *left, EXP *right);
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
EXP *makeEXPterm(TERM *term);

TERM *makeTERMvar(VARIABLE *var);
TERM *makeTERMact_list(char* id, struct ACT_LIST *list);
TERM *makeTERMexp(struct EXP *exp);
TERM *makeTERMnotTerm(struct TERM *notTerm);
TERM *makeTERMexpCard(struct EXP *expCard);
TERM *makeTERMnum(int num);
TERM *makeTERMtrue();
TERM *makeTERMfalse();
TERM *makeTERMnull();

STATEMENT *makeSTMreturn(EXP *return_);
STATEMENT *makeSTMwrite(EXP *write);
STATEMENT *makeSTMallocate(VARIABLE *allocate);
STATEMENT *makeSTMallocateLength(VARIABLE *var, EXP *exp);
STATEMENT *makeSTMif_then(EXP *if_, STATEMENT *then);
STATEMENT *makeSTMif_then_else(EXP *if_, STATEMENT *then, STATEMENT *else_);
STATEMENT *makeSTMwhile_do(EXP *while_, STATEMENT *do_);
STATEMENT *makeSTMlist(STATEMENT_LIST *list);

PAR_DECL_LIST *makePDL(VAR_DECL_LIST *vList);
VAR_DECL_LIST *makeVDL(VAR_TYPE *vType, VAR_DECL_LIST *vList);

VAR_TYPE *makeVAR_TYPE(char *id, TYPE *type);

DECL_LIST *makeDECL_LIST(DECLARATION *decl, DECL_LIST *decl_list);

DECLARATION *makeDECLid(TYPE *id);
DECLARATION *makeDECLvar(VAR_DECL_LIST *var, FUNCTION *func);

VARIABLE *makeVARIABLEexp(char *id, VARIABLE *var, EXP *exp);

ACT_LIST *makeACT_LIST(EXP_LIST *list);
EXP_LIST *makeEXP_LIST(EXP *exp, EXP_LIST *list);






#endif
