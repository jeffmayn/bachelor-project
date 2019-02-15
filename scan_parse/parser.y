%{
#include <stdio.h>
#include "tree.h"

extern char *yytext;
extern EXP *theexpression;

void yyerror() {
   printf("syntax error before %s\n",yytext);
}
%}


//Denne union angiver typen af associeret data
//det vil sige typen af $x og $$.
//da der ikke er noget nvanv for union er den kaldet YYSTYPE
//Jeg tror at dette er stak typen
%union {
  struct FUNCTION* ufunc;
  struct HEAD* uhead;
  struct BODY* ubody;
  struct TAIL* utail;
  struct TYPE* utype;
  struct PAR_DECL_LIST* upardecllist;
  struct VAR_DECL_LIST* uvardecllist;
  struct STATEMENT_LIST* ustatementlist;
  //struct STATEMENT* ustatement;
  void* uvoid; //default for testing
  struct EXP* uexp;

  int uint;






   //int intconst;
   //char *stringconst;
   //struct EXPRESSION *exp;

   //jeg tror at jeg skal lave en variable af hver type som JEFF laver
   //Måske primitive typer er undtaget
}

//da %union er brugt til at definere type, skal den præcise type/variable angives i < >
//tokens er terminal symboler
//%token <intconst> tINTCONST
//%token <stringconst> tIDENTIFIER

/*
%token <> tID
%token <> tEND
%token <> tINT
%token <> tBOOL
%token <> tARRAY
%token <> tOF
%token <> tRECORD
%token <> tTYPE
%token <> tVAR
%token <> tRETURN
%token <> tWRITE
%token <> tALLOC
%token <> tLEN
%token <> tIF
%token <> tTHEN
%token <> tWHILE
%token <> tDO
%token <unum> tNUM
%token <> tTRUE
%token <> tFALSE
%token <> tNULL
*/

%token <uint> tINT
%token tPLUS tMINUS tTIMES tDIV tEQ tNE tLE tGE tLESS tGREAT tAND tOR tLPAR tRPAR tLSQ tRSQ tLCURL tRCURL
%token tID tEND tBOOL tARRAY tOF tRECORD tTYPE tVAR tRETURN tWRITE tWRITE tALLOC tLEN tTHEN tWHILE tDO tNULL
%token tTRUE tFALSE


//type er non-terminal symboler
//bruges kun til at definere typen af non-terminalen
%type <uexp> program exp


%type <ufunc> func
%type <uhead> head
%type <ubody> body
%type <utail> tail
%type <utype> type //gad vide om jeg må kalde den type??
%type <upardecllist> par_decl_list
%type <uvardecllist> var_decl_list


//Only for temporary testing below
%type var_type
%type decl_list
%type decl
%type stmt_list
%type stmt
%type var
%type exp
%type term
%type act_list
%type exp_list

%type exp
%type term
%type act_list
%type exp_list

/*
%type <> var_type
%type <> decl_list
%type <> decl
%type <ustatementlist> stmt_list
%type <ustatement> stmt
%type <> var
%type <> exp
%type <> term
%type <> act_list
%type <> exp_list
*/

/*
%type <> exp
%type <> term
%type <> act_list
%type <> exp_list
*/

%start program

/*
%left '+' '-'
%left '*' '/'
*/



%%
program: exp
         { theexpression = $1;}
;



func :  head body head { $$ = makeFUNCTION($1, $2, $3);}

head :  tFUNC tID tLPAR par_decl_list tRPAR tCOL type {$$ = makeHEAD($2, $4, $6);}

body :  decl_list stmt_list {$$ = makeBODY($1, $2);}

tail :  tEND tID {$$ = makeTAIL($2);}

type :  tID {$$ = makeID($1);}
      | tINT {$$ = makeINT($1);}
      | tBOOL {$$ = makeBOOL($1);}
      | tARRAY tOF type {$$ = makeARRAY($2);}
      | tRECORD tOF '{' var_decl_list '}' {$$ = makeRECORD($3);}


