%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>
extern int lineno;
int nestedcomments = 0;
/*int linePos = 0;*/
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
<INITIAL>" || " { return tOR;/*her kan der gøres noget smartere måske!*/}

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
<INITIAL>"record"   { return tRECORDTYPE;}

<INITIAL>"of"       { return tOF;}

<INITIAL>"func"     { return tFUNC;}
<INITIAL>"type"     { return tTYPE;}
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
                                  return tINT;}
<INITIAL>[a-zA-Z][a-zA-Z0-9_]*  { yylval.uid = (char *) malloc(strlen(yytext)+1);
                                  sprintf(yylval.uid, "%s", yytext);
                                  return tID;}


<INITIAL>[ \t\r]  /*ignore*/
<INITIAL>"(*"     { nestedcomments++; BEGIN COMMENT;}
<INITIAL>#        { BEGIN ONELINECOMMENT;}
<INITIAL>\n       { lineno++;}
<INITIAL>.        /*TODO errors*/

<COMMENT>"(*"   { nestedcomments++;}
<COMMENT>"*)"   { nestedcomments--;
                  if(nestedcomments==0){BEGIN INITIAL;}}
<COMMENT>\n     { lineno++;}
<COMMENT>.      /*ignore*/

<ONELINECOMMENT>\n  { lineno++; BEGIN INITIAL;}
<ONELINECOMMENT>.   /*ignore*/
%%
