.data
arr:        .word   1, 2, 3, 4, 5
newline:    .asciiz "\n"

.text
            .globl  main
main:
    la      $s2,    arr             # $s2 = base address of arr
    li      $s1,    5               # $s1 = length
    li      $s0,    0               # $s0 = index 0

loop:
    bge     $s0,    $s1,        end # if index >= length, done

    lw      $a0,    0($s2)          # load arr[index] into $a0
    li      $v0,    1
    syscall                         # print integer

    la      $a0,    newline
    li      $v0,    4
    syscall                         # print newline

    sll     $s2,    $s2,        4   # advance pointer to next word
    addi    $s0,    $s0,        1   # index++
    j       loop

end:
    li      $v0,    10
    syscall                         # exit
