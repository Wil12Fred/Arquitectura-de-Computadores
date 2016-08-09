.text
.globl main
main:
  la $a0,array #a0 = A[]
  lw $a1,count #a1 = n
  li $v0,5
  syscall
  move $a2,$v0 #a2 = x
  li $t0,4
  mul $t0,$t0,$a2
  add $t0,$t0,$a0
  lw $t1,($t0)#temp1=A[x]
  lw $t2,4($t0)#temp2=A[x+1]
  sw $t2,($t0)#A[x]=temp2
  sw $t1,4($t0)#A[x+1]=temp1
  li $v0,10
  syscall

  .data
array: .word 3, 4, 2, 6, 12, 7
count: .word 6
