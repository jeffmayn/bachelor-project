%{
#include <stdio.h>
#include "tree.h"
#include "y.tab.h"
int lineNo = 0;
int linePos = 0;
%}

NUMBER    0|[1-9][0-9]*
ID        [a-zA-Z][a-zA-Z0-9_]*
VAR_TYPE  ID" ":" "(id|int|bool|array" "of" ("VAR_TYPE")"|record" "of" ("VAR_TYPE(,VAR_TYPE)*")"

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

<INITIAL>{ID}     { yylval.stringconst = (char *) malloc(strlen(yytext)+1);
                    sprintf(yylval.stringconst, "%s", yytext);
                    return tID;}

<INITIAL>{NUMBER} { yylval.intconst = atoi(yytext);
                    return tINT;}

<INITIAL>func" "ID" ("VAR_TYPE")"    {/*return <head> token here or something*/}

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
