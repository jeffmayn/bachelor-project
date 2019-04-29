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
<<<<<<< HEAD
mainSPoint3:
.space 8
.text
.globl main
main:
=======
.text
.globl main
main:
	movq $heap0, freeHeap1
>>>>>>> IRoperator
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
<<<<<<< HEAD
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
=======
	subq $296, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-22, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
<<<<<<< HEAD
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
=======
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc3
#Here some kind of error should  be returned
allocSucc3:
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-25, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
<<<<<<< HEAD
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
=======
	addq $8, %rbx
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
<<<<<<< HEAD
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
	movq $10, %rbx
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
=======
	addq $16, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call buildData4
#remove static link and parameters
	addq $8, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-33, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbp, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call buildTree5
#remove static link and parameters
	addq $8, %rsp#remove static link and parameters
	pop %r11
	pop %r10
	pop %r9
	pop %r8
	pop %rdi
	pop %rsi
	pop %rdx
	pop %rcx
	movq $-39, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
mainend:
	addq $296, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



buildData4:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $1944, %rsp
	push %rbx
	movq $-6, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-6, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
<<<<<<< HEAD
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
=======
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $60, %rbx
>>>>>>> IRoperator
	addq $1, %rbx#making room for arraySize
	imul $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
<<<<<<< HEAD
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
=======
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc7
#Here some kind of error should  be returned
allocSucc7:
	movq $60, %rbx
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $599, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-11, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-11, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-10, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $648, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-15, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-15, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-14, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $8, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-19, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-19, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-18, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $781, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $3, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-23, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-23, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-22, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $796, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $4, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-27, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-27, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-26, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $893, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $5, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-31, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-31, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-30, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $412, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $6, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-35, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-35, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-34, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $199, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-39, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-39, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-38, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $561, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $8, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-43, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-43, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-42, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $489, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $9, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-47, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-47, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-48, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-46, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $236, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $10, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-51, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-51, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-50, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $977, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $11, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-55, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-55, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-54, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $630, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $12, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-59, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-59, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-59, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-60, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-58, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $785, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $13, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-63, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-63, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-63, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-63, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-64, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-64, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-62, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $280, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-65, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $14, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-66, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-67, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-67, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-67, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-68, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-68, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-66, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-65, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $138, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $15, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-71, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-71, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-72, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-72, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-70, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $127, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $16, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-75, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-75, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-75, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-75, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-76, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-76, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-74, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $657, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $17, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-78, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-79, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-79, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-79, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-80, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-80, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-78, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $361, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-81, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $18, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-83, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-83, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-83, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-83, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-83, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-84, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-84, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-82, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-81, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $534, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-85, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $19, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-86, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-87, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-87, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-87, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-87, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-87, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-88, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-86, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-86, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-85, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-86, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $179, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-89, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $20, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-90, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-91, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-91, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-91, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-91, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-91, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-92, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-92, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-90, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-90, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-89, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-90, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $140, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-93, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $21, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-94, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-95, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-95, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-95, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-95, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-95, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-96, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-96, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-94, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-94, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-93, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-94, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $334, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-97, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $22, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-98, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-99, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-99, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-99, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-99, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-99, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-100, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-100, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-98, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-98, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-97, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-98, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $963, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-101, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $23, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-102, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-103, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-103, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-103, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-103, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-103, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-104, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-104, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-102, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-102, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-101, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-102, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $909, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-105, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $24, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-106, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-107, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-107, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-107, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-107, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-107, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-108, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-108, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-106, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-106, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-105, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-106, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $212, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-109, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $25, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-110, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-111, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-111, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-111, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-111, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-111, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-112, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-112, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-110, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-110, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-109, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-110, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $34, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-113, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $26, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-114, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-115, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-115, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-115, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-115, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-115, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-116, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-116, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-114, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-114, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-113, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-114, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $100, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-117, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $27, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-118, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-119, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-119, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-119, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-119, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-119, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-120, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-120, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-118, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-118, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-117, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-118, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $12, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-121, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $28, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-122, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-123, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-123, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-123, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-123, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-123, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-124, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-124, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-122, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-122, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-121, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-122, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $371, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-125, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $29, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-126, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-127, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-127, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-127, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-127, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-127, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-128, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-128, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-126, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-126, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-125, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-126, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $219, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-129, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $30, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-130, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-131, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-131, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-131, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-131, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-131, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-132, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-132, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-130, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-130, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-129, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-130, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $752, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-133, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $31, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-134, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-135, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-135, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-135, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-135, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-135, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-136, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-136, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-134, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-134, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-133, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-134, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $519, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-137, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $32, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-138, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-139, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-139, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-139, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-139, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-139, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-140, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-140, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-138, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-138, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-137, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-138, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $594, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-141, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $33, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-142, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-143, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-143, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-143, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-143, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-143, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-144, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-144, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-142, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-142, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-141, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-142, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $903, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-145, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $34, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-146, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-147, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-147, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-147, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-147, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-147, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-148, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-148, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-146, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-146, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-145, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-146, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $981, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-149, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $35, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-150, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-151, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-151, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-151, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-151, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-151, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-152, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-152, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-150, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-150, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-149, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-150, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $258, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-153, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $36, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-154, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-155, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-155, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-155, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-155, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-155, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-156, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-156, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-154, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-154, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-153, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-154, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $791, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-157, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $37, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-158, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-159, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-159, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-159, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-159, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-159, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-160, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-160, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-158, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-158, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-157, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-158, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $873, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-161, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $38, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-162, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-163, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-163, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-163, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-163, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-163, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-164, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-164, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-162, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-162, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-161, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-162, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $108, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-165, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $39, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-166, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-167, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-167, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-167, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-167, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-167, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-168, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-168, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-166, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-166, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-165, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-166, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $511, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-169, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $40, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-170, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-171, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-171, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-171, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-171, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-171, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-172, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-172, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-170, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-170, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-169, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-170, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $264, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-173, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $41, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-174, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-175, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-175, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-175, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-175, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-175, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-176, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-176, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-174, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-174, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-173, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-174, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $327, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-177, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $42, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-178, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-179, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-179, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-179, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-179, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-179, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-180, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-180, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-178, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-178, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-177, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-178, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $587, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-181, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $43, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-182, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-183, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-183, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-183, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-183, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-183, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-184, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-184, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-182, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-182, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-181, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-182, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $815, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-185, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $44, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-186, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-187, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-187, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-187, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-187, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-187, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-188, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-188, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-186, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-186, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-185, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-186, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $503, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-189, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $45, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-190, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-191, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-191, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-191, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-191, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-191, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-192, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-192, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-190, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-190, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-189, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-190, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $851, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-193, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $46, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-194, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-195, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-195, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-195, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-195, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-195, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-196, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-196, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-194, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-194, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-193, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-194, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $592, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-197, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $47, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-198, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-199, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-199, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-199, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-199, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-199, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-200, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-200, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-198, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-198, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-197, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-198, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $396, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-201, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $48, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-202, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-203, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-203, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-203, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-203, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-203, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-204, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-204, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-202, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-202, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-201, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-202, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-205, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $49, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-206, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-207, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-207, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-207, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-207, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-207, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-208, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-208, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-206, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-206, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-205, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-206, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $156, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-209, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $50, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-210, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-211, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-211, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-211, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-211, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-211, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-212, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-212, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-210, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-210, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-209, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-210, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $904, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-213, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $51, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-214, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-215, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-215, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-215, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-215, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-215, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-216, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-216, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-214, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-214, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-213, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-214, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $617, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-217, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $52, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-218, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-219, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-219, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-219, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-219, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-219, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-220, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-220, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-218, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-218, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-217, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-218, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $635, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-221, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $53, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-222, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-223, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-223, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-223, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-223, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-223, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-224, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-224, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-222, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-222, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-221, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-222, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $899, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-225, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $54, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-226, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-227, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-227, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-227, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-227, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-227, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-228, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-228, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-226, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-226, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-225, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-226, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $497, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-229, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $55, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-230, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-231, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-231, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-231, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-231, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-231, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-232, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-232, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-230, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-230, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-229, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-230, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $585, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-233, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $56, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-234, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-235, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-235, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-235, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-235, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-235, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-236, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-236, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-234, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-234, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-233, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-234, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $793, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-237, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $57, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-238, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-239, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-239, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-239, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-239, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-239, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-240, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-240, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-238, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-238, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-237, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-238, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $269, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-241, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $58, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-242, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-243, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-243, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-243, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-243, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-243, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-244, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-244, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-242, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-242, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-241, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-242, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $918, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-245, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $59, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-246, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-247, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-247, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-247, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-247, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-247, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-248, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-248, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-246, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-246, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-245, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-246, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rax
	jmp buildData4end
