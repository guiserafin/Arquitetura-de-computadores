 /*
* \author: Éder Augusto Penharbel
* \date: February, 2022
* \version: February, 2022
*/

# generate 16-bit code
.code16 			   
# executable code location
.text 				   

.globl _start

# entry point
_start:				    

    # Cube Location
    movw $0, %cx
    movw $0, %dx

    #Entering video mode (W.I.P)
    movb $0, %ah
    movb $0x0d, %al
    int $0x10
    

    main:

        # function to write pixels
        movb $0x0c, %ah
        
        # Desenha o cubo
        movb $0xe, %al
        call draw_cube

        # Leitura do teclado
        movb $0, %al
        movb $0, %ah
        int $0x16
        
        # Compara para ser 'd'
        cmp $0x64, %al
        je move_right

        # Compara para ser 's'
        cmp $0x73, %al
        je move_down

        # Compara para ser 'a'
        cmp $0x61, %al
        je move_left


move_up:
    sub $10, %dx

    jmp main

    call reset_quadrado

move_down:

    call reset_quadrado
    
    add $10, %dx

    jmp main

move_right:

    call reset_quadrado

    add $10, %cx

    jmp main

move_left:

    call reset_quadrado
    
    sub $10, %cx

    jmp main

reset_quadrado:
    
    # Reseta o cubo antigo
    movb $0, %al
    
    call draw_cube
    
    ret

draw_cube:

    pusha

    draw:
        int $0x10

    cmp $10, %bh
    jl increment_x
    je increment_y

    increment_x:
        #incrementa o X e seu contador
        inc %cx
        inc %bh
        jmp draw

    increment_y:
        #reseta o X e seu contador
        sub $10, %cx
        sub $10, %bh

        #incrementa o Y e seu contador
        inc %bl
        inc %dx
    
    cmp $10, %bl
    jl draw


    popa

    ret
final:
    . = _start + 510    
    # MBR boot signature 
    .byte 0x55		        
    # MBR boot signature 
    .byte 0xaa	