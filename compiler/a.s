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
#line: 125 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos14
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos14:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc15
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc15:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 126 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos16
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos16:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc17
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc17:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 127 allocate of length statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq freeHeap2, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
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
	movq freeHeap2, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1000, %rbx
	cmp $0, %rbx
	jg allocPos20
	movq $4, %rax#negative allocation size
	jmp errorCleanup6
allocPos20:
	addq $1, %rbx#making room for arraySize
	imulq $8, %rbx
	addq %rbx, freeHeap2
	movq freeHeap2, %rbx
	cmp endHeap3, %rbx
	jl allocSucc21
	movq $6, %rax#outofMemory
	jmp errorCleanup6
allocSucc21:
	movq $1000, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 129 assign statement
	movq $1000, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-13, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 130 assign statement
	movq $600, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 131 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	dec %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 132 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 133 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-16, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 136 assign statement
	movq $1, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 137 assign statement
	movq $40, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-19, %rdx
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
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl ge23
	movq $0, %r9
ge23:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile22
#line: 155 list statement statement
#line: 145 assign statement
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-21, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-20, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-19, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-18, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call NextRand9
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 146 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-18, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8#first operand in t1
	movq $20, %rbx
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
	movq $10, %rbx
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref26#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref26:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError25#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed24#not indexOutOfBounds
indeksError25:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed24:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref27#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref27:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 147 assign statement
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-21, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-20, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-19, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-18, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call NextRand9
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-18, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 148 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-18, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8#first operand in t1
	movq $90, %rbx
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
	inc %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref30#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref30:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError29#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed28#not indexOutOfBounds
indeksError29:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed28:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref31#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref31:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 149 assign statement
	movq $0, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref34#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref34:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError33#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed32#not indexOutOfBounds
indeksError33:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed32:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref35#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref35:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 150 assign statement
	movq $0, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref38#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref38:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError37#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed36#not indexOutOfBounds
indeksError37:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed36:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref39#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref39:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 154 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while22
endwhile22:
#line: 158 assign statement
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
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
	movq $-17, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 170 assign statement
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
	push $0
	push $0
	movq %r8, %rbx
	push %rbx
	call BKnap7
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 173 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 181 while statement
while40:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl ge41
	movq $0, %r9
ge41:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile40
#line: 181 list statement statement
#line: 180 if then statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref46#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref46:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError45#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed44#not indexOutOfBounds
indeksError45:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed44:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref47#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref47:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq $1, %rbx
	cmp %rbx, %r8
	je eq43
	movq $0, %r9
eq43:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endif42
#line: 176 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-16, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
endif42:
#line: 180 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while40
endwhile40:
#line: 182 write statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	push %rdi
	movq $-16, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 183 write statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	push %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 184 write statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	push %rdi
	movq $-15, %rdx
	movq (%rdi,%rdx,8), %rsi
	movq %rbp, %rdi		#resetting basepointer
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



BKnap7:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $1320, %rsp
#line: 46 list statement statement
#line: 29 if then statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref53#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref53:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError52#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed51#not indexOutOfBounds
indeksError52:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed51:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref54#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref54:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jle ge50
	movq $0, %r10
ge50:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endif49
#line: 28 list statement statement
#line: 15 assign statement
	movq $1, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref57#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref57:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError56#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed55#not indexOutOfBounds
indeksError56:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed55:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref58#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref58:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 17 if then statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %r8, %rbx
	cmp %rbx, %r9
	jl ge60
	movq $0, %r10
ge60:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endif59
#line: 16 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r10
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref63#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref63:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError62#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed61#not indexOutOfBounds
indeksError62:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed61:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref64#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref64:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	push %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref67#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref67:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError66#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed65#not indexOutOfBounds
indeksError66:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed65:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref68#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref68:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	push %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	push %r8
	movq %r10, %rbx
	push %rbx
	call BKnap7
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
endif59:
#line: 28 if then statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref74#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref74:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError73#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed72#not indexOutOfBounds
indeksError73:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed72:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref75#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref75:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jg ge71
	movq $0, %r10
ge71:
	movq %r10, %rbx
	movq %rbx, %r9
	cmp $0, %rbx
	je lazyAnd70
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r11
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %r8, %rbx
	cmp %rbx, %r11
	je eq76
	movq $0, %r10
eq76:
	movq %r10, %rbx
	and %r9, %rbx
lazyAnd70:
	cmp $1, %rbx
	jne endif69
