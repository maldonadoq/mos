[org 0x7c00] ; bootloader offset
    mov bp, 0x9000 ; set the stack
    mov sp, bp

    mov bx, MSG_REAL_MODE
    call print ; after the BIOS messages

    call switch_to_pm
    jmp $

%include "../boot-sector/print.asm"
%include "gdt.asm"
%include "tprint.asm"
%include "switch.asm"

[bits 32]
BEGIN_PM:						; after the switch we will get here
    mov ebx, MSG_PROT_MODE
    call print_string_pm		; Note that this will be written at the top left corner
    jmp $

MSG_REAL_MODE db "Started in [16-BITS] Real Mode", 0
MSG_PROT_MODE db "Successfully landed in [32-BITS] Protected Mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55