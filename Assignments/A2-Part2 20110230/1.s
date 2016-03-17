# Abdallah Mohamed Okasha
# 20110230
# A2-Part-2,problem 1
# CS-6
.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "number of operations = "
endl: .asciiz "\n"
.text

.globl main

main: 
# cout << "Enter a number: "
li $v0, 4
la $a0, msg1
syscall
# cin >> num
li $v0, 5
syscall
addi $s0, $v0, 0 # num

li $s1, 0 # counter
loop:
beq $s0, 1, Exit
andi $s2, $s0, 1
# counter ++
addi $s1, $s1, 1
beq $s2, 1, Odd
beq $s2, 0, Even
j loop

Even:
# num = (num >> 1)
srl $s0, $s0, 1 
# cont << num 
li $v0, 1
addi $a0, $s0, 0
syscall
# cout << endl
li $v0, 4
la $a0, endl
syscall

j loop

Odd:
mul $s0, $s0, 3
addi $s0, $s0, 1
# cont << num 
li $v0, 1
addi $a0, $s0, 0
syscall
# cout << endl
li $v0, 4
la $a0, endl
syscall
j loop

Exit:
# cout << "number of operations"
li $v0, 4
la $a0, msg2
syscall

# cout << counter
li $v0, 1
addi $a0, $s1, 0
syscall

li $v0, 10
syscall

.end main