#line: 27 list statement statement
#line: 19 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref79#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref79:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError78#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed77#not indexOutOfBounds
indeksError78:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed77:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref80#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref80:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 20 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref83#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref83:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError82#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed81#not indexOutOfBounds
indeksError82:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed81:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref84#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref84:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 21 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 26 while statement
while85:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jle ge86
	movq $0, %r9
ge86:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile85
#line: 26 list statement statement
#line: 24 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref89#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref89:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError88#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed87#not indexOutOfBounds
indeksError88:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed87:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref90#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref90:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref93#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref93:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError92#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed91#not indexOutOfBounds
indeksError92:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed91:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref94#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref94:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 25 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while85
endwhile85:
endif69:
endif49:
#line: 45 if then statement
	movq $1, %r10
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call Bound8
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
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jge ge96
	movq $0, %r10
ge96:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endif95
#line: 44 list statement statement
#line: 31 assign statement
	movq $0, %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref99#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref99:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError98#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed97#not indexOutOfBounds
indeksError98:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed97:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref100#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref100:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 33 if then statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %r8, %rbx
	cmp %rbx, %r9
	jl ge102
	movq $0, %r10
ge102:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endif101
#line: 32 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	push %r8
	movq %r9, %rbx
	push %rbx
	call BKnap7
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
endif101:
#line: 44 if then statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jg ge105
	movq $0, %r10
ge105:
	movq %r10, %rbx
	movq %rbx, %r9
	cmp $0, %rbx
	je lazyAnd104
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r11
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %r8, %rbx
	cmp %rbx, %r11
	je eq106
	movq $0, %r10
eq106:
	movq %r10, %rbx
	and %r9, %rbx
lazyAnd104:
	cmp $1, %rbx
	jne endif103
#line: 43 list statement statement
#line: 35 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 36 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq %r9, %rbx
	movq $-15, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 37 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 42 while statement
while107:
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jle ge108
	movq $0, %r9
ge108:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endwhile107
#line: 42 list statement statement
#line: 40 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref111#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref111:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError110#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed109#not indexOutOfBounds
indeksError110:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed109:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref112#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref112:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref115#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref115:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError114#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed113#not indexOutOfBounds
indeksError114:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed113:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref116#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref116:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 41 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while107
endwhile107:
endif103:
endif95:
#line: 45 return statement
	movq $0, %rax
	jmp BKnap7end
BKnap7end:
	addq $1320, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



Bound8:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $496, %rsp
#line: 63 list statement statement
#line: 52 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 53 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 54 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 61 while statement
while118:
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jl ge119
	movq $0, %r10
ge119:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile118
#line: 61 list statement statement
#line: 57 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref122#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref122:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError121#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed120#not indexOutOfBounds
indeksError121:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed120:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref123#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref123:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 59 if then else statement
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r9
	jl ge125
	movq $0, %r10
ge125:
	movq %r10, %rbx
	cmp $1, %rbx
	jne else124
#line: 58 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref128#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref128:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError127#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed126#not indexOutOfBounds
indeksError127:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed126:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref129#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref129:
	movq %r9, %rcx
	movq (%rcx), %rbx
	addq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp endif124
else124:
#line: 59 return statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq $1, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r10
	movq %rbp, %r11
	addq $16, %r11
	movq %r11, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	subq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %r11#first operand in t1
	movq %rbp, %r10
	addq $16, %r10
	movq %r10, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r10
	cmp $0, %r10
	jne nonNullDeref132#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref132:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r10, %rcx
	cmp (%rcx), %rbx
	jge indeksError131#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed130#not indexOutOfBounds
indeksError131:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed130:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r10
	cmp $0, %r10
	jne nonNullDeref133#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref133:
	movq %r10, %rcx
	movq (%rcx), %rbx
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
	subq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %r10
	movq %rbp, %r9
	addq $16, %r9
	movq %r9, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref136#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref136:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r9, %rcx
	cmp (%rcx), %rbx
	jge indeksError135#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed134#not indexOutOfBounds
indeksError135:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed134:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r9
	cmp $0, %r9
	jne nonNullDeref137#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref137:
	movq %r9, %rcx
	movq (%rcx), %rbx
	imulq %r10, %rbx
	addq %rbx, %r8
	movq %r8, %rax
	jmp Bound8end
endif124:
#line: 60 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while118
endwhile118:
#line: 62 return statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rax
	movq %rbp, %rdi		#resetting basepointer
	jmp Bound8end
Bound8end:
	addq $496, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



