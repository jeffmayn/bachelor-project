#include "del3Pretty.h"
#include <stdio.h>
#include <string.h>

void prettyDel3PrintStart(BODY *program){
  char *indentstring = "       ";
  fprintf(stderr, "%s\n", "program body");
  prettyDel3DeclList(indentstring);
  prettyDel3StmtList(indentstring);
}

void prettyDel3DeclList(char* indentstring){
  indentstring += "|\__"
  fprintf(stderr, "%s %s\n", indentstring, "program body");
}

void prettyDel3StmtList(char* indentstring){
  indentstring += "\___"
  fprintf(stderr, "%s %s\n", indentstring, "program body");
}
