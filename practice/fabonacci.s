.data
msg1: .asciiz "Enter a number\n"
msg2: .asciiz "Fabonacci = \n"
endl : .asciiz "\n"
.text

.globl main

fab:
addi $sp, $sp, 
base_case:

main:
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

.end main
