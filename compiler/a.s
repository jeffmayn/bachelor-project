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
	subq $112, %rsp
	movq freeHeap1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	addq $2, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc3
 #Here some kind of error should  be returned(%rcx)
allocSucc3:
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $2, %rbx
	addq $2, %rbx
	mov $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-13, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-15, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	mov $-16, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-17, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	movq freeHeap1, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	imul $1, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc4
 #Here some kind of error should  be returned(%rcx)
allocSucc4:
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $2, %rbx
	mov $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	mov $-18, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $2, %rbx
	mov $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-19, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
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



