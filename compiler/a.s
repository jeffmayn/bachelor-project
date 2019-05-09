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

	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 125 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)

	movq %rbp, %rbx

	movq %rbp, %rbx

	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos18
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos18:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc19
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc19:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 128 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %rdi

	movq %rbp, %rbx

	movq %rbp, %rbx

	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx

	movq %rbx, %rdi

	movq %r8, %rbx

	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx

	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 138 assign statement
	movq $3641, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-20, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 139 assign statement
	movq $729, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-21, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 142 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 155 while statement
while22:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi

	push %rdi

	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref34#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref34:
	movq %rbp, %rbx
	movq %rbx, %rdi

	movq (%rdi,%rdx,8), %rbx

	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 150 assign statement
	movq $0, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi

	movq (%rdi,%rdx,8), %rbx

	movq %rbx, %r8

	movq %rbx, %rdi

	movq (%rdi,%rdx,8), %rbx

	movq %rbx, %r8
	dec %r8
	push %r8
	push $0
	movq %r9, %rbx
	push %rbx
	call quicksort11
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
	movq %rbp, %rbx
	movq %rbx, %rdi

	movq %r8, %rbx

	movq %rbx, %r8

	movq %r8, %rbx

	movq %rbx, %rdi

	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref162#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref162:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError161#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed160#not indexOutOfBounds
indeksError161:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed160:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref163#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref163:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref166#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref166:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError165#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed164#not indexOutOfBounds
indeksError165:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed164:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref167#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref167:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 83 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx

	movq %rbx, %r8

	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
endif173:
#line: 98 return statement
	movq $1, %rax
	jmp quicksort11end
quicksort11end:
	addq $232, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx

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
