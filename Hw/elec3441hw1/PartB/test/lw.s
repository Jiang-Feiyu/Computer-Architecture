/* Test lw: read 2 words from .data section (located at 0xA00) */
        .global _start
        .text
        .align 4
_start:
	li x1, 0xA00 
	lw x2, 0(x1)
	lw x3, 4(x1)
	ebreak

	.data
	.word 0xDEADBEEF
	.word 0xFACECAFE
