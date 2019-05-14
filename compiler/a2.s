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
	subq $224, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 5 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $7, %rbx
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq $7, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 7 assign statement
	movq $4, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 8 assign statement
	movq $5, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 9 assign statement
	movq $6, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 10 assign statement
	movq $7, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $3, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 11 assign statement
	movq $8, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $4, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 12 assign statement
	movq $9, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $5, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 13 assign statement
	movq $10, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $6, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 15 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 16 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $6, %rbx
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $224, %rsp
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
