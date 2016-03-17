# Abdallah Mohamed Okasha
# 20110230
# A3-Part-1,problem 2
# CS-6
# Find Method
.data
str: .space 1024
char: .space 10
msg1: .asciiz "Enter a String:\n"
msg2: .asciiz "Enter a char:\n"
msg3: .asciiz "Index = "
endl: .asciiz "\n" 
.text

.globl main

main:

jal find

li $v0, 4
la $a0, endl
syscall

li $v0, 10
syscall

.end main

find:
# cout << "Enter a String: "
li $v0, 4
la $a0, msg1
syscall 
# cin >> str;
li $v0, 8
la $a0, str
li $a1, 1024
syscall

# cout << "Enter a char: "
li $v0, 4
la $a0, msg2
syscall 
# cin >> char;
li $v0, 8
la $a0, char
li $a1, 10
syscall

la $t1, char
lb $s1, ($t1)
li $s2, 0
la $t0, str
loop:
lb $s0, ($t0)
beq $s0, $s1, found 
beq $s0, 0, notfound
addi $s2, $s2, 1
addi $t0, $t0, 1
j loop

found:
li $v0, 4
la $a0, msg3
syscall 

li $v0, 1
addi $a0, $s2, 0
syscall

j exit
notfound:
li $v0, 4
la $a0, msg3
syscall 

li $s2, -1
li $v0, 1
addi $a0, $s2, 0
syscall
j exit 

exit:
jr $ra
