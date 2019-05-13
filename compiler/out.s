format:
.string	"%d\n"
.data
.align 8
heap1:
.space 1048576
freeHeap2:
.space 8
endHeap3:
.space 8
mainSPoint4:
.space 8
mainBPoint5:
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
	subq $208, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $666, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while8:
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge9
	movq $0, %r9
ge9:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge11
	movq $0, %r9
ge11:
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
while12:
	movq $1, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	movq $666, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	je eq13
	movq $0, %r8
eq13:
	movq %r8, %rbx
	cmp $1, %rbx
	jne endwhile12
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while12
	jmp while12
endwhile12:
endif10:
	jmp while8
endwhile8:
	movq $0, %rax
mainend:
	addq $208, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup6:
	movq mainSPoint4, %rsp
	movq mainBPoint5, %rbp
	jmp mainend
