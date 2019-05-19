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
	subq $80, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 4 assign statement
	movq $1, %r8
	movq %rbp, %rdi
	movq $-6, %rdx
	movq %r8, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 5 write statement
	movq %rbp, %rdi
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 6 assign statement
	movq %rbp, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq $1, %r8
	cmp $0, %rbx
	je false8
	movq $0, %r8
false8:
	movq %rbp, %rdi
	movq $-7, %rdx
	movq %r8, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 7 write statement
	movq %rbp, %rdi
	push %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $80, %rsp
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
