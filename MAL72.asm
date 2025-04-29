;Write a assembly code for printing a 5*5 matrix type
.model small               
.stack 100h  
 
.data 
a db '* * * * *',10,13,'$' 

.code 

main proc 
    mov ax,@data
    mov ds,ax
    
    mov cx,5  ; Loop run 5 times
    
    mov ah,9
    lea dx,a 
    
    top:
    int 21h   ;Printing one string and one new line 
    
    loop top:
    
    exit:
    mov ah,4ch
    int 21h  
    main endp
end main
    
    