; Write some code in assembly language for subtract of 3 numbers using EMU8086
.model small
.stack 100h

.data
a db 'Enter the 1st, 2nd and 3rd numbers: $'
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
    
    int 21h
    mov cl,al   ;Input 3rd number
    
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
    
    sub bl,cl   ;Sub: bl=bl-cl
    add bl,48   ;Add for convert disit
    
    mov ah,2
    mov dl,bl
    int 21h     ;Result
    
    exit:
    mov ah,4ch
    main endp

end main 

;Note: Input must be decending order, like 421