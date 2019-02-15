%{
#include <stdio.h>
#include "y.tab.h"
int lineNo = 0;
int linePos = 0;
%}

%option noyywrap
%x COMMENT ONELINECOMMENT
%%
<INITIAL>"+"    { return tPLUS;}
<INITIAL>"-"    { return tMINUS;}
<INITIAL>"*"    { return tTIMES;}
<INITIAL>"/"    { return tDIV;}
<INITIAL>"=="   { return tEQ;}
<INITIAL>"!="   { return tNE;}
<INITIAL>"<="   { return tLE;}
<INITIAL>">="   { return tGE;}
<INITIAL>"<"    { return tLESS;}
<INITIAL>">"    { return tGREAT;}
<INITIAL>"&&"   { return tAND;}
<INITIAL>"||"   { return tOR;}

<INITIAL>"="    { return tASSI;}

<INITIAL>"("    { return tLPAR;}
<INITIAL>")"    { return tRPAR;}
<INITIAL>"["    { return tLSQ;}
<INITIAL>"]"    { return tRSQ;}
<INITIAL>"{"    { return tLCURL;}
<INITIAL>"}"    { return tRCURL;}
<INITIAL>"|"    { return tBAR;}

<INITIAL>"!"    { return tNEG;}

<INITIAL>";"    { return tSEMI;}
<INITIAL>":"    { return tCOL;}
<INITIAL>","    { return tCOM;}
<INITIAL>"."    { return tDOT;}

<INITIAL>"true"     { return tTRUE;}
<INITIAL>"false"    { return tFALSE;}
<INITIAL>"null"     { return tNULL;}

<INITIAL>"int"      { return tINTTYPE;}
<INITIAL>"bool"     { return tBOOLTYPE;}
<INITIAL>"array"    { return tARRAYTYPE;}
<INITIAL>"of"       { return tOFTYPE;}
<INITIAL>"record"   { return tRECORDTYPE;}

<INITIAL>"func"     { return tFUNC;}
<INITIAL>"end"      { return tEND;}
<INITIAL>"var"      { return tVAR;}
<INITIAL>"return"   { return tRETURN;}
<INITIAL>"write"    { return tWRITE;}
<INITIAL>"allocate" { return tALLOC;}
<INITIAL>"length"   { return tLEN;}
<INITIAL>"if"       { return tIF;}
<INITIAL>"else"     { return tELSE;}
<INITIAL>"then"     { return tTHEN;}
<INITIAL>"while"    { return tWHILE;}
<INITIAL>"do"       { return tDO;}

<INITIAL>0|[1-9][0-9]*          { yylval.uint = atoi(yytext);
                                  printf("lex int\n");
                                  return tINT;}
<INITIAL>[a-zA-Z][a-zA-Z0-9_]*  { /*yylval.stringconst = (char *) malloc(strlen(yytext)+1);
                                  sprintf(yylval.stringconst, "%s", yytext);
                                  return tID;*/}

<INITIAL>"(*"   { BEGIN COMMENT;}
<INITIAL>#      { BEGIN ONELINECOMMENT;}
<INITIAL>\n     { lineNo++;}
<INITIAL>.      /*TODO errors*/

<COMMENT>"*)"   { BEGIN INITIAL;}
<COMMENT>\n     { lineNo++;}
<COMMENT>.      /*ignore*/

<ONELINECOMMENT>\n  { lineNo++; BEGIN INITIAL;}
<ONELINECOMMENT>.   /*ignore*/
%%
