;Id: 222311077
;Program performed for only single disit number

.model small
.stack 100h 

.data
    m1 db 'Enter 1st number: $'
    m2 db 13,10, 'Enter 2nd number: $'
    m3 db 13,10, 'Enter 3rd number: $'
    m4 db 13,10, 'Largest: $'
    max db ?

.code 

main proc
    
    mov ax, @data
    mov ds, ax

    mov ah, 9    
    lea dx, m1
    int 21h      ; Print m1
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov bl, al   ; Input 1st num

    mov ah, 9
    lea dx, m2
    int 21h      ; Print m2
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov bh, al   ; Input 2nd num
    
    mov ah, 9
    lea dx, m3
    int 21h      ; Print m3
        
    mov ah, 1
    int 21h
    sub al, '0'
    mov cl, al   ; Input 3rd num 
    

    ; Compare 1st & 2nd
    mov al, bl
    cmp al, bh    ; If al > bh
    jge Big       ; jge = Jump if Greater or Equal
    mov al, bh    ; Else bh > al
    jmp Big 

    Big:        
        cmp al, cl        ; If al > cl
        jge display       ; jge = Jump if Greater or Equal
        mov al, cl        ; Else cl > al
        jmp display

    display:
        add al, '0'      ; Convert result to ASCII
        mov max, al

        mov ah, 9
        lea dx, m4
        int 21h          ; Print m4  
    
        mov ah, 2
        mov dl, max 
        int 21h          ; Output maximum

    exit:
    mov ah, 4ch
    int 21h 
    main endp
end main
