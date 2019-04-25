format:
.string	"%d\n"
.data
.align 8
heap0:
.space 16384
freeHeap1:
.space 8
endHeap2:
.space 8
.text
.globl main
main:
	movq $heap0, freeHeap1
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $120, %rsp
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-7, %rdx
	movq $1, (%rbp,%rdx,8)
	cmp $0, %rbx
	je false3
	movq $-7, %rdx
	movq $0, (%rbp,%rdx,8)
false3:
	push %rdi
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-8, %rdx
	movq $1, (%rbp,%rdx,8)
	cmp $0, %rbx
	je false4
	movq $-8, %rdx
	movq $0, (%rbp,%rdx,8)
false4:
	push %rdi
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-12, %rdx
	movq $1, (%rbp,%rdx,8)
	cmp $0, %rbx
	je false5
	movq $-12, %rdx
	movq $0, (%rbp,%rdx,8)
false5:
	push %rdi
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-18, %rdx
	movq $1, (%rbp,%rdx,8)
	cmp $0, %rbx
	je false6
	movq $-18, %rdx
	movq $0, (%rbp,%rdx,8)
false6:
	push %rdi
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	jg %rsi
	push %rdi
	movq , %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
mainend:
	addq $120, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



