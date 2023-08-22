.data
    num: .word 10
    arr: .word 10 5 4 9 8 6 2 1 3 0 7
    
.text
.globl main

main:
    la $t7, num
    lw $a0, 0($t7)