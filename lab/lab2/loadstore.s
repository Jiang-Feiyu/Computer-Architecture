# loadstore.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
.text
_start:
	li   a1, 0x10010000 # Hack alert.  Only works with rars
    lw   t0, 0(a1)
    lw   t1, 4(a1)
    add  t2, t0, t1
    sw   t2, 8(a1)

.data
arrayPrime:
.word 11
.word 13
.word 17
.word 19

