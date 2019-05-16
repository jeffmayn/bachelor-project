%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>
#include "memory.h"

extern int lineno;
extern int charpos;

#define NCP (charpos+=yyleng) /*Next Character Position*/
/*<INITIAL>" || " { NCP; return tOR;}*/

int nestedcomments = 0;
int insideABS = 0;
int freshEXP = 0;
int secondOR = 0;
%}

%option noyywrap
%x COMMENT ONELINECOMMENT
%%
<INITIAL>"+"    { NCP; freshEXP = 1; return tPLUS;}
<INITIAL>"-"    { NCP; freshEXP = 1; return tMINUS;}
<INITIAL>"*"    { NCP; freshEXP = 1; return tTIMES;}
<INITIAL>"/"    { NCP; freshEXP = 1; return tDIV;}
<INITIAL>"=="   { NCP; freshEXP = 1; return tEQ;}
<INITIAL>"!="   { NCP; freshEXP = 1; return tNE;}
<INITIAL>"<="   { NCP; freshEXP = 1; return tLE;}
<INITIAL>">="   { NCP; freshEXP = 1; return tGE;}
<INITIAL>"<"    { NCP; freshEXP = 1; return tLESS;}
<INITIAL>">"    { NCP; freshEXP = 1; return tGREAT;}
<INITIAL>"&&"   { NCP; freshEXP = 1; return tAND;}

<INITIAL>"="    { NCP; freshEXP = 1; return tASSI;}

<INITIAL>"("    { NCP; freshEXP = 1; return tLPAR;}
<INITIAL>")"    { NCP; freshEXP = 0; return tRPAR;}
<INITIAL>"["    { NCP; freshEXP = 1; return tLSQ;}
<INITIAL>"]"    { NCP; freshEXP = 0; return tRSQ;}
<INITIAL>"{"    { NCP; return tLCURL;}
<INITIAL>"}"    { NCP; return tRCURL;}
<INITIAL>"|"    { NCP; 	if(secondOR == 1) {	
							secondOR == 0;
							return tOR;
						} else if (freshEXP == 1){
							insideABS++;
							freshEXP = 1;
							return tBAR;
						} else if (freshEXP == 0 && insideABS > 0){
							insideABS--;
							freshEXP = 0;
							return tBAR;
						} else if (freshEXP == 0 && insideABS == 0){
							freshEXP = 1;
							secondOR = 1;
							return tOR;
						};
				}

<INITIAL>"!"    { NCP; return tNEG;}

<INITIAL>";"    { NCP; freshEXP = 1; return tSEMI;}
<INITIAL>":"    { NCP; return tCOL;}
<INITIAL>","    { NCP; return tCOM;}
<INITIAL>"."    { NCP; freshEXP = 0; return tDOT;}

<INITIAL>"true"     { NCP; freshEXP = 0; return tTRUE;}
<INITIAL>"false"    { NCP; freshEXP = 0; return tFALSE;}
<INITIAL>"null"     { NCP; freshEXP = 0; return tNULL;}

<INITIAL>"int"      { NCP; return tINTTYPE;}
<INITIAL>"bool"     { NCP; return tBOOLTYPE;}
<INITIAL>"array"    { NCP; return tARRAYTYPE;}
<INITIAL>"record"   { NCP; return tRECORDTYPE;}

<INITIAL>"of"       { NCP; return tOF;}

<INITIAL>"func"     { NCP; return tFUNC;}
<INITIAL>"type"     { NCP; return tTYPE;}
<INITIAL>"end"      { NCP; return tEND;}
<INITIAL>"var"      { NCP; return tVAR;}
<INITIAL>"return"   { NCP; freshEXP = 1; return tRETURN;}
<INITIAL>"write"    { NCP; freshEXP = 1; return tWRITE;}
<INITIAL>"allocate" { NCP; return tALLOC;}
<INITIAL>"length"   { NCP; freshEXP = 1; return tLEN;}
<INITIAL>"if"       { NCP; freshEXP = 1; return tIF;}
<INITIAL>"else"     { NCP; freshEXP = 1; return tELSE;}
<INITIAL>"then"     { NCP; return tTHEN;}
<INITIAL>"while"    { NCP; freshEXP = 1; return tWHILE;}
<INITIAL>"do"       { NCP; freshEXP = 1; return tDO;}
<INITIAL>"break"	{ NCP; return tBREAK;}
<INITIAL>"continue"	{ NCP; return tCONTINUE;}

<INITIAL>0|[1-9][0-9]*          { yylval.uint = atoi(yytext);
                                  NCP; freshEXP = 0; 
                                  return tINT;}
<INITIAL>[a-zA-Z][a-zA-Z0-9_]*  { yylval.uid = (char *) Malloc(strlen(yytext)+1);
                                  sprintf(yylval.uid, "%s", yytext);
                                  NCP; freshEXP = 0;
                                  return tID;}

<INITIAL>[ \t\r]  { NCP; /*ignore*/}
<INITIAL>"(*"     { NCP; nestedcomments++; BEGIN COMMENT;}
<INITIAL>#        { NCP; BEGIN ONELINECOMMENT;}
<INITIAL>\n       { charpos = 0; lineno++;}
<INITIAL>.        { NCP; yyerror();}

<COMMENT>"(*"     { NCP; nestedcomments++;}
<COMMENT>"*)"     { NCP; nestedcomments--;
                    if(nestedcomments==0){BEGIN INITIAL;}}
<COMMENT>\n       { charpos = 0; lineno++;}
<COMMENT><<EOF>>  { yyerror(); BEGIN INITIAL;}
<COMMENT>.        { NCP; /*ignore*/}

<ONELINECOMMENT>\n  { charpos = 0; lineno++; BEGIN INITIAL;}
<ONELINECOMMENT>.   { NCP; /*ignore*/}
%%
