/* Test beq */
        .global _start
        .text
        .align 4
_start:
	addi x2, x0, 5
	addi x3, x0, 7
	addi x4, x2, 0
	bne x2, x3, target_1
	bne x2, x4, target_2
	nop
	nop

target_1:
	ebreak
	.word 0x88888888 # shows the correct ebreak
	
target_2:
	ebreak # you shouldn't arrive here
	.word 0x0BADBAD0
	nop
	nop
