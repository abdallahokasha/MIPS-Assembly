# Abdallah Mohamed Okasha
# 20110230
# A2-Part-2,problem 2
# CS-6
.data
str: .space 1024
msg1: .asciiz "Enter string: "
msg2: .asciiz "palindrome string\n"
msg3: .asciiz "not palindrome string\n"
endl: .asciiz "\n"
.text 

.globl main

main:
# cout << "Enter string: "
li $v0, 4
la $a0, msg1
syscall 
# cin >> str;
li $v0, 8
la $a0, str
li $a1, 1024
syscall
# cout << str;
li $v0, 4
la $a0, str
syscall

la $t0, str
la $t1, str
# str.size()
lenLoop:
lb $s1, ($t0)
beq $s1, 0, initialize
addi $t0, $t0, 1
addi $s0, $s0, 1
j lenLoop

initialize: 
sub $t0, $t0, 1
sub $t0, $t0, 1
sub $s0, $s0, 1
# size /= 2
srl $s0, $s0, 1
bge $t0, 0, palindrome

palindrome:
lb $s2, ($t0)
lb $s3, ($t1)
# cout << s2;
li $v0, 11
la $a0, ($s2)
syscall
# cout << s3;
li $v0, 11
la $a0, ($s3)
syscall
# cout << endl
li $v0, 4
la $a0, endl
syscall 
# if(s2 != s3)
bne $s2, $s3, notpalindrome
# if (s0 <= 0)
ble $s0, 0, exit
sub $t0, $t0, 1
sub $s0, $s0, 1
addi $t1, $t1, 1
j palindrome

exit:
li $v0, 4
la $a0, msg2
syscall 
li $v0, 10
syscall  
  
notpalindrome:
li $v0, 4
la $a0, msg3
syscall
li $v0, 10
syscall

.end main
