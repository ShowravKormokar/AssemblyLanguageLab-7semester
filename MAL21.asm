;Write some dode in assembly language for printing string using EMU 8086
.model small
.stack 100h

.data
a db 'My name is Showrav Kormokar, ID: 222311077.$'  ;Variable declaration

.code

main proc
    
    mov ax, @data   ;Initialization the data segment to code segment
    mov ds,ax
    
    mov ah,9
    lea dx, a   ;Load effective address and show the string
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp

end main