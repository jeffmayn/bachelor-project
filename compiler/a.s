format:
.string	"%d\n"
.data
.align 8
heap1:
.space 1048576
freeHeap2:
.space 8
endHeap3:
.space 8
mainSPoint4:
.space 8
mainBPoint5:
.space 8
.text
.globl main
main:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15

	movq %rbp, %rbx

	movq %rbx, %r8

	push %rdi

	pop %rdi

	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx

	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref21#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref21:
	addq $0, %rbx
	movq %rbx, %r8

	movq %rbp, %rdi#resetting basepointer

	movq %r9, %rbx

	movq %rbp, %rdi#resetting basepointer

	movq %rbp, %rdi#resetting basepointer

	movq %rbp, %rdi#resetting basepointer

	movq $0, %rax

	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup6:
	movq mainSPoint4, %rsp
	movq mainBPoint5, %rbp
	jmp mainend
