.data
var:            .word   10
msg:            .asciiz "inserisci numero : "
struguale:      .asciiz "uguale\n"
strmaggiore:    .asciiz "maggiore\n"
strminore:      .asciiz "minore\n"

newline:        .asciiz "\n"

.text
                .globl  main
main:
    la      $a0,    msg
    li      $v0,    4
    syscall
    li      $v0,    5
    syscall
    move    $t1,    $v0
    lw      $t2,    var

    beq     $t1,    $t2,            uguale

    slt     $t0,    $t1,            $t2
    beq     $t0,    0,              maggiore
    j       minore

uguale:
    la      $a0,    struguale
    li      $v0,    4
    syscall
    li      $v0,    10
    syscall
    # j ciclo

minore:
    la      $a0,    strminore
    li      $v0,    4
    syscall
    li      $v0,    10
    # syscall
    j       main

maggiore:
    la      $a0,    strmaggiore
    li      $v0,    4
    syscall
    # li $v0, 10
    # syscall
    j       main