%{
#include <stdio.h>
#include "tree.h"

extern int lineno;
extern int charpos;
extern char *yytext;
extern BODY *theexpression; //the root of AST
extern SYNTAX_ERROR;

void yyerror() {
  fprintf(stderr, "Syntax Error line %d position %d before %s\n",
                                                    lineno, charpos, yytext);
  SYNTAX_ERROR = 1;
}
%}

//Union giving the parser-stack types.
//Referenced as yyval/yystype.
%union {
  struct FUNCTION* ufunc;
  struct HEAD* uhead;
  struct BODY* ubody;
  struct TAIL* utail;
  struct TYPE* utype;
  struct PAR_DECL_LIST* upardecllist;
  struct VAR_DECL_LIST* uvardecllist;
  struct VAR_TYPE* uvartype;
  struct DECL_LIST* udecllist;
  struct DECLARATION* udecl;
  struct STATEMENT_LIST* ustmtlist;
  struct STATEMENT* ustmt;
  struct VARIABLE* uvar;
  struct EXP* uexp;
  struct TERM* uterm;
  struct ACT_LIST* uactlist;
  struct EXP_LIST* uexplist;

  int uint;
  char* uid;

  void* uvoid; //only used for testing during development
}

//all terminals
%token <uint> tINT
%token <uid> tID
%token tPLUS tMINUS tTIMES tDIV tEQ tNE tLE tGE tLESS tGREAT tAND tOR 
%token tLPAR tRPAR tLSQ tRSQ tLCURL tRCURL
%token tEND tINTTYPE tBOOLTYPE tARRAYTYPE tOF tRECORDTYPE tTYPE tVAR 
%token tRETURN tWRITE tALLOC tLEN tIF tTHEN tELSE tWHILE tDO tNULL 
%token tBREAK tCONTINUE
%token tTRUE tFALSE
%token tASSI tNEG tDOT
%token tFUNC
%token tBAR tCOL tCOM tSEMI

//all non-terminals
%type <ubody> program //the start type

%type <ufunc> func
%type <uhead> head
%type <ubody> body
%type <utail> tail
%type <utype> type
%type <upardecllist> par_decl_list
%type <uvardecllist> var_decl_list
%type <uvartype> var_type
%type <udecllist> decl_list
%type <udecl> decl
%type <ustmtlist> stmt_list
%type <ustmt> stmt
%type <uvar> var
%type <uexp> exp
%type <uterm> term
%type <uactlist> act_list
%type <uexplist> exp_list

%start program

%right tTHEN tELSE
//Precedence rules for operators
%left tASSI
%left tOR
%left tAND
%left tEQ tNE
%left tLESS tGREAT tLE tGE
%left tPLUS tMINUS
%left tTIMES tDIV tMOD
%left tNEG

%%
//Rule for returning the AST
program: body
         { theexpression = $1;}
;

//All rules in grammar
func : head body tail { $$ = makeFUNCTION($1, $2, $3);}

head : tFUNC tID tLPAR par_decl_list tRPAR tCOL type
                          {$$ = makeHEAD($2, $4, $7);}

body : decl_list stmt_list {$$ = makeBODY($1, $2);}

tail : tEND tID {$$ = makeTAIL($2);}

type : tID {$$ = makeID($1);}
     | tINTTYPE {$$ = makeINT();}
     | tBOOLTYPE {$$ = makeBOOL();}
     | tARRAYTYPE tOF type {$$ = makeARRAY($3);}
     | tRECORDTYPE tOF tLCURL var_decl_list tRCURL {$$ = makeRECORD($4);}

par_decl_list : var_decl_list {$$ = makePDL($1);}
              | {$$ = makePDL(NULL);}//empty string

var_decl_list : var_type tCOM var_decl_list {$$ = makeVDL($1,$3);}
              | var_type {$$ = makeVDL($1,NULL);}
              | var_type tCOM error var_decl_list {yyerrok; }