var :   tID {printf("var tID\n");}
      | var tLSQ exp tRSQ {printf("var exp\n");}
      | var tDOT tID {printf("var dot\n");}

par_decl_list : var_decl_list{printf("par_decl_list\n");}
      | {printf("par_decl_list empty\n");};//empty string

var_decl_list : var_type tCOM var_decl_list{printf("var_decl_list\n");}
      | var_type {printf("var_decl_list empty\n");}

var_type : tID tCOL type{printf("var_typ tID\n");}

decl_list : decl decl_list {printf("decl_list\n");}
      | {printf("decl_list empty\n");}//empty string

decl :  tTYPE tID tASSI type tSEMI {printf("decl assi\n");}
      | function {printf("decl func\n");}
      | tVAR var_decl_list tSEMI {printf("decl var\n");}

stmt_list : stmt {printf("stmt_list stmt\n");}
      | stmt stmt_list {printf("stmt_list list\n");}

stmt :  tRETURN exp tSEMI {printf("stmt return\n");}
      | tWRITE exp tSEMI {printf("stmt write\n");}
      | tALLOC var tSEMI {printf("stmt alloc\n");}
      | tALLOC var tOF tLEN exp tSEMI {printf("stmt alloc len\n");}
      | var tASSI exp tSEMI {printf("stmt var assign\n");}
      | tIF exp tTHEN stmt {printf("stmt if then\n");}
      | tIF exp tTHEN stmt tELSE stmt {printf("stmt if else\n");}
      | tWHILE exp tDO stmt {printf("stmt while\n");}
      | tLCURL stmt_list tRCURL {printf("stmt list\n");}


exp :   exp tPLUS exp {$$ = makeEXPplus($1,$3);}
      | exp tMINUS exp {$$ = makeEXPminus($1,$3);}
      | exp tTIMES exp {$$ = makeEXPtimes($1,$3);}
      | exp tDIV exp {$$ = makeEXPdiv($1,$3);}
      | exp tEQ exp {$$ = makeEXPeq($1,$3);}
      | exp tNE exp {$$ = makeEXPne($1,$3);}
      | exp tLE exp {$$ = makeEXPle($1,$3);}
      | exp tGE exp {$$ = makeEXPge($1,$3);}
      | exp tLESS exp {$$ = makeEXPless($1,$3);}
      | exp tGREAT exp {$$ = makeEXPgreat($1,$3);}
      | exp tAND exp {$$ = makeEXPand($1,$3);}
      | exp tOR exp {$$ = makeEXPor($1,$3);}
      | term {$$ = makeEXPterm($1,$3);}

term :  var {printf("term var\n");}
      | tID tLPAR act_list tRPAR {printf("term func\n");}
      | tLPAR exp_list tRPAR {printf("term paren\n");}
      | tNEG term {printf("term neg\n");}
      | tBAR exp tBAR {printf("term size\n");}
      | tINT {printf("term num\n");}
      | tTRUE {printf("term true\n");}
      | tFALSE {printf("term false\n");}
      | tNULL {printf("term null\n");}

act_list : exp_list {printf("act_list exp_list\n");}
      | {printf("act_list empty\n");}

exp_list : exp {printf("exp_list exp\n");}
      | exp, exp_list {printf("exp_list list\n");}


/*
exp : tIDENTIFIER
      {$$ = makeEXPid($1);}
    | tINTCONST
      {$$ = makeEXPintconst($1);}
    | exp '*' exp
      {$$ = makeEXPtimes($1,$3);}
    | exp '/' exp
      {$$ = makeEXPdiv($1,$3);}
    | exp '+' exp
      {$$ = makeEXPplus($1,$3);}
    | exp '-' exp
      {$$ = makeEXPminus($1,$3);}
    | '(' exp ')'
      {$$ = $2;}
;
*/

%%
