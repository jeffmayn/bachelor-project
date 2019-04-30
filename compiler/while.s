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
	subq $1176, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-133, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-134, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-134, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-133, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-135, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-136, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-136, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-135, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-137, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-138, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-138, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-137, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-139, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-140, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-140, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-139, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-141, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-142, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-142, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-141, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-21, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-143, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-144, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-144, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-143, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-37, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-145, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-146, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-146, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-145, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-69, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-147, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-147, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-148, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-148, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $0, %rbx
	cmp $0, %rbx
	movq $3, %rax
	je errorCleanup4
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rax
	movq $0, %rdx
	idivq %rbx
	movq $3, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-150, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-151, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-151, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-150, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-152, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-152, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
	jmp mainend
mainend:
	addq $1176, %rsp
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
