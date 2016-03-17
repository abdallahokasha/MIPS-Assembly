# sorting Array
.data
Array: .word 1024
msg1: .asciiz "Enter Array Numbers:\n"
msg2: .asciiz "Input Array: \n"
msg3: .asciiz "\nSorted array: \n"
endl: .asciiz "\n"
ws: .asciiz "  "
.text 

.globl main

main:

la $t0, Array
li $s0, 0
# cout << ""
li $v0, 4
la $a0, msg1
syscall 
 
input_loop:
li $v0, 5
syscall 
beq $v0, 0, init1
sw $v0, ($t0)
addi $t0, $t0, 4
addi $s0, $s0, 1
j input_loop

li $v0, 4
la $a0, msg2
syscall 
 
la $t0, Array
li $s1, 0
j print_loop

init1:
li $v0, 4
la $a0, msg2
syscall 
 
la $t0, Array
li $s1, 0
j print_loop
 
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
beq $s0, $s1, init2
j print_loop

init2:
la $t0, Array
li $s1, 0
li $s4, 0 
j loop1
 
 
loop1:
li $s1, 0
la $t0, Array
beq $s4, 1000, init3
addi $s4, $s4, 1
loop2:
beq $s1, $s0, loop1

lw $s2, ($t0)
addi $t0, $t0, 4
lw $s3, ($t0)
addi $t0, $t0, -4
addi $s1, $s1, 1
 
bgt $s2, $s3, swap 
ble $s2, $s3, inc
j loop2
j loop1

inc:
addi $t0, $t0, 4
j loop2

swap:
sw $s3, ($t0)
addi $t0, $t0, 4
sw $s2, ($t0)
j loop2   

init3:
la $t0, Array
li $s1, 0
 
li $v0, 4
la $a0, msg3
syscall 
 
j print_loop2
 
print_loop2:
beq $s0, $s1, exit
lw $s2, ($t0)
 
li $v0, 1
addi $a0, $s2, 0
syscall 
 
li $v0, 4
la $a0, ws
syscall
 
addi $s1, $s1, 1
addi $t0, $t0, 4
j print_loop2
 
exit:
li $v0, 10
syscall

.end main
