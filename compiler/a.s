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
	subq $632, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc3
#Here some kind of error should  be returned
allocSucc3:
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc4
#Here some kind of error should  be returned
allocSucc4:
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc5
#Here some kind of error should  be returned
allocSucc5:
	push %rbx
	movq %rbp, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $203, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc6
#Here some kind of error should  be returned
allocSucc6:
	movq $203, %rbx
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $200, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-24, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc7
#Here some kind of error should  be returned
allocSucc7:
	push %rbx
	movq %rbp, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $200, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-30, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-34, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc8
#Here some kind of error should  be returned
allocSucc8:
	push %rbx
	movq %rbp, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc9
#Here some kind of error should  be returned
allocSucc9:
	movq $1, %rbx
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $200, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $200, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-52, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-59, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-60, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-58, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-63, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-64, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-64, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-65, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-65, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-66, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-67, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-63, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-68, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-68, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-75, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-72, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-76, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-78, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-79, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-80, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-76, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-80, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-76, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-76, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-81, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-81, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-83, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-84, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-84, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-83, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
mainend:
	addq $632, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



