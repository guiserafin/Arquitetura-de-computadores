.code16             # Set the code to 16-bit mode
.text
.globl _start

# Code segment
_start:
    # Initialize data segment
    mov $0, %ax
    mov %ds, %ax

    # Save the old INT 80h handler (IVT entry 0x80)
    mov %ax, 0          # AH = 0 (DOS Function: Get Interrupt Vector)
    int $0x21            # Call DOS to get the current IVT entry
    movw $0, %bx
    # movw $2, %cx

    # Set the new INT 80h handler
    mov %ax, 0          # AH = 0 (DOS Function: Set Interrupt Vector)
    mov %dx, new_handler # DS:DX points to the new INT 80h handler
    int $0x21            # Call DOS to set the new handler

    # Trigger the custom interrupt using "int $0x80"
    mov $0x80, %ah        # Set AH to $0x80 (our custom interrupt number)
    int $0x80           # Call the custom interrupt

    # Restore the original INT 80h handler
    mov %ax, 0          # AH = 0 (DOS Function: Set Interrupt Vector)
    mov $0, %dx # DS:DX points to the old INT 80h handler
    mov $2, %cx
    int $0x21            # Call DOS to restore the old handler

    # Exit program
    # mov %ah, 4Ch
    int $0x21

# Custom interrupt handler
new_handler:
    # Your custom interrupt code here
    movw $0x00, %ax
    movb $0x30 , %al
    addb $3 , %al

    addb $3 , %al

    movb $0xe, %ah
    int  $0x10
    
    # Return from interrupt
    iret


# End of the program
final:
    mov $0x80, %ah       # Set AH to 0x80 (our custom interrupt number)
    int $0x80
    hlt
    jmp final

    . = _start + 510
    .byte 0x55
    .byte 0xaa
