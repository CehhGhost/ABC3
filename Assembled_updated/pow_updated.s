	.file	"pow.c"
	.intel_syntax noprefix
	.text
	.globl	pow
	.type	pow, @function
pow:
	push	rbp
	mov	rbp, rsp
	movsd	QWORD PTR -24[rbp], xmm0		# x (= -24)
	movsd	QWORD PTR -32[rbp], xmm1		# n (= -32)
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0			# res (= -8)
	mov	r12d, 0					# r12d = i в цикле for()
	jmp	.L2
.L3:
	movsd	xmm0, QWORD PTR -8[rbp]			# xmm0 = res
	mulsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR -8[rbp], xmm0			# res = res * x
	add	r12d, 1					# ++i
.L2:
	cvtsi2sd	xmm1, r12d
	movsd	xmm0, QWORD PTR -32[rbp]		# xmm0 = n
	comisd	xmm0, xmm1				# i < n
	ja	.L3
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	pow, .-pow
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
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
