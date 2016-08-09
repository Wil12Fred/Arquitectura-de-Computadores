   .data   # Data declaration section
userString: .space 256
Prompt:     .asciiz "\nEnter a word: "
newLine:    .asciiz "\n"
    .text

# Part I
main:       # Start of code section
  li $v0, 4
  la $a0, Prompt
  syscall

# Part II
li $v0, 8
la $a0, userString
li $a1, 256
syscall

jr $ra

# Part III
la $a0, userString
move $t0, $a0
lb $t1, 1($t0) 
li $v0, 4
move $a0, $t1
syscall     # prints first letter of word

li $v0,10
syscall
