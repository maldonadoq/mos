[org 0x7c00]
    mov bp, 0x8000
    mov sp, bp

    mov bx, 0x9000
    mov dh, 2 ; read 2 sectors    
    call disk_load

    mov dx, [0x9000] ; loaded word, 0xdada
    call print_hex

    mov dx, [0x9000 + 512] ; second loaded sector, 0xface
    call print_hex

    jmp $

%include "print.asm"
%include "hex.asm"
%include "load.asm"

; Magic number
times 510 - ($-$$) db 0
dw 0xaa55

; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes