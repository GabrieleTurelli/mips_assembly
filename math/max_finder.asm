# Ricerca del massimo in un array
# Dati in memoria (etichetta array) 10 parole (word), scrivi un programma che:

#     scorrerà l’array con un ciclo per trovare il valore massimo;

#     al termine, stamperà il massimo.


.data
# primo elemento dimensione e gli altri i valori
arr: .word 8,   1,2,3,8,3,12,21,0
msg: .asciiz "massimo : "

.text
main:

 # lunghezza
 lw $s0, arr
 
 # "i"
 li $s1, 1
 
 # in s2 ho il max
 la $t0, arr
 lw $s2, 4($t0)
 addi $t0, $t0, 4
 
 
loop:
	bge $s1, $s0, end
	addi $t0, $t0, 4
	lw $s3, ($t0)
	bgt $s3, $s2, load_max
	addi $s1, $s1, 1
	j loop


load_max: 
	move $s2, $s3
	addi $s1, $s1, 1
	j loop

end:
    la $a0, msg
    li $v0, 4
    syscall

    move $a0, $s2 
    li $v0, 1
    syscall


