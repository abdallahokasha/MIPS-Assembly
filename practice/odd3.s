# lab Exam 2015
# 20110230
# CS-6
.data 
Array: .word 1024
msg1: .asciiz "Enter array size: \n"
msg2: .asciiz "Enter array numbers: \n"
msg3: .asciiz "edited Array:\n"
endl: .asciiz "\n"
ws: .asciiz "  "
.text 

.globl main

main:

li $v0, 4
la $a0, msg1
syscall
 
li $v0, 5
syscall
addi $s0, $v0, 0 #size

li $v0, 4
la $a0, msg2
syscall

li $s1, 0
la $t0, Array
loop: 
li $v0, 5
syscall
sw $v0, ($t0)
addi $t0, $t0, 4
addi $s1, $s1, 1
beq $s1, $s0, call
j loop

call:
addi $a0, $s0, 0
la $a1, Array
jal replace_odd_array

la $t0, Array
li $s1, 0

li $v0, 4
la $a0, msg3
syscall

print_loop:
lw $s2, ($t0)

li $v0, 1
addi $a0, $s2, 0
syscall

li $v0, 4
la $a0, ws
syscall

addi $s1, $s1, 1
addi $t0, $t0, 4
beq $s1, $s0, final
j print_loop

final:
li $v0, 10
syscall

.end main

replace_odd_array:
li $s1, 0
addi $sp, $sp, -12
sw $ra, 0($sp)
sw $a0, 4($sp)
sw $a1, 8($sp)

lw $t0, 8($sp) 
loop_func:
lw $s2, ($t0)
# call is_odd function
addi $a0, $s2, 0 # is_odd parameter
jal is_odd
beq $v0, 0, assigne

addi $s1, $s1, 1
addi $t0, $t0, 4
beq $s1, $s0, exit
assigne:
li $s2, 0
sw $s2, ($t0)
addi $s1, $s1, 1
addi $t0, $t0, 4
beq $s1, $s0, exit

j loop_func

exit:
lw $ra, 0($sp)
addi $sp, $sp, 12
jr $ra

is_odd:
addi $sp, $sp, -8
sw $ra, 0($sp)
sw $a0, 4($sp) 
lw $s2, 4($sp)

andi $s2, $s2, 1
beq $s2, 1, odd
beq $s2, 0, even
odd:
li $v0, 0
lw $ra, 0($sp)
addi $sp, $sp, 8
jr $ra

even:
li $v0, 1
lw $ra, 0($sp)
addi $sp, $sp, 8
jr $ra
