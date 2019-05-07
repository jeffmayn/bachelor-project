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
	subq $1000, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap2, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos15
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos15:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx#may be out of order
	jl allocSucc16
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc16:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap2, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos17
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos17:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx#may be out of order
	jl allocSucc18
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc18:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap2, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos19
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos19:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx#may be out of order
	jl allocSucc20
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc20:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap2, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos21
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos21:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx#may be out of order
	jl allocSucc22
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc22:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq $1000, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $600, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-16, %rdx
	movq %rbx, (%rdi,%rdx,8)
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
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $40, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-19, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $3641, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-20, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $729, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-21, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while23:
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge24
	movq $0, %r9
ge24:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile23
	movq %rbp, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-21, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-20, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-19, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-18, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call NextRand10
#remove static link and parameters
	addq $40, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-18, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8#first operand in t1
	movq $20, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rax
	movq $3, %rax
	cmp $0, %rbx
	je errorCleanup6
	pop %rax
	movq %r9, %rbx
	movq %r8, %rax
	movq $0, %rdx
	idivq %rbx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref27#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref27:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError26#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed25#not indexOutOfBounds
indeksError26:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed25:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref28#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref28:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-21, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-20, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-19, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-18, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call NextRand10
#remove static link and parameters
	addq $40, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-18, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8#first operand in t1
	movq $90, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rax
	movq $3, %rax
	cmp $0, %rbx
	je errorCleanup6
	pop %rax
	movq %r9, %rbx
	movq %r8, %rax
	movq $0, %rdx
	idivq %rbx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref31#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref31:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError30#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed29#not indexOutOfBounds
indeksError30:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed29:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref32#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref32:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref35#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref35:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError34#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed33#not indexOutOfBounds
indeksError34:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed33:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref36#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref36:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref39#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref39:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError38#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed37#not indexOutOfBounds
indeksError38:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed37:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref40#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref40:
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
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while23
endwhile23:
	movq %rbp, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	push $0
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rbx
	push %rbx
	call quicksort12
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-17, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push $0
	movq %rbp, %rdi#resetting basepointer
	push $0
	movq %rbp, %rdi#resetting basepointer
	push $0
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call BKnap8
#remove static link and parameters
	addq $32, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while41:
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge42
	movq $0, %r9
ge42:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile41
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref47#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref47:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError46#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed45#not indexOutOfBounds
indeksError46:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed45:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref48#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref48:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	je eq44
	movq $0, %r9
eq44:
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif43
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-16, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif43:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while41
endwhile41:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rsi
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
	push %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rsi
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
	push %rdi
	movq $-15, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $1000, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



BKnap8:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $1320, %rsp
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref54#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref54:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError53#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed52#not indexOutOfBounds
indeksError53:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed52:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref55#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref55:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jle ge51
	movq $0, %r10
ge51:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif50
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref58#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref58:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError57#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed56#not indexOutOfBounds
indeksError57:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed56:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref59#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref59:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge61
	movq $0, %r10
ge61:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif60
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref64#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref64:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError63#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed62#not indexOutOfBounds
indeksError63:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed62:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref65#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref65:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref68#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref68:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError67#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed66#not indexOutOfBounds
indeksError67:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed66:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref69#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref69:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	movq %r10, %rbx
	push %rbx
	call BKnap8
#remove static link and parameters
	addq $32, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif60:
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref75#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref75:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError74#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed73#not indexOutOfBounds
indeksError74:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed73:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref76#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref76:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jg ge72
	movq $0, %r10
ge72:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	cmp $0, %rbx
	jmp ge71
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r11
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r11
	je eq77
	movq $0, %r10
eq77:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r9, %rbx
ge71:
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif70
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref80#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref80:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError79#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed78#not indexOutOfBounds
indeksError79:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed78:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref81#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref81:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r9, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref84#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref84:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError83#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed82#not indexOutOfBounds
indeksError83:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed82:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref85#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref85:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r9, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while86:
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jle ge87
	movq $0, %r9
ge87:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile86
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref90#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref90:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError89#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed88#not indexOutOfBounds
indeksError89:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed88:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref91#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref91:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref94#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref94:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError93#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed92#not indexOutOfBounds
indeksError93:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed92:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref95#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref95:
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while86
endwhile86:
endif70:
endif50:
	movq $1, %r10
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call Bound9
#remove static link and parameters
	addq $32, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jge ge97
	movq $0, %r10
ge97:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif96
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref100#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref100:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError99#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed98#not indexOutOfBounds
indeksError99:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed98:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref101#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref101:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge103
	movq $0, %r10
ge103:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif102
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rbx
	push %rbx
	call BKnap8
#remove static link and parameters
	addq $32, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif102:
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jg ge106
	movq $0, %r10
ge106:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	cmp $0, %rbx
	jmp ge105
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r11
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r11
	je eq107
	movq $0, %r10
eq107:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	and %r9, %rbx
ge105:
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif104
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r9, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r9, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while108:
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jle ge109
	movq $0, %r9
