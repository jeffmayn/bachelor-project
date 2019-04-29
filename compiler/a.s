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
	subq $352, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
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
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
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
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rbx
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
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $10, %rbx
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
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $0, %rbx
	jg allocPos4
	movq $4, %rax#negative allocation size
	jmp errorCleanup4
allocPos4:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc5
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc5:
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $17, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError7#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed6#not indexOutOfBounds
indeksError7:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed6:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-32, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-32, %rdx
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
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError9#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed8#not indexOutOfBounds
indeksError9:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed8:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-37, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	cmp $0, %rbx
	jg allocPos10
	movq $4, %rax#negative allocation size
	jmp errorCleanup4
allocPos10:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc11
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc11:
	movq $17, %rbx
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError13#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed12#not indexOutOfBounds
indeksError13:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed12:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-41, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc14
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc14:
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
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
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-44, %rdx
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
	imulq $8, %rbx
	movq $-44, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError18#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed17#not indexOutOfBounds
indeksError18:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup4
indeksAllowed17:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-47, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $352, %rsp
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
