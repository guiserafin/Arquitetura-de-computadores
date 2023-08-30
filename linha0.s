.code16
.text
.globl _start

_start:

loop:

    movb $'0' , %al
    movb $0xe , %ah

    int $0x10

    inc %bl 
    cmp $80, %bl
    jl loop

final:

    hlt

    jmp final

    . = _start + 510

    .byte 0x55
    .byte 0xaa
