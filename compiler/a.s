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
	subq $112, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $16, %rsp
	movq %rbp, %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $8, %rsp
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %rsp, %r8
	addq $0, %r8
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r10, %rbx
	push %rbx
	call c8
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r10
	movq %rsp, %r8
	addq $0, %r8
	movq %r10, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $8, %rsp
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %rsp, %r8
	addq $0, %r8
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r10, %rbx
	push %rbx
	call c8
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r10
	movq %rsp, %r8
	addq $8, %r8
	movq %r10, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r9, %rbx
	push %rbx
	call b7
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $112, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



b7:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $24, %rsp
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rax
	jmp b7end
b7end:
	addq $24, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



c8:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $72, %rsp
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r9, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rax
	jmp c8end
c8end:
	addq $72, %rsp
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
