.code16
.text
.globl _start

_start:

    movb $'.' , %al
    movb $0xe , %ah
    int $0x10

    movb $' ' , %al
    movb $0xe , %ah
    int $0x10

    movw $0x01 , %ax
    movw %ax , %ds

    movw $0x100 , %bx

loopLeitura:

    # Serviço de teclado 0x0 leitura em al
    movb $0x00 , %ah
    int $0x16
    # Imprimir um byte em al
    movb $0xe , %ah
    int $0x10

    movb %al, (%bx)
    incw %bx

    jmp loopLeitura

loop:
    movb %al , (%bx)
    incb %al
    incw %bx
    cmp $0x10 , %al
    jne loop

final:
    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa