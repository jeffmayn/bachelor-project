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
#line: 2 assign statement
	movq $1, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-6, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 3 assign statement
	movq $1, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-7, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 4 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-8, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 5 assign statement
	movq $0, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-9, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 7 assign statement
	movq $1000, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-10, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 8 assign statement
	movq $1000000, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-11, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 9 assign statement
	movq $10, %rbx
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-12, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 10 assign statement
	movq $10, %rbx
	movq %rbx, %r8
	movq $100, %rbx
	subq %rbx, %r8
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
#line: 11 assign statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq %r8, %rbx
	movq $-14, %rdx
	movq %rbx, (%rdi,%rdx,8)
	movq %rbp, %rdi		#resetting basepointer
#line: 13 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je lazy8
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	and %r8, %rbx
lazy8:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 15 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 17 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je lazy9
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	and %r8, %rbx
lazy9:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 19 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 21 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je lazy10
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	and %r8, %rbx
lazy10:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 23 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 25 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $0, %rbx
	je lazy11
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	and %r8, %rbx
lazy11:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 27 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 29 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $1, %rbx
	je lazy12
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	or %r8, %rbx
lazy12:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 31 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 33 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $1, %rbx
	je lazy13
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	or %r8, %rbx
lazy13:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 35 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 37 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-6, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $1, %rbx
	je lazy14
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-9, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	or %r8, %rbx
lazy14:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 39 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 41 write statement
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-8, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	cmp $1, %rbx
	je lazy15
	movq %rbp, %rbx
	movq %rbx, %r9
	movq %r9, %rbx
	movq %rbx, %rdi
	movq $-7, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	or %r8, %rbx
lazy15:
	movq %rbx, %r8
	push %rdi
	movq %r8, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 43 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 45 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	je cmp16
	movq $0, %r9
cmp16:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 47 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 49 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	je cmp17
	movq $0, %r9
cmp17:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 51 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 53 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	je cmp18
	movq $0, %r9
cmp18:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 55 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 57 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-14, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jne cmp19
	movq $0, %r9
cmp19:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 59 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 61 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jne cmp20
	movq $0, %r9
cmp20:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 63 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 65 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jne cmp21
	movq $0, %r9
cmp21:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 67 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 69 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl cmp22
	movq $0, %r9
cmp22:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 71 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 73 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl cmp23
	movq $0, %r9
cmp23:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 75 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 77 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jl cmp24
	movq $0, %r9
cmp24:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 79 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 81 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jg cmp25
	movq $0, %r9
cmp25:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 83 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 85 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jg cmp26
	movq $0, %r9
cmp26:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 87 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 89 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jg cmp27
	movq $0, %r9
cmp27:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 91 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 93 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jle cmp28
	movq $0, %r9
cmp28:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 95 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 97 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jle cmp29
	movq $0, %r9
cmp29:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 99 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 101 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jle cmp30
	movq $0, %r9
cmp30:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 103 write statement
	push %rdi
	movq $123456789, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 105 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-11, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jge cmp31
	movq $0, %r9
cmp31:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 107 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 109 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-12, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-13, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jge cmp32
	movq $0, %r9
cmp32:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 111 write statement
	push %rdi
	movq $1234, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 113 write statement
	movq $1, %r9
	movq %rbp, %rbx
	movq %rbx, %r8
	movq %r8, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	movq %rbx, %r8
	movq %rbp, %rbx
	movq %rbx, %r10
	movq %r10, %rbx
	movq %rbx, %rdi
	movq $-10, %rdx
	movq (%rdi,%rdx,8), %rbx
	movq %rbp, %rdi		#resetting basepointer
	cmp %rbx, %r8
	jge cmp33
	movq $0, %r9
cmp33:
	push %rdi
	movq %r9, %rsi
	movq $format, %rdi
	movq $0, %rax
	call printf
	pop %rdi
#line: 115 write statement
	push %rdi
	movq $123456789, %rsi
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



errorCleanup6:
	movq mainSPoint4, %rsp
	movq mainBPoint5, %rbp
	jmp mainend
