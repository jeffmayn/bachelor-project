format:
.string	"%d\n"
.data
.align 8
heap0:
.space 1048576
freeHeap1:
.space 8
endHeap2:
.space 8
mainSPoint3:
.space 8
mainBPoint4:
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
	subq $16, %rsp
	movq %rsp, mainSPoint3
	movq %rbp, mainBPoint4
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $1048576, endHeap2
	movq %rbp, %rbx
	movq $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $5
	movq %rbp, %rdi#resetting basepointer
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call b4
#remove static link and parameters
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-7, %rdx
	movq %rax, (%rbp,%rdx,8)
	push %rdi
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $16, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



b4:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $32, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $1
	movq %rbp, %rdi#resetting basepointer
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call b7
#remove static link and parameters
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-9, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-6, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp b4end
b4end:
	addq $32, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



b7:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $24, %rsp
	movq $-6, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-7, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq9
	movq $-6, %rdx
	movq $0, (%rbp,%rdx,8)
eq9:
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else8
	movq $1, %rax
	jmp b7end
	jmp endif8
else8:
	movq $0, %rax
	jmp b7end
endif8:
b7end:
	addq $24, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup5:
	movq mainSPoint3, %rsp
	movq mainBPoint4, %rbp
	jmp mainend
