# simpleadd.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
_start:
	addi a1, zero, 0xab
        addi a2, zero, 23
        add  a0, a1, a2
