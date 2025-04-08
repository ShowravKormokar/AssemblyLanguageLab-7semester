;Write some code in assembly language for division of 2 numbers using EMU8086
.model small
.stack 100h
 
.code
 
main proc 
    
    mov al,6    ;1st value
    mov bl,2    ;2nd value
       
    div bl      ;Divition bl=al/bl
    
    mov cl,bl   ;Store result
    mov ch,ah   ;Store reminder
    
    mov ah,2
    mov dl,cl 
    add dl,48
    int 21h     ;Show result
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ;Newline
    
    mov ah,2
    mov dl,ch
    add dl,48
    int 21h     ;Show reminder
   
    exit:
    mov ah,4ch
    int 21h
    main endp
 
end main