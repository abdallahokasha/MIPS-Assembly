# Reverse String
# Abdallah Mohamed Okasha
# 20110230
# A3-part2-Problem1
# CS-6

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
move $t0, $v0
li $v0, 4
syscall

la $a0,endl
li $v0, 4
syscall

li $t2, 0
la $t1, str1
while:
lb $s2, ($t0)
sb $s2, ($t1)
  
beq $s2, 32, print
beq $s2, 0, exit
addi $t0, $t0, 1
addi $t1, $t1, 1
addi $t2, $t2, 1
j while

print:
addi $t1, $t1, 1
li $s1, 0
sb $s1, ($t1)

addi $a0, $t2, 0
li $v0, 1
syscall

li $v0, 4
la $a0, endl
syscall

li $v0, 4
la $a0, str1
syscall
li $v0, 4
la $a0, endl
syscall

# la $a0, str1
# jal reverse_iterative
# move $a0, $v0
# li $v0, 4
# syscall


li $v0, 4
la $a0, endl
syscall



la $t1, str1
li $s1, 0
sb $s1, ($t1)
la $t1, str1
addi $t0, $t0, 1
addi $t2, $t2, 1
j while
exit:
li $v0, 10
syscall

.end main

# string reverse (string s)
# {
#    int n = (int)s.size();
#    if (n == 1)return s;
#    else
#    {
#        char c = s[0];
#        s.erase(0, 1);
#        s = reverse(s) + c;
#        return s;
#    }
# }

# begin of function 
reverse_recursive:
addi $sp, $sp, -8
sw $ra, 0($sp)
sw $a0, 4($sp)# string address

lw $a0, 4($sp)# length function parameter
jal string_length
move $s0, $v0 # string size - return value

beq $s0, 1, cond1
bgt $s0, 1, cond2

cond1:# if (size == 1)return str; - base case
lw $ra, 0($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
jr $ra
cond2:# if (size > 1) recursive call
lw $t0, 4($sp) # string str
lb $s1, ($t0) # char c = str[0]

lw $a0, 4($sp)# erase_first_char function parameter, String str
jal erase_first_char
move $a0, $v0 # return value , parameter for reverse function
sw $a0, 4($sp)

li $v0, 4
syscall

li $v0, 4
la $a0, endl
syscall

lw $a0, 4($sp)
jal reverse_recursive
move $t0, $v0

# addi $a0, $t0, 0
# li $v0, 4
# syscall

# li $v0, 4
# la $a0, endl 
# syscall

for:# get last index in string s 
lb $s2, ($t0)
beq $s2, 0, brk
addi $t0, $t0, 1
j for

brk:
sb $s1, ($t0) # reverse(s) + c
lw $ra, 0($sp)
lw $v0, 4($sp)
addi $sp, $sp, 8
jr $ra
.end reverse_recursive
# end of function

# begin of size function
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
addi $v0, $v0, -1
addi $sp, $sp, 8
jr $ra

.end string_length
# end of function

erase_first_char:
addi $sp, $sp, -8
sw $ra, 0($sp)
sw $a0, 4($sp)

lw $t0, 4($sp)
lw $t1, 4($sp)
addi $t1, $t1, 1
loop3:
lb $s2, ($t1)
sb $s2, ($t0)
addi $t0, $t0, 1
addi $t1, $t1, 1
beq $s2, 0, ret2
j loop3
ret2:
lw $a0, 4($sp)
move $v0, $a0
addi $sp, $sp, 8
jr $ra
.end erase_first_char

# begin  of function 
reverse_iterative:
addi $sp, $sp, -8
sw $ra 0($sp)
sw $a0, 4($sp)

lw $a0, 4($sp)
jal string_length
move $s0, $v0 # return value - size

lw $t0, 4($sp)
loop2:
lb $s1, ($t0)
beq $s1, 0, init
addi $t0, $t0, 1
j loop2
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
# end of function
