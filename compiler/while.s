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
	subq $1208, %rsp
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
while3:
	push %rbx
	movq %rbp, %rbx
	movq $-147, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-147, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-148, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $1, %rbx
	je eq4
	movq $-148, %rdx
	movq $0, (%rbp,%rdx,8)
eq4:
	push %rbx
	movq %rbp, %rbx
	movq $-149, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-149, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-150, %rdx
	movq $1, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $0, %rbx
	jg great5
	movq $-150, %rdx
	movq $0, (%rbp,%rdx,8)
great5:
	movq $-148, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-150, %rdx
	and (%rbp,%rdx,8), %rbx
	movq $-151, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-151, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile3
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
	push %rbx
	movq %rbp, %rbx
	movq $-153, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-153, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	subq $1, %rbx
	movq $-154, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-154, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-155, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-156, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-156, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-155, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while3
endwhile3:
mainend:
	addq $1208, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



