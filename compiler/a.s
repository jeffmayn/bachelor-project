format:
.string	"%d\n"
.data
.align 8
heap1:
.space 1048576
freeHeap2:
.space 8
endHeap3:
.space 8
mainSPoint4:
.space 8
mainBPoint5:
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
	subq $56, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 2 allocate of length statement
	movq %rbp, %rdi
	movq freeHeap2, %r8
	movq $-6, %rdx
	movq %r8, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq $8, %r9
	movq %r9, %rbx
	cmp $0, %rbx
	jg allocPos8
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos8:
	movq %r9, %rbx
	incq %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc9
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc9:
	movq %r8, %rcx
	movq %r9, (%rcx)
#line: 3 assign statement
	movq $11, %r9
	movq %rbp, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %r8
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref12#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref12:
	movq $4, %rbx
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError11#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed10#not indexOutOfBounds
indeksError11:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed10:
	incq %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref13#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref13:
	movq %r8, %rcx
	movq %r9, (%rcx)
	movq $0, %rax
mainend:
	addq $56, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup6:
	movq mainSPoint4, %rsp
	movq mainBPoint5, %rbp
	jmp mainend
