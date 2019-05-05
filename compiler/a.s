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
	subq $624, %rsp
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
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc3
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc3:
	movq $7, %rbx
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
	addq $0, %rbx
	movq %rbx, %r9
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
	addq $8, %rbx
	movq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	addq $0, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	cmp $0, %rbx
	jg allocPos4
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos4:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc5
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc5:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	addq $16, %rbx
	movq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc6
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc6:
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $203, %rbx
	cmp $0, %rbx
	jg allocPos7
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos7:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc8
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc8:
	movq $203, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError10#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed9#not indexOutOfBounds
indeksError10:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed9:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc11
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc11:
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
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError13#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed12#not indexOutOfBounds
indeksError13:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed12:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError15#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed14#not indexOutOfBounds
indeksError15:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed14:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $8, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc16
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc16:
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	cmp $0, %rbx
	jg allocPos17
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos17:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc18
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc18:
	movq $1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError20#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed19#not indexOutOfBounds
indeksError20:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed19:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $200, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError22#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed21#not indexOutOfBounds
indeksError22:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed21:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError24#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed23#not indexOutOfBounds
indeksError24:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed23:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError26#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed25#not indexOutOfBounds
indeksError26:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed25:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
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
#creating record dereferencing
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
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
	addq $16, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError28#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed27#not indexOutOfBounds
indeksError28:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed27:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	addq $8, %rbx
	movq %rbx, %r8
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
	movq $0, %rax
mainend:
	addq $624, %rsp
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
