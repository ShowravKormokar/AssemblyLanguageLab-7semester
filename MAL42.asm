; Write some code in assembly language for multiplication of 2 numbers using EMU8086
.model small
.stack 100h

.data
a db 'Enter the 1st and 2nd numbers: $'
b db 'The mul is: $'
m db ?  ;Variable for store user input value

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h     ; Print a
    
    mov ah,1    ; Input 1
    int 21h
    mov m,al 
    sub m, 48   ; Accumulator resister (value is kept for multiplication) 
       
    mov ah,1    ; Input 2
    int 21h
    sub al, 48
       
    mul m       ; al=al*m
    aam         ; Adjust the AX after multiplication
    mov bx,ax   ; Showing carry value or multiplication value

    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h     ; Newline
    
    mov ah,9
    lea dx,b
    int 21h     ; Print b
        
    mov ah,2
    mov dl,bh   ; 1st disit (If the answer is 2 disit)[Most significant disit(left most disit)]
    add dl,48
    int 21h
       
    mov ah, 2
    mov dl,bl   ; 2nd disit (If the answer is 2 disit)[Most significant disit(right most disit)]
    add dl,48
    int 21h     ; Output

    
    exit:
    mov ah,4ch
    main endp

end main 

;Note: Input must be decending order, like 421