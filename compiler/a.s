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
mainSPoint3:
.space 8
.text
.globl main
main:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $32, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
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
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc3
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc3:
	movq $0, %rax
	jmp mainend
mainend:
	addq $32, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup4:
	movq mainSPoint3, %rsp
	jmp mainend
