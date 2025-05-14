.model small
.stack 100h

.data
a db  'Enter y or Y: $'
m1 db ,10,13,'*VU_CSE*$'
m2 db ,10,13,'Input is not y or Y.$'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h     ;Print a
    
    mov ah,1
    int 21h
    mov bl,al   ;Input
    
    cmp bl,'y'
    je display
    
    cmp bl,'Y'
    je display
    
    mov ah,9
    lea dx,m2   ;Print m2
    int 21h
    
    jmp exit
    
    display:
        mov ah,9
        lea dx,m1
        int 21h
    
    exit:
        mov ah,4ch
        int 21h
    main endp
end main
    
    