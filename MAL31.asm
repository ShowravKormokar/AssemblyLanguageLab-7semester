;Write some code in assembly language for addition of two numbers using EMU8086
.model small
.stack 100h

.data
a db 'Enter 1st and 2nd number: $'
b db 'The sum is: $'

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al   ;Input 1st number
    
    int 21h
    mov bh,al   ;Input 2nd number
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,b
    int 21h
    
    add bl,bh   ;Sum: bl=bl+bh
    sub bl,48   ;Sub for convert ascii to disit
    
    mov ah,2
    mov dl,bl
    int 21h     ;Result
    
    exit:
    mov ah,4ch
    main endp

end main