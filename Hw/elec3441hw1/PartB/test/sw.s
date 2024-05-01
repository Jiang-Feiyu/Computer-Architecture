/* Test sw: set up an array, write to a few cells */
        .global _start
        .text
        .align 4
_start:
	addi x1, x0, 0x10 
	addi x2, x0, 0x42
	sw x2, 0(x1)
	addi x2, x2, 1
	sw x2, 4(x1)
	addi x2, x2, 1
	sw x2, 8(x1)
	ebreak
