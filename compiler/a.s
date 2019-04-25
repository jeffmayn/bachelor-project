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
	subq $168, %rsp
	movq $format, %rdi
	movq $1, %rsi
	movq $0, %rax
	call printf
	movq $format, %rdi
	movq $4, %rsi
	movq $0, %rax
	call printf
	movq freeHeap1, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	addq $32, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc3
 #Here some kind of error should  be returned(%rcx)
allocSucc3:
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $123, %rbx
	addq $1, %rbx #making room for arraySize(%rcx)
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc4
 #Here some kind of error should  be returned(%rcx)
allocSucc4:
	mov $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-13, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $123, %rbx
	mov $-14, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-15, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-16, %rdx
	cmp $0, (%rbp,%rdx,8)
	jge posi5
	movq $0, %rbx
	mov $-16, %rdx
	subq (%rbp,%rdx,8), %rbx
	mov $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
posi5:
	movq $format, %rdi
	mov $-16, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $8, %rbx
	mov $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	movq $1, %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-18, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-19, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-19, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $24, %rbx
	mov $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	mov $-20, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $24, %rbx
	mov $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-21, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $24, %rbx
	mov $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	mov $-22, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $24, %rbx
	mov $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-23, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
	movq $format, %rdi
	movq $0, %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	mov $-24, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-25, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-26, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-26, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
mainend:
	addq $168, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



