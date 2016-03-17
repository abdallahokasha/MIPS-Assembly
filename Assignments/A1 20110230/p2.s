# Abdallah Mohamed Okasha
# 20110230
# CS-3
# A1 - p2

.data 

msg1: .asciiz "Enter Program total execution time: \n"
msg2: .asciiz "Enter Execution time affected by improvement: \n"
msg3: .asciiz "Amount of improvement: \n"
res: .asciiz "The Execution time of a program after improvement: \n"
endl: .asciiz "\n" 
.text 

.globl main

main:


# cout << msg1
li $v0, 4
la $a0, msg1
syscall
# cin >> x
li $v0, 5
syscall 
addi $s0, $v0, 0
# cout << msg2
li $v0, 4
la $a0, msg2
syscall 
# cin >> y
li $v0, 5
syscall 
addi $s1, $v0, 0
# cout << msg3
li $v0, 4
la $a0, msg3
syscall 
# cin >> z 
li $v0, 5
syscall 
addi $s2, $v0, 0
# s3 = s1 / s2
div $s3, $s1, $s2
# s3 = s3 + s0
add $s3, $s3, $s0
# cout << res 
li $v0, 4
la $a0, res
syscall 
# cout << s3
li $v0, 1
addi $a0, $s3, 0
syscall 
# cout << endl
li $v0, 4
la $a0, endl
syscall 
# return 0
li $v0, 10
syscall 

.end main 