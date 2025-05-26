.model small
.stack 100h   

.data
a db  'Enter 1st and 2nd number: $'
m1 db ,10,13,'1st is greater than 2nd$'
m2 db ,10,13,'1st is less than 2nd$' 
m3 db ,10,13,'1st and 2nd is equal$'

.code

main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h     ;Print a
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,1
    int 21h
    mov cl,al
    
    cmp bl, cl
    jg greater
    
    cmp bl, cl
    jl less
    
    cmp al, cl
    je equal
    
    greater:
    mov ah,9
    lea dx,m1
    int 21h
    jmp exit
    
    less:
    mov ah,9
    lea dx,m2
    int 21h
    jmp exit
    
    equal:
    mov ah,9
    lea dx,m3
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main