.data
	vetor:  .word 81, 29, 13, 42, 35, 64, 57  # Exemplo de vetor a ser ordenado
	n:      .word  7  # Tamanho do vetor
	
.text
bubbleSort:
	la $a0, vetor	  # carrega o end base de vetor em $a0
	lw $a1, n         # Carrega o tamanho do vetor em $a1
	add $t0, $zero, 1 # k = 1
forExterno:
	li $t1, 0		#j = 0

forInterno:
	mul $t3, $t1, 4      # $t3 = 4*j
	add $t3, $a0, $t3    # $t3 = end de vetor[j]
	addi $t4, $t3, 4     # $t4 = end de vetor[j+1]
	lw $t6, ($t3)        # $t6 = vetor[j]
	lw $t7, ($t4)        # $t7 = vetor[j+1]
	ble $t6, $t7, fimIf  # se vetor[j] <= vetor[j+1] desvia
	lw $t2, 0($t3)       # aux = vetor[j]
	lw $t5, 0($t4)       # $t5 = vetor[j+1]
	sw  $t5, 0($t3)      # vetor[j] = vetor[j+1]
	sw $t2, 0($t4)       # vetor[j+1] = aux
	
fimIf:
	addi $t1, $t1, 1           # j++
	sub $t4, $a1, $t0          # $t4 = n-k
	bne $t4, $t1, forInterno   # se j<n-k, continua executando for interno
	addi $t0, $t0, 1           # k++
	bne $t0, $a1, forExterno   # se k < n continua executando for externo
	