buildData4end:
	addq $1944, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



buildTree5:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $368, %rsp
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-13, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-13, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-12, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-16, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-16, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq $-19, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-19, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
while9:
	movq $-22, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $60, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-23, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	jl less10
	movq $-22, %rdx
	movq $0, (%rbp,%rdx,8)
less10:
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile9
	push %rbx
	movq %rbp, %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-29, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-29, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-28, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
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
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-34, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-34, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	push %rbx
	movq $-36, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-36, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-36, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-36, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call insertValue10
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
	movq $-40, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-42, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-42, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-41, %rdx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	addq $1, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while9
endwhile9:
	push %rbx
	movq %rbp, %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
	jmp buildTree5end
buildTree5end:
	addq $368, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



insertValue10:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $672, %rsp
	push %rdi
	movq $10001, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-11, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-12, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	jl less13
	movq $-11, %rdx
	movq $0, (%rbp,%rdx,8)
less13:
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else12
	push %rdi
	movq $10002, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-18, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-21, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-21, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-22, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-22, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-19, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq14
	movq $-18, %rdx
	movq $0, (%rbp,%rdx,8)
eq14:
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else13
	push %rdi
	movq $10004, %rsi
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
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-25, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc14
#Here some kind of error should  be returned
allocSucc14:
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-26, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
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
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-34, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
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
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	jmp endif13
else13:
	push %rdi
	movq $10005, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-43, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-43, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
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
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-47, %rdx
	movq (%rbp,%rdx,8), %rcx
	push (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	push (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call insertValue10
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
	movq $-50, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-52, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-52, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif13:
	jmp endif12
else12:
	push %rdi
	movq $10003, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-54, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-55, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	je eq16
	movq $-54, %rdx
	movq $0, (%rbp,%rdx,8)
eq16:
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp $1, %rbx
	jne else15
	push %rdi
	movq $10006, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	push %rbx
	movq %rbp, %rbx
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-60, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $24, freeHeap1
	movq freeHeap1, %rbx
	cmp %rbx, endHeap2#may be out of order
	jl allocSucc16
#Here some kind of error should  be returned
allocSucc16:
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-64, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-64, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-65, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-65, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-66, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-66, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-67, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-69, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-69, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-70, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-70, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-71, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-67, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-71, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-73, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-73, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-74, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-76, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-76, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-77, %rdx
	movq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-77, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-78, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-74, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-78, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	jmp endif15
else15:
	push %rdi
	movq $10007, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $-79, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-79, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-79, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-79, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-80, %rdx
	movq %rbx, (%rbp,%rdx,8)
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
	movq $-82, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-82, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq $-83, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-83, %rdx
	movq (%rbp,%rdx,8), %rcx
	push (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-85, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-85, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $3, %rdx
	push (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-80, %rdx
	movq (%rbp,%rdx,8), %rbx
	push %rbx
	call insertValue10
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
	movq $-86, %rdx
	movq %rax, (%rbp,%rdx,8)
	movq $-86, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-87, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-88, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-88, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-88, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-88, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-89, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-89, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-87, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
endif15:
endif12:
	movq $0, %rax
	jmp insertValue10end
insertValue10end:
	addq $672, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



testGlobal17:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $72, %rsp
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-7, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-7, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-6, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $1, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-10, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-10, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
<<<<<<< HEAD
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
=======
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq $-13, %rdx
	movq %rbp, (%rbp,%rdx,8)
	movq $-13, %rdx
	addq $16, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq (%rbx), %rbx
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-13, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	addq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-12, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-12, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
<<<<<<< HEAD
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
	addq $8, freeHeap1
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
=======
	movq $0, %rax
	jmp testGlobal17end
testGlobal17end:
	addq $72, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



testParam19:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $72, %rsp
	movq $0, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-8, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $3, %rdx
	addq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-6, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-6, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $1, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $3, %rdx
	addq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $2, %rbx
	addq $1, %rbx#moving past array-size-value
	imul $8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-14, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $3, %rdx
	addq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-12, %rdx
	addq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
testParam19end:
	addq $72, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



testOneParam21:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $16, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $3, %rdx
	movq (%rbp,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
testOneParam21end:
	addq $16, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



testRecordParam23:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $56, %rsp
	push %rbx
	movq %rbp, %rbx
	movq $-7, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-7, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-8, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rdi
	movq $-8, %rdx
>>>>>>> IRoperator
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
<<<<<<< HEAD
	movq $0, %rax
	jmp mainend
mainend:
	addq $560, %rsp
=======
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-11, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-11, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
#creating record dereferencing
	movq $4, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-12, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-12, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rax
	jmp testRecordParam23end
testRecordParam23end:
	addq $56, %rsp
>>>>>>> IRoperator
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



<<<<<<< HEAD
errorCleanup4:
	movq mainSPoint3, %rsp
	jmp mainend
=======
>>>>>>> IRoperator
