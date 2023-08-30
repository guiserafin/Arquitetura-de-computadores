.code16
.text
.globl _start

_start:
    movb $0x00, %bl

main_loop:

    movb $0x00 , %ah
    int $0x16
    movb $0xe , %ah
    int $0x10

    cmp $0x00, %bl
    je q0

    cmp $0x01, %bl
    je q1

    cmp $0x02, %bl
    je q2

    cmp $0x03, %bl
    je q3

q0:
    cmp $'e', %al
    je incrementa
    jne zera

q1:
    cmp $'x', %al
    je incrementa
    jne zera

q2:
    cmp $'i', %al
    je incrementa
    jne zera


q3:
    cmp $'t', %al
    je incrementa
    jne zera

incrementa:
    inc %bl
    cmp $0x04, %bl
    je final
    jne main_loop

zera:
    movb $0x00, %bl
    jmp main_loop

final:
    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa


