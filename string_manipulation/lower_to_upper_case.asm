    # codice per convertire una stringa in input da minuscolo a maiuiscolo
.data
input_string:       .asciiz "inserisci stringa : "
output_string:      .asciiz "string in maiuscolo : "
string_buffer:      .space  100

.text
main:
    la      $a0,        input_string                                # carico nel primo argomeno l'indirizzo del messaggio della richiesta di una stringa 
    li      $v0,        4                                           # 4 viene usato per printare stringhe
    syscall

    la      $a0,        string_buffer                               # indirizzo del buffer di memoria in cui andra scritta la stringa inserita dall'utente
    li      $a1,        100                                         # dimensione del buffer della stringa
    li      $v0,        8                                           # 8 => codice per richiedere una stringa
    syscall


    la      $s0,        string_buffer                               # in s0 salvo l'indirizzo di memoria contenente il primo carattere della stringa
    li      $s2,        10                                          # codice asci corrispondente a '\n'
    li      $t0,        96                                          # codice relativo al carattere ascii 'a' in minuscolo - 1
    li      $t1,        123                                         # codice relativo al carattere ascii 'z' in minuscolo + 1
    li      $t5,        1                                           # usato alla riga 30 per confrontarlo con $t4
loop_char:
    lb      $s1,        0($s0)                                      # in s1 salvo il codice ascii (1 byte) del carattere all'indirizzo di memoria di s1
    beq     $s1,        $s2,            print_string                # continua a ciclare finche trova il \n (codice ascii = 10)


    slt     $t2,        $t0,            $s1                         # setto a 1 t2 se il carattere e' maggiore di 97
    slt     $t3,        $s1,            $t1                         # setto a 1 t3 se il carattere e' minore di 122
    and     $t4,        $t2,            $t3                         # se il valore si trova all'interno del range vuol dire che e minuscolo e quindi devo portarlo in maiuscolo
    beq     $t4,        $t5,            convert_to_uppercase        # se t4 == 1 converto il carattere

    addi    $s0,        $s0,            1                           # aumento di 1 l'indirizzo di memoria in modo da puntare al byte successivo
    j       loop_char

print_string:
    la      $a0,        output_string                               # carico nel primo argomeno l'indirizzo del messagio di output della stringa 
    li      $v0,        4                                           # 4 viene usato per printare stringhe
    syscall

    la      $a0,        string_buffer                               # carico nel primo argomeno l'indirizzo del buffer della stringa
    li      $v0,        4                                           # 4 viene usato per printare stringhe
    syscall


end:
    li      $v0,        10
    syscall

convert_to_uppercase:
    subi    $s1,        $s1,            32
    sb      $s1,        0($s0)
    addi    $s0,        $s0,            1                           # aumento di 1 l'indirizzo di memoria in modo da puntare al byte successivo
    j       loop_char
