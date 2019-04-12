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
push $0
call f3
addq $1, %rsp 
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
mov $-10, %rdx
movq (%rbp,%rdx,8), %rbx 
mov $-8, %rdx
movq %rbx , (%rbp,%rdx,8)
movq $format, %rdi 
mov $-8, %rdx
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
f3:
push %rbp 
movq %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
addq $1, %rsp 
mov $-8, %rdx
movq $39, (%rbp,%rdx,8)
mov $-8, %rdx
addq $2, (%rbp,%rdx,8)
mov $-8, %rdx
movq (%rbp,%rdx,8), %rax 
jmp f3end
f3end:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
movq %rbp , %rsp 
pop %rbp 
ret 
