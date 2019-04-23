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
	subq $48, %rsp
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $0, %rax
	call printf
	push %rbx
	movq %rbp, %rbx
	mov $-10, %rdx
	movq %rbx, (%rbp,%rdx,8), %rbx
	pop %rbx
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	mov $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call incGlobalBy103
#remove static link and parameters
	addq $8, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-11, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $0, %rax
	call printf
mainend:
	addq $48, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



incGlobalBy103:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $24, %rsp
	movq $10, %rbx
	mov $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	mov $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	mov $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	mov $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	mov $-6, %rdx
	addq (%rdi,%rdx,8), %rbx
	mov $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq $0, %rax
	jmp incGlobalBy103end
incGlobalBy103end:
	addq $24, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



