    # 2. Calcolo del fattoriale di N
    # Implementa un programma che:

    #     legge un intero «N» (N ≥ 0);

    #     calcola N! usando un ciclo (o un ciclo annidato, se vuoi gestire N=0 come caso particolare);

    #     stampa il risultato.

.data
msg_input:      .asciiz "Inserisci numero : "
msg_fattoriale: .asciiz "fattoriale : "


.text
main:

    la      $a0,    msg_input
    li      $v0,    4
    syscall

    li      $v0,    5
    syscall

    # registro che contiene il numero inserito
    move    $s0,    $v0

    #s1 contiene l'iteratore
    li      $s1,    1
    # s2 contiene il fattorial
    li      $s2,    1

    beq     $s0,    $zero,          edge_case


loop:
    bgt     $s1,    $s0,            end

    mul     $s2,    $s2,            $s1
    addi    $s1,    $s1,            1
    j       loop



edge_case:
    li      $s2,    1
    j       end

end:

    la      $a0,    msg_fattoriale
    li      $v0,    4
    syscall

    move    $a0,    $s2
    li      $v0,    1
    syscall
