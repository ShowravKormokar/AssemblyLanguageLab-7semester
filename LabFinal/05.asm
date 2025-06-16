.model small
.stack 100h

.data
    m1 db 'Enter 2-digit number 1 (00–99): $'
    m2 db 13,10, 'Enter 2-digit number 2 (00–99): $'
    mR db 13,10, 'Result: $'
    res db ?

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m1
    int 21h       ; Print m1


    mov ah, 1
    int 21h
    sub al, '0'
    shl al, 4       ; Input 1st num 1st disit

    mov bl, al


    mov ah, 1
    int 21h
    sub al, '0'
    or bl, al       ; Input 1st num 2nd disit

    mov bh, bl      ; Store first number in BH


    mov ah, 9
    lea dx, m2 
    int 21h         ; Print m2


    mov ah, 1
    int 21h
    sub al, '0'
    shl al, 4        ; Input 2nd num 1st disit
    mov bl, al


    mov ah, 1
    int 21h
    sub al, '0'     ; Input 2nd num 2nd disit
    or bl, al       ; Second packed BCD in BL

    ; ------- BCD Addition -------
    mov al, bh      ; First number
    add al, bl      ; Add second number
    daa             ; Decimal Adjust for BCD result
    mov res, al

    ; ------- Output Result -------
    mov ah, 9
    lea dx, mR
    int 21h         ; Print mR

    mov al, res
    mov ah, al
    and ah, 0F0h    ; Mask high nibble
    shr ah, 4       ; Get tens digit
    add ah, '0'
    mov dl, ah
    mov ah, 2
    int 21h

    mov al, res
    and al, 0Fh     ; Mask low nibble
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

    exit:
    mov ah, 4ch
    int 21h
end main
 