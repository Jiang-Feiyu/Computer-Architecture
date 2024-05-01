/* Test some R-type operations */
	.global _start
	.text
	.align 4
_start:
	add x5, x1, x2
	sub x6, x3, x4
	and x7, x5, x6
	or  x8, x5, x6
	ebreak
