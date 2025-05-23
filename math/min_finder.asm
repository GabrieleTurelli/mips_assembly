# Esercizio 3: Ricerca del minimo in un array

.data
arr: .word 1,2,3,4,5,6,-7,8,9,-10000
len: .word 10
msg: .asciiz "Minimo dell'array : "

.text 

main:
    # in s0 tengo la lunghezza
    la $s0, len

    # in s1 tengo l'indirizzo
    la $s1, arr

    # in S2 tengo il minimo
    lw $s2, ($s1) 

loop: 
    beq $s0, $s1, end
    addi $s1, $s1, 4
    
    lw $t2, ($s1)
    blt $t2, $s2, set_min
    j loop


set_min:
    move $s2, $t2
    j loop

end:
    la $a0, msg
    li $v0, 4
    syscall
    
    move $a0, $s2 
    li $v0, 1
    syscall

