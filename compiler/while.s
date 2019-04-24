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
	subq $200, %rsp
	movq $1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
while3:
	mov $-21, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $10, %rbx
	jl less4
	mov $-21, %rdx
	movq $0, (%rbp,%rdx,8)
less4:
	mov $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while3
endwhile3:
while4:
	mov $-23, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $0, %rbx
	jg great5
	mov $-23, %rdx
	movq $0, (%rbp,%rdx,8)
great5:
	mov $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile4
	movq $format, %rdi
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $1, %rbx
	mov $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while4
endwhile4:
while5:
	mov $-25, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $10, %rbx
	jle le6
	mov $-25, %rdx
	movq $0, (%rbp,%rdx,8)
le6:
	mov $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile5
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $1, %rbx
	mov $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while5
endwhile5:
while6:
	mov $-27, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jge ge7
	mov $-27, %rdx
	movq $0, (%rbp,%rdx,8)
ge7:
	mov $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile6
	movq $format, %rdi
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $1, %rbx
	mov $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while6
endwhile6:
while7:
	mov $-29, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $5, %rbx
	jne neq8
	mov $-29, %rdx
	movq $0, (%rbp,%rdx,8)
neq8:
	mov $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile7
	movq $format, %rdi
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $1, %rbx
	mov $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp while7
endwhile7:
mainend:
	addq $200, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



