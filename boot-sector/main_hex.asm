[org 0x7c00] ; tell the assembler that our offset

	mov dx, 0x14ff
	call print_hex

	jmp $

	%include "print.asm"
	%include "hex.asm"

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55