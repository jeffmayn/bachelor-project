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
mov $-9, %rdx
movq $42, (%rbp,%rdx,8)
mov $-9, %rdx
add $4, (%rbp,%rdx,8)
mov $-9, %rdx
mov (%rbp,%rdx,8), %rbx
mov $-8, %rdx
mov %rbx , (%rbp,%rdx,8)
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
