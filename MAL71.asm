;Write a assembly code for printing * 80 times using loop
.model small               
.stack 100h
.code 

main proc 
    
    mov cx,80
    mov ah,2
    mov dl,'*'   ;Print *
    
    top:
    int 21h
    loop top:
    
    exit:
    mov ah,4ch
    int 21h  
    main endp
end main 