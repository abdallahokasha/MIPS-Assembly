# Abdallah Mohamed Okasha
# 20110230
# A2-Part-1,problem 1
# CS-6
.data 
msg1: .asciiz "Enter the radius: \n"
msg2: .asciiz "Circle Area = "
msg3: .asciiz "Circle Circumfrance = "
endl: .asciiz "\n"
  
.text 

.globl main
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall 

li $s1, 22
li $s2, 7

add $s0, $s0, $v0


mul $s3, $s0, $s1
mul $s3, $s3, $s0
div $s3, $s3, $s2

li $v0, 4
la $a0, msg2
syscall 

li $v0, 1
addi $a0, $s3, 0
syscall 

li $v0, 4
la $a0, endl
syscall  

li $v0, 4
la $a0, msg3
syscall 

add $s0, $s0, $s0
mul $s3, $s0, $s1
div $s3, $s3, $s2

 li $v0, 1
 addi $a0, $s3, 0
 syscall 

li $v0, 10
syscall

.end main