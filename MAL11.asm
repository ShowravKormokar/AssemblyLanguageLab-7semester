.model small
.stack 100h
.code

main proc
    mov ah,1
    int 21h
    mov bl, al  ;input
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ; Newline
    
    mov ah,2
    mov dl,bl
    int 21h     ;output
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main