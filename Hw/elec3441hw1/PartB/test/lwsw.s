/* Test Case */
	.global _start
	.text
	.align 4
_start:
	lw x1, 0(x0)
	lw x2, 4(x0)
	lw x3, 8(x0)
	lw x4, 12(x0)
	add x5, x1, x2
	sub x6, x4, x3
	sw x5, 36(x0)
	sw x6, 40(x0)
