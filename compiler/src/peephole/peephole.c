#include "internalASM.h"
#include "patterns.h"
#include "memory.h"
#include "tree.h"
#include "typecheck.h"
#include <string.h>

/* list of function pointers to patterns */
int (*func_list[NRPATTERNS])(INSTR* instr) = {	incPattern,
												decPattern,
												wastedMovq,
												wastedMovqSeq,
												addZero,
												addOne,
												moveToSelf};

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

/*loop over all patterns*/
int loopPatterns(INSTR* instrucktion){
	int error = 0;
	int currentPattern = 0;

	while(currentPattern < NRPATTERNS){
		error = func_list[currentPattern](instrucktion);
		currentPattern++;
	}
	return error;
}

/**
	looks for pattern 	"movq %rbx, x
						 movq x, %rbx"
	always removes second move, checks with liveness
	if first move can be removed as well.
	*/
int wastedMovq(INSTR* instr){
	OPERAND *o1, *o2, *o3, *o4;
	INSTR *instrTarget = instr->next;
	INSTR *instrNext;
	TempList *outList;
	TempListNode *liveNode;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == movI){
			instrNext = instrTarget->next;
			if(instrNext != NULL){
				if(instrNext->instrKind == movI){
					o1 = instrTarget->paramList;
					o2 = instrTarget->paramList->next;
					o3 = instrNext->paramList;
					o4 = instrNext->paramList->next;
					if(o1->operandKind == registerO){
						if(o2->operandKind == temporaryO){
							if(o3->operandKind == temporaryO){
								if(o4->operandKind == registerO){
									if(o1->val.reg == RBX){
										if(o4->val.reg == RBX){
											outList = lia[instrNext->id].out;
											liveNode = outList->head;
											if(o2->val.temp == o3->val.temp ){
												instrTarget->next = instrNext->next; //remove second move
												changeMade = 1;
												while(liveNode != NULL){
													if(liveNode->temp == o2->val.temp){
														return 0; //temporary is still live out
													}
													liveNode = liveNode->next;
												}
												instr->next = instrTarget->next; //remove first move
											}
											else if(o2->val.temp->temporarykind == regT){
												if(o3->val.temp->temporarykind == regT){
													if(o2->val.temp->placement.reg == o3->val.temp->placement.reg){
														instrTarget->next = instrNext->next; //remove second move
														changeMade = 1;
														while(liveNode != NULL){
															if(liveNode->temp->temporarykind == regT){
																if(liveNode->temp->placement.reg == o2->val.temp->placement.reg){
																		return 0; //temporary is still live out
																}
															}
															liveNode=liveNode->next;
														}
														instr->next = instrTarget->next; //remove first move
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return 0;
}

/**
	collapses a sequence of moves into a single move
	when possible. Checks with liveness to ensure
	nothing is lost. rbx is almost never liveout. *fingers crossed*
	*/
int wastedMovqSeq(INSTR* instr){
	//return 0;
	OPERAND *o1, *o2, *o3, *o4;
	registers r2, r3;
	INSTR *instrTarget = instr->next;
	INSTR *instrNext;
	TempList *outList;
	TempListNode *liveNode;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == movI){
			instrNext = instrTarget->next;
			if(instrNext != NULL){
				if(instrNext->instrKind == movI){
					o1 = instrTarget->paramList;
					o2 = instrTarget->paramList->next;
					o3 = instrNext->paramList;
					o4 = instrNext->paramList->next;
					if(o1->operandKind == registerO //ensure at least one operand to be register
						|| (o1->operandKind == temporaryO && o1->val.temp->temporarykind == regT)
						|| o4->operandKind == registerO
						|| (o4->operandKind == temporaryO && o4->val.temp->temporarykind == regT)) {
						r2=NA;
						r3=NA;
						if(o2->operandKind == registerO){
							r2 = o2->val.reg;
						}
						else if(o2->operandKind == temporaryO){
							outList = lia[instrNext->id].out;
							liveNode = outList->head;
							while(liveNode != NULL){
								if(liveNode->temp == o2->val.temp){
									return 0; //temporary is still live out
								}
								liveNode = liveNode->next;
							}
							if(o2->val.temp->temporarykind == regT){
								r2 = o2->val.temp->placement.reg;
							}
						}
	
						if(o3->operandKind == registerO){
							r3 = o3->val.reg;
						}
						else if(o3->operandKind == temporaryO && o3->val.temp->temporarykind == regT){
							r3 = o3->val.temp->placement.reg;
						}
						if(o2->operandKind == temporaryO && o3->operandKind == temporaryO){
							if(o2->val.temp == o3->val.temp){
								//combine the two moves
								instrTarget->paramList->next = o4;
								instrTarget->next = instrNext->next;
								changeMade = 1;
							}
						}
						else if(r2 != NA && r2 == r3){
							//combine the two moves
							instrTarget->paramList->next = o4;
							instrTarget->next = instrNext->next;
							changeMade = 1;
						}
					}
				}
			}
		}
	}
	return 0;
}

/**
	looks for pattern "addq $0, x"
	and remove it
	*/
int addZero(INSTR *instr){
	INSTR *instrTarget = instr->next;
	INSTR *instrNext;
	OPERAND *op;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == addI || instrTarget->instrKind == subI){
			op = instrTarget->paramList;
			if(op->operandKind == constantO){
				if(op->val.constant == 0){
					instr->next = instrTarget->next;
					changeMade = 1;
				}
			}
		}
	}
	return 0;
}

/**
	looks for pattern "addq $1, x"
	replace it with "incq x"
	*/
int addOne(INSTR *instr){
	INSTR *instrTarget = instr->next;
	INSTR *replacement;
	OPERAND *op1, *op2;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == addI || instrTarget->instrKind == subI){
			op1 = instrTarget->paramList;
			op2 = instrTarget->paramList->next;
			if(op1->operandKind == constantO){
				if(op1->val.constant == 1){
					replacement = IRmakeIncINSTR(op2);
					replacement->next = instrTarget->next;
					instr->next = replacement;
					changeMade = 1;
				}
			}
		}
	}
	return 0;
}

/**
	looks for pattern "movq %x, %x" and removes it.
	*/
int moveToSelf(INSTR *instr){
	INSTR *instrTarget = instr->next;
	OPERAND *op1, *op2;
	registers r1, r2;
	if(instrTarget != NULL){
		if(instrTarget->instrKind == movI){
			op1 = instrTarget->paramList;
			op2 = instrTarget->paramList->next;
			r1 = NA;
			r2 = NA;
			if(op1->operandKind == registerO){
				r1 = op1->val.reg;
			}
			else if(op1->operandKind == temporaryO && op1->val.temp->temporarykind == regT){
				r1 = op1->val.temp->placement.reg;
			}
			if(op2->operandKind == registerO){
				r2 = op2->val.reg;
			}
			else if(op2->operandKind == temporaryO && op2->val.temp->temporarykind == regT){
				r2 = op2->val.temp->placement.reg;
			}
			if(r1 != NA && r1==r2){
				instr->next = instrTarget->next;
				changeMade = 1;
			}
		}
	}
	return 0;
}

/**
 * look for a pattern "movq $1, %rbx
 					  "addq rbx, x" 

   replace it with "incq x"
 */
int incPattern(INSTR *instr){
	OPERAND *leftOP, *temp;
	INSTR *replacement;
	INSTR *instrTarget = instr->next;
	if(instrTarget != NULL){//we are not at the end.
		if(instrTarget->instrKind == movI){
			leftOP = instrTarget->paramList;
			if(leftOP->operandKind == constantO){
				if(leftOP->val.constant == 1 &&
					leftOP->next->operandKind == registerO){
					if(leftOP->next->val.reg == RBX){
						if(instrTarget->next->instrKind == addI){
							if(instrTarget->next->paramList->operandKind == registerO){
								if(instrTarget->next->paramList->val.reg == RBX){
									temp = instrTarget->next->paramList->next;
									replacement = IRmakeIncINSTR(temp);
									replacement->next = instrTarget->next->next;
									//instrTarget->next = replacement;
									instr->next = replacement;
									changeMade = 1;
								}
							}
						}
					}
				}
			}
		}
	}

	return 0;
}

/**
 * look for a pattern "movq $1, %rbx
 					  "subq rbx, x" 

   replace it with "decq x"
 */
int decPattern(INSTR *instr){
	OPERAND *leftOP, *temp;
	INSTR *replacement;
	INSTR *instrTarget = instr->next;
	if(instrTarget != NULL){//we are not at the end.
		if(instrTarget->instrKind == movI){
			leftOP = instrTarget->paramList;
			if(leftOP->operandKind == constantO){
				if(leftOP->val.constant == 1 &&
					leftOP->next->operandKind == registerO){
					if(leftOP->next->val.reg == RBX){
						if(instrTarget->next->instrKind == subI){
							if(instrTarget->next->paramList->operandKind == registerO){
								if(instrTarget->next->paramList->val.reg == RBX){
									temp = instrTarget->next->paramList->next;
									replacement = IRmakeDecINSTR(temp);
									replacement->next = instrTarget->next->next;
									//instrTarget->next = replacement;
									instr->next = replacement;
									changeMade = 1;
								}
							}
						}
					}
				}
			}
		}
	}

	return 0;
}
