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
	subq $560, %rsp
	movq %rsp, mainSPoint3
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $16384, endHeap2
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
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
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-40, %rdx
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
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rbx
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
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $1000000, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-21, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-21, %rdx
	movq (%rdi,%rdx,8), %rbx
	cmp $0, %rbx
	jg allocPos4
	movq $4, %rax#negative allocation size
	jmp errorCleanup4
allocPos4:
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc5
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc5:
	movq $-21, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $17, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-59, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-58, %rdx
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
	imul $8, %rbx
	movq $-58, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-60, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-64, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-64, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-63, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $2, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-63, %rdx
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
	imul $8, %rbx
	movq $-63, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-65, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-65, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-66, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	cmp $0, %rbx
	jg allocPos10
	movq $4, %rax#negative allocation size
	jmp errorCleanup4
allocPos10:
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc11
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc11:
	movq $17, %rbx
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq $-68, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-68, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-67, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-67, %rdx
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
	imul $8, %rbx
	movq $-67, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc14
	movq $6, %rax#outofMemory
	jmp errorCleanup4
allocSucc14:
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-70, %rdx
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
	movq $-70, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-72, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-73, %rdx
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
	imul $8, %rbx
	movq $-73, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-75, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
	jmp mainend
mainend:
	addq $560, %rsp
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
