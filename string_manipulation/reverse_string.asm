    # Inverti una stringa
    # Descrizione: Data in memoria una stringa terminata da zero (max 32 caratteri),
    #  creare una subroutine reverse_str che la inverte “in place”. Poi stampare prima la stringa originale e poi quella invertita
.data
string:         .asciiz "prova"
reverse_string: .space  32
msg:            .asciiz "string invertita : "
newline:        .asciiz "\n"

.text
main:
    la      $s0,                string                              # carico l'indirizzo di memoria della string in s0
    la      $s1,                reverse_string                      # carico l'indirizzo di memoria allocato per la stringa invertita in s1
    li      $t2,                0


calcualte_str_len:
    lb      $t1,                ($s0)                               # carico in t1 il valore in memoria all indirizzo s0

    beq     $t1,                $t2,            save_reverse_str    # se e null va alla fine
    # move    $a0,        $t1
    # li      $v0,        11
    # syscall

    addi    $s0,                $s0,            1                   # aumento di 1 l'indirizzo di memoria a cui punta s3 in modo da prendere il byte successivo
    addi    $t0,                $t0,            1


    j       calcualte_str_len

save_reverse_str:
    lb      $t1,                ($s0)                               # carico in t1 il valore in memoria all indirizzo s0
    sb      $t1,                ($s1)
    beq     $t0,                $t2,            end                 # se e null va alla fine

    subi    $s0,                $s0,            1                   # aumento di 1 l'indirizzo di memoria a cui punta s0 in modo da prendere il byte successivo
    addi    $s1,                $s1,            1                   # diminuisco di 1 l'indirizzo di memoria a cui punta s1 in modo da salvare il byte precedente
    subi    $t0,                $t0,            1

    j       save_reverse_str

end:
    sb      $zero,              ($s1)
    la      $a0,                string
    li      $v0,                4
    syscall

    la      $a0,                newline
    li      $v0,                4
    syscall

    la      $a0,                msg
    li      $v0,                4
    syscall

    la      $a0,                reverse_string
    li      $v0,                4
    syscall

    la      $a0,                newline
    li      $v0,                4
    syscall


