.data
len:    .word   5
    # Esempio di array inizializzato a 5 valori
arr:    .word   1, 2, 3, 4, 5

msg1:   .asciiz "Calcolando somma dell'array\n"
msg2:   .asciiz "Somma = "

.text
main:
    # Stampa messaggio iniziale
    la      $a0,    msg1
    li      $v0,    4
    syscall

    # Carica la lunghezza in $s0
    lw      $s0,    len

    # Azzeriamo: somma in $s1, indice i in $s2
    li      $s1,    0                           # sum = 0
    li      $s2,    0                           # i   = 0

    # Base address dell'array in $t3 (fuori dal loop per efficienza)
    la      $t3,    arr

loop:
    # if (i == len) goto done
    beq     $s2,    $s0,    done

    # offset = i * 4  (ogni word è 4 byte)
    sll     $t0,    $s2,    2

    # indirizzo corrente = base + offset
    add     $t1,    $t3,    $t0

    # carica arr[i]
    lw      $t2,    0($t1)

    # sum += arr[i]
    add     $s1,    $s1,    $t2

    # i++
    addi    $s2,    $s2,    1

    # torna all'inizio del loop
    j       loop

done:
    # Stampa etichetta “Somma = ”
    la      $a0,    msg2
    li      $v0,    4
    syscall

    # Stampa il valore della somma (integer)
    move    $a0,    $s1
    li      $v0,    1
    syscall

    # Termina
    li      $v0,    10
    syscall
