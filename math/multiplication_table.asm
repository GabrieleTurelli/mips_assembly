    # 4. Stampa della tabellina di un numero K
    # Scrivi un programma che:

    #     legge un intero «K» da tastiera;

    #     stampa la tabellina di K da K×1 fino a K×10, ognuna su una nuova riga.


.data
input_string:       .asciiz "inserisci numero : "
tabellina_string:   .asciiz "tabellina del : "
error_string:       .asciiz "numoro troppo alto"
per:                .asciiz " x "
uguale:             .asciiz " = "
n:                  .asciiz "\n"

.text
main:
    la      $a0,        input_string
    li      $v0,        4
    syscall


    li      $v0,        5
    syscall

    move    $s0,        $v0
    li      $t0,        1
    li      $t1,        10

    # costante 1
    li      $t2,        1


    # print stringaaaaaaa
    la      $a0,        tabellina_string
    li      $v0,        4
    syscall

    la      $a0,        n
    li      $v0,        4
    syscall

loop:                   bgt     $t0,        $t1,                end
    mul     $s1,        $s0,                $t0
    j       print_riga


error:
    la      $a0,        error_string
    li      $v0,        4
    syscall
    j       end

print_riga:
    move    $a0,        $s0
    li      $v0,        1
    syscall

    la      $a0,        per
    li      $v0,        4
    syscall

    move    $a0,        $t0
    li      $v0,        1
    syscall

    la      $a0,        uguale
    li      $v0,        4
    syscall

    move    $a0,        $s1
    li      $v0,        1
    syscall

    la      $a0,        n
    li      $v0,        4
    syscall

    addi    $t0,        $t0,                1

    j       loop

end:
    li      $v0,        10
    syscall

