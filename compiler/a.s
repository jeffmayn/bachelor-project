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
	subq $1776, %rsp
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
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $5, %rbx
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
	movq $5, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
while5:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq $0, %r10
	cmp $0, %rbx
	je null7
	movq %rbx, %r10
	movq %r10, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r10
null7:
	movq %r10, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r8
	jl ge6
	movq $0, %r9
ge6:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile5
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
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError9#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed8#not indexOutOfBounds
indeksError9:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed8:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $6, %rbx
	cmp $0, %rbx
	jg allocPos10
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos10:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc11
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc11:
	movq $6, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while12:
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
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq $0, %r8
	cmp $0, %rbx
	je null16
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
null16:
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge13
	movq $0, %r10
ge13:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile12
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
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
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
	movq freeHeap1, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r8
	movq $7, %rbx
	cmp $0, %rbx
	jg allocPos21
	movq $4, %rax#negative allocation size
	jmp errorCleanup5
allocPos21:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap1
	movq freeHeap1, %rbx
	cmp endHeap2, %rbx#may be out of order
	jl allocSucc22
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc22:
	movq $7, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
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
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi#resetting basepointer
while23:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r11
	movq %r11, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq $0, %r8
	cmp $0, %rbx
	je null29
	movq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
null29:
	movq %r8, %rbx
	movq %rbp, %rdi#resetting basepointer
	cmp %rbx, %r9
	jl ge24
	movq $0, %r10
ge24:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile23
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
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError33#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed32#not indexOutOfBounds
indeksError33:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed32:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
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
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError31#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed30#not indexOutOfBounds
indeksError31:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed30:
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
	jl allocSucc36
	movq $6, %rax#outofMemory
	jmp errorCleanup5
allocSucc36:
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError42#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed41#not indexOutOfBounds
indeksError42:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed41:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
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
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError40#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed39#not indexOutOfBounds
indeksError40:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed39:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError38#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed37#not indexOutOfBounds
indeksError38:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed37:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $0, %rbx
	movq %rbx, %r8
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
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError48#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed47#not indexOutOfBounds
indeksError48:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed47:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
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
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError46#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed45#not indexOutOfBounds
indeksError46:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed45:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError44#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed43#not indexOutOfBounds
indeksError44:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed43:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r8
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
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError54#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed53#not indexOutOfBounds
indeksError54:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed53:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
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
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError52#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed51#not indexOutOfBounds
indeksError52:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed51:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	push %rbx
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	pop %rbx
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError50#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed49#not indexOutOfBounds
indeksError50:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed49:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
#creating record dereferencing
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r8
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
	jmp while23
endwhile23:
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
	jmp while12
endwhile12:
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
	jmp while5
endwhile5:
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
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError60#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed59#not indexOutOfBounds
indeksError60:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed59:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError58#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed57#not indexOutOfBounds
indeksError58:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed57:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError56#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed55#not indexOutOfBounds
indeksError56:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed55:
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
	movq %rbx, %r8
	movq $100, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError66#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed65#not indexOutOfBounds
indeksError66:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed65:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError64#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed63#not indexOutOfBounds
indeksError64:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed63:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError62#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed61#not indexOutOfBounds
indeksError62:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed61:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError72#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed71#not indexOutOfBounds
indeksError72:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed71:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError70#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed69#not indexOutOfBounds
indeksError70:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed69:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError68#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed67#not indexOutOfBounds
indeksError68:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed67:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %rdi
	movq %r8, %rsi
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError78#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed77#not indexOutOfBounds
indeksError78:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed77:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError76#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed75#not indexOutOfBounds
indeksError76:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed75:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError74#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed73#not indexOutOfBounds
indeksError74:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed73:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-10, %rdx
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
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError84#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed83#not indexOutOfBounds
indeksError84:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed83:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError82#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed81#not indexOutOfBounds
indeksError82:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed81:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError80#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed79#not indexOutOfBounds
indeksError80:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed79:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError90#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed89#not indexOutOfBounds
indeksError90:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed89:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError88#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed87#not indexOutOfBounds
indeksError88:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed87:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError86#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed85#not indexOutOfBounds
indeksError86:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed85:
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
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError96#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed95#not indexOutOfBounds
indeksError96:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed95:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError94#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed93#not indexOutOfBounds
indeksError94:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed93:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError92#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed91#not indexOutOfBounds
indeksError92:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed91:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError102#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed101#not indexOutOfBounds
indeksError102:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed101:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError100#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed99#not indexOutOfBounds
indeksError100:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed99:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError98#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed97#not indexOutOfBounds
indeksError98:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed97:
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
	movq %rbx, %r8
	movq $100, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError108#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed107#not indexOutOfBounds
