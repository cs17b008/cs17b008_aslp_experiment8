.data

	a: .ascii "iittirupati"	
	n: .word 11		#size
		
.text

main:
	la $a0,a
	la $a2,a
	lw $t1,n
	#addi $a2,$a2,11
	lw $a1,n
	addi $t2,$0,1
	addi $t3,$0,0
	addi $s3,$s3,4
	addi $s4,$0,0
	addi $s7,$0,0
	addi $v0,$0,0
	jal solve
	


	li $v0,10
	syscall
        

	
solve:	
	sub $sp,$sp,8
	sw $ra,0($sp)
	sb $s6,5($sp)

	beq $a1,$0,Exit
	lb $s6,0($a0)
	addi $a0,$a0,1
	sub $a1,$a1,1

	jal solve
	
	sb $s6,0($a2)
	addi $a2,$a2,1

Exit:
	lw $ra,0($sp)
	lb $s6,5($sp)
	addi $sp,$sp,8
	j $ra

