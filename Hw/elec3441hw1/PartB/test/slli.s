/* Test slli */
        .global _start
        .text
        .align 4
_start:
	addi x1, x0, 13
	slli x2, x1, 4
	slli x3, x1, 8
	slli x4, x1, 1 
	ebreak
