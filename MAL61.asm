;Write some code in assembly language for converting uppercase to lowercase using EMU8086

.model small
.stack 100h

.data
a db 'Enter the uppercase letter: $'
b db 'The lowercase letter is: $'

.code
main proc
       
       mov ax,@data
       mov ds,ax
       
       mov ah,9
       lea dx,a
       int 21h      ; Print a
       
       mov ah,1
       int 21h
       mov bl,al    ; Input
       
       add bl,32    ; Add 32, to converting lowercase
       
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h      ; Newline
       
       mov ah,9
       lea dx,b
       int 21h      ; Print b
       
       mov ah,2
       mov dl,bl
       int 21h      ; Output
       
       exit:
       mov ah,4ch
       int 21h
       main endp
end main
