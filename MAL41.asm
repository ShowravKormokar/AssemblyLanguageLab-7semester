; Write some code in assembly language for subtract of 2 numbers using 2 numbers
.model small
.stack 100h

.data
a db 'Enter the 1st and 2nd numbers: $'
b db 'The sub is: $'

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h     ;Print a
    
    mov ah,1
    int 21h
    mov bl,al   ;Input 1st number
    
    int 21h
    mov bh,al   ;Input 2nd number
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ;Newline
    
    mov ah,9
    lea dx,b
    int 21h     ;Print b
    
    sub bl,bh   ;Sub: bl=bl-bh
    add bl,48   ;Add for convert disit
    
    mov ah,2
    mov dl,bl
    int 21h     ;Result
    
    exit:
    mov ah,4ch
    main endp

end main