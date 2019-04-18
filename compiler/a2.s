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
	movq freeHeap1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	addq $1, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order()
	jl allocSucc3
 #Here some kind of error should  be returned()
allocSucc3:
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $2, %rbx
	mov $-7, %rdx
	mov (%rbp,%rdx,8) %rdi #added
	movq %rbx, (%rdi) #changed
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-8, %rdx
	mov (%rbp,%rdx,8) %rdi #added
	movq (%rdi), %rsi #changed
	movq $0, %rax
	call printf
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
