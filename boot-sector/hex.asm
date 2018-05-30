print_hex:
    pusha

    mov cx, 0 ; our index variable

    ; '0' (ASCII 0x30) to '9' (0x39)
    ; A-F: 'A' (ASCII 0x41) to 'F' (0x46) we'll add 0x40
hex_loop:
    cmp cx, 4 ; loop
    je end

    mov ax, dx      ; 'ax' as our working register
    and ax, 0x000f  ; 0x1234 -> 0x0004
    add al, 0x30    ; add 0x30 convert ""
    cmp al, 0x39    ; if > 9, add extra 8 to represent 'A' to 'F'
    jle step2
    add al, 7

step2:
    ; bx <- base address + string length - index of char
    mov bx, HEX_OUT + 5     ; base + length
    sub bx, cx              ; our index variable
    mov [bx], al            ; copy the ASCII char
    ror dx, 4

    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

    popa
    ret

HEX_OUT:
    db '0x0000',0 ; reserve memory for our new string