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
	subq $32, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 4 write statement
	movq $1, %r8
	cmp $0, %r8
	jge posi8
	movq $0, %rbx
	subq %r8, %rbx
	movq %rbx, %r8
posi8:
	movq $2, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jge posi9
	movq $0, %rbx
	subq %r8, %rbx
	movq %rbx, %r8
posi9:
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 5 write statement
	movq $1, %rbx
	cmp $1, %rbx
	movq %rbx, %r8
	je lazy10
	movq $0, %rbx
	or %r8, %rbx
lazy10:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
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



errorCleanup6:
	movq mainSPoint4, %rsp
	movq mainBPoint5, %rbp
	jmp mainend
