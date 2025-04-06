;Write some code in assembly language for addition of three numbers using EMU8086
.model small
.stack 100h

.data
a db 'Enter the 1st, 2nd and 3rd numbers: $'
b db 'The sum is: $'

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
    
    int 21h
    mov cl,al   ;Input3rd number
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ;NewLine
    
    mov ah,9
    lea dx,b
    int 21h     ;Print b
    
    add bl,bh   ;Add: bl=bl+bh
    sub bl,48   ;Sub: for convert disit
    
    add bl,cl   ;Add: bl=bl+cl
    sub bl,48   ;Sub: for convert disit
    
    
    mov ah,2
    mov dl,bl
    int 21h     ;Output
    
    exit:
    mov ah,4ch
    main endp

end main