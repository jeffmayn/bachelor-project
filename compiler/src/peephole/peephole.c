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

int incPattern(INSTR *instr){

	INSTR *replacement;
	INSTR *instrTarget = instr->next;
	int lookAhead = 0;
	registers reg;
	if(instrTarget != NULL){//we are not at the end.
		if(instrTarget->instrKind == movI){
			OPERAND *leftOP = instrTarget->paramList;
			if(leftOP->operandKind == constantO){
				if(leftOP->val.constant == 1 && leftOP->next->operandKind == registerO){
					if(instrTarget->next->next->instrKind == addI){

						//replacement = IRmakeIncINSTR(IRmakeRegOPERAND());
					}
				}
			}
		}
	}



	return 0;
}

int decPattern(INSTR *instr){
	OPERAND *leftOP;
	if(instr->instrKind == subI){
		leftOP = instr->paramList;
		if(leftOP->operandKind == constantO){
			if(leftOP->val.constant == 1){
				fprintf(stderr, "%s\n", "sub: WE CAN REPLACE THIS SHIT!");
			}
		}	}
	return 0;
}