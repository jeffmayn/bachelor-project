%{
#include <stdio.h>
#include "tree.h"
#include "y.tab.h"
int lineNo = 0;
%}

%option noyywrap
%start INITIAL COMMENT ONELINECOMMENT
%%
<INITIAL>"+"    { return tOP;}/*noget med at finde ud af hvilken operator det er*/
<INITIAL>"-"    { return tOP;}
<INITIAL>"*"    { return tOP;}
<INITIAL>"/"    { return tOP;}
<INITIAL>"=="   { return tOP;}
<INITIAL>"!="   { return tOP;}
<INITIAL>"<"    { return tOP;}
<INITIAL>">"    { return tOP;}
<INITIAL>"<="   { return tOP;}
<INITIAL>">="   { return tOP;}
<INITIAL>"&&"   { return tOP;}
<INITIAL>"||"   { return tOP;}

<INITIAL>[a-zA-Z][a-zA-Z0-9_]*  { yylval.stringconst = (char *) malloc(strlen(yytext)+1);
                                  sprintf(yylval.stringconst, "%s", yytext);
                                  return tID;}

<INITIAL>0|[1-9][0-9]*  { yylval.intconst = atoi(yytext);
                          return tINT;}

<INITIAL>"(*"                       { BEGIN COMMENT;}
<INITIAL>#                          { BEGIN ONELINECOMMENT;}
<INITIAL>\n                         { lineNo++;}
<INITIAL>.                          /*TODO errors*/

<COMMENT>"*)"                       { BEGIN INITIAL;}
<COMMENT>\n                         { lineNo++;}
<COMMENT>.                          /*ignore*/
<ONELINECOMMENT>\n                  { lineNo++; BEGIN <INITIAL>;}
<ONELINECOMMENT>.                   /*ignore*/

%%
void main() {
  yylex();
}
