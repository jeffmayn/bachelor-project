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
	subq $456, %rsp
	movq %rsp, mainSPoint3
	movq %rbp, mainBPoint4
	movq $heap0, freeHeap1
	movq $heap0, endHeap2
	addq $1048576, endHeap2
	push %rbx
	movq %rbp, %rbx
	movq $-9, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-9, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq freeHeap1, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $-10, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	cmp $0, %rbx
	jg allocPos3
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos3:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc4
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc4:
	movq $7, %rbx
	movq $-10, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq $0, %rbx
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
while5:
	movq $-14, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-15, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-15, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-13, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-13, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	jl ge6
	movq $-14, %rdx
	movq $0, (%rbp,%rdx,8)
ge6:
	movq $-14, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile5
	push %rbx
	movq %rbp, %rbx
	movq $-17, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-17, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-16, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-18, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-18, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError8#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed7#not indexOutOfBounds
indeksError8:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed7:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-16, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq freeHeap1, %rbx
	movq $-16, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	addq $16, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc9
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc9:
	push %rbx
	movq %rbp, %rbx
	movq $-20, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-20, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-19, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-19, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-19, %rdx
	movq (%rbp,%rdx,8), %rbx
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
	jmp while5
endwhile5:
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-23, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-24, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-24, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-23, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while10:
	movq $-26, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-27, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-27, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-25, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-25, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	jl ge11
	movq $-26, %rdx
	movq $0, (%rbp,%rdx,8)
ge11:
	movq $-26, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile10
	push %rbx
	movq %rbp, %rbx
	movq $-28, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-28, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-29, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-31, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-31, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-30, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-32, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-32, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
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
	movq $-30, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-30, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-33, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-29, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-33, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-35, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-37, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-37, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rcx
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
	movq $-35, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-35, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq $-38, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-34, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-38, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-40, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-40, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-39, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-39, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-39, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-41, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-42, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-42, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-41, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while10
endwhile10:
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-43, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-44, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-44, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-43, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq $0, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-45, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-46, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-46, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-45, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while16:
	movq $-48, %rdx
	movq $1, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-49, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-49, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $7, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-47, %rdx
	cmp %rbx, (%rbp,%rdx,8)
	jl ge17
	movq $-48, %rdx
	movq $0, (%rbp,%rdx,8)
ge17:
	movq $-48, %rdx
	movq (%rbp,%rdx,8), %rbx
	cmp $1, %rbx
	jne endwhile16
	push %rbx
	movq %rbp, %rbx
	movq $-51, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-51, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-50, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-53, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-53, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $-52, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-54, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-54, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rcx
	cmp (%rcx), %rbx
	jge indeksError19#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed18#not indexOutOfBounds
indeksError19:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed18:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	movq $-52, %rdx
	addq %rbx, (%rbp,%rdx,8)
#creating record dereferencing
	movq $-52, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq $-55, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-55, %rdx
	movq (%rbp,%rdx,8), %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-50, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-50, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-56, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-57, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-57, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-56, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq $-59, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-59, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-58, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $1, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-58, %rdx
	addq %rbx, (%rbp,%rdx,8)
	movq $-58, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq $-60, %rdx
	movq %rbx, (%rbp,%rdx,8)
	push %rbx
	movq %rbp, %rbx
	movq $-61, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-61, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-60, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	jmp while16
endwhile16:
	push %rbx
	movq %rbp, %rbx
	movq $-62, %rdx
	movq %rbx, (%rbp,%rdx,8)
	movq $-62, %rdx
	movq (%rbp,%rdx,8), %rbx
	movq %rbx, %rdi
	pop %rbx
	push %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $456, %rsp
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
