# Reverse String Iterative
# Abdallah Mohamed Okasha
.data 
input: .space 1024
str1: .space 1024
msg1: .asciiz "Enter a string: \n"
msg2: .asciiz "Reversed String: \n"
endl: .asciiz "\n"
ws: .asciiz "  "
.text 

.globl main

main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 8
la $a0, input
li $a1, 1024
syscall

la $a0, input
jal reverse_iterative

# jal reverse_recursive

move $a0, $v0
li $v0, 4
syscall

li $v0, 10
syscall

.end main

reverse_iterative:
addi $sp, $sp, -8
sw $ra 0($sp)
sw $a0, 4($sp)

lw $a0, 4($sp)
jal string_length
move $s0, $v0 # return value - size

lw $t0, 4($sp)
loop3:
lb $s1, ($t0)
beq $s1, 0, init
addi $t0, $t0, 1
j loop3
init:
la $t1, str1
addi $t0, $t0, -1
loop4:
lb $s1, ($t0)
sb $s1, ($t1)
addi $t1, $t1, 1
addi $t0, $t0, -1
addi $s0, $s0, -1
ble $s0, -1, ret3
j loop4

ret3:
la $v0, str1
lw $ra, 0($sp)
addi $sp, $sp, 8
jr $ra
.end reverse_iterative

string_length:
addi $sp ,$sp, -8
sw $ra, 0($sp)
sw $a0, 4($sp)

lw $t0, 4($sp)
li $v0, 0
len_loop:
lb $s0, ($t0)
beq $s0, 0, ret 
addi $v0, $v0, 1
addi $t0, $t0, 1
j len_loop  
ret:
lw $ra, 0($sp)
addi $sp, $sp, 8
addi $v0, $v0, -1
jr $ra
.end string_length
# end of length function 