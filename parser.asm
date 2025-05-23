.data
lower_bound: .word 48
upper_bound: .word 57 
plus_char: .ascii "+"
expression: .space 4 
len: .word 4
end_str: .asciiz "fineeeeee"


.text
main:

# # inizializzazione registri 
# lw $s0, len #s0 tiene la lunghezza della stringa
# la $s1, expression #s1 tiene l'indirizzo di memoria della stringfa

# # read expression from input 
# la $t0, expression
# la $a0, ($t0) 
# move $a1, $s0

# li $v0, 8
# syscall



# 
#     li $t0, 1
# loop_string: 
#     beq  $t0, $s0, end

#     li $a0, '\n' # new lline 
#     li $v0, 11
#     syscall

#     lb $a0, ($s1) # print del carattere all indirizzo di memoria contenuto nel registro $s1
#     li $v0, 11
#     syscall





#     addi $t0, $t0, 1 # incremento la variabile che tiene conto delle iterazioni
#     addi $s1, $s1, 1 # incremento dell'indirizzo di memoria di un byte
#     j loop_string

# end:
#     la $a0, end_str 
#     li $v0, 4
#     syscall

#     li $v0, 8
#     syscall