var_type : tID tCOL type {$$ = makeVAR_TYPE($1,$3);}

decl_list : {$$ = makeDECL_LIST(0, 0);}//empty string
          | decl decl_list {$$ = makeDECL_LIST($1,$2);}

decl : tTYPE tID tASSI type tSEMI {$$ = makeDECLid($2,$4);}
     | func {$$ = makeDECLfunc($1);}
     | tVAR var_decl_list tSEMI {$$ = makeDECLlist($2);}

stmt_list : stmt {$$ = makeSTM_LISTstmtlist($1,NULL);}
          | stmt stmt_list {$$ = makeSTM_LISTstmtlist($1,$2); }

stmt : tRETURN exp tSEMI {$$ = makeSTMreturn($2);}
     | tWRITE exp tSEMI { $$ = makeSTMwrite($2);}
     | tALLOC var tSEMI {$$ = makeSTMallocate($2);}
     | tALLOC var tOF tLEN exp tSEMI {$$ = makeSTMallocateLength($2,$5);}
     | var tASSI exp tSEMI {$$ = makeSTMassign($1,$3);}
     | tIF exp tTHEN stmt {$$ = makeSTMif_then($2,$4);}
     | tIF exp tTHEN stmt tELSE stmt {$$ = makeSTMif_then_else($2,$4,$6);}
     | tWHILE exp tDO stmt {$$ = makeSTMwhile_do($2,$4);}
     | tLCURL stmt_list tRCURL {$$ = makeSTMlist($2);}
     | tBREAK tSEMI {$$ = makeSTMbreak();}
     | tCONTINUE tSEMI {$$ = makeSTMcontinue();}
     | error tSEMI {yyerrok; }

var : tID {$$ = makeVARIABLEid($1);}
    | var tLSQ exp tRSQ {$$ = makeVARIABLEexp($1,$3);}
    | var tDOT tID {$$ = makeVARIABLEdot($3,$1);}

exp : exp tPLUS exp {$$ = makeEXPplus($1,$3);}
    | exp tMINUS exp {$$ = makeEXPminus($1,$3);}
    | exp tTIMES exp {$$ = makeEXPtimes($1,$3);}
    | exp tMOD exp {fprintf(stderr, "Modulo operation not yet implemented\n");}
    | exp tDIV exp {$$ = makeEXPdiv($1,$3);}
    | exp tEQ exp {$$ = makeEXPeq($1,$3);}
    | exp tNE exp {$$ = makeEXPne($1,$3);}
    | exp tLE exp {$$ = makeEXPle($1,$3);}
    | exp tGE exp {$$ = makeEXPge($1,$3);}
    | exp tLESS exp {$$ = makeEXPless($1,$3);}
    | exp tGREAT exp {$$ = makeEXPgreat($1,$3);}
    | exp tAND exp {$$ = makeEXPand($1,$3);}
    | exp tOR exp {$$ = makeEXPor($1,$3);}
    | term {$$ = makeEXPterm($1);}

term : var {$$ = makeTERMvar($1);}
     | tID tLPAR act_list tRPAR {$$ = makeTERMact_list($1,$3);}
     | tLPAR exp tRPAR {$$ = makeTERMexp($2);}
     | tNEG term {$$ = makeTERMnotTerm($2);}
     | tBAR exp tBAR {$$ = makeTERMexpCard($2);}
     | tINT {$$ = makeTERMnum($1);}
     | tTRUE {$$ = makeTERMtrue();}
     | tFALSE {$$ = makeTERMfalse();}
     | tNULL {$$ = makeTERMnull();}

act_list : exp_list {$$ = makeACT_LIST($1);}
         | {$$ = makeACT_LIST(NULL);}

exp_list : exp {$$ = makeEXP_LIST($1,NULL);}
         | exp tCOM exp_list {$$ = makeEXP_LIST($1,$3);}
%%
