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
	subq $864, %rsp
	movq %rsp, mainSPoint4
	movq %rbp, mainBPoint5
	movq $heap1, freeHeap2
	movq $heap1, endHeap3
	addq $1048576, endHeap3
#line: 80 allocate statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-16, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	addq $16, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc12
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc12:
#line: 81 assign statement
	movq $7, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref13#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref13:
	addq $0, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref14#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref14:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 82 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref15#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref15:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref16#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref16:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 84 allocate statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	addq $24, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc17
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc17:
#line: 85 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $42, %rbx
	movq %rbx, %r9
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
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 86 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 91 while statement
while20:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $42, %rbx
	cmp %rbx, %r8
	jl cmp21
	movq $0, %r9
cmp21:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile20
#line: 91 list statement statement
#line: 88 allocate statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref24#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref24:
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError23#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed22#not indexOutOfBounds
indeksError23:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed22:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref25#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref25:
	movq freeHeap2, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	addq $40, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc26
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc26:
#line: 89 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref31#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref31:
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError30#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed29#not indexOutOfBounds
indeksError30:
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
	movq %r8, %rcx
	movq (%rcx), %rbx
	cmp $0, %rbx
	jne nonNullDeref27#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref27:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref28#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref28:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 90 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	inc %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while20
endwhile20:
#line: 92 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 97 while statement
while33:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $42, %rbx
	cmp %rbx, %r8
	jl cmp34
	movq $0, %r9
cmp34:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile33
#line: 97 list statement statement
#line: 95 assign statement
	movq %rbp, %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $16, %rsp
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %rsp, %r8
	addq $0, %r8
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref37#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref37:
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError36#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed35#not indexOutOfBounds
indeksError36:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed35:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref38#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref38:
	movq %rsp, %r9
	addq $8, %r9
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
	movq %r10, %rbx
	push %rbx
	call add8
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 96 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	inc %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while33
endwhile33:
#line: 99 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 104 while statement
while39:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $42, %rbx
	cmp %rbx, %r8
	jl cmp40
	movq $0, %r9
cmp40:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile39
#line: 104 list statement statement
#line: 101 assign statement
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
	subq $8, %rsp
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %rsp, %r8
	addq $0, %r8
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r9, %rbx
	push %rbx
	call removeLast9
	addq $16, %rsp#remove static link and parameters
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 102 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref41#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref41:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref42#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref42:
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 103 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	inc %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while39
endwhile39:
#line: 110 if then statement
	movq $1, %r11
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r10
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref47#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref47:
	movq $42, %rbx
	movq %rbx, %r9
	movq $1, %rbx
	dec %r9
	movq %r9, %rbx
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError46#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed45#not indexOutOfBounds
indeksError46:
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
	cmp %rbx, %r10
	je cmp44
	movq $0, %r11
cmp44:
	movq %r11, %rbx
	cmp $1, %rbx
	jne endif43
#line: 108 write statement
	push %rdi
	movq $1, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif43:
#line: 110 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 119 if then statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq $1, %r8
	cmp $0, %rbx
	je false50
	movq $0, %r8
false50:
	movq %r8, %rbx
	cmp $1, %rbx
	jne endif49
#line: 113 list statement statement
#line: 112 assign statement
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
	subq $8, %rsp
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %rsp, %r8
	addq $0, %r8
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r9, %rbx
	push %rbx
	call removeLast9
	addq $16, %rsp#remove static link and parameters
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 113 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref51#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref51:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref52#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref52:
	push %rdi
	movq %r8, %rcx
	movq (%rcx), %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
endif49:
#line: 119 assign statement
	movq %rbp, %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	subq $16, %rsp
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %rsp, %r8
	addq $0, %r8
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref55#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref55:
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError54#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed53#not indexOutOfBounds
indeksError54:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed53:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref56#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref56:
	movq %rsp, %r9
	addq $8, %r9
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
	movq %r10, %rbx
	push %rbx
	call add8
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 120 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 121 assign statement
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
	subq $0, %rsp
	movq %r8, %rbx
	push %rbx
	call noArgs10
	addq $8, %rsp#remove static link and parameters
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 122 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	push %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 125 assign statement
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
	subq $8, %rsp
	movq %rsp, %r8
	addq $0, %r8
	movq $3, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
	movq %r9, %rbx
	push %rbx
	call f7
	addq $16, %rsp#remove static link and parameters
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
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq $0, %rax
mainend:
	addq $864, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