ge109:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile108
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref112#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref112:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError111#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed110#not indexOutOfBounds
indeksError111:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed110:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref113#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref113:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref116#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref116:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError115#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed114#not indexOutOfBounds
indeksError115:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed114:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref117#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref117:
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while108
endwhile108:
endif104:
endif96:
	movq $0, %rax
	jmp BKnap8end
BKnap8end:
	addq $1320, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



Bound9:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $496, %rsp
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while119:
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge120
	movq $0, %r10
ge120:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile119
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref123#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref123:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError122#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed121#not indexOutOfBounds
indeksError122:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed121:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref124#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref124:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge126
	movq $0, %r10
ge126:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else125
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref129#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref129:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError128#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed127#not indexOutOfBounds
indeksError128:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed127:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref130#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref130:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp endif125
else125:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r10
	push %rbx
	movq %rbp, %r11
	addq $16, %r11
	movq %r11, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r10
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r11#first operand in t1
	push %rbx
	movq %rbp, %r10
	addq $16, %r10
	movq %r10, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r10
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r12
	movq %r12, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r10
	jne nonNullDeref133#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref133:
	movq %r10, %rcx
	cmp (%rcx), %rbx
	jge indeksError132#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed131#not indexOutOfBounds
indeksError132:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed131:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r10
	cmp $0, %r10
	jne nonNullDeref134#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref134:
	movq %r10, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r10
	push %rax
	movq $3, %rax
	cmp $0, %rbx
	je errorCleanup6
	pop %rax
	movq %r10, %rbx
	movq %r11, %rax
	movq $0, %rdx
	idivq %rbx
	movq %rax, %r11
	movq %r11, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r10
	push %rbx
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r9
	jne nonNullDeref137#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref137:
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError136#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed135#not indexOutOfBounds
indeksError136:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed135:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref138#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref138:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r10, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rax
	jmp Bound9end
endif125:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while119
endwhile119:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rax
	jmp Bound9end
Bound9end:
	addq $496, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



NextRand10:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $128, %rsp
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9#first operand in t1
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r10
	push %rax
	movq $3, %rax
	cmp $0, %rbx
	je errorCleanup6
	pop %rax
	movq %r10, %rbx
	movq %r9, %rax
	movq $0, %rdx
	idivq %rbx
	movq %rax, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rax
	jmp NextRand10end
NextRand10end:
	addq $128, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



exchange11:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $352, %rsp
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref143#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref143:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError142#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed141#not indexOutOfBounds
indeksError142:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed141:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref144#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref144:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref147#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref147:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError146#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed145#not indexOutOfBounds
indeksError146:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed145:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref148#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref148:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref151#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref151:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError150#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed149#not indexOutOfBounds
indeksError150:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed149:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref152#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref152:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref155#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref155:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError154#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed153#not indexOutOfBounds
indeksError154:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed153:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref156#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref156:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref159#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref159:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError158#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed157#not indexOutOfBounds
indeksError158:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed157:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref160#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref160:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref163#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref163:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError162#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed161#not indexOutOfBounds
indeksError162:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed161:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref164#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref164:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref167#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref167:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError166#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed165#not indexOutOfBounds
indeksError166:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed165:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref168#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref168:
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref171#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref171:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError170#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed169#not indexOutOfBounds
indeksError170:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed169:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref172#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref172:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $1, %rax
	jmp exchange11end
exchange11end:
	addq $352, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



quicksort12:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $232, %rsp
	movq $1, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge175
	movq $0, %r9
ge175:
	movq %r9, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif174
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call partition13
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rbx
	push %rbx
	call quicksort12
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rbx
	push %rbx
	call quicksort12
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif174:
	movq $1, %rax
	jmp quicksort12end
quicksort12end:
	addq $232, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



partition13:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $544, %rsp
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref179#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref179:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError178#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed177#not indexOutOfBounds
indeksError178:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed177:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref180#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref180:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref183#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref183:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError182#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed181#not indexOutOfBounds
indeksError182:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed181:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref184#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref184:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while185:
	movq $1, %r10
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	subq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jle ge186
	movq $0, %r10
ge186:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile185
	movq $1, %r10
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref191#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref191:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError190#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed189#not indexOutOfBounds
indeksError190:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed189:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref192#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref192:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r11
	push %rbx
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r12
	movq %r12, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $0, %r8
	jne nonNullDeref195#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref195:
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError194#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed193#not indexOutOfBounds
indeksError194:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed193:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref196#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref196:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r11, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jge ge188
	movq $0, %r10
ge188:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne endif187
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call exchange11
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif187:
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while185
endwhile185:
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %r8
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rbx
	push %rbx
	call exchange11
#remove static link and parameters
	addq $24, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq %rax, %r8
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq %r8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	movq %r8, %rax
	jmp partition13end
partition13end:
	addq $544, %rsp
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
