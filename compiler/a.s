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
	subq $824, %rsp
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-21, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-72, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-37, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while3:
	push %rbx
	movq %rbp, %rbx
	movq $-75, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-76, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $10, %rbx
	jl less4
	movq $-76, %rdx
	movq $0, (%rbp,%rdx,8)
less4:
	movq $-76, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
	push %rbx
	movq %rbp, %rbx
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-78, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx
	movq $-79, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-80, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-81, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-81, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-80, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while3
endwhile3:
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-83, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-83, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while4:
	push %rbx
	movq %rbp, %rbx
	movq $-84, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-84, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-85, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $1, %rbx
	jg great5
	movq $-85, %rdx
	movq $0, (%rbp,%rdx,8)
great5:
	movq $-85, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile4
	push %rbx
	movq %rbp, %rbx
	movq $-86, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-86, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-87, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-87, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	subq $1, %rbx
	movq $-88, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-89, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-90, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-90, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-89, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while4
endwhile4:
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-91, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-92, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-92, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-91, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while5:
	push %rbx
	movq %rbp, %rbx
	movq $-93, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-93, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-94, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $10, %rbx
	jle le6
	movq $-94, %rdx
	movq $0, (%rbp,%rdx,8)
le6:
	movq $-94, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile5
	push %rbx
	movq %rbp, %rbx
	movq $-95, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-95, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-96, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-96, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx
	movq $-97, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-97, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-98, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-99, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-99, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-98, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while5
endwhile5:
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-100, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-101, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-101, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-100, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while6:
	push %rbx
	movq %rbp, %rbx
	movq $-102, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-102, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-103, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $1, %rbx
	jge ge7
	movq $-103, %rdx
	movq $0, (%rbp,%rdx,8)
ge7:
	movq $-103, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile6
	push %rbx
	movq %rbp, %rbx
	movq $-104, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-104, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-105, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-105, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	subq $1, %rbx
	movq $-106, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-106, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-107, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-108, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-108, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-107, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while6
endwhile6:
mainend:
	addq $824, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



