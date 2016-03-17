.data 
Array: .space 12
msg : .asciiz "Enter 3 grades: \n"
res: .asciiz "the result is : \n"  
suc: .asciiz "\n Congratulations!\n"
oh: .asciiz "\n hard Luck!\n"  
.text 

.globl main
main : 

li $s0, 0
la $a0, msg
li $v0, 4
syscall 
la $t0, Array

li $v0, 5
syscall 
sw $v0, ($t0)


li $v0, 5
syscall 
sw $v0, 4($t0)

li $v0, 5
syscall 
sw $v0, 8($t0)

lw $s1, ($t0)
add $s0, $s0, $s1

lw $s1, 4($t0)
add $s0, $s0, $s1

lw $s1, 8($t0)
add $s0, $s0, $s1

li $v0, 4
la $a0, res
syscall

li $v0, 1
addi $a0, $s0, 0
syscall 

bge $s0,50,Success
blt $s0, 50, ohBabe 

Success:
li $v0, 4
la $a0, suc
syscall 
li $v0, 10
syscall 
ohBabe:
li $v0, 4
la $a0, oh
syscall 
li $v0, 10
syscall


li $v0, 10
syscall 

.end main 