indeksError108:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed107:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError106#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed105#not indexOutOfBounds
indeksError106:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed105:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError104#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed103#not indexOutOfBounds
indeksError104:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed103:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError114#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed113#not indexOutOfBounds
indeksError114:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed113:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError112#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed111#not indexOutOfBounds
indeksError112:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed111:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError110#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed109#not indexOutOfBounds
indeksError110:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed109:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %rdi
	movq %r8, %rsi
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError118#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed117#not indexOutOfBounds
indeksError118:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed117:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError116#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed115#not indexOutOfBounds
indeksError116:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed115:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-11, %rdx
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
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError122#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed121#not indexOutOfBounds
indeksError122:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed121:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError120#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed119#not indexOutOfBounds
indeksError120:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed119:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError126#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed125#not indexOutOfBounds
indeksError126:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed125:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError124#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed123#not indexOutOfBounds
indeksError124:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed123:
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
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError130#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed129#not indexOutOfBounds
indeksError130:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed129:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError128#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed127#not indexOutOfBounds
indeksError128:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed127:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError136#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed135#not indexOutOfBounds
indeksError136:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed135:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError134#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed133#not indexOutOfBounds
indeksError134:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed133:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError132#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed131#not indexOutOfBounds
indeksError132:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed131:
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
	movq %rbx, %r8
	movq $100, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError142#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed141#not indexOutOfBounds
indeksError142:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed141:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError140#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed139#not indexOutOfBounds
indeksError140:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed139:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError138#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed137#not indexOutOfBounds
indeksError138:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed137:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError148#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed147#not indexOutOfBounds
indeksError148:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed147:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError146#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed145#not indexOutOfBounds
indeksError146:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed145:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError144#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed143#not indexOutOfBounds
indeksError144:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed143:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %rdi
	movq %r8, %rsi
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError150#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed149#not indexOutOfBounds
indeksError150:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed149:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-12, %rdx
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
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError152#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed151#not indexOutOfBounds
indeksError152:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed151:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError154#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed153#not indexOutOfBounds
indeksError154:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed153:
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
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
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
	movq $3, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError156#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed155#not indexOutOfBounds
indeksError156:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed155:
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError162#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed161#not indexOutOfBounds
indeksError162:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed161:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError160#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed159#not indexOutOfBounds
indeksError160:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed159:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError158#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed157#not indexOutOfBounds
indeksError158:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed157:
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
	movq %rbx, %r8
	movq $100, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError168#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed167#not indexOutOfBounds
indeksError168:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed167:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError166#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed165#not indexOutOfBounds
indeksError166:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed165:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError164#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed163#not indexOutOfBounds
indeksError164:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed163:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $8, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %rbx, %r9
	movq $10, %rbx
	movq %rbp, %rdi#resetting basepointer
	imulq %r9, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
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
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $4, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError174#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed173#not indexOutOfBounds
indeksError174:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed173:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $5, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError172#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed171#not indexOutOfBounds
indeksError172:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed171:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %rdi#resetting basepointer
	movq $6, %rbx
	movq %rbp, %rdi#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError170#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed169#not indexOutOfBounds
indeksError170:
#Exit program with error here
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup5
indeksAllowed169:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
#creating record dereferencing
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq $16, %rbx
	movq %rbx, %r9
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbp, %rdi#resetting basepointer
	addq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
	movq $0, %rax
mainend:
	addq $1776, %rsp
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
