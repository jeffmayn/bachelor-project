format:
.string	"%d\n"
.data
.align 8
heap0:
.space 1048576
freeHeap1:
.space 8
endHeap2:
.space 8
mainSPoint3:
.space 8
mainBPoint4:
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
	subq $232, %rsp
	movq %rsp, mainSPoint3
	movq %rbp, mainBPoint4
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $1048576, endHeap2
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc3
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc3:
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref4#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref4:
	addq $0, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref5#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref5:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref6#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref6:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref7#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref7:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref8#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref8:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref9#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref9:
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref10#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref10:
	addq $8, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref11#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref11:
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc12
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc12:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref13#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref13:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref14#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref14:
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $300, %rbx
	cmp $0, %rbx
	jg allocPos15
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos15:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc16
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc16:
	movq $300, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref21#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref21:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref22#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref22:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref19#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref19:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError18#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed17#not indexOutOfBounds
indeksError18:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed17:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref20#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref20:
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc23
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc23:
	movq $87, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref30#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref30:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref31#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref31:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref28#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref28:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError27#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed26#not indexOutOfBounds
indeksError27:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed26:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref29#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref29:
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref24#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref24:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref25#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref25:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref38#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref38:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref39#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref39:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref36#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref36:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError35#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed34#not indexOutOfBounds
indeksError35:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed34:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref37#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref37:
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref32#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref32:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref33#not NULL
	movq $5, %rax
	jmp errorCleanup5
nonNullDeref33:
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $232, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



errorCleanup5:
	movq mainSPoint3, %rsp
	movq mainBPoint4, %rbp
	jmp mainend
