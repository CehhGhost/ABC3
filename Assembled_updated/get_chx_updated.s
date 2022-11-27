	.file	"get_chx.c"
	.intel_syntax noprefix
	.text
	.globl	get_chx
	.type	get_chx, @function
get_chx:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -36[rbp], edi			# x (= -36)
	movsd	QWORD PTR -48[rbp], xmm0		# epsilon (= -48)
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0			# sum (= -8)
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -16[rbp], xmm0		# prev (= -16)
	mov	r14d, 0					# r14d = i
	jmp	.L2					# начало цикла for(int i = 0; sum - prev > epsilon; ++i)
.L3:
	movsd	xmm0, QWORD PTR -8[rbp]			# xmn0 = sum
	movsd	QWORD PTR -16[rbp], xmm0		# prev = sum
	mov	eax, r14d				# eax = i
	add	eax, eax				# i * 2
	cvtsi2sd	xmm1, eax
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]	# x (= -36)
	call	pow@PLT
	movsd	QWORD PTR -56[rbp], xmm0
	mov	eax, r14d				# eax = i
	add	eax, eax
	mov	edi, eax
	call	fact@PLT
	movsd	xmm2, QWORD PTR -56[rbp]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	movsd	QWORD PTR -32[rbp], xmm0		# res (= -32)
	movsd	xmm0, QWORD PTR -8[rbp]			# xmm0 = sum
	addsd	xmm0, QWORD PTR -32[rbp]		# sum += res
	movsd	QWORD PTR -8[rbp], xmm0			# ++i
	add	r14d, 1
.L2:							# цикл for(int i = 0; sum - prev > epsilon; ++i)
	movsd	xmm0, QWORD PTR -8[rbp]			# xmm0 = sum
	subsd	xmm0, QWORD PTR -16[rbp]		# sum - prev
	comisd	xmm0, QWORD PTR -48[rbp]		# sum - prev > epsilon
	ja	.L3
	movsd	xmm0, QWORD PTR -8[rbp]
	leave
	ret
	.size	get_chx, .-get_chx
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
