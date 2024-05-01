# rtype.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
.globl _exit

.text
_start:
    addi    a0, zero, 15
    ori     a1, zero, 0xFF
    andi    a2, zero, 0xA5
    xori    a3, zero, 0xE7
    add     a1, a0, a0
    slli    a2, a1, 8
    sub     a3, a2, a1
    or      s0, a0, a2

.data
anArray:
.word 29
.word 1337
.word 0xABCD1234
.word 0x0EEE3441
.word 238
.word 1000
anArrayLen:
.word 6
outputStr:
.string "The count is: "

