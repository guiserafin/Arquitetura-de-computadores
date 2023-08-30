.code16 			   
.text 				   
.globl _start

_start:				    

    movb $'x' , %al	
    movb $0x0e, %ah	
    int  $0x10

    mov $10000, %cx
    movw $535, %ax

    mov $10, %bx
loop:

    # zerar dx devido a dx fazer parte da conta
    mov $0, %dx
    # Dividir o numero/resto
    div %cx
    # empilhar o resto
    pushw %dx

    # Converter para ascii
    add $0x30, %al

    # imprimir
    movb $0xe, %ah
    int $0x10

    # zerar dx devido a dx fazer parte da conta
    mov $0, %dx

    # mover potencia para ax
    movw %cx, %ax
    # Calcular nova potencia
    div %bx
    # armazenar nova potencia em cx
    movw %ax, %cx
    

    # restaurar resto para ax
    popw %ax
    # comparar se o numero e zero
    cmp $0, %ax
    je fimloop
    
    jmp loop


fimloop:

    hlt
    jmp fimloop

    
    # mov to 510th byte from 0 pos
    . = _start + 510	    
    
    # MBR boot signature 
    .byte 0x55		        
    # MBR boot signature 
    .byte 0xaa		        