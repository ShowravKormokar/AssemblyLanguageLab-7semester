;Print only odd numbers between 1 to 10

.model stack
.stack 100h
    
.code

main proc
    mov cx,5    ;Only 5 odd number exist 1 to 10 
    mov ah,2
    mov dl,1    ;Start from 1
    add dl,48   ;Convert to disit
    
    top:
        int 21h
        inc dl  ;Increment by 1
        inc dl  ;Increment by 1
        
    loop top    ;Go to top to continue loop 5 times

    exit:
    mov ah,4ch
    int 21h
    main endp
end main