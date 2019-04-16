


format:
.string	"%d\n"
.data
.align 8



heap0:
.space 16384



freeHeap1:
.space 8
.text
.globl main



main:
movq $heap0, freeHeap1
push %rbp 
movq %rsp , %rbp 
push %rbx 
push %r12 
push %r13 
push %r14 
push %r15 



mainend:
addq $8, %rsp 
pop %r15 
pop %r14 
pop %r13 
pop %r12 
pop %rbx 
movq %rbp , %rsp 
pop %rbp 
ret 
