	.file	"fact.c"
	.intel_syntax noprefix
	.text
	.globl	fact
	.type	fact, @function
fact:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi			# n(= -20)
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0			# res(= -8)
	mov	r12d, 1					# r12d = i = 1 в цикле for()
	jmp	.L2
.L3:
	cvtsi2sd	xmm0, r12d
	movsd	xmm1, QWORD PTR -8[rbp]			# xmm1 = res
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0			# res = res * i
	add	r12d, 1					# ++i
.L2:
	mov	eax, r12d				# eax = i
	cmp	eax, DWORD PTR -20[rbp]			# i <= n
	jle	.L3
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	ret
	.size	fact, .-fact
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
