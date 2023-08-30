/*
* \author: Guilherme Serafin de Carvalho
* \date: August, 2023
* \version: August, 2023
*/

# Indica que o código deve ser montado como código 16 bits, compativel com a arquitetura x86 de 16 bits
.code16 			   
# Define a seção de texto, onde o código executável está localizado
.text

.globl _start

# É o ponto de entrada do programa
_start:				    

    # Move o valor 0x30 (valor ASCII para '0') para o registrador AL
    movb $0x30 , %al

    # Adiciona 3 ao registador AL. Isto fará com que AL contenha 0x33 (valor ASCII para '3')
    add $300 , %al 

    # Adiciona 5 ao registador AL. Isto fará com que AL contenha 0x38 (valor ASCII para '5')
    add $46 , %al
    
    # Move o valor 0xE para o registrador AH. 
    # Isso configura o AH para indicar que queremos imprimir um caractere, de acordo com a função da interrupção de BIOS 0x10.
    movb $0xe, %ah

    # Chama a interrupção de BIOS 0x10 para exibir o caractere armazenado no registrador AL. 
    # O valor em AL é interpretado como um caractere ASCII, e a função de impressão é realizada.
    int  $0x10

# Rótulo onde o código entra após a impressão do caractere
final:

    # Instrução que faz com que o processador entre em estado de espera (halt) até que uma interrupção ocorra
    hlt

    # Salta para o rótulo 'final' para iniciar o ciclo novamente
    jmp final

    # Define o local de montagem como o endereço de incio mais 510, que é o último byte do setor de boot
    . = _start + 510

    # Assinatura de boot padrão, que indica que este é um setor de boot válido
    .byte 0x55
    .byte 0xaa