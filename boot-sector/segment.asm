	; A simple boot sector program that demonstrates segment offsetting
	mov ah , 0x0e
	mov al , [the_secret]
	int 0x10 			; Does this print an X?

	mov bx , 0x7c0
	mov ds , bx
	mov al , [the_secret]
	int 0x10 			; Does this print an X?

	mov al , [es: the_secret] ;CPU use the es ( not ds) segment.
	int 0x10 			; Does this print an X?
	mov bx , 0x7c0
	mov es , bx
	mov al , [es: the_secret]
	int 0x10			; Does this print an X?

	jmp $

the_secret:
	db "X "


	times 510-($-$$) db 0
	dw 0xaa55