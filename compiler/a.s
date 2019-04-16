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
	subq $32, %rsp
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $4
	push $0
	call fib3
 #remove static link and parameters
	addq $16, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-8, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	movq $1, %rbx
	cmp $1, %rbx
	jne else4
	movq $1, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	jmp endif4
else4:
	movq $0, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
endif4:
	movq $format, %rdi
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $20
	push $0
	call realFib5
 #remove static link and parameters
	addq $16, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-9, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $0, %rax
	call printf
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



realFib5:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $56, %rsp
	mov $-6, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $0, %rbx
	je eq8
	mov $-6, %rdx
	movq $0, (%rbp,%rdx,8)
eq8:
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endif7
	movq $0, %rax
	jmp realFib5end
endif7:
	mov $-7, %rdx
	movq $1, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	je eq9
	mov $-7, %rdx
	movq $0, (%rbp,%rdx,8)
eq9:
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endif8
	movq $1, %rax
	jmp realFib5end
endif8:
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $1, %rbx
	mov $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	mov $-8, %rdx
	push (%rbp,%rdx,8)
	push $0
	call realFib5
 #remove static link and parameters
	addq $16, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-9, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	subq $2, %rbx
	mov $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	mov $-10, %rdx
	push (%rbp,%rdx,8)
	push $0
	call realFib5
 #remove static link and parameters
	addq $16, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-11, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-11, %rdx
	addq (%rbp,%rdx,8), %rbx
	mov $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-12, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp realFib5end
realFib5end:
	addq $56, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



fib3:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $56, %rsp
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $10, %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	mov $-7, %rdx
	push (%rbp,%rdx,8)
	mov $3, %rdx
	push (%rbp,%rdx,8)
	push $0
	call f10
 #remove static link and parameters
	addq $24, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-8, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $3, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $2, %rbx
	mov $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	mov $-9, %rdx
	push (%rbp,%rdx,8)
	mov $-10, %rdx
	push (%rbp,%rdx,8)
	push $0
	call f10
 #remove static link and parameters
	addq $24, %rsp #remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-11, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-11, %rdx
	addq (%rbp,%rdx,8), %rbx
	mov $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp fib3end
fib3end:
	addq $56, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



f10:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $8, %rsp
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $4, %rdx
	subq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp f10end
f10end:
	addq $8, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



