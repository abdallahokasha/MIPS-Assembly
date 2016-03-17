# Abdallah Mohamed Okasha
# 20110230
# A2-Part-1,problem 2
# CS-6

.data 
Array: .word 3
msg1: .asciiz "Enter arr[0]: "
msg2: .asciiz "Enter arr[1]: "
msg3: .asciiz "Enter arr[2]: "
msg4: .asciiz "arr[2] = "
endl: .asciiz "\n"
.text 

.globl main

main:
# cout << "Enter arr[0]: ";
li $v0, 4
la $a0, msg1
syscall
la $t0, Array 
# cin >> arr[0]
li $v0, 5
syscall 

sw $v0, ($t0)

# cout << "Enter arr[1]: "
li $v0, 4
la $a0, msg2
syscall

# cin >> arr[1]
li $v0, 5
syscall
sw $v0, 4($t0)

lw $s1, 0($t0)
lw $s2, 4($t0)
add $s1, $s1, $s2
# arr[1] += arr[0];
sw $s1, 4($t0)

# cout << "Enter arr[2]: ";
li $v0, 4
la $a0, msg3
syscall

# cin >> arr[2];
li $v0, 5
syscall
sw $v0, 8($t0)

lw $s1, 4($t0)
lw $s2, 8($t0)
add $s1, $s1, $s2
# arr[2] += arr[1]
sw $s1, 8($t0)

# cout << "arr[2] = ";
li $v0, 4
la $a0, msg4
syscall

# cout << arr[2];
lw $a0, 8($t0)
li $v0, 1
syscall 

# cout << "\n";
li $v0, 4
la $a0, endl
syscall

.end main