.code16
.text
.globl _start

_start:

    movb $0x00 , %ah
    int $0x16
    movb $0xe , %ah

    # bx vai receber o numero que o usuario digitar
    mov %ax , %bx

    # zera o ax
    movw $0x30, %ax
    
    call compara

# Compara pra verificar se o numero em bx ja se igualou ao ax
compara:

    cmp %bx, %ax
    je final
    call continua
    ret

# Faz a impressão e incrementa o valor do ax
continua:

    movb $0xe , %ah
    int $0x10

    #
    movw %ax , %cx

    movb $0x0a , %al
    int $0x10
    movb $0x00 , %al

    movb $0x08 , %al
    int $0x010
    movb $0x00, %al

    movw %cx, %ax

    #
    incw %ax
    call compara
    ret

final:

    movb $0xe , %ah
    int $0x10

    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa