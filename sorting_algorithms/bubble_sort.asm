    # Look at the first number in the list.
    # Compare the current number with the next number.
    # Is the next number smaller than the current number? If so, swap the two numbers around. If not, do not swap.
    # Move to the next number along in the list and make this the current number.
    # Repeat from step 2 until the last number in the list has been reached.
    # If any numbers were swapped, repeat again from step 1.
    # If the end of the list is reached without any swaps being made, then the list is ordered and the algorithm can stop.

.data
    # array di solo interi positivi e il -1 utilizzato come fine dell' array
arr:    .word   27, 4, 7, 12, 9, -1
msg:    .asciiz "sorted array : "


.text
main:

    la      $s0,            arr
    li      $s7,            0                           # in s8 tengo salvata la lunghezza dell'array


calculate_len:
    lw      $t1,            ($s0)                       # carico in t2 il valore all'indirizzo di memoria presente nel registros0
    li      $t2,            -1                          # carico in t2 il valore che determina la fine dell' array
    beq     $t1,            $t2,    continue
    addi    $s7,            $s7,    1                   # incremento il counter della lunghezza dell'array
    addi    $s0,            $s0,    4                   # incremento di una word (4byte) l'indirizzo di memoria a cui puntare
    j       calculate_len


continue:
    li      $t7,            1                           # registro per fare lo swap finche e' 1
    li      $t6,            0                           # registro per fare lo swap finche e' 1

sort:
    la      $s0,            arr                         # ricarico in s0 l'indirizzo di memoria dell'array
    li      $t8,            1                           # "indice" dell'array
    beq     $t6,            $t7,    print_sorted_arr

arr_cicle:
    beq     $t8,            $s7,    sort

    li      $t7,            0
    lw      $t1,            ($s0)
    lw      $t2,            4($s0)

    blt     $t2,            $t1,    swap
    addi    $t8,            $t8,    1                   #incremento il counter
    addi    $s0,            $s0,    4
    j       arr_cicle

swap:
    li      $t7,            1
    sw      $t2,            0($s0)                      # salvo all'indirizzo di mem in s0 il valore in t2
    sw      $t1,            4($s0)                      # salvo all'indirizzo di mem in s0 + 4 il valore in t1

    addi    $t8,            $t8,    1                   #incremento il counter
    addi    $s0,            $s0,    4

    j       arr_cicle


print_sorted_arr:
    li      $t0,            0
    la      $s0,            arr
loop:
    beq     $t0,            $s7,    end

    lw      $a0,            ($s0)                       # print di ogni elemento
    li      $v0,            1
    syscall

    li      $a0,            '-'
    li      $v0,            11
    syscall

    addi    $s0,            $s0,    4
    addi    $t0,            $t0,    1
    j       loop

end:
 	
    li      $v0,            10
    syscall
