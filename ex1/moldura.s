.code16
.text
.globl _star

_start:

    # Move o caractere ╔ para o al
    movb $0xC9 , %al
    movb $0xe , %ah
    int $0x10

loop:

    # Move o caractere ═ para o al
    movb $0xCD , %al
    inc %bl

    cmp $77, %bl
    int $0x10
    jle loop

ultimoDaLinha1:
    movb $0xBB, %al

    int $0x10

linhasSeguintes:

    movb $0xBA , %al
    movb $0x00 , %bl
    int $0x10

    loopEspaco:

        movb $0x20 , %al
        inc %bl
        cmp $77, %bl
        int $0x10
        jle loopEspaco

    movb $0xBA , %al
    inc %bh
    cmp $5, %bh
    int $0x10
    jle linhasSeguintes

    movb $0xC8 , %al
    movb $0xe , %ah
    int $0x10

loopFinal:

    # Move o caractere ═ para o al
    movb $0xCD , %al
    inc %bh

    cmp $83, %bh
    int $0x10
    jle loopFinal

final:

    movb $0xBC, %al

    int $0x10

    hlt
    jmp final
    . = _start + 510
    .byte 0x55
    .byte 0xaa