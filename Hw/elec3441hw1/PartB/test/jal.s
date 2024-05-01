/* Test Case */
        .global _start
        .text
        .align 4
_start:
	li  x28, 2
	li  ra, 0

linkaddr_2:
	jal target_2
	nop
	ebreak # you shouldn't arrive here
	.word 0x0BADBAD0
	nop
	nop

target_2:
	addi x2, x2, 0xc # compare x2 and x1 (ra), they should be the same
	ebreak
	.word 0x88888888 # shows the correct ebreak
	
