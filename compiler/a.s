


format:
.string	"%d\n"
.text
.globl main



main:
push %rbp 
movq %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
addq $2, %rsp 
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
addq $2, %rsp 
pop %r11 
pop %r10 
pop %r9 
pop %r8 
pop %rdi 
pop %rsi 
pop %rdx 
pop %rcx 
mov $-8, %rdx
movq %rax , (%rbp,%rdx,8)
mov $-8, %rdx
movq (%rbp,%rdx,8), %rbx 
mov $-6, %rdx
movq %rbx , (%rbp,%rdx,8)
movq $format, %rdi 
mov $-6, %rdx
movq (%rbp,%rdx,8), %rsi 
movq $0, %rax 
call printf



mainend:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
movq %rbp , %rsp 
pop %rbp 
ret 



fib3:
push %rbp 
movq %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
addq $2, %rsp 
mov $3, %rdx
movq (%rbp,%rdx,8), %rbx 
addq $1, %rbx 
push %rcx 
push %rdx 
push %rsi 
push %rdi 
push %r8 
push %r9 
push %r10 
push %r11 
push %rbx 
mov $3, %rdx
push (%rbp,%rdx,8)
push $0
call f5
addq $3, %rsp 
pop %r11 
pop %r10 
pop %r9 
pop %r8 
pop %rdi 
pop %rsi 
pop %rdx 
pop %rcx 
mov $-10, %rdx
movq %rax , (%rbp,%rdx,8)
mov $3, %rdx
movq (%rbp,%rdx,8), %rbx 
addq $3, %rbx 
mov $3, %rdx
movq (%rbp,%rdx,8), %rbx 
addq $2, %rbx 
push %rcx 
push %rdx 
push %rsi 
push %rdi 
push %r8 
push %r9 
push %r10 
push %r11 
push %rbx 
push %rbx 
push $0
call f5
addq $3, %rsp 
pop %r11 
pop %r10 
pop %r9 
pop %r8 
pop %rdi 
pop %rsi 
pop %rdx 
pop %rcx 
mov $-11, %rdx
movq %rax , (%rbp,%rdx,8)
mov $-10, %rdx
movq (%rbp,%rdx,8), %rbx 
mov $-11, %rdx
addq (%rbp,%rdx,8), %rbx 
movq %rbx , %rax 
jmp fib3end



fib3end:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
movq %rbp , %rsp 
pop %rbp 
ret 



f5:
push %rbp 
movq %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
addq $0, %rsp 
mov $3, %rdx
movq (%rbp,%rdx,8), %rbx 
mov $4, %rdx
subq (%rbp,%rdx,8), %rbx 
movq %rbx , %rax 
jmp f5end



f5end:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
movq %rbp , %rsp 
pop %rbp 
ret 
