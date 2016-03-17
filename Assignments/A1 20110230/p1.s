# Abdallah Mohamed Okasha
# 20110230
# CS-3
# A1 - p1
.data

welcome: .asciiz "Welcome!, this program computes Recangle Area & Circumference.\n"
len: .asciiz "Enter length: \n"
wid: .asciiz "Enter width: \n"
area: .asciiz "The area is : \n"
cir: .asciiz  "The Circumference is : \n"
endl: .asciiz " \n"

.text 

.globl main 

main:

# cout << " welcome ..\n"
li $v0, 4
la $a0, welcome
syscall 
# cout << "Enter length:\n"
li $v0, 4
la $a0, len
syscall
# cin >> length
li $v0, 5
syscall
addi $s0, $v0, 0
# cout << "Enter Width:\n"
li $v0, 4
la $a0, wid 
syscall 
# cin >> width
li $v0, 5
syscall 
addi $s1, $v0, 0
# area = length * width
mul $s2, $s0, $s1
# cout << " Area is \n"
li $v0, 4
la $a0, area
syscall 
# cout << area 
li $v0, 1
addi $a0, $s2, 0
syscall 
# cout << endl
li $v0, 4
la $a0, endl
syscall
# s2 = s0 + s1 
add $s2, $s0, $s1
add $s2, $s2, $s2
# cout << "Circum is : \n"
li $v0, 4
la $a0, cir
syscall
# cout << circum
li $v0, 1
addi $a0, $s2, 0
syscall 
# cout << endl
li $v0, 4
la $a0, endl
syscall             
# return 0
li $v0, 10
syscall 

.end main