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
	subq $400, %rsp
	movq freeHeap1, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc3
 #Here some kind of error should  be returned(%rcx)
allocSucc3:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	mov $-9, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $8, %rbx
	mov $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-10, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-11, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc4
 #Here some kind of error should  be returned(%rcx)
allocSucc4:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-12, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc5
 #Here some kind of error should  be returned(%rcx)
allocSucc5:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-13, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-14, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $203, %rbx
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc6
 #Here some kind of error should  be returned(%rcx)
allocSucc6:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-15, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	imul $8, %rbx
	mov $-16, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-17, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc7
 #Here some kind of error should  be returned(%rcx)
allocSucc7:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-18, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	imul $8, %rbx
	mov $-19, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-20, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-21, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	imul $8, %rbx
	mov $-22, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-23, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-24, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-25, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-26, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc8
 #Here some kind of error should  be returned(%rcx)
allocSucc8:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-27, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-28, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	mov $-29, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $1, %rbx
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc9
 #Here some kind of error should  be returned(%rcx)
allocSucc9:
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-30, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	imul $8, %rbx
	mov $-31, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-32, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-33, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-34, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-35, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	imul $8, %rbx
	mov $-36, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-38, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	imul $8, %rbx
	mov $-39, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-40, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-41, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-37, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-42, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-43, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	imul $8, %rbx
	mov $-44, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-45, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-46, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $16, %rbx
	mov $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-48, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-49, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-50, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-47, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $16, %rbx
	mov $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-51, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $8, %rbx
	mov $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-52, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $0, %rbx
	mov $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	imul $8, %rbx
	mov $-53, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-54, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $8, %rbx
	mov $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-55, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
mainend:
	addq $400, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



