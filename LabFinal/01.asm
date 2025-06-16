;ID: 222311077

;Solution question no.: 01

;Program performed for only single disit number
;For subtraction 1st number must be greater than 2nd

.model small
.stack 100h    

.data
    m1 db 'Enter 1st number: $'
    m2 db 13,10, 'Enter 2nd number: $'
    m3 db 13,10, 'Enter operator (+, -, *): $'
    m4 db 13,10, 'Result: $'
    res db ? 

.code

main proc
    mov ax, @data
    mov ds, ax
  
    mov ah, 9
    lea dx, m1
    int 21h     ; Print m1

    mov ah, 1
    int 21h     ; Input 1st num

    sub al, '0' ; Convert ASCII to number
    mov bl, al 
    
    mov ah, 9
    lea dx, m2
    int 21h     ; Print m2

    mov ah, 1
    int 21h     ; Input 2nd num
    
    sub al, '0' ; Convert ASCII to number
    mov bh, al  ; store second number in BH

    mov ah, 9
    lea dx, m3
    int 21h     ; Print m3

    mov ah, 1
    int 21h     ; Input operator
    mov cl, al


    cmp cl, '+' ; Compare operators 
    je sum
    cmp cl, '-'  ; If match to execute 
    je subt
    cmp cl, '*'
    je mult
    jmp exit     ; If operator doesn't match exit the program

    sum:
    mov al, bl
    add al, bh   ; Addition al=al+bh
    jmp display

    subt:
    mov al, bl
    sub al, bh   ; Subtract al=al-bh
    jmp display

    mult:
    mov al, bl
    mul bh       ; Multiplication ax = al * bh
    jmp display

    display:
    add al, '0'  ; Convert result to ASCII
    mov res, al

    lea dx, m4
    mov ah, 9
    int 21h      ; Print m4

    mov ah, 2
    mov dl, res
    int 21h      ; Print result

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main 