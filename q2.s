.data

	a: .word 1, 0, 1, 1, 0	#array
	n: .word 5		#size
		
.text

main:
	la $a0,a
	la $a2,a
	lw $a1,n
	addi $t2,$0,1
	addi $t3,$0,0
	addi $s3,$s3,4
	addi $s4,$0,0
	addi $s7,$0,0
	addi $v0,$0,0
	jal solve
	
	

	addi $t1,$v1,0
	addi $t2,$v0,0
	addi $t6,$v1,0
	addi $t7,$v0,0
	
	jal loop1

	li $v0,10
	syscall
        

	
solve:	
	sub $sp,$sp,8
	sw $ra,0($sp)
	sw $s6,4($sp)

	beq $a1,$0,Exit
	lw $s5,0($a0)
	addi $s6,$s5,0
	addi $a0,$a0,4
	sub $a1,$a1,1

	jal solve
	
	beq $s6,$t2,Exit1
	beq $s6,$t3,Exit2

Exit:
	lw $ra,0($sp)
	lw $s6,4($sp)
	addi $sp,$sp,8
	j $ra
Exit1:
	addi $v0,$v0,1
	j Exit
Exit2:
	addi $v1,$v1,1
	j Exit
loop1:
	slt $t3,$0,$t1
	beq $t3,$0,loop2
	addi $t4,$0,0
	sw $t4,0($a2)
	addi $a2,$a2,4
	sub $t1,$t1,1
	j loop1
loop2: 
	slt $t3,$0,$t2
	beq $t3,$0,loop3
	addi $t4,$0,1
	sw $t4,0($a2)
	addi $a2,$a2,4
	sub $t2,$t2,1
	j loop2
loop3:
	j $ra
