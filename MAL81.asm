;Write code in assembly language for compare uppercase letter or not
.model small
.stack 100h
.code

main proc
    mov ah,1
    int 21h
    
    cmp al, 'A'
    jb exit     ;If AL < 'A' -> exit. JB = jump if below
    
    cmp al, 'Z'
    jb exit     ;If AL > 'Z' -> exit. JA = jump if above
    
    mov ah,2
    mov dl,al
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main