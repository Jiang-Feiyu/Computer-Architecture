# mystery.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
.globl _exit

.text
_start:
    la s1, anArray
    la t0, anArrayLen
    lw t2, 0(t0)
    slli t2, t2, 2
    add s2, s1, t2
    li s0, 0
loop:
    lw a0, 0(s1)
    call chk_number
    add s0, s0, a0
    addi s1, s1, 4
    bne s1, s2, loop
    # print out results
    la a0, outputStr
    li a7, 4
    ecall
    mv a0, s0 #originally it's a1
    li a7, 1
    ecall
    # done
    j _exit
chk_number:
    andi a0, a0, 0x1
    ret
_exit:
    # rars uses a7 to denote environment call (system call)
    # Putting a value 10 in a7 here denotes the Exit function.
    # See https://github.com/TheThirdOne/rars/wiki/Environment-Calls
    li a7, 10
    ecall


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
