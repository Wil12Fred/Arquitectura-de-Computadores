  .text
      .globl main

main:         # execution starts here 
  la $a0,pedir
  li $v0,4
  syscall

  li $v0,8
  la $a0,buffer
  li $a1,100
  move $t2,$a0
  syscall

  li $t1,-1 # t1 holds the count

nextCh: 
  lb $t0,($t2) # get a byte from string 
  beqz $t0,strEnd # zero means end of string 

  move $a0,$t0
  li $v0,11
  syscall

  la $a0,endl # system call to print 
  li $v0,4 # out a newline
  syscall 

  add $t1,$t1,1 # increment count 
  add $t2,1 # move pointer one character 

  j nextCh # go round the loop again

strEnd:
  la $a0,ans # system call to print 
  li $v0,4 # out a message 
  syscall 

  move $a0,$t1 # system call to print 
  li $v0,1 # out the length worked out 
  syscall

  la $a0,endl # system call to print 
  li $v0,4 # out a newline
  syscall 

  li $v0,10 
  syscall # au revoir...

  .data
buffer: .space 100
pedir: .asciiz "Imprima una palabra: "
str: .asciiz "hello world"
ans: .asciiz "Length is "
endl: .asciiz "\n"
