/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tINT = 258,
    tID = 259,
    tPLUS = 260,
    tMINUS = 261,
    tTIMES = 262,
    tDIV = 263,
    tEQ = 264,
    tNE = 265,
    tLE = 266,
    tGE = 267,
    tLESS = 268,
    tGREAT = 269,
    tAND = 270,
    tOR = 271,
    tLPAR = 272,
    tRPAR = 273,
    tLSQ = 274,
    tRSQ = 275,
    tLCURL = 276,
    tRCURL = 277,
    tEND = 278,
    tINTTYPE = 279,
    tBOOLTYPE = 280,
    tARRAYTYPE = 281,
    tOF = 282,
    tRECORDTYPE = 283,
    tTYPE = 284,
    tVAR = 285,
    tRETURN = 286,
    tWRITE = 287,
    tALLOC = 288,
    tLEN = 289,
    tIF = 290,
    tTHEN = 291,
    tELSE = 292,
    tWHILE = 293,
    tDO = 294,
    tNULL = 295,
    tTRUE = 296,
    tFALSE = 297,
    tASSI = 298,
    tNEG = 299,
    tDOT = 300,
    tFUNC = 301,
    tBAR = 302,
    tCOL = 303,
    tCOM = 304,
    tSEMI = 305,
    tMOD = 306
  };
#endif
/* Tokens.  */
#define tINT 258
#define tID 259
#define tPLUS 260
#define tMINUS 261
#define tTIMES 262
#define tDIV 263
#define tEQ 264
#define tNE 265
#define tLE 266
#define tGE 267
#define tLESS 268
#define tGREAT 269
#define tAND 270
#define tOR 271
#define tLPAR 272
#define tRPAR 273
#define tLSQ 274
#define tRSQ 275
#define tLCURL 276
#define tRCURL 277
#define tEND 278
#define tINTTYPE 279
#define tBOOLTYPE 280
#define tARRAYTYPE 281
#define tOF 282
#define tRECORDTYPE 283
#define tTYPE 284
#define tVAR 285
#define tRETURN 286
#define tWRITE 287
#define tALLOC 288
#define tLEN 289
#define tIF 290
#define tTHEN 291
#define tELSE 292
#define tWHILE 293
#define tDO 294
#define tNULL 295
#define tTRUE 296
#define tFALSE 297
#define tASSI 298
#define tNEG 299
#define tDOT 300
#define tFUNC 301
#define tBAR 302
#define tCOL 303
#define tCOM 304
#define tSEMI 305
#define tMOD 306

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 17 "parser.y" /* yacc.c:1909  */

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

#line 181 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
