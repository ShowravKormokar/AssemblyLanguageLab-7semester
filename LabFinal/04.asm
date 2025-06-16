.model small
.stack 100h

.data
    m1 db 'Enter 1st number (3 digits): $'
    m2 db 13,10, 'Enter 2nd number (3 digits): $'
    m3 db 13,10, 'Enter 3rd number (3 digits): $'
    msg db 13,10, 'Largest number: $'
    largest dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Input 1st number
    lea dx, m1
    mov ah, 9
    int 21h
    call read3Digit
    mov cx, ax      ; CX = first number

    ; Input 2nd number
    lea dx, m2
    mov ah, 9
    int 21h
    call read3Digit
    mov dx, ax      ; DX = second number

    ; Compare first and second
    mov ax, cx
    cmp ax, dx
    jge store_ax
    mov ax, dx
store_ax:
    ; Input 3rd number
    lea dx, m3
    mov ah, 9
    int 21h
    call read3Digit
    mov bx, ax      ; BX = third number

    ; Compare AX and BX
    cmp ax, bx
    jge skip_bx
    mov ax, bx
skip_bx:
    mov largest, ax
    ; Display Result
    lea dx, msg
    mov ah, 9
    int 21h

    mov ax, largest
    call printNumber

    ; Exit
    mov ah, 4ch
    int 21h

; Read 3-digit number into AX
read3Digit:
    ; Read hundreds
    mov ah, 1
    int 21h
    sub al, '0'
    mov bl, 100
    mul bl          ; AL * 100 → AX

    ; Read tens
    mov si, ax      ; Save hundreds in SI
    mov ah, 1
    int 21h
    sub al, '0'
    mov bl, 10
    mul bl          ; AL * 10 → AX

    add si, ax      ; Add to hundreds

    ; Read units
    mov ah, 1
    int 21h
    sub al, '0'
    add si, ax      ; Add to total

    mov ax, si
    ret

; Print number in AX
printNumber:
    mov cx, 0
    mov bx, 10
nextDigit:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne nextDigit

printLoop:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop printLoop
    ret
exit:
    mov ah,4ch
    int 21h
    main endp
end main
