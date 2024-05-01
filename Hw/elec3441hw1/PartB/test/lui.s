/* Test lui */
        .global _start
        .text
        .align 4
_start:
	lui x1, 0xDEADC
	addi x1, x1, -273
	ebreak
