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
mov $3, %rax
mov $-8, %rdx
mov %rax , (%rbp,%rdx,8)
mov $42, %rax
mov $-8, %rdx
mov %rax , (%rbp,%rdx,8)
mov $-8, %rdx
mov (%rbp,%rdx,8), %rax
mov $-9, %rdx
mov %rax , (%rbp,%rdx,8)
mov $format, %rdi
mov $-9, %rdx
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
