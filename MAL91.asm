; Code for check even or odd using shift or bitwise operation

.model small
.stack 100h

.data
m1 db 'Enter the number: $'
m2 db ,10,13, 'The number is even.$'
m3  db ,10,13, 'The number is odd.$'

.code 

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m1
    int 21h      ;Print m1
    
    mov ah,1
    int 21h
    mov bl,al   ;Input
    
    and al, 1   ;AL = AL AND 00000001, check last bit

    cmp al, 0
    je even     ; If result is 0, go to even
    jmp odd     ; else odd, go to odd

    even:
    mov ah, 9
    lea dx, m2
    int 21h
    jmp exit     ;Print m2

    odd:    
    mov ah, 9
    lea dx, m3    
    int 21h      ;Print m3

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    