	[org 0x7c00] ; tell the assembler that our offset

	; main
	mov bx, H_MSG
	call print

	mov bx, G_MSG
	call print

	mov dx, 0x12fe

	jmp $

	; include subroutines below the hang
	%include "print.asm"

	; data
	H_MSG:
	    db 'Hello World', 0

	G_MSG:
	    db 'GooBye', 0

; padding and magic number
times 510-($-$$) db 0
dw 0xaa55