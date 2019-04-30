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
	subq $1000, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
	movq $1, %rbx
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
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
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
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
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
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1000, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1000000, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-12, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $100, %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-29, %rdx
	subq (%rbp,%rdx,8), %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
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
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-35, %rdx
	and (%rbp,%rdx,8), %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
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
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-38, %rdx
	and (%rbp,%rdx,8), %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-41, %rdx
	and (%rbp,%rdx,8), %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-44, %rdx
	and (%rbp,%rdx,8), %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	or (%rbp,%rdx,8), %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-50, %rdx
	or (%rbp,%rdx,8), %rbx
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-53, %rdx
	or (%rbp,%rdx,8), %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-56, %rdx
	or (%rbp,%rdx,8), %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-59, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-60, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq3
	movq $-59, %rdx
	movq $0, (%rbp,%rdx,8)
eq3:
	push %rdi
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-63, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-65, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-65, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-64, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-66, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-64, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq4
	movq $-63, %rdx
	movq $0, (%rbp,%rdx,8)
eq4:
	push %rdi
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-67, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-68, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-68, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq5
	movq $-67, %rdx
	movq $0, (%rbp,%rdx,8)
eq5:
	push %rdi
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-71, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-72, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq6
	movq $-71, %rdx
	movq $0, (%rbp,%rdx,8)
eq6:
	push %rdi
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-75, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-76, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-78, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-76, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq7
	movq $-75, %rdx
	movq $0, (%rbp,%rdx,8)
eq7:
	push %rdi
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-79, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-81, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-81, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-80, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-80, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq8
	movq $-79, %rdx
	movq $0, (%rbp,%rdx,8)
eq8:
	push %rdi
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-84, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-85, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-85, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-83, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-86, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-86, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-83, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jl ge9
	movq $-84, %rdx
	movq $0, (%rbp,%rdx,8)
ge9:
	push %rdi
	movq $-84, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-88, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-89, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-89, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-87, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-90, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-90, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-87, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jl ge10
	movq $-88, %rdx
	movq $0, (%rbp,%rdx,8)
ge10:
	push %rdi
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-92, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-93, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-93, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-91, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-94, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-94, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-91, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jl ge11
	movq $-92, %rdx
	movq $0, (%rbp,%rdx,8)
ge11:
	push %rdi
	movq $-92, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-96, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-97, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-97, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-95, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-98, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-98, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-95, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jg ge12
	movq $-96, %rdx
	movq $0, (%rbp,%rdx,8)
ge12:
	push %rdi
	movq $-96, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-100, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-101, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-101, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-99, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-102, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-102, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-99, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jg ge13
	movq $-100, %rdx
	movq $0, (%rbp,%rdx,8)
ge13:
	push %rdi
	movq $-100, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-104, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-105, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-105, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-103, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-106, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-106, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-103, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jg ge14
	movq $-104, %rdx
	movq $0, (%rbp,%rdx,8)
ge14:
	push %rdi
	movq $-104, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-108, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-109, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-109, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-107, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-110, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-110, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-107, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jle ge15
	movq $-108, %rdx
	movq $0, (%rbp,%rdx,8)
ge15:
	push %rdi
	movq $-108, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-112, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-113, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-113, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-111, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-114, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-114, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-111, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jle ge16
	movq $-112, %rdx
	movq $0, (%rbp,%rdx,8)
ge16:
	push %rdi
	movq $-112, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-116, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-117, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-117, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-115, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-118, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-118, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-115, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jle ge17
	movq $-116, %rdx
	movq $0, (%rbp,%rdx,8)
ge17:
	push %rdi
	movq $-116, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-120, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-121, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-121, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-119, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-122, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-122, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-119, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jge ge18
	movq $-120, %rdx
	movq $0, (%rbp,%rdx,8)
ge18:
	push %rdi
	movq $-120, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-124, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-125, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-125, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-123, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-126, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-126, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-123, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jge ge19
	movq $-124, %rdx
	movq $0, (%rbp,%rdx,8)
ge19:
	push %rdi
	movq $-124, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-128, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-129, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-129, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-127, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-130, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-130, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-127, %rdx
	cmp (%rbp,%rdx,8), %rbx
	jge ge20
	movq $-128, %rdx
	movq $0, (%rbp,%rdx,8)
ge20:
	push %rdi
	movq $-128, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
	jmp mainend
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



errorCleanup4:
	movq mainSPoint3, %rsp
	jmp mainend
