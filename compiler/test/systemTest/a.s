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
	subq $56, %rsp
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $10
	push $0
	call heltalsFabrik3
 #remove static link and parameters(%rcx)
	addq $16, %rsp #remove static link and parameters(%rcx)
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
	mov $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $0
	call f4
 #remove static link and parameters(%rcx)
	addq $8, %rsp #remove static link and parameters(%rcx)
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	mov $-10, %rdx
	movq %rax, (%rbp,%rdx,8)
	mov $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	mov $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
 #creating record dereferencing(%rcx)
	mov $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $3, %rbx
	imul $8, %rbx
	mov $-11, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $format, %rdi
	mov $-12, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $0, %rax
	call printf
mainend:
	addq $56, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



heltalsFabrik3:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $8, %rsp
	movq freeHeap1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	mov $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc6
 #Here some kind of error should  be returned(%rcx)
allocSucc6:
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp heltalsFabrik3end
heltalsFabrik3end:
	addq $8, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



f4:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $40, %rsp
	movq freeHeap1, %rbx
	mov $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2 #may be out of order(%rcx)
	jl allocSucc8
 #Here some kind of error should  be returned(%rcx)
allocSucc8:
 #creating record dereferencing(%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
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
	push $11
	push $0
	call heltalsFabrik3
 #remove static link and parameters(%rcx)
	addq $16, %rsp #remove static link and parameters(%rcx)
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
	mov $-7, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
 #creating record dereferencing(%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	addq $0, %rbx
	mov $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $3, %rbx
	imul $8, %rbx
	mov $-9, %rdx
	mov (%rbp,%rdx,8), %rcx
	addq (%rcx), %rbx
	mov $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	mov $-10, %rdx
	mov (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	mov $-6, %rdx
	movq (%rbp,%rdx,8), %rax
	jmp f4end
f4end:
	addq $40, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



