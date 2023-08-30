.code16

.globl _start

_start:
    movb $0x30 , %al
    addb $3 , %al

    addb $5 , %al

    movb $0xe, %ah
    int  $0x10

final:
    hlt
    jmp final

.section .bss
    result resb 10   # Reserva espaço para armazenar os dígitos convertidos

    times 510 - ($ - $$) db 0
    db 0x55
    db 0xAA
