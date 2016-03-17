#Prime numbers

.data

msg: .asciiz "Enter a number: "
prime: .asciiz "Prime Number\n"
not_prime: .asciiz "Not Prime!"
endline: .asciiz "\n"

.text 

.globl main 
main:

li $v0, 4
la $a0, msg
syscall 

li $v0, 5
syscall
addi $s0, $v0, 0           #num in $s0
beq $s0, 1, isPrime
beq $s0, 2, isPrime


li $s1, 2                  #i = 2
li $s4, 1
sub $s3, $s0, $s4


loop:                      #for()  
rem $s2, $s0, $s1          #s2 = s0 % s1 
beq $s2, 0, isNotPrime     #if (!s2)put("num is not Prime\n")
beq $s1, $s3, isPrime      # i < n
addi $s1, $s1, 1           #i++
j loop

isPrime:
li $v0, 4
la $a0, prime
syscall
li $v0, 10
syscall

isNotPrime:
li $v0, 4
la $a0, not_prime
syscall

li $v0, 10
syscall

.end main 