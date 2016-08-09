	.text
       	.globl main
main:
  li $t0,5 #faux
  li $t1,1 #fant
  li $t2,1 #f
  li $t3,2 #i
FOR:
  bgt $t3,$t0,END
  move $t4,$t2 #aux
  add $t2,$t2,$t1 #f+fant
  move $t1,$t4
  move $a0,$t2
  li $v0,1
  syscall
  la $a0,endl
  li $v0,4
  syscall
  add $t3,$t3,1
  j FOR
END:
  li $v0,10
	syscall		# fin
  .data
endl: .asciiz "\n"
