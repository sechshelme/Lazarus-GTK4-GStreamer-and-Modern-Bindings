	.intel_syntax noprefix
	.file	"mein_modul"
	.text
	.globl	calc
	.p2align	4
	.type	calc,@function
calc:
	.cfi_startproc
	lea	eax, [rdi + rsi]
	ret
.Lfunc_end0:
	.size	calc, .Lfunc_end0-calc
	.cfi_endproc

	.globl	calc.1
	.p2align	4
	.type	calc.1,@function
calc.1:
	.cfi_startproc
	mov	eax, edi
	imul	eax, esi
	ret
.Lfunc_end1:
	.size	calc.1, .Lfunc_end1-calc.1
	.cfi_endproc

	.globl	main
	.p2align	4
	.type	main,@function
main:
	.cfi_startproc
	push	rax
	.cfi_def_cfa_offset 16
	mov	edi, 10
	mov	esi, 20
	call	calc@PLT
	mov	edi, eax
	mov	esi, 30
	call	calc@PLT
	mov	edi, eax
	mov	esi, 2
	call	calc.1@PLT
	lea	rdi, [rip + .Lstr]
	mov	esi, eax
	xor	eax, eax
	call	printf@PLT
	xor	eax, eax
	pop	rcx
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc

	.type	.Lstr,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Das Ergebnis ist: %d\n"
	.size	.Lstr, 22

	.section	".note.GNU-stack","",@progbits
