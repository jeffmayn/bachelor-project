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
	subq $520, %rsp
	movq $1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	mov $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	mov $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
while3:
	mov $-69, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $10, %rbx
	jl less4
	mov $-69, %rdx
	movq $0, (%rbp,%rdx,8)
less4:
	mov $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-70, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while3
endwhile3:
mainend:
	addq $520, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



