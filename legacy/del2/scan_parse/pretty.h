#ifndef __pretty_h
#define __pretty_h

#include "tree.h"

void pFUNC(FUNCTION *f);
void pHEAD(HEAD *h);
void pBODY(BODY *b);
void pTAIL(TAIL *t);
void pTYPE(TYPE *t);
void pPARDECLLIST(PAR_DECL_LIST *pdl);
void pVARDECLLIST(VAR_DECL_LIST *vdl);
void pVARTYPE(VAR_TYPE *vt);
void pDECLLIST(DECL_LIST *dl);
void pDECL(DECLARATION *d);
void pSTMTLIST(STATEMENT_LIST *sl);
void pSTMT(STATEMENT *s);
void pVARIABLE(VARIABLE *v);
void pEXP(EXP *e);
void pTERM(TERM *t);
void pACTLIST(ACT_LIST *al);
void pEXPLIST(EXP_LIST *el);

#endif
