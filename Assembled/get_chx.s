	.file	"get_chx.c"
	.intel_syntax noprefix
	.text
	.globl	get_chx
	.type	get_chx, @function
get_chx:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	DWORD PTR -36[rbp], edi
	movsd	QWORD PTR -48[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0		# sum (= -24)
	movsd	xmm0, QWORD PTR .LC1[rip]
	movsd	QWORD PTR -16[rbp], xmm0		# prev (= -16)
	mov	DWORD PTR -28[rbp], 0			# i (= -28)
	jmp	.L2					# начало цикла for(int i = 0; sum - prev > epsilon; ++i)
.L3:
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -16[rbp], xmm0
	mov	eax, DWORD PTR -28[rbp]
	add	eax, eax
	cvtsi2sd	xmm1, eax
	cvtsi2sd	xmm0, DWORD PTR -36[rbp]	# x (= -36)
	call	pow@PLT
	movsd	QWORD PTR -56[rbp], xmm0
	mov	eax, DWORD PTR -28[rbp]
	add	eax, eax
	mov	edi, eax
	call	fact@PLT
	movsd	xmm2, QWORD PTR -56[rbp]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	addsd	xmm0, QWORD PTR -8[rbp]
	movsd	QWORD PTR -24[rbp], xmm0
	add	DWORD PTR -28[rbp], 1
.L2:							# цикл for(int i = 0; sum - prev > epsilon; ++i)
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	comisd	xmm0, QWORD PTR -48[rbp]
	ja	.L3
	movsd	xmm0, QWORD PTR -24[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
