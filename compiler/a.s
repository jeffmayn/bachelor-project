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
	subq $1000, %rsp
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-71, %rdx
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
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-72, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-37, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-75, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while3:
	push %rbx
	movq %rbp, %rbx
	movq $-79, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-80, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $10, %rbx
	jl less4
	movq $-80, %rdx
	movq $0, (%rbp,%rdx,8)
less4:
	movq $-80, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
	push %rbx
	movq %rbp, %rbx
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-82, %rdx
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
	movq $-84, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-84, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx
	movq $-85, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-85, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-86, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-88, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-86, %rdx
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
	movq $-89, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-91, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-91, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-89, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while4:
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
	cmp $1, %rbx
	jg great5
	movq $-94, %rdx
	movq $0, (%rbp,%rdx,8)
great5:
	movq $-94, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile4
	push %rbx
	movq %rbp, %rbx
	movq $-96, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-96, %rdx
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
	movq $-98, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-98, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	subq $1, %rbx
	movq $-99, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-99, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-100, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-102, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-102, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-100, %rdx
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
	movq $-103, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-105, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-105, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-103, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while5:
	push %rbx
	movq %rbp, %rbx
	movq $-107, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-107, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-108, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $10, %rbx
	jle le6
	movq $-108, %rdx
	movq $0, (%rbp,%rdx,8)
le6:
	movq $-108, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile5
	push %rbx
	movq %rbp, %rbx
	movq $-110, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-110, %rdx
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
	movq $-112, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-112, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx
	movq $-113, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-113, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-114, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-116, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-116, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-114, %rdx
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
	movq $-117, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-119, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-119, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-117, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while6:
	push %rbx
	movq %rbp, %rbx
	movq $-121, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-121, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-122, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $1, %rbx
	jge ge7
	movq $-122, %rdx
	movq $0, (%rbp,%rdx,8)
ge7:
	movq $-122, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile6
	push %rbx
	movq %rbp, %rbx
	movq $-124, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-124, %rdx
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
	movq $-126, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-126, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	subq $1, %rbx
	movq $-127, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-127, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-128, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-130, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-130, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-128, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while6
endwhile6:
mainend:
	addq $1000, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



