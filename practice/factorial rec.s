.data
msg1: .asciiz "Enter a number\n"
msg2: .asciiz "factorial = "
endl: .asciiz "\n"
.text 

.globl main

main:

li $v0, 4
la $a0, msg1
syscall 

li $v0, 5
syscall
 
addi $a0, $v0, 0
 
jal fact
 
addi $s0, $v0, 0
 
li $v0, 4
la $a0, msg2
syscall 
 
li $v0, 1
addi $a0, $s0, 0
syscall
 
li $v0, 4
la $a0, endl
syscall

li $v0, 10
syscall

.end main

fact:
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)
li $v0, 1
ble $a0, 0, base_case
addi $a0, $a0, -1
jal fact
lw $a0, 0($sp)
mul $v0, $v0, $a0  
base_case:
lw $ra, 4($sp)
addi $sp, $sp, 8
jr $ra
