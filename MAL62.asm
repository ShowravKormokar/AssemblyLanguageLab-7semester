;Write some code in assembly language for printing A-Z using EMU8086
.model small
.stack 100h
.code
main proc
	mov cx,26   
	mov ah,2
	mov dl,'A' ;Start A

	top:        ;Loop start
	int 21h
	inc dl     ;Increment by one 

	loop  top:  ;Back to top

	exit: 
	mov ah,4ch
	int 21h
	main  endp
end  main
