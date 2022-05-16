.model small
.stack 64
.data

ciclo macro x,y
    mov bl,x    ;0
    mov dl,30h
    bucle:
        imprime
        inc dl
        inc bl
    cmp bl,y    ;10
    jne bucle
endm
imprime macro 
    mov ah,02h
    int 21h
endm

.code
    mov ax,@data
    mov ds,ax
    
    ciclo 0,0ah
     
    mov ah,4ch
    int 21h
    
    
end