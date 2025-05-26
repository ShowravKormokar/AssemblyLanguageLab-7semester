;Print 5x5 matrix using loop

.model stack
.stack 100h
     
.data
m3 db '* $'     
     
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,5    ;Outter ioop run 5 times
    
    top1: 
        mov bx,5    ;Inner loop run 5 times
    top2:
        mov ah,9
        lea dx,m3 
        int 21h
     dec bx     ;Decrement by 1
     jnz top2   ;If bx!=0 go to top2
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h ;Print new line
    
    loop top1     ;Run 5 times
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main