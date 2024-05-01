/* Test Case */
        .global _start
        .text
        .align 4
_start:
        addi x1, x0, 1
        addi x2, x1, 1
	addi x3, x0, 3
	addi x4, x3, -1
	addi x5, x4, -3
        ebreak
