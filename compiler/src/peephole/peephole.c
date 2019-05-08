#include "internalASM.h"
#include "patterns.h"
#include "memory.h"
#include "tree.h"
#include "typecheck.h"
#include <string.h>

/*list of function pointers to patterns I DO NOT KNOW IF THIS WORKS!*/
int (*func_list[NRPATTERNS])(INSTR* instr) = {	incPattern, 
												decPattern};

//when introducing a new pattern remember it needs to change the next, not the current

/**
 * called from main, runs peephole optimization.
 */
int peephole(){
	int error = 0;
	changeMade = 1;
	while(changeMade != 0){
		changeMade = 0;

		error = loopInternalRep();
		if(error != 0){
			fprintf(stderr, "%s\n", "peephole error halt");
			return -1;
		}
	}
	return 0;
}

/**
 * loops over entire internal representation from start to finish
 * calling loopPatterns
 */
int loopInternalRep(){
	int error = 0;

	INSTR *current = intermediateHead;

	while(current != NULL){
		error = loopPatterns(current);
		if(error != 0){
			fprintf(stderr, "%s\n", "loopPatterns error halt");
			return -1;
		}
		current = current->next;
	}
	return 0;
}

int loopPatterns(INSTR* instrucktion){
	int error = 0;
	int currentPattern = 0;

	while(currentPattern < NRPATTERNS){
		error = func_list[currentPattern](instrucktion);
		currentPattern++;
	}
	return 0;
}

int wastedMovq(INSTR* instr){
	OPERAND *o1, *o2, *o3, *o4;
	INSTR *instrTarget = instr->next;
	INSTR *instrNext = instrTarget->next;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == movI){
			if(instrNext->instrKind == movI){
				o1 = instrTarget->paramList;
				o2 = instrTarget->paramList->next;
				o3 = instrNext->paramList;
				o4 = instrNext->paramList->next;
				if(o1->operandKind == registerO && o2->operandKind == registerO && o3->operandKind == registerO && o4->operandKind == registerO){
					if(o1->val.reg == o4->val.reg){
						if(o2->val.reg == o3->val.reg){
							fprintf(stderr, "%s\n", "I found one!");
						}
					}
				}
			}
		}




	}



	return 0;
}

/**
 * look for a pattern where "addq $1, x" is used instead of "inc x"
 */
int incPattern(INSTR *instr){
	OPERAND *leftOP, *temp;
	INSTR *replacement;
	INSTR *instrTarget = instr->next;
	if(instrTarget != NULL){//we are not at the end.
		if(instrTarget->instrKind == movI){
			leftOP = instrTarget->paramList;
			if(leftOP->operandKind == constantO){
				if(leftOP->val.constant == 1 && leftOP->next->operandKind == registerO){
					if(leftOP->next->val.reg == RBX){
						if(instrTarget->next->instrKind == addI){
							temp = instrTarget->next->paramList->next;
							replacement = IRmakeIncINSTR(temp);
							replacement->next = instrTarget->next->next;
							instr->next = replacement;
						}
					}
				}
			}
		}
	}

	return 0;
}

/**
 * look for a pattern where "subq $1, x" is used instead of "dec x"
 */
int decPattern(INSTR *instr){
	OPERAND *leftOP, *temp;
	INSTR *replacement;
	INSTR *instrTarget = instr->next;
	if(instrTarget != NULL){//we are not at the end.
		if(instrTarget->instrKind == movI){
			leftOP = instrTarget->paramList;
			if(leftOP->operandKind == constantO){
				if(leftOP->val.constant == 1 && leftOP->next->operandKind == registerO){
					if(leftOP->next->val.reg == RBX){
						if(instrTarget->next->instrKind == subI){
							temp = instrTarget->next->paramList->next;
							replacement = IRmakeDecINSTR(temp);
							replacement->next = instrTarget->next->next;
							instr->next = replacement;
						}
					}
				}
			}
		}
	}

	return 0;
}