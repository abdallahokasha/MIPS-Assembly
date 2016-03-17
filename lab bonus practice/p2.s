.data
Array: .word 1024
msg1: .asciiz "Enter array numbers: \n"
ws: .asciiz "\t"
.text

.globl main

main:
la $t0, Array

li $v0, 4
la $a0, msg1
syscall

loop:
li $v0, 5
syscall
addi $s1, $v0, 0

beq $v0, 0, init1
andi $s0, $v0, 1
beq $s0, 1, odd
addi $t0, $t0, 4
j loop

odd:
addi $s1, $s1, 1
sw $s1, ($t0)
addi $t0, $t0, 4
j loop

init1:
li $s0, 0
la $t0, Array
j print

print:
lw $s1, ($t0)
beq $s0, 10, exit

li $v0, 1
addi $a0, $s1, 0
syscall 

li $v0, 4
la $a0, ws
syscall 

addi $t0, $t0, 4
addi $s0, $s0, 1
j print

exit:
li $v0, 10
syscall

.end main