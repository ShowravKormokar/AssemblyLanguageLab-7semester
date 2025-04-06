;Write some code in assembly language for simple user friendly input and output where inpiut is given by user using EMU8086
.model small
.stack 100h

.data
a db 'Enter a single disit number: $'   ;Variable a declaration
b db 'The number is: $'     ;Variable b declaration

.code

main proc
    
    mov ax,@data    ;Initialization the data segment to code segment
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h         ;Print variable a
    
    mov ah,1
    int 21h
    mov bl,al       ;Take input
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h         ;Print Newline
    
    mov ah,9
    lea dx,b
    int 21h         ;Print variable b
    
    mov ah,2
    mov dl,bl
    int 21h         ;Print output
    
    exit:
    mov ah,4ch
    main endp

end main