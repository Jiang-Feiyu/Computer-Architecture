# jump.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
_start:         li   a0, 0x314
                li   a1, 0xabc
                bne  a0, a1, branch_target
                sub  t0, a0, a1
                j    clean_up
branch_target:  add  t0, a0, a1
                slli t0, t0, 2
clean_up:       mv   a0, t0

