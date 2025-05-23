.data
msg:    .asciiz "inserici numero : "
msg1:   .asciiz "\nquadrato : "

.text
main:

    la      $a0,    msg
    li      $v0,    4
    syscall

    li      $v0,    5
    syscall

    move    $s0,    $v0
    mul     $s1,    $s0,    $s0

    la      $a0,    msg1
    li      $v0,    4
    syscall

    move    $a0,    $s1
    li      $v0,    1
    syscall


