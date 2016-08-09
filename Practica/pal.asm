	.text		
       	.globl main
main:		# execution starts here
	la $a0,pedir	# puntero al string
  li $v0,4
  syscall

  li $v0,8
  la $a0,st
  li $a1,256
  move $t2,$a0
  syscall

	li $t1,-1		# contador del tamaño del string
nextCh:
	lb $t0,($t2)	# leyendo un byte del string
	beqz $t0,strEnd	# mientras no encuentro
	add $t1,$t1,1	# incremento contador
	add $t2,1	# puntero mas un byte
	j nextCh		# regreso a leer

strEnd:
  div $t2,$t1,2 #dividiendo entre dos
  move $t3,$t2
  sub $t2,$t2,1 #menos 1
  and $t4,$t1,1 #n%2

  beq $t4,0,L1
  addi $t3,$t3,1

L1:
  move $t0,$a0
  move $t4,$a0
  move $t5,$a0
  add $t4,$t4,$t2
  add $t5,$t5,$t3
pal:
  beq $t3,$t1,L2
  lb $t6,($t4)
  lb $t7,($t5)
  add $t4,1
  sub $t5,1
  add $t3,$t3,1
  beq $t6,$t7,pal
L2:
  beq $t3,$t1,L3
  la $a0,noespalindromo
  li $v0,4
  syscall
  j L4
L3:
  la $a0,espalindromo
  li $v0,4
  syscall
L4:
  li $v0,10
	syscall		# fin

	.data
st: .space 256
noespalindromo:	.asciiz "La palabra que ingreso no es palindromo \n"
espalindromo:	.asciiz "La palabra que ingreso es palindromo \n"
pedir:	.asciiz "Ingrese una palabra: "
endl:	.asciiz "\n"
