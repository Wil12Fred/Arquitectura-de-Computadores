	.text          # Aqui empieza el segnmento de codigo
	.globl main
main:	
	la $t0,array	# $t0 apuntara a los elementos
	lw $t1,count	# sale del bucle cuando $t1 es 0
sumArray:
  li $t2,0 #total
WHILE:
  bgt $t1,0,CONTINUE
  j BREAK
CONTINUE:
  lw $t3,($t0)
  add $t2,$t2,$t3
  add $t0,$t0,4
  sub $t1,$t1,1
  j WHILE
BREAK:
  move $a0,$t2
  li $v0,1
  syscall

	li $v0,10
	syscall		# fin del programa...

	.data    	# Aqui empieza el segmento de datos
array: .word 1, 2, 3, 4, 5
count: .word 5
