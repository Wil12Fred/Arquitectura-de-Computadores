	.text		
       	.globl main
main:
	la $a0,pedir
  li $v0,4
  syscall

  li $v0,8
  la $a0,st
  li $a1,256
  move $t0,$a0
  syscall

	la $a0,pedir2
  li $v0,4
  syscall

  li $v0,5
  syscall

  move $t1,$v0

  move $a0,$t0
  li $v0,4
  syscall

	la $a0,endl
  li $v0,4
  syscall

  move $a0,$t1
  li $v0,1
  syscall

  li $v0,10
	syscall		# fin

	.data
st: .space 256
pedir:	.asciiz "Ingrese una cadena: "
pedir2: .asciiz "Ingrese un entero: "
endl:	.asciiz "\n"
