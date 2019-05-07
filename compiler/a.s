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
	subq $376, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
	movq $1, %rbx
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
	movq $1, %rbx
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
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
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
	cmp $0, %rbx
	je ge11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r8, %rbx
ge11:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je ge10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r8, %rbx
ge10:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif9
	push %rdi
	movq $1, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif9:
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
	movq $1, %rbx
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
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
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
	cmp $1, %rbx
	je ge13
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
	cmp $0, %rbx
	je ge14
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r9, %rbx
ge14:
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	or %r8, %rbx
ge13:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif12
	push %rdi
	movq $2, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif12:
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
	movq $1, %rbx
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
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
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
	cmp $0, %rbx
	je ge17
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r8, %rbx
ge17:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je ge16
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r8, %rbx
ge16:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif15
	push %rdi
	movq $3, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif15:
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
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
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
	cmp $1, %rbx
	je ge20
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	or %r8, %rbx
ge20:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	cmp $1, %rbx
	je ge19
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	or %r8, %rbx
ge19:
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif18
	push %rdi
	movq $4, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif18:
	movq $0, %rax
mainend:
	addq $376, %rsp
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
