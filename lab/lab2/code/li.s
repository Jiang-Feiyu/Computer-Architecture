# li.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
_start:
	li   a1, 65536
    li   a2, 0x1234abcd
    add  a0, a1, a2