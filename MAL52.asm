;Write some code in assembly language for converting lowercase to uppercase using EMU8086
.model small
.stack 100h 

.data
a db 'Enter the small letter: $'
b db 'The capital letter is: $'
 
.code
 
main proc   
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h     ; Print a
    
    mov ah,1
    int 21h
    mov bl,al   ; Input letter
    
    sub bl,32   ; a=97, A=65 difference 32, so convert uppercase sub 32
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ; New line
    
    mov ah,9
    lea dx,b
    int 21h     ; Print b
    
    mov ah,2
    mov dl,bl
    int 21h     ; Result
   
    exit:
    mov ah,4ch
    int 21h
    main endp
 
end main 
    
 
       
    