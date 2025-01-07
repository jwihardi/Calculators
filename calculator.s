.data
	title: .asciiz "A SIMPLE CALCULATOR IN MIPS-ASSEMBLY\n"
	input: .asciiz "     ENTER INPUTS WITHOUT SPACES    \n"
	separator: .asciiz "************************************\n"
	get_operation: .asciiz "Enter an operation (+, -, *, /) | 'q' to quit: "
	get_number_1: .asciiz "Enter number 1 (double): "
	get_number_2: .asciiz "Enter number 2 (double): "	
	result: .asciiz "The result is: "	
	buffer: .space 50

.text
main:
	li $v0, 4			# print string
	la $a0, separator		# load address of string separator into $a0
	syscall
	
	la $a0, title			# load address of string title into $a0	
	syscall

	la $a0, input			# load address of string input into $a0
	syscall

	la $a0, separator 		# load address of string separator into $a0
	syscall

	li $v0, 11			# print char
	li $a0, 10			# load '\n' into $a0, 10 = '\n'
	syscall
	syscall

while_true:
	la $a0, get_operation		# load address of string get_operation into $a0
	li $v0, 4			# print string
	syscall	

	li $v0, 12			# read char
	syscall

	move $t0, $v0			# $t0 = $v0 

	li $v0, 8 			# read string
	la $a0, buffer			# clear the buffer (entering char then enter processes 2 chars so this handles that)
	li $a1, 50			# buffer is 50 spaces
	syscall 

	li $t1, 'q'			# load 'q' into $t1
	li $t2, 'Q'			# load 'Q' into $t2


	beq $t0, $t1, end_calculator	# if input is 'q' go to end_calculator
	beq $t0, $t2, end_calculator	# if input is 'Q' go to end_calculator

	li $v0, 4			# print string
	la $a0, get_number_1		# load address of string get_number_1 into $a0
	syscall

	li $v0, 7			# read double
	syscall
	mov.d $f2, $f0			# $f2 = $f0, doubles occupy 2 f registers

	li $v0, 4			# print string
	la $a0, get_number_2		# load address of string get_number_2 into $a0
	syscall

	li $v0, 7			# read double
	syscall

	li $t1, '+'			# load '+' into $t1
	li $t2, '-'			# load '-' into $t2
	li $t3, '*'			# load '*' into $t3

	# all operations give an "approximate" result when using decimals		
	beq $t0, $t1, addition 		# if input is '+' go to addition
	beq $t0, $t2, subtraction 	# if input is '-' go to subtraction
	beq $t0, $t3, multiplication	# if input is '*' go to multiplication
	
	# default is division since I didn't want to do another beq
	div.d $f4, $f2, $f0
	j print_result
print_result:
	li $v0, 4			# print string
	la $a0,	result 			# load address of string result into $a0
	syscall 

	li $v0, 3			# print double
	mov.d $f12, $f4			# $f4 = $f12
	syscall

	li $v0, 11			# print char
	li $a0, 10			# load '\n' into $a0, 10 = '\n'
	syscall	

	j while_true			# jump to while_true (infinite loop)

addition:
	add.d $f4, $f2, $f0		# $f4 = $f2 + $f0
	j print_result			# jump to print_result

subtraction:
	sub.d $f4, $f2, $f0		# $f4 = $f2 - $f0
	j print_result			# jump to print_result

multiplication:
	mul.d $f4, $f2, $f0		# $f4 = $f2 * $f0
	j print_result			# jump to print_result

end_calculator:
	jr $ra
