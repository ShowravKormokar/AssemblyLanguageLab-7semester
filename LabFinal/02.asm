;ID: 222311077 
;Program performed for only single disit number

.model small
.stack 100h
.data
    m1 db 'Enter 1st number: $'
    m2 db 13,10, 'Enter 2nd number: $'
    m3 db 13,10, 'Enter 3rd number: $'
    m4 db 13,10, 'Average: $'
    res db ?

.code 

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m1
    int 21h       ; Print m1
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov bl, al    ; Input 1st num

    mov ah, 9 
    lea dx, m2
    int 21h       ; Print m2
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov bh, al    ; Input 2nd num
    
    mov ah, 9
    lea dx, m3
    int 21h       ; Print m3
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov dl, al    ; Input 3rd num 
    

    ; Add three numbers
    mov al, bl
    add al, bh    ; Add al = al + bh
    add al, dl    ; Add al = al + dl 
    

    ; Divide by 3
    mov ah, 0     ; Clear ah before division
    mov bl, 3
    div bl        ; AL / BL, quotient in al, remainder in ah

    
    add al, '0'   ; Convert result to ASCII
    mov res, al

    mov ah, 9
    lea dx, m4
    int 21h       ; Print m4
    
    mov ah, 2
    mov dl, res
    int 21h       ; Output result

    exit:
    mov ah, 4ch
    int 21h 
    main endp
end main
