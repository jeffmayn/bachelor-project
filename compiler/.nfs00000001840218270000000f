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
	subq $136, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc3
#Here some kind of error should  be returned
allocSucc3:
	push %rbx
	movq %rbp, %rbx
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc4
#Here some kind of error should  be returned
allocSucc4:
	push %rbx
	movq %rbp, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $3, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc5
#Here some kind of error should  be returned
allocSucc5:
	movq $3, %rbx
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-14, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $300, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc6
#Here some kind of error should  be returned
allocSucc6:
	movq $300, %rbx
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-17, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $25, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-21, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-20, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
mainend:
	addq $136, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



