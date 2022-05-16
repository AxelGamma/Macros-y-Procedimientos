.model small
.stack 64
.data

.code
   Inicio:
    ;inicio del programa
    mov ax,@data
    mov ds,ax
    
    call ciclo
    
    mov ah,4ch
    int 21h
    ;fin del programa
    ;Inicio de procedimientos    
    
    ciclo proc 
        mov bl,0
        mov dl,30h
        bucle:
            
            call imprime

            inc dl
            inc bl
        cmp bl,10
        jne bucle
        ret
    ciclo endp 
    
    imprime proc 
        mov ah,02h
        int 21h
        ret
    imprime endp
    
    
end