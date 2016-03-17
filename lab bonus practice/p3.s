.data
Array: .word 1024
msg1: .asciiz "Enter array numbers: \n"
msg2: .asciiz "Min value: \n"
msg3: .asciiz "max value: \n"
endl: .asciiz "   \n"
.text

.globl main

main:
li $v0, 4
la $a0, msg1
syscall

la $t0, Array
li $s0, 0

li $s1, 0 #max
li $s2, 1000 #min
loop:
li $v0, 5
syscall

beq $v0, 0, print
sw $v0, ($t0)
addi $s3, $v0, 0
addi $s0, $s0, 1
addi $t0, $t0, 4
blt $s3, $s2, min
bgt $s3, $s1, max
j loop

min:
addi $s2, $s3, 0
j loop
max:
addi $s1, $s3, 0
j loop

print:
li $v0, 4
la $a0, msg2
syscall 

li $v0, 1
addi $a0, $s2, 0
syscall


li $v0, 4
la $a0, endl
syscall

li $v0, 4
la $a0, msg3
syscall

li $v0, 1
addi $a0, $s1, 0
syscall

.end main