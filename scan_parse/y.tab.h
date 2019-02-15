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
    tPLUS = 259,
    tMINUS = 260,
    tTIMES = 261,
    tDIV = 262,
    tEQ = 263,
    tNE = 264,
    tLE = 265,
    tGE = 266,
    tLESS = 267,
    tGREAT = 268,
    tAND = 269,
    tOR = 270,
    tLPAR = 271,
    tRPAR = 272,
    tLSQ = 273,
    tRSQ = 274,
    tLCURL = 275,
    tRCURL = 276
  };
#endif
/* Tokens.  */
#define tINT 258
#define tPLUS 259
#define tMINUS 260
#define tTIMES 261
#define tDIV 262
#define tEQ 263
#define tNE 264
#define tLE 265
#define tGE 266
#define tLESS 267
#define tGREAT 268
#define tAND 269
#define tOR 270
#define tLPAR 271
#define tRPAR 272
#define tLSQ 273
#define tRSQ 274
#define tLCURL 275
#define tRCURL 276

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 18 "parser.y" /* yacc.c:1909  */

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
  struct EXPRESSION* uexp;

  int unum;






   //int intconst;
   //char *stringconst;
   //struct EXPRESSION *exp;

   //jeg tror at jeg skal lave en variable af hver type som JEFF laver
   //Måske primitive typer er undtaget

#line 124 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
