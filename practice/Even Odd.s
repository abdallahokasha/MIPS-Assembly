#check for Even and Odd Numbers 

.data

endline: .asciiz "\n"
msg : .asciiz "Enter a number: \n"
odd : .asciiz "Odd Num\n"
even: .asciiz "Even Num"

.text

.globl main
main:


li $v0, 4
la $a0, msg
syscall

li $s0, 1

li $v0, 5
syscall 
addi $s1, $v0, 0

li $s0, 1

and $s2, $s0, $s1
beq $s2, 1, isOdd
beq $s2, 0, isEven

isOdd:
li $v0, 4
la $a0, odd
syscall 
li $v0, 10
syscall

isEven:
li $v0, 4
la $a0, even
syscall

li $v0, 10
syscall


.end main
