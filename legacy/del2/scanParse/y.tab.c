/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "parser.y" /* yacc.c:339  */

#include <stdio.h>
#include "tree.h"

extern int lineno;
extern int charpos;
extern char *yytext;
extern BODY *theexpression; //the root of AST

void yyerror() {
   printf("Syntax Error line %d position %d before %s\n",lineno, charpos, yytext);
}

#line 80 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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
#line 17 "parser.y" /* yacc.c:355  */

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

#line 247 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 264 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  15
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   345

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  52
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  19
/* YYNRULES -- Number of rules.  */
#define YYNRULES  62
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  133

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   306

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    91,    91,    97,    99,   101,   103,   105,   106,   107,
     108,   109,   111,   112,   114,   115,   117,   119,   120,   122,
     123,   124,   126,   127,   129,   130,   131,   132,   133,   134,
     135,   136,   137,   139,   140,   141,   143,   144,   145,   146,
     147,   148,   149,   150,   151,   152,   153,   154,   155,   156,
     158,   159,   160,   161,   162,   163,   164,   165,   166,   168,
     169,   171,   172
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "tINT", "tID", "tPLUS", "tMINUS",
  "tTIMES", "tDIV", "tEQ", "tNE", "tLE", "tGE", "tLESS", "tGREAT", "tAND",
  "tOR", "tLPAR", "tRPAR", "tLSQ", "tRSQ", "tLCURL", "tRCURL", "tEND",
  "tINTTYPE", "tBOOLTYPE", "tARRAYTYPE", "tOF", "tRECORDTYPE", "tTYPE",
  "tVAR", "tRETURN", "tWRITE", "tALLOC", "tLEN", "tIF", "tTHEN", "tELSE",
  "tWHILE", "tDO", "tNULL", "tTRUE", "tFALSE", "tASSI", "tNEG", "tDOT",
  "tFUNC", "tBAR", "tCOL", "tCOM", "tSEMI", "tMOD", "$accept", "program",
  "func", "head", "body", "tail", "type", "par_decl_list", "var_decl_list",
  "var_type", "decl_list", "decl", "stmt_list", "stmt", "var", "exp",
  "term", "act_list", "exp_list", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306
};
# endif

#define YYPACT_NINF -78

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-78)))

#define YYTABLE_NINF -1

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -15,    14,    15,    17,    22,   -78,   -15,   -78,   299,   -15,
     -19,   -21,   -22,   -20,    13,   -78,     9,   -78,   299,   298,
     298,    29,   298,   298,   -78,   299,   166,   -78,   189,   189,
     -78,    15,    15,    47,   -78,    43,   -78,    19,   298,   -78,
     -78,   -78,   298,   298,     7,    32,   -78,    63,    92,    79,
      94,   -78,   298,   298,   108,   -78,   -78,   -78,    89,    90,
      70,   -78,   -78,   103,   -78,   -78,   -78,   298,   141,   -78,
     155,   298,   298,   298,   298,   298,   298,   298,   298,   298,
     298,   298,   298,   -78,   298,   -78,    88,   -78,   299,   299,
     167,   214,   -78,   189,   102,   -78,    76,   226,   107,   -78,
     -78,   -78,    -1,    -1,   -78,   -78,   255,   255,   133,   133,
     133,   133,   273,   285,   -78,   298,    91,   -78,   -78,   -78,
     -78,    15,   189,   298,   -78,   238,   299,   104,   -78,   -78,
     -78,   -78,   -78
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
      17,     0,     0,     0,     0,    20,    17,     2,     0,    17,
       0,     0,     0,    15,     0,     1,     0,    33,     0,     0,
       0,     0,     0,     0,     5,    22,     0,    18,     0,     0,
      21,     0,    13,     0,     3,     0,    55,    33,     0,    58,
      56,    57,     0,     0,    50,     0,    49,     0,     0,     0,
       0,    23,     0,     0,     0,     7,     8,     9,     0,     0,
       0,    16,    14,     0,    12,     6,    32,    60,     0,    53,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    24,     0,    25,     0,    26,     0,     0,
       0,     0,    35,     0,     0,    19,     0,    61,     0,    59,
      52,    54,    36,    37,    38,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    39,     0,    29,    31,    34,    28,
      10,     0,     0,     0,    51,     0,     0,     0,     4,    62,
      27,    30,    11
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -78,   -78,   -78,   -78,   121,   -78,   -26,   -78,   -23,   -78,
     120,   -78,    -2,   -77,    -8,   -18,    93,   -78,     8
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     4,     5,     6,     7,    34,    60,    63,    12,    13,
       8,     9,    24,    25,    44,    97,    46,    98,    99
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      26,    45,    47,    61,    49,    50,    73,    74,    62,    64,
      26,   116,   117,    48,     1,     2,    35,    26,    10,    11,
      68,    14,    15,    51,    28,    70,    52,    29,    30,    31,
      32,     3,    33,    17,    90,    91,    67,    71,    72,    73,
      74,    75,    76,    77,    78,    79,    80,    81,    82,   131,
      84,    65,    54,   102,   103,   104,   105,   106,   107,   108,
     109,   110,   111,   112,   113,    66,   114,   120,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      26,    26,    83,    84,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,   128,   125,   127,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    52,    92,    85,    84,    88,    93,    94,    26,    86,
      95,    96,   115,   121,   122,   124,   132,    16,   126,    27,
      84,   129,     0,    89,     0,    69,     0,    54,    71,    72,
      73,    74,    87,     0,     0,    84,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,     0,   100,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    84,    52,     0,   118,     0,     0,
       0,     0,    84,    55,     0,     0,     0,     0,     0,     0,
       0,     0,   101,     0,     0,     0,    84,     0,     0,    53,
       0,    54,     0,    56,    57,    58,     0,    59,    84,    71,
      72,    73,    74,    75,    76,    77,    78,    79,    80,    81,
      82,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,     0,     0,     0,     0,     0,
      71,    72,    73,    74,   119,    84,    77,    78,    79,    80,
       0,     0,     0,     0,     0,   123,     0,    84,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,   130,    84,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    36,    37,    17,     0,     0,    84,     0,     0,     0,
       0,     0,     0,     0,     0,    38,     0,     0,     0,     0,
      18,     0,     0,     0,    84,     0,     0,     0,     0,     0,
      19,    20,    21,     0,    22,     0,    84,    23,    39,    40,
      41,     0,    42,     0,     0,    43
};

