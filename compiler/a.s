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
	subq $88, %rsp
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $0
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call recPrintAndInc3
#remove static link and parameters
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-13, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
mainend:
	addq $88, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



recPrintAndInc3:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $192, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $3, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq $-12, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-12, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $10, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-16, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-16, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-18, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-18, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-24, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $10, %rbx
	je eq6
	movq $-24, %rdx
	movq $0, (%rbp,%rdx,8)
eq6:
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else5
	movq $0, %rax
	jmp recPrintAndInc3end
	jmp endif5
else5:
	push %rbx
	movq %rbp, %rbx
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-27, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-27, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq $3, %rdx
	push (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call recPrintAndInc3
#remove static link and parameters
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-29, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp recPrintAndInc3end
endif5:
recPrintAndInc3end:
	addq $192, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



