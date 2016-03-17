.data 
str: .space 1024
msg1: .asciiz "Enter ur String: \n"
msg2: .asciiz "Upper case string: "
whitespace: .asciiz "  "
endl: .asciiz "\n"

.text 


.globl main 

main:
# cout << msg1
li $v0, 4
la $a0, msg1
syscall 
# cin >> str
li $v0, 8
li $a1, 1024
la $a0, str
syscall 

loop:
lb $t0, ($a0)
beq $t0, 0, exit
blt $t0, 97, next
bgt $t0, 122, next
sub $t0, $t0, 32 
sb $t0, ($a0)

next:
addi $a0, $a0, 1
j loop 

exit:
li $v0, 4
la $a0, msg2
syscall
li $v0, 4
la $a0, str
syscall

li $v0, 4
la $a0, endl
syscall 

li $v0, 10
syscall 

.end main
