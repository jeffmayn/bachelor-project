%{
#include <stdio.h>
#include "y.tab.h"//S
int lineNo = 0;
int linePos = 0;

/*<INITIAL>"=="   { return '==';}*/
/*<INITIAL>"!="   { return '!=';}*/
/*<INITIAL>"<="   { return '<=';}*/
/*<INITIAL>">="   { return '>=';}*/
/*<INITIAL>"&&"   { return '&&';}*/
/*<INITIAL>"||"   { return '||';}*/
%}

NUMBER
ID

%option noyywrap
%x COMMENT ONELINECOMMENT
%%
<INITIAL>"+"    { printf("lex +\n"); return '+';}
<INITIAL>"-"    { return '-';}
<INITIAL>"*"    { return '*';}
<INITIAL>"/"    { return '/';}

<INITIAL>"<"    { return '<';}
<INITIAL>">"    { return '>';}

<INITIAL>"("    { return '(';}
<INITIAL>")"    { return ')';}

<INITIAL>[a-zA-Z][a-zA-Z0-9_]*     { /*yylval.stringconst = (char *) malloc(strlen(yytext)+1);
                    sprintf(yylval.stringconst, "%s", yytext);
                    return tID;*/}

<INITIAL>0|[1-9][0-9]* { yylval.unum = atoi(yytext);
                    printf("lex int\n");
                    return tINT;
                    }

<INITIAL>"(*"                       { BEGIN COMMENT;}
<INITIAL>#                          { BEGIN ONELINECOMMENT;}
<INITIAL>\n                         { lineNo++;}
<INITIAL>.                          /*TODO errors*/

<COMMENT>"*)"                       { BEGIN INITIAL;}
<COMMENT>\n                         { lineNo++;}
<COMMENT>.                          { /*ignore*/}

<ONELINECOMMENT>\n                  { lineNo++; BEGIN INITIAL;}
<ONELINECOMMENT>.                   { /*ignore*/}
%%