f7:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $8, %rsp
#line: 32 return statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rax
	movq %rbp, %rdi		#resetting basepointer
	jmp f7end
f7end:
	addq $8, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



add8:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $256, %rsp
#line: 47 if then else statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref61#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref61:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref62#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref62:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq $0, %rbx
	cmp %rbx, %r8
	je cmp60
	movq $0, %r9
cmp60:
	movq %r9, %rbx
	cmp $1, %rbx
	jne else59
#line: 41 list statement statement
#line: 38 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref63#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref63:
	addq $0, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref64#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref64:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 39 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref65#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref65:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref66#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref66:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 40 assign statement
	movq $0, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp endif59
else59:
#line: 47 list statement statement
#line: 43 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref67#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref67:
	addq $0, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref68#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref68:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref69#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref69:
	addq $16, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref70#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref70:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 44 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref73#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref73:
	addq $16, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref74#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref74:
	movq %r9, %rcx
	movq (%rcx), %rbx
	cmp $0, %rbx
	jne nonNullDeref71#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref71:
	addq $24, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref72#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref72:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 45 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref75#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref75:
	addq $24, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref76#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref76:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 46 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref77#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref77:
	addq $0, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref78#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref78:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
endif59:
#line: 48 return statement
	movq $0, %rax
	jmp add8end
add8end:
	addq $256, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



removeLast9:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $312, %rsp
#line: 72 if then else statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $0, %rbx
	cmp %rbx, %r8
	je cmp82
	movq $0, %r9
cmp82:
	movq %r9, %rbx
	movq %rbx, %r8
	cmp $1, %rbx
	je lazy81
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref84#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref84:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref85#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref85:
	movq %r9, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq $0, %rbx
	cmp %rbx, %r9
	je cmp83
	movq $0, %r10
cmp83:
	movq %r10, %rbx
	or %r8, %rbx
lazy81:
	movq %rbx, %r8
	movq %r8, %rbx
	cmp $1, %rbx
	jne else80
#line: 57 list statement statement
#line: 55 write statement
	push %rdi
	movq $121, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 56 return statement
	movq $0, %rax
	jmp removeLast9end
	jmp endif80
else80:
#line: 72 list statement statement
#line: 59 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref86#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref86:
	addq $8, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref87#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref87:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 60 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref88#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref88:
	addq $24, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref89#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref89:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref90#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref90:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref91#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref91:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 61 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref92#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref92:
	addq $16, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref93#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref93:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 62 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref94#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref94:
	addq $24, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref95#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref95:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 70 if then else statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref98#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref98:
	addq $8, %rbx
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref99#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref99:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq $0, %rbx
	cmp %rbx, %r8
	je cmp97
	movq $0, %r9
cmp97:
	movq %r9, %rbx
	cmp $1, %rbx
	jne else96
#line: 67 list statement statement
#line: 65 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref100#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref100:
	addq $0, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref101#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref101:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
#line: 66 assign statement
	movq $1, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp endif96
else96:
#line: 70 list statement statement
#line: 69 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp $0, %rbx
	jne nonNullDeref104#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref104:
	addq $8, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref105#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref105:
	movq %r9, %rcx
	movq (%rcx), %rbx
	cmp $0, %rbx
	jne nonNullDeref102#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref102:
	addq $16, %rbx
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref103#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref103:
	movq %r8, %rbx
	movq %r9, %rcx
	movq %rbx, (%rcx)
endif96:
#line: 71 return statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rax
	movq %rbp, %rdi		#resetting basepointer
	jmp removeLast9end
endif80:
removeLast9end:
	addq $312, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



noArgs10:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $0, %rsp
#line: 76 return statement
	movq $0, %rax
	jmp noArgs10end
noArgs10end:
	addq $0, %rsp
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