NextRand9:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $128, %rsp
#line: 71 list statement statement
#line: 69 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	imulq %r8, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $5, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	addq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 70 return statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9#first operand in t1
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
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
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	imulq %r9, %rbx
	subq %rbx, %r8
	movq %r8, %rax
	jmp NextRand9end
NextRand9end:
	addq $128, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



exchange10:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $352, %rsp
#line: 85 list statement statement
#line: 78 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref142#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref142:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError141#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed140#not indexOutOfBounds
indeksError141:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed140:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref143#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref143:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 79 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref146#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref146:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError145#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed144#not indexOutOfBounds
indeksError145:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed144:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref147#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref147:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref150#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref150:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError149#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed148#not indexOutOfBounds
indeksError149:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed148:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref151#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref151:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 80 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref154#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref154:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError153#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed152#not indexOutOfBounds
indeksError153:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed152:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref155#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref155:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 81 assign statement
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
	jne nonNullDeref158#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref158:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError157#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed156#not indexOutOfBounds
indeksError157:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed156:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref159#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref159:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 82 assign statement
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
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref170#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref170:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError169#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed168#not indexOutOfBounds
indeksError169:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed168:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref171#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref171:
	movq %r9, %rbx
	movq %r8, %rcx
	movq %rbx, (%rcx)
#line: 84 return statement
	movq $1, %rax
	jmp exchange10end
exchange10end:
	addq $352, %rsp
	pop %r15
	pop %r14
	pop %r13
	pop %r12
	pop %rbx
	movq %rbp, %rsp
	pop %rbp
	ret 



quicksort11:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $232, %rsp
#line: 99 list statement statement
#line: 98 if then statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl ge174
	movq $0, %r9
ge174:
	movq %r9, %rbx
	cmp $1, %rbx
	jne endif173
#line: 97 list statement statement
#line: 94 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call partition12
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
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 95 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	push %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
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
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 96 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	push %r8
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
	movq %rbp, %rsp
	pop %rbp
	ret 



partition12:
	push %rbp
	movq %rsp, %rbp
	push %rbx
	push %r12
	push %r13
	push %r14
	push %r15
	subq $544, %rsp
#line: 121 list statement statement
#line: 106 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref178#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref178:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError177#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed176#not indexOutOfBounds
indeksError177:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed176:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref179#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref179:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 107 assign statement
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
	jne nonNullDeref182#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref182:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError181#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed180#not indexOutOfBounds
indeksError181:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed180:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref183#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref183:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 108 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 109 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $3, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 118 while statement
while184:
	movq $1, %r10
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	dec %r8
	movq %r8, %rbx
	cmp %rbx, %r9
	jle ge185
	movq $0, %r10
ge185:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endwhile184
#line: 118 list statement statement
#line: 117 if then statement
	movq $1, %r10
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref190#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref190:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError189#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed188#not indexOutOfBounds
indeksError189:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed188:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref191#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref191:
	movq %r8, %rcx
	movq (%rcx), %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	imulq %r8, %rbx
	movq %rbx, %r9
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r11
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
	jne nonNullDeref194#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref194:
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rcx
	cmp (%rcx), %rbx
	jge indeksError193#indexOutOfBounds
	cmp $0, %rbx
	jge indeksAllowed192#not indexOutOfBounds
indeksError193:
	movq $2, %rax#IndexOutOfBounds
	jmp errorCleanup6
indeksAllowed192:
	addq $1, %rbx#moving past array-size-value
	imulq $8, %rbx
	addq %rbx, %r8
	cmp $0, %r8
	jne nonNullDeref195#not NULL
	movq $5, %rax
	jmp errorCleanup6
nonNullDeref195:
	movq %r8, %rcx
	movq (%rcx), %rbx
	imulq %r11, %rbx
	cmp %rbx, %r9
	jge ge187
	movq $0, %r10
ge187:
	movq %r10, %rbx
	cmp $1, %rbx
	jne endif186
#line: 116 list statement statement
#line: 114 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 115 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r8
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %r8, %rbx
	push %rbx
	call exchange10
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
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
endif186:
#line: 117 assign statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	jmp while184
endwhile184:
#line: 119 assign statement
	movq %rbp, %r8
	addq $16, %r8
	movq %r8, %rbx
	movq (%rbx), %rbx
	movq %rbx, %r9
	push %rcx
	push %rdx
	push %rsi
	push %rdi
	push %r8
	push %r9
	push %r10
	push %r11
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $4, %rdx
	push (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	push %r8
	movq %r9, %rbx
	push %rbx
	call exchange10
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
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 120 return statement
	movq %rbp, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	inc %r8
	movq %r8, %rax
	jmp partition12end
partition12end:
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
