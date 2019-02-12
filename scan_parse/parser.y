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
  FUNCTION* ufunc;
  HEAD* uhead;
  BODY* ubody;
  TAIL* utail;
  TYPE* utype;
  PAR_DECL_LIST* upardecllist;
  VAR_DECL_LIST* uvardecllist;
  STATEMENT_LIST* ustatementlist;
  STATEMENT* ustatement;
  void* uvoid; //default for testing






   //int intconst;
   //char *stringconst;
   //struct EXP *exp;

   //jeg tror at jeg skal lave en variable af hver type som JEFF laver
   //Måske primitive typer er undtaget
}

//da %union er brugt til at definere type, skal den præcise type/variable angives i < >
//tokens er terminal symboler
//%token <intconst> tINTCONST
//%token <stringconst> tIDENTIFIER
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
%token <> tOP
%token <> tNUM
%token <> tTRUE
%token <> tFALSE
%token <> tNULL



//type er non-terminal symboler
//bruges kun til at definere typen af non-terminalen
//%type <exp> program exp
%type <ufunc> func
%type <uhead> head
%type <ubody> body
%type <utail> tail
%type <utype> type //gad vide om jeg må kalde den type??
%type <upardecllist> par_decl_list
%type <uvardecllist> var_decl_list
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

%start program

%left '+' '-'
%left '*' '/'

%%
program: exp
         { theexpression = $1;}
;

func :  head body head
        {
          $$ = makeFUNCTION($1, $2, $3);
        }
head :  tFUNC tID '(' par_decl_list ')' : type
        {
          $$ = makeHEAD($2, $4, $6);
        }
tail :  tEND tID
        {
          $$ = makeTAIL($2);
        }
type :  tID
        {
          $$ = makeID($1);
        }
      | tINT
        {
          $$ = makeINT($1);
        }
      | tBOOL
        {
          $$ = makeBOOL($1);
        }
      | tARRAY tOF type
        {
          $$ = makeARRAY($2);
        }
      | tRECORD tOF '{' var_decl_list '}'
        {
          $$ = makeRECORD($3);
        }
par_decl_list : var_decl_list
        {
          //what about empty strings??
        }
      | ;//empty string
var_decl_list : var_type ',' var_decl_list
        {
          //blah
        }
      | var_type
        {
          //blah
        }
var_type : tID ':' type
        {
          //more semantic happening here
        }
body :  decl_list stmt_list
        {
          $$ = makeBODY($1, $2);
        }
decl_list : decl decl_list
      | ;//empty string
decl :  tTYPE tID '=' type ';'
      | function {}
      | tVAR var_decl_list ';' {}
stmt_list : stmt {}
      | stmt stmt_list {}
stmt :  tRETURN exp ';' {}
      | tWRITE exp ';' {}
      | tALLOC var ';' {}
      | tALLOC var tOF tLEN exp ';' {}
      | var '=' exp ';' {}
      | tIF exp tTHEN stmt {}
      | tIF exp tTHEN stmt tELSE stmt {}
      | tWHILE exp tDO stmt {}
      | '{' stmt_list '}' {}
var :   tID {}
      | var '[' exp ']' {}
      | var '.' tID {}
exp :   exp tOP exp {}
      | term {}
term :  var {}
      | tID '(' act_list ')' {}
      | '(' exp_list ')' {}
      | '!' term {}
      | '|' exp '|' {}
      | tNUM {}
      | tTRUE {}
      | tFALSE {}
      | tNULL {}
act_list : exp_list {}
      | ; {}
exp_list : exp {}
      | exp, exp_list {}


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

%%
