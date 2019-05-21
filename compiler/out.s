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
	subq $176, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 4 allocate statement
	movq %rbp, %rdi
	movq freeHeap2, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	addq $16, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc8
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc8:
#line: 6 assign statement
	movq $10, %r8
	movq %rbp, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref9#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref9:
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref10#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref10:
	movq %r9, %rcx
	movq %r8, (%rcx)
#line: 7 assign statement
	movq $1, %r8
	movq %rbp, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref11#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref11:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref12#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref12:
	movq %r9, %rcx
	movq %r8, (%rcx)
#line: 8 assign statement
	movq $10, %r8
	movq %rbp, %rdi
	movq $-6, %rdx
	movq %r8, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 9 assign statement
	movq $20, %r8
	movq %rbp, %rdi
	movq $-7, %rdx
	movq %r8, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 11 write statement
	movq %rbp, %rdi
	movq $2, %r9
	movq %rbp, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %r8
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	subq %rbx, %r8
	cmp $0, %r8
	jge posi13
	movq $0, %rbx
	subq %r8, %rbx
	movq %rbx, %r8
posi13:
	movq %r8, %rbx
	imulq %r9, %rbx
	movq %rbx, %r8
	movq %rbp, %rdi
	movq $2, %rbx
	imulq %r8, %rbx
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $176, %rsp
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
