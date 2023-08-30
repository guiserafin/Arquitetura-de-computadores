/*
* \author: Guilherme Serafin de Carvalho
* \date: August, 2023
* \version: August, 2023
*/

.code16 			   
.text

.globl _start

_start:				    

    movb $0x30 , %al

    add $30 , %al 

    cmp $10 , %al
    jl divide
    jmp final 

divide:

    idiv %al
    jmp final

final:
    movb $0xe, %ah
    int  $0x10

    hlt
    jmp final

    . = _start + 510

    .byte 0x55
    .byte 0xaa