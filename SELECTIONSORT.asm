.data 
	arr: .word 81, 29, 13, 42, 35, 64, 57
	n: .word 7
	
.text
selectionSort:
	la $a0, arr # $a0 = end base de arr
	lw $a1, n   # $a1 = n
	li $t0, 0   # i = 0

	
forExterno:
	move $t2, $t0     # min_idx = i
	addi $t1, $t0, 1  # j = i + 1
	
forInterno:
	mul $t4, $t1, 4          # $t4 = 4 * j
	add $t4, $t4, $a0        # $t4 = end de arr[j]
	lw $t5, ($t4)            # $t5 = arr[j]
	mul $t6, $t2, 4          # $t6 = 4 * min_idx
	add $t6, $t6, $a0        # $t6 = end de arr[min_idx]
	lw $t7, ($t6)            # $t7 = arr[min_idx]
	bge $t5, $t7, failIf     # desvia se arr[j] > arr[min_idx], senão continua
	move $t2, $t1  		 # min_idx = j
failIf:
	addi $t1, $t1, 1          # j++
	blt $t1, $a1, forInterno  # se j<n continua for interno
		 
	  
fimForInterno:
	beq $t2, $t0, fimForExterno  # se min_idx = i, entao pula o if
	mul $t4, $t2, 4	             # $t4 = 4 * min_idx
	add $t4, $t4, $a0            # $t4 = end de arr[min_idx]
	lw $t3, ($t4)	             # temp = arr[min_idx]
	mul $t5, $t0, 4              # $t5 = 4 * i
	add $t5, $t5, $a0            # $t5 = end de arr[i]
	lw $t6, ($t5)	             # $t6  = arr[i]
	sw  $t6, ($t4)	             # arr[min_idx] = arr[i]
	sw  $t3,($t5)                #arr[i] = temp
	
fimForExterno:
	addi $t0, $t0, 1          # i++
	sub $t4, $a1, 1		  # $t4 = n-1
	blt $t0, $t4, forExterno  # se i < n-1 volta a fazer for externo

	
	