static const yytype_int8 yycheck[] =
{
       8,    19,    20,    29,    22,    23,     7,     8,    31,    32,
      18,    88,    89,    21,    29,    30,    18,    25,     4,     4,
      38,     4,     0,    25,    43,    43,    19,    48,    50,    49,
      17,    46,    23,     4,    52,    53,    17,     5,     6,     7,
       8,     9,    10,    11,    12,    13,    14,    15,    16,   126,
      51,     4,    45,    71,    72,    73,    74,    75,    76,    77,
      78,    79,    80,    81,    82,    22,    84,    93,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      88,    89,    50,    51,     5,     6,     7,     8,     9,    10,
      11,    12,    13,    14,    15,    16,   122,   115,   121,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,    19,     4,    50,    51,    36,    27,    27,   126,    27,
      50,    18,    34,    21,    48,    18,    22,     6,    37,     9,
      51,   123,    -1,    39,    -1,    42,    -1,    45,     5,     6,
       7,     8,    50,    -1,    -1,    51,     5,     6,     7,     8,
       9,    10,    11,    12,    13,    14,    15,    16,    -1,    18,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    51,    19,    -1,    20,    -1,    -1,
      -1,    -1,    51,     4,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    47,    -1,    -1,    -1,    51,    -1,    -1,    43,
      -1,    45,    -1,    24,    25,    26,    -1,    28,    51,     5,
       6,     7,     8,     9,    10,    11,    12,    13,    14,    15,
      16,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,     5,     6,     7,     8,     9,    10,    11,
      12,    13,    14,    15,    16,    -1,    -1,    -1,    -1,    -1,
       5,     6,     7,     8,    50,    51,    11,    12,    13,    14,
      -1,    -1,    -1,    -1,    -1,    49,    -1,    51,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    50,    51,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,     3,     4,     4,    -1,    -1,    51,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    17,    -1,    -1,    -1,    -1,
      21,    -1,    -1,    -1,    51,    -1,    -1,    -1,    -1,    -1,
      31,    32,    33,    -1,    35,    -1,    51,    38,    40,    41,
      42,    -1,    44,    -1,    -1,    47
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    29,    30,    46,    53,    54,    55,    56,    62,    63,
       4,     4,    60,    61,     4,     0,    56,     4,    21,    31,
      32,    33,    35,    38,    64,    65,    66,    62,    43,    48,
      50,    49,    17,    23,    57,    64,     3,     4,    17,    40,
      41,    42,    44,    47,    66,    67,    68,    67,    66,    67,
      67,    64,    19,    43,    45,     4,    24,    25,    26,    28,
      58,    58,    60,    59,    60,     4,    22,    17,    67,    68,
      67,     5,     6,     7,     8,     9,    10,    11,    12,    13,
      14,    15,    16,    50,    51,    50,    27,    50,    36,    39,
      67,    67,     4,    27,    27,    50,    18,    67,    69,    70,
      18,    47,    67,    67,    67,    67,    67,    67,    67,    67,
      67,    67,    67,    67,    67,    34,    65,    65,    20,    50,
      58,    21,    48,    49,    18,    67,    37,    60,    58,    70,
      50,    65,    22
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    52,    53,    54,    55,    56,    57,    58,    58,    58,
      58,    58,    59,    59,    60,    60,    61,    62,    62,    63,
      63,    63,    64,    64,    65,    65,    65,    65,    65,    65,
      65,    65,    65,    66,    66,    66,    67,    67,    67,    67,
      67,    67,    67,    67,    67,    67,    67,    67,    67,    67,
      68,    68,    68,    68,    68,    68,    68,    68,    68,    69,
      69,    70,    70
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     3,     7,     2,     2,     1,     1,     1,
       3,     5,     1,     0,     3,     1,     3,     0,     2,     5,
       1,     3,     1,     2,     3,     3,     3,     6,     4,     4,
       6,     4,     3,     1,     4,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     1,
       1,     4,     3,     2,     3,     1,     1,     1,     1,     1,
       0,     1,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 92 "parser.y" /* yacc.c:1646  */
    { theexpression = (yyvsp[0].ubody);}
#line 1474 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 97 "parser.y" /* yacc.c:1646  */
    { (yyval.ufunc) = makeFUNCTION((yyvsp[-2].uhead), (yyvsp[-1].ubody), (yyvsp[0].utail));}
#line 1480 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 99 "parser.y" /* yacc.c:1646  */
    {(yyval.uhead) = makeHEAD((yyvsp[-5].uid), (yyvsp[-3].upardecllist), (yyvsp[0].utype));}
#line 1486 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 101 "parser.y" /* yacc.c:1646  */
    {(yyval.ubody) = makeBODY((yyvsp[-1].udecllist), (yyvsp[0].ustmtlist));}
#line 1492 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 103 "parser.y" /* yacc.c:1646  */
    {(yyval.utail) = makeTAIL((yyvsp[0].uid));}
#line 1498 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 105 "parser.y" /* yacc.c:1646  */
    {(yyval.utype) = makeID((yyvsp[0].uid));}
#line 1504 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 106 "parser.y" /* yacc.c:1646  */
    {(yyval.utype) = makeINT();}
#line 1510 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 107 "parser.y" /* yacc.c:1646  */
    {(yyval.utype) = makeBOOL();}
#line 1516 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 108 "parser.y" /* yacc.c:1646  */
    {(yyval.utype) = makeARRAY((yyvsp[0].utype));}
#line 1522 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 109 "parser.y" /* yacc.c:1646  */
    {(yyval.utype) = makeRECORD((yyvsp[-1].uvardecllist));}
#line 1528 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 111 "parser.y" /* yacc.c:1646  */
    {(yyval.upardecllist) = makePDL((yyvsp[0].uvardecllist));}
#line 1534 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 112 "parser.y" /* yacc.c:1646  */
    {(yyval.upardecllist) = makePDL(NULL);}
#line 1540 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 114 "parser.y" /* yacc.c:1646  */
    {(yyval.uvardecllist) = makeVDL((yyvsp[-2].uvartype),(yyvsp[0].uvardecllist));}
#line 1546 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 115 "parser.y" /* yacc.c:1646  */
    {(yyval.uvardecllist) = makeVDL((yyvsp[0].uvartype),NULL);}
#line 1552 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 117 "parser.y" /* yacc.c:1646  */
    {(yyval.uvartype) = makeVAR_TYPE((yyvsp[-2].uid),(yyvsp[0].utype));}
#line 1558 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 119 "parser.y" /* yacc.c:1646  */
    {(yyval.udecllist) = makeDECL_LIST(0, 0);}
#line 1564 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 120 "parser.y" /* yacc.c:1646  */
    {(yyval.udecllist) = makeDECL_LIST((yyvsp[-1].udecl),(yyvsp[0].udecllist));}
#line 1570 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 122 "parser.y" /* yacc.c:1646  */
    {(yyval.udecl) = makeDECLid((yyvsp[-3].uid),(yyvsp[-1].utype));}
#line 1576 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 123 "parser.y" /* yacc.c:1646  */
    {(yyval.udecl) = makeDECLfunc((yyvsp[0].ufunc));}
#line 1582 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 124 "parser.y" /* yacc.c:1646  */
    {(yyval.udecl) = makeDECLlist((yyvsp[-1].uvardecllist));}
#line 1588 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 126 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmtlist) = makeSTM_LISTstmtlist((yyvsp[0].ustmt),NULL);}
#line 1594 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 127 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmtlist) = makeSTM_LISTstmtlist((yyvsp[-1].ustmt),(yyvsp[0].ustmtlist));}
#line 1600 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 129 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMreturn((yyvsp[-1].uexp));}
#line 1606 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 130 "parser.y" /* yacc.c:1646  */
    { (yyval.ustmt) = makeSTMwrite((yyvsp[-1].uexp));}
#line 1612 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 131 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMallocate((yyvsp[-1].uvar));}
#line 1618 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 132 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMallocateLength((yyvsp[-4].uvar),(yyvsp[-1].uexp));}
#line 1624 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 133 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMassign((yyvsp[-3].uvar),(yyvsp[-1].uexp));}
#line 1630 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 134 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMif_then((yyvsp[-2].uexp),(yyvsp[0].ustmt));}
#line 1636 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 135 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMif_then_else((yyvsp[-4].uexp),(yyvsp[-2].ustmt),(yyvsp[0].ustmt));}
#line 1642 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 136 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMwhile_do((yyvsp[-2].uexp),(yyvsp[0].ustmt));}
#line 1648 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 137 "parser.y" /* yacc.c:1646  */
    {(yyval.ustmt) = makeSTMlist((yyvsp[-1].ustmtlist));}
#line 1654 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 139 "parser.y" /* yacc.c:1646  */
    {(yyval.uvar) = makeVARIABLEid((yyvsp[0].uid));}
#line 1660 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 140 "parser.y" /* yacc.c:1646  */
    {(yyval.uvar) = makeVARIABLEexp((yyvsp[-3].uvar),(yyvsp[-1].uexp));}
#line 1666 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 141 "parser.y" /* yacc.c:1646  */
    {(yyval.uvar) = makeVARIABLEdot((yyvsp[0].uid),(yyvsp[-2].uvar));}
#line 1672 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 143 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPplus((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1678 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 144 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPminus((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1684 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 145 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPtimes((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1690 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 146 "parser.y" /* yacc.c:1646  */
    {printf("Modulo operation not yet implemented");}
#line 1696 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 147 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPdiv((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1702 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 148 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPeq((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1708 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 149 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPne((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1714 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 150 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPle((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1720 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 151 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPge((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1726 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 152 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPless((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1732 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 153 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPgreat((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1738 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 154 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPand((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1744 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 155 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPor((yyvsp[-2].uexp),(yyvsp[0].uexp));}
#line 1750 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 156 "parser.y" /* yacc.c:1646  */
    {(yyval.uexp) = makeEXPterm((yyvsp[0].uterm));}
#line 1756 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 158 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMvar((yyvsp[0].uvar));}
#line 1762 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 159 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMact_list((yyvsp[-3].uid),(yyvsp[-1].uactlist));}
#line 1768 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 160 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMexp((yyvsp[-1].uexp));}
#line 1774 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 161 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMnotTerm((yyvsp[0].uterm));}
#line 1780 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 162 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMexpCard((yyvsp[-1].uexp));}
#line 1786 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 163 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMnum((yyvsp[0].uint));}
#line 1792 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 164 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMtrue();}
#line 1798 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 165 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMfalse();}
#line 1804 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 166 "parser.y" /* yacc.c:1646  */
    {(yyval.uterm) = makeTERMnull();}
#line 1810 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 168 "parser.y" /* yacc.c:1646  */
    {(yyval.uactlist) = makeACT_LIST((yyvsp[0].uexplist));}
#line 1816 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 169 "parser.y" /* yacc.c:1646  */
    {(yyval.uactlist) = makeACT_LIST(NULL);}
#line 1822 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 171 "parser.y" /* yacc.c:1646  */
    {(yyval.uexplist) = makeEXP_LIST((yyvsp[0].uexp),NULL);}
#line 1828 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 172 "parser.y" /* yacc.c:1646  */
    {(yyval.uexplist) = makeEXP_LIST((yyvsp[-2].uexp),(yyvsp[0].uexplist));}
#line 1834 "y.tab.c" /* yacc.c:1646  */
    break;


#line 1838 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 173 "parser.y" /* yacc.c:1906  */
