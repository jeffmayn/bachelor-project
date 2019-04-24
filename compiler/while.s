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
	subq $24, %rsp
	movq $10, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
while3:
	mov $-7, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jg great4
	mov $-7, %rdx
	movq $0, (%rbp,%rdx,8)
great4:
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $1, %rbx
	mov $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	jmp while3
endwhile3:
mainend:
	addq $24, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



