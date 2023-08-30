.code16
.text
.globl _start

_start:

    movb $0x00 , %ah
    int $0x16
    movb $0xe , %ah
    int $0x10
    jmp _start

final:
    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa


