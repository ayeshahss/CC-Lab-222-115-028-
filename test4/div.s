	.file	"div.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter dividend: \0"
LC1:
	.ascii "%d\0"
LC2:
	.ascii "Enter divisor: \0"
	.align 4
LC3:
	.ascii "Error: Division by zero is not allowed.\0"
	.align 4
LC4:
	.ascii "The result of %d / %d is %.2f\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 64
	call	___main
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	lea	eax, [esp+56]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	lea	eax, [esp+52]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_scanf
	mov	eax, DWORD PTR [esp+52]
	test	eax, eax
	jne	L2
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_puts
	jmp	L3
L2:
	mov	eax, DWORD PTR [esp+56]
	mov	DWORD PTR [esp+44], eax
	fild	DWORD PTR [esp+44]
	mov	eax, DWORD PTR [esp+52]
	mov	DWORD PTR [esp+44], eax
	fild	DWORD PTR [esp+44]
	fdivp	st(1), st
	fstp	DWORD PTR [esp+60]
	fld	DWORD PTR [esp+60]
	mov	edx, DWORD PTR [esp+52]
	mov	eax, DWORD PTR [esp+56]
	fstp	QWORD PTR [esp+12]
	mov	DWORD PTR [esp+8], edx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
L3:
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
