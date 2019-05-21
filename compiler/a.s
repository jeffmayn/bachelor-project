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
	subq $16, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 10 write statement
	movq %rbp, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $8, %rsp
	movq %rsp, %r8
	movq $47, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r9, %rbx
	push %rbx
	call fibbo7
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	push %rdi
	movq %r8, %rsi
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



fibbo7:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $120, %rsp
#line: 5 if then statement
	movq $1, %r9
	movq %rbp, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %r8
	movq %rbp, %rdi		#resetting basepointer
	movq $0, %rbx
	cmp %rbx, %r8
	je cmp11
	movq $0, %r9
cmp11:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endif10
#line: 4 return statement
	movq $0, %rax
	jmp fibbo7end
endif10:
#line: 7 if then statement
	movq $1, %r9
	movq %rbp, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %r8
	movq %rbp, %rdi		#resetting basepointer
	movq $1, %rbx
	cmp %rbx, %r8
	je cmp13
	movq $0, %r9
cmp13:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endif12
#line: 6 return statement
	movq $1, %rax
	jmp fibbo7end
endif12:
#line: 7 return statement
	movq %rbp, %rbx
	addq $16, %rbx
	movq (%rbx), %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $8, %rsp
	movq %rbp, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %r8
	movq %rbp, %rdi		#resetting basepointer
	decq %r8
	movq %rsp, %r9
	movq %r9, %rcx
	movq %r8, (%rcx)
	movq %r10, %rbx
	push %rbx
	call fibbo7
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %rbp, %rbx
	addq $16, %rbx
	movq (%rbx), %r11
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $8, %rsp
	movq %rbp, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %r9
	movq %rbp, %rdi		#resetting basepointer
	movq $2, %rbx
	subq %rbx, %r9
	movq %rsp, %r10
	movq %r10, %rcx
	movq %r9, (%rcx)
	movq %r11, %rbx
	push %rbx
	call fibbo7
	addq $16, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %rbx
	addq %rbx, %r8
	movq %r8, %rax
	jmp fibbo7end
fibbo7end:
	addq $120, %rsp
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
