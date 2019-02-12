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
   int intconst;
   char *stringconst;
   struct EXP *exp;
   //jeg tror at jeg skal lave en variable af hver type som JEFF laver
   //Måske primitive typer er undtaget
}

//da %union er brugt til at definere type, skal den præcise type/variable angives i < >
//tokens er terminal symboler
//%token <intconst> tINTCONST
//%token <stringconst> tIDENTIFIER
%token <> tFUNC
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
%type <> func
%type <> head
%type <> body
%type <> tail
%type <> type //gad vide om jeg må kalde den type??
%type <> par_decl_list
%type <> var_decl_list
%type <> var_type
%type <> decl_list
%type <> decl
%type <> stmt_list
%type <> stmt
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
          //what the heck should happen here?!?!?
        }
head :  tFUNC tID '(' par_decl_list ')' : type
        {
          //someshit should also happen here
        }
tail :  tEND tID
        {
          //I'm getting tired of making up sentences
        }
type :  tID
        {
          //Jeff
        }
      | tINT
        {
          //I
        }
      | tBOOL
        {
          //need
        }
      | tARRAY tOF type
        {
          //function
        }
      | tRECORD tOF '{' var_decl_list '}'
        {
          //definitions
        }
par_decl_list : var_decl_list
        {
          //what about empty strings??
        }
      | //empty string
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
body :  decl_list stmt_list {}
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

//MANGLER REGLER PÅ SIDE 3 AF del2.pdf



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
