.code16
.text
.globl _start

_start:
    
loopLeitura:
    movb $0x00 , %ah
    int $0x16
    movb $0xe , %ah
    int $0x10

    cmp $'a' , %al
    je final

    sub $0x30 , %ax
    sub $0xe , %ax
    push %ax

    movw $0x100 , %bx

    jmp _start

final:

    
    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa