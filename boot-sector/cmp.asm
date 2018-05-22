	mov bx, 10

	cmp bx, 4
	jg first

	mov al , 'A'
	jmp done	

	first:
		cmp bx, 40
		jg second

		mov al , 'B'
		jmp done

	second:
		mov al, 'C'
		jg done
		
	done:	
		mov ah , 0x0e		; int =10/ ah =0 x0e -> BIOS tele - type output
		int 0x10			; print the character in al

		jmp $

; Padding and magic number.
times 510-($-$$) db 0
dw 0xaa55