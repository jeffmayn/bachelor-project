%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>

extern int lineno;
extern int charpos;

#define NCP (charpos+=yyleng)

int nestedcomments = 0;
%}

%option noyywrap
%x COMMENT ONELINECOMMENT
%%
<INITIAL>"+"    { NCP; return tPLUS;}
<INITIAL>"-"    { NCP; return tMINUS;}
<INITIAL>"*"    { NCP; return tTIMES;}
<INITIAL>"/"    { NCP; return tDIV;}
<INITIAL>"=="   { NCP; return tEQ;}
<INITIAL>"!="   { NCP; return tNE;}
<INITIAL>"<="   { NCP; return tLE;}
<INITIAL>">="   { NCP; return tGE;}
<INITIAL>"<"    { NCP; return tLESS;}
<INITIAL>">"    { NCP; return tGREAT;}
<INITIAL>"&&"   { NCP; return tAND;}
<INITIAL>" || " { NCP; return tOR;}

<INITIAL>"="    { NCP; return tASSI;}

<INITIAL>"("    { NCP; return tLPAR;}
<INITIAL>")"    { NCP; return tRPAR;}
<INITIAL>"["    { NCP; return tLSQ;}
<INITIAL>"]"    { NCP; return tRSQ;}
<INITIAL>"{"    { NCP; return tLCURL;}
<INITIAL>"}"    { NCP; return tRCURL;}
<INITIAL>"|"    { NCP; return tBAR;}

<INITIAL>"!"    { NCP; return tNEG;}

<INITIAL>";"    { NCP; return tSEMI;}
<INITIAL>":"    { NCP; return tCOL;}
<INITIAL>","    { NCP; return tCOM;}
<INITIAL>"."    { NCP; return tDOT;}

<INITIAL>"true"     { NCP; return tTRUE;}
<INITIAL>"false"    { NCP; return tFALSE;}
<INITIAL>"null"     { NCP; return tNULL;}

<INITIAL>"int"      { NCP; return tINTTYPE;}
<INITIAL>"bool"     { NCP; return tBOOLTYPE;}
<INITIAL>"array"    { NCP; return tARRAYTYPE;}
<INITIAL>"record"   { NCP; return tRECORDTYPE;}

<INITIAL>"of"       { NCP; return tOF;}

<INITIAL>"func"     { NCP; return tFUNC;}
<INITIAL>"type"     { NCP; return tTYPE;}
<INITIAL>"end"      { NCP; return tEND;}
<INITIAL>"var"      { NCP; return tVAR;}
<INITIAL>"return"   { NCP; return tRETURN;}
<INITIAL>"write"    { NCP; return tWRITE;}
<INITIAL>"allocate" { NCP; return tALLOC;}
<INITIAL>"length"   { NCP; return tLEN;}
<INITIAL>"if"       { NCP; return tIF;}
<INITIAL>"else"     { NCP; return tELSE;}
<INITIAL>"then"     { NCP; return tTHEN;}
<INITIAL>"while"    { NCP; return tWHILE;}
<INITIAL>"do"       { NCP; return tDO;}

<INITIAL>0|[1-9][0-9]*          { yylval.uint = atoi(yytext);
                                  NCP; return tINT;}
<INITIAL>[a-zA-Z][a-zA-Z0-9_]*  { yylval.uid = (char *) malloc(strlen(yytext)+1);
                                  sprintf(yylval.uid, "%s", yytext);
                                  NCP; return tID;}

<INITIAL>[ \t\r]  { NCP; /*ignore*/}
<INITIAL>"(*"     { NCP; nestedcomments++; BEGIN COMMENT;}
<INITIAL>#        { NCP; BEGIN ONELINECOMMENT;}
<INITIAL>\n       { charpos = 0; lineno++;}
<INITIAL>.        { NCP; /*TODO Errors*/}

<COMMENT>"(*"   { NCP; nestedcomments++;}
<COMMENT>"*)"   { NCP; nestedcomments--;
                  if(nestedcomments==0){BEGIN INITIAL;}}
<COMMENT>\n     { charpos = 0; lineno++;}
<COMMENT>.      { NCP; /*ignore*/}

<ONELINECOMMENT>\n  { charpos = 0; lineno++; BEGIN INITIAL;}
<ONELINECOMMENT>.   { NCP; /*ignore*/}
%%
