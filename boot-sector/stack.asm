	mov ah, 0x0e		; tty mode

	mov bp, 0x8000		; this is an address far away from 0x7c00 so that we don't get overwritten
	mov sp, bp			; if the stack is empty then sp points to bp

	mov al, [0x7ffe] ; 0x8000 - 2
	int 0x10

	push 'A'
	push 'B'
	push 'C'
	push 'D'
	push 'E'
	push 'F'
	
	mov cx, 6
	mov al, [0x7ffa]
	int 0x10

	;top:
	;	pop bx
	;	mov al, bl
	;	int 0x10 			; prints		
	;loop top

	; data that has been pop'd from the stack is garbage now
	mov al, [0x8000]
	int 0x10


	jmp $

times 510-($-$$) db 0
dw 0xaa55