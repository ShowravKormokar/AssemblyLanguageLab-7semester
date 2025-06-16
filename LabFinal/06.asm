.model small
.stack 100h

.data
    m1 db 'Enter quantity (2-digit): $'
    m2 db 13,10, 'Enter price per unit (2-digit): $'
    m3 db 13,10, 'Final bill: $'
    total dw ?
    final dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ;INPUT QUANTITY
    mov ah, 9
    lea dx, m1
    int 21h
    call read2Digit
    mov bl, al      ; Quantity in BL

    ;INPUT PRICE
    mov ah, 9
    lea dx, m2
    int 21h
    call read2Digit
    mov bh, al      ; Price in BH

    ;MULTIPLY quantity × price
    mov al, bl      ; Quantity
    mov ah, 0
    mov cx, ax      ; Save in CX

    mov al, bh      ; Price
    mov ah, 0
    mul cl          ; AL * CL = AX
    mov total, ax

    ;CHECK DISCOUNT
    mov al, bl
    cmp al, 10
    ja apply_discount

no_discount:
    mov ax, total
    mov final, ax
    jmp display_result

apply_discount:
    mov ax, total
    mov bx, 10
    xor dx, dx
    div bx          ; AX = total / 10 = discount
    mov bx, ax      ; Save discount in BX

    mov ax, total
    sub ax, bx      ; Final = total - discount
    mov final, ax

display_result:
    lea dx, m3
    mov ah, 9
    int 21h

    mov ax, final
    call printNumber

    mov ah, 4ch
    int 21h


read2Digit:
    ; read tens digit
    mov ah, 1
    int 21h
    sub al, '0'
    mov ah, 0
    mov bl, 10
    mul bl          ; AX = tens * 10
    mov bl, al      ; Store result in BL

    ; read units digit
    mov ah, 1
    int 21h
    sub al, '0'
    add bl, al      ; BL = tens*10 + units

    mov al, bl
    ret

printNumber:
    mov cx, 0
    mov bx, 10
.next:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne .next

.print:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop .print
    ret

exit:
    mov ah,4ch
    int 21h
    main endp
end main
