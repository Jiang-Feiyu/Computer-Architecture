/* Test auipc */
	.global _start
	.text
	.align 4
_start:
	auipc x1, 1
	ebreak
