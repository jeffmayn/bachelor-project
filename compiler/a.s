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
	subq $408, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-23, %rdx
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
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc3
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc3:
	movq $2, %rbx
	addq $2, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc4
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc4:
	movq $10, %rbx
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $17, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError6#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed5#not indexOutOfBounds
indeksError6:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed5:
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-39, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError8#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed7#not indexOutOfBounds
indeksError8:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed7:
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-44, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc9
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc9:
	movq $17, %rbx
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError11#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed10#not indexOutOfBounds
indeksError11:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed10:
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-48, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc12
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc12:
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError14#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed13#not indexOutOfBounds
indeksError14:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed13:
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-51, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError16#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed15#not indexOutOfBounds
indeksError16:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed15:
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-54, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
	jmp mainend
mainend:
	addq $408, %rsp
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
