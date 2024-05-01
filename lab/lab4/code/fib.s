# fig.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
.globl _exit

.text
_start:
    li      s0, 9
    add     a0, zero, s0
    call    fib
    
    li    a7, 10


    # print out results
    la a0, outputStr
    li a7, 4
    ecall
    mv a0, s0 #originally it's a1
    li a7, 1
    ecall
    # done
    j _exit
_exit:
    # rars uses a7 to denote environment call (system call)
    # Putting a value 10 in a7 here denotes the Exit function.
    # See https://github.com/TheThirdOne/rars/wiki/Environment-Calls
    li a7, 10
    ecall


.text
outputStr:
.string "Fibonacci number "
isStr:
.string " is: "
