format:
.string	"%d\n"
.text
.globl main
main:
push %rbp 
mov %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
add $2, %rsp 
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
add $1, %rsp 
pop %r11 
pop %r10 
pop %r9 
pop %r8 
pop %rdi 
pop %rsi 
pop %rdx 
pop %rcx 
mov $-10, %rdx
mov %rax , (%rbp,%rdx,8)
mov $-10, %rdx
mov (%rbp,%rdx,8), %rax 
mov $-8, %rdx
mov %rax , (%rbp,%rdx,8)
mov $format, %rdi 
mov $-8, %rdx
mov (%rbp,%rdx,8), %rsi 
mov $0, %rax 
call printf
mainend:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
mov %rbp , %rsp 
pop %rbp 
ret 
f3:
push %rbp 
mov %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 
add $0, %rsp 
mov $0, %rax 
jmp f3end
f3end:
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
mov %rbp , %rsp 
pop %rbp 
ret 
