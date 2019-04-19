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
	subq $216, %rsp
	movq $3, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
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
	mov $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $2, %rbx
	addq $2, %rbx
	mov $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-21, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-23, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	mov $-24, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-25, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	movq freeHeap1, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc4
 #Here some kind of error should  be returned(%rcx)
allocSucc4:
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $2, %rbx
	mov $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	mov $-26, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $2, %rbx
	mov $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-27, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	movq freeHeap1, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc5
 #Here some kind of error should  be returned(%rcx)
allocSucc5:
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $3, %rbx
	mov $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-28, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	addq $2, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc6
 #Here some kind of error should  be returned(%rcx)
allocSucc6:
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $3, %rbx
	mov $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-29, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	mov $-30, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $3, %rbx
	mov $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-31, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-32, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
mainend:
	addq $216, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



