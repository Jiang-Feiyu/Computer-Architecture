# itermult.s
# ELEC3441 Lab
# Copyright Hayden So 2023
.globl _start
.globl _exit

.text
_start:
    li  a0, 3    # first value
    li  a1, 4    # second value
    add s0, zero, a0    # save the values of a0
    add s1, zero, a1    # save the values of a1
    call itermult
    mv s2, a0
    # print out results
    la a0, outputStr
    li a7, 4
    ecall
    mv a0, s0  # first value
    li a7, 1
    ecall
    la a0, timesStr
    li a7, 4
    ecall
    mv a0, s1  # second value
    li a7, 1
    ecall
    la a0, equalStr
    li a7, 4
    ecall
    mv a0, s2  # result value
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

itermult:
    ###############################################
    # Function: itermult
    # Parameter:
    #  * a0: first value (multiplicant)
    #  * a1: second value (mltuiplier)
    # Perform a0 x a1 and return the result in a0
    ###############################################
    
    ###### BEGIN of your code #############
    # Your code goes here
    ###### END of your code   #############
    ret
    
.data
outputStr:
.string "The result of "
timesStr:
.string " x "
equalStr:
.string " = "

