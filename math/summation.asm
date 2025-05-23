# 1. Somma dei primi N numeri naturali
# Scrivi un programma che:

#     legge un intero «N» da tastiera;

#     calcola la somma 1 + 2 + … + N usando un ciclo;

#     stampa il risultato.


.data
msg_input: .asciiz "Inserisci numero : "
msg_sommatoria: .asciiz "sommatoria : "

.text
main: 

    la $a0, msg_input 
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    # registro che contiene il numero inserito
    move $s0, $v0

    # registro che contiene il valore dell'iteratore
    li $s1, 1
    li $s2, 0

loop:
    # va a end  se si l'iteratore arriva 
    blt $s0, $s1, end
    add $s2, $s2, $s1
    
    addi $s1, $s1, 1
	j loop

end:
    la $a0, msg_sommatoria
    li $v0, 4
    syscall

    move $a0, $s2
    li $v0, 1
    syscall


