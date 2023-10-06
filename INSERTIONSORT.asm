.data
	arr: .word -77, 61, -88, 95, -5, 33, -49, 70
	n: .word 8
.text
	la $a0, arr
	lw $a1, n

insertionSort:
li $t5, 1 # inicialização k = 1

# início do for
for: slt $t0, $t5, $a1 # reg. $t0 = 0 se $t5 >= $a1 (k >= n). Caso contrário, $t0 = 1
     beq $t0, $zero, exit # vai para exit se $t5 >= $a1 (k >= n)
	# Entrou no for
	sll $t1, $t5, 2 # reg. $t1 = k*4
	add $t1, $a0, $t1 # reg. $t1 = vetor + (k*4). Necessário para encontrar endereço de k
	lw $t2, 0($t1) # reg. $t2 = vetor[k]
	move $t7, $t2 # reg. $t7 = $t2 (aux = vetor[k])
	addi $t6, $t5, -1 # j = k - 1

	while: slti $t0, $t6, 0 # reg. $t0 = 1 se $t6 < 0 (j < 0)
	bne $t0, $zero, exit2 # vai para exit2 se  $t6 < 0 (j < 0)
	# Se não pular, então j >= 0
	
	# Segunda condição:
	sll $t1, $t6, 2 # reg. $t1 = j*4
	add $t2, $a0, $t1 # reg. $t2 = vetor + (j*4)
	lw $t3, 0($t2) # reg. $t3 = vetor[j]
	slt $t0, $t7, $t3 # reg. $t0 = 0 se $t7 >= $t3 (aux >= vetor[j])
	beq $t0, $zero, exit2 # vai para exit2 se $t7 >= $t3 (aux >= vetor[j])
	
		# Entrou no while:
		addi $t4, $t6, 1 # $t4 = j+1
		sll $t4, $t4, 2 # $t4 = 4*$t4
		add $t4, $t4, $a0 # endereço j+1
		sw $t3, 0($t4) # vetor[j+1] = vetor[j]
		addi $t6, $t6, -1 # j = j - 1
		j while # vai para o while
	exit2:
	addi $t4, $t6, 1 # $t4 = j+1
	sll $t4, $t4, 2 # $t4 = 4*$t4
	add $t4, $t4, $a0 # endereço j+1
	sw $t7, 0($t4) # vetor[j+1] = aux
	addi $t5, $t5, 1 # k+=1
	j for # vai para for
exit: