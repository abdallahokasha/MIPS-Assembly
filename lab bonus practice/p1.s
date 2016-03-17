 .data
msg1: .asciiz "Enter first num: \n"
msg2: .asciiz "Enter second num: \n"
msg3: .asciiz "the Summation is : \n"

.text
.globl main

main:
li $s3, 0

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall 
addi $s0, $v0, 0

li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall 
addi $s1, $v0, 0


loop:
add $s3, $s3, $s0
beq $s0, $s1, print_sum
addi $s0, $s0, 1 
j loop

print_sum:
li $v0, 4
la $a0, msg3
syscall

li $v0, 1
addi $a0, $s3, 0
syscall

li $v0, 10
syscall

.end main 