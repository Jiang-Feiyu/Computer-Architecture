/* Test Case */
        .global _start
        .text
        .align 4
_start:
	li  x28, 2
	li  ra, 0

linkaddr_2:
	jal target_2
	ebreak # you shouldn't arrive here
	.word 0x0BADBAD0
	nop
	addi x5, x5, 0x34 # compare x4 and x5, they should be the same
	ebreak
	.word 0x88888888 # shows the correct ebreak
	nop
	nop

target_2:
	addi x2, x2, 0xc # compare x2 and x1 (ra), they should be the same
	jalr x4, 12(x1)
	ebreak # you shouldn't arrive here
	.word 0x0BADBAD0
