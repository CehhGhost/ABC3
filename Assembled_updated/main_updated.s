	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"File Opening Error"
.LC2:
	.string	"%d%lf"
.LC3:
	.string	"w"
.LC4:
	.string	"Your ch(x) = %lf\r\n"
	.align 8
.LC5:
	.string	"Choose input: manual or random(0 = manual; other = random):\r"
.LC6:
	.string	"%d"
.LC7:
	.string	"Set your x(>0 && <= %d)\r\n"
.LC8:
	.string	"x is out of range\r"
	.align 8
.LC10:
	.string	"Set your epsilon(>= %lf && <= 0.001)\r\n"
.LC11:
	.string	"%lf"
.LC13:
	.string	"epsilon is out of range\r"
	.align 8
.LC14:
	.string	"Choose seed generation(>0 && <= 100):\r"
.LC15:
	.string	"Seed is out of range\r"
.LC18:
	.string	"x: = %d \r\n"
.LC19:
	.string	"epsilon: = %lf \r\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi		# int argc (= -52)
	mov	QWORD PTR -64[rbp], rsi		# char *argv[] (= -64)
	cmp	DWORD PTR -52[rbp], 3		# сравнить argc с 3 (argc == 3)
	jne	.L2				# if (argc == 3) {...} else
	mov	rax, QWORD PTR -64[rbp]		# rax = argv[0]
	add	rax, 8				# для чтения с командной строки сдвигаем на argv[0]
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]			# ссылка на 'r'
	mov	rdi, rax			# argv[1]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax		# FILE *input (= -8)
	cmp	QWORD PTR -8[rbp], 0		# сравнить input с NULL (input == NULL)
	jne	.L3				# if (input == NULL) {...} else
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L3:
	lea	rcx, -32[rbp]			# rcx = epsilon для передачи в fscanf(input, "%d%lf", &x, &epsilon);
	lea	rdx, -20[rbp]			# rdx = x для передачи в fscanf(input, "%d%lf", &x, &epsilon);
	mov	rax, QWORD PTR -8[rbp]		# rax = input для передачи в fscanf(input, "%d%lf", &x, &epsilon);
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rdi, QWORD PTR -8[rbp]		# rdi = input для передачи в fclose(input);
	call	fclose@PLT
	mov	rax, QWORD PTR -64[rbp]		# rax =  argv[0]
	add	rax, 16				# для чтения с командной строки сдвигаем на argv[0]
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC3[rip]			# ссылка на 'w'
	mov	rdi, rax			# argv[2]
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax		# FILE *output (= -16)
	cmp	QWORD PTR -16[rbp], 0		# сравнить output с NULL (output == NULL)
	jne	.L5				# if (output == NULL) {...} else
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L5:
	mov	rdx, QWORD PTR -32[rbp]		# rdx = epsilon для передачи в get_chx(x, epsilon);
	mov	eax, DWORD PTR -20[rbp]		# eax = x для передачи в get_chx(x, epsilon);
	movq	xmm0, rdx
	mov	edi, eax
	call	get_chx@PLT
	mov	rax, QWORD PTR -16[rbp]		# rax = output для передачи в fprintf(output, "Your ch(x) = %lf\r\n", get_chx(x, epsilon));
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	mov	rdi, QWORD PTR -16[rbp]		# rdi = output для передачи в fclose(input);
	call	fclose@PLT
	mov	eax, 0
	jmp	.L14
.L2:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	lea	rax, -40[rbp]			# flag для передачи в scanf("%d", &flag);
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -40[rbp]		# eax = flag
	test	eax, eax
	jne	.L6				# if (flag == 0) {...} else
	mov	edi, 10
	call	putchar@PLT
	mov	esi, 10
	lea	rdi, .LC7[rip]
	mov	eax, 0				# eax = 0
	call	printf@PLT
	lea	rax, -20[rbp]			# x для передачи в scanf("%d", &x);
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0				# eax = 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -20[rbp]		# eax = x
	test	eax, eax
	jle	.L7
	mov	eax, DWORD PTR -20[rbp]		# eax = x
	cmp	eax, 10
	jle	.L8
.L7:
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L8:
	mov	rax, QWORD PTR .LC9[rip]
	movq	xmm0, rax
	lea	rdi, .LC10[rip]
	mov	eax, 1
	call	printf@PLT
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	movsd	xmm1, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR .LC9[rip]
	comisd	xmm0, xmm1
	ja	.L9
	movsd	xmm0, QWORD PTR -32[rbp]
	comisd	xmm0, QWORD PTR .LC12[rip]
	jbe	.L15
.L9:
	lea	rdi, .LC13[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L15:
	mov	rdx, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR -20[rbp]
	movq	xmm0, rdx
	mov	edi, eax
	call	get_chx@PLT
	lea	rdi, .LC4[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	jmp	.L14
.L6:
	lea	rdi, .LC14[rip]
	call	puts@PLT
	lea	rax, -36[rbp]			# rax = seed для передачи в scanf("%d", &seed);
	mov	rsi, rax
	lea	rdi, .LC6[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -36[rbp]
	test	eax, eax
	jle	.L12
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, 100
	jle	.L13
.L12:
	lea	rdi, .LC15[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L13:
	mov	edi, DWORD PTR -36[rbp]
	call	srand@PLT
	call	rand@PLT
	mov	ecx, eax
	movsx	rax, ecx
	imul	rax, rax, 780903145
	shr	rax, 32
	mov	edx, eax
	sar	edx
	mov	eax, ecx
	sar	eax, 31
	sub	edx, eax
	mov	eax, edx
	sal	eax, 2
	add	eax, edx
	add	eax, eax
	add	eax, edx
	sub	ecx, eax
	mov	edx, ecx
	mov	DWORD PTR -20[rbp], edx
	call	rand@PLT
	cdq
	shr	edx, 30
	add	eax, edx
	and	eax, 3
	sub	eax, edx
	add	eax, 3
	cvtsi2sd	xmm0, eax
	mov	rax, QWORD PTR .LC16[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	xmm1, QWORD PTR .LC17[rip]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	mov	esi, DWORD PTR -20[rbp]
	lea	rdi, .LC18[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	lea	rdi, .LC19[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR -20[rbp]
	movq	xmm0, rdx
	mov	edi, eax
	call	get_chx@PLT
	lea	rdi, .LC4[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L14:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC9:
	.long	2696277389
	.long	1051772663
	.align 8
.LC12:
	.long	3539053052
	.long	1062232653
	.align 8
.LC16:
	.long	0
	.long	1076101120
	.align 8
.LC17:
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
