
.model small
.stack 100h

.data
lf equ 10
od equ 13

salto db lf,od,"$"
cadena label byte ;este programa acepta como máximo 50 caracteres introducidos
chare db 50
max db 50
campo db ?
suma db ?
n1 db 0                 ; variable para entrada 1
n2 db 0                 ; variable para entrada 2
n3 db 0                 ; variable para resultado
n4 db 0                 ; variable para entrada 1
n5 db 0                 ; variable para entrada 2
n6 db 0                 ; variable para resultado
n7 db 0                 ; variable para entrada 1
n8 db 0                 ; variable para entrada 2
dece db 0
uni db 0

m1 db 10,13,' No.Control: $'    ; variable de mensaje 1

resultado db 10,13,' Resultado : $'    ; variable de mensaje resultado

top db     '--------------------------------------------------$';14
cuerpo1 db '|  Nombre:                                       |$';15
cuerpo2 db '|  Matricula:                                    |$';16
cuerpo3 db '|                                                |$';17
cuerpo4 db '|  Longitud de nombre:                           |$';18
cuerpo5 db '|  Suma de numeros de matricula:                 |$';19
both db    '--------------------------------------------------$';20
movercursor macro x,y
mov ah,2
mov dl,x    ;columna
mov dh,y    ;renglon
mov bx,0
int 10h
endm

Estudiante1 macro
movercursor 0dh,00h    ;hexadecimal
    
mov ah,09
lea dx,top
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 0dh,01h ;hexadecimal

mov ah,09
lea dx,cuerpo1
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 0dh,02h ;hexadecimal
mov ah,09
lea dx,cuerpo2
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 0dh,03h ;hexadecimal

mov ah,09
lea dx,cuerpo3
int 21h

mov ah,09
lea dx,salto
int 21h

;posicionCursor
movercursor 0dh,04h ;hexadecimal

mov ah,09
lea dx,cuerpo4
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 0dh,05h ;hexadecimal

mov ah,09
lea dx,cuerpo5
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 0dh,06h ;hexadecimal

mov ah,09
lea dx,both
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 18h,01h ;hexadecimal

mov ah,0ah
lea dx, cadena
mov dx,offset cadena
int 21h

lea si,campo
mov cx,00

endm
Estudiante2 macro
movercursor 13,7    ;decimal

mov ah,09
lea dx,top
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,8    ;decimal

mov ah,09
lea dx,cuerpo1
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,9    ;decimal

mov ah,09
lea dx,cuerpo2
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,10    ;decimal

mov ah,09
lea dx,cuerpo3
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,11    ;decimal

mov ah,09
lea dx,cuerpo4
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,12    ;decimal

mov ah,09
lea dx,cuerpo5
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,13    ;decimal

mov ah,09
lea dx,both
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 24,8    ;decimal

mov ah,0ah
lea dx, cadena
mov dx,offset cadena
int 21h

lea si,campo
mov cx,00

endm
Estudiante3 macro
movercursor 13,14    ;decimal

mov ah,09
lea dx,top
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,15    ;decimal

mov ah,09
lea dx,cuerpo1
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,16    ;decimal

mov ah,09
lea dx,cuerpo2
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,17    ;decimal

mov ah,09
lea dx,cuerpo3
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,18    ;decimal

mov ah,09
lea dx,cuerpo4
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,19    ;decimal

mov ah,09
lea dx,cuerpo5
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 13,20    ;decimal

mov ah,09
lea dx,both
int 21h

mov ah,09
lea dx,salto
int 21h

movercursor 24,15    ;decimal

mov ah,0ah
lea dx, cadena
mov dx,offset cadena
int 21h

lea si,campo
mov cx,00

endm

pedirNumeros1 macro
    ;----------------Bucle para contar los caracteres----------------
    loop1:
    mov al,[si]
    cmp al,0dh ;si detecta un enter
    je salida1 ;deja de contar los caracteres
    inc cx
    inc si
    jmp loop1

    salida1:
    ;posicion del cursor
    movercursor 36,4

    mov bl,10
    mov ax,cx
    div bl
    mov dx,ax
    or dx,3030h
    mov ah,02h
    int 21h

    mov suma,dh
    xchg dl,suma    ;salida de la suma
    mov ah,02h
    int 21h
endm
pedirNumeros2 macro
    ;----------------Bucle para contar los caracteres----------------
    loop2:
    mov al,[si]
    cmp al,0dh ;si detecta un enter
    je salida2 ;deja de contar los caracteres
    inc cx
    inc si
    jmp loop2

     salida2:
     movercursor 36,11

    mov bl,10
    mov ax,cx
    div bl
    mov dx,ax
    or dx,3030h
    mov ah,02h
    int 21h

    mov suma,dh
    xchg dl,suma    ;salida de la suma
    mov ah,02h
    int 21h

endm
pedirNumeros3 macro
    ;----------------Bucle para contar los caracteres----------------
    loop3:
    mov al,[si]
    cmp al,0dh ;si detecta un enter
    je salida3 ;deja de contar los caracteres
    inc cx
    inc si
    jmp loop3

        salida3:
    movercursor 36,18

    mov bl,10
    mov ax,cx
    div bl
    mov dx,ax
    or dx,3030h
    mov ah,02h
    int 21h

    mov suma,dh
    xchg dl,suma    ;salida de la suma
    mov ah,02h
    int 21h
    
endm

sumaNumeros1 macro

    ;---------------suma de los numeros-----------------------
    ;PIDIENDO DATOS
    ;19071579
    movercursor 26,2

    mov ah, 1
    int 21h
    sub al, 30h             ; restar 30h/48d 
    mov n1, al              ; mover entrada a la variable n1
    ;segundo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n2, al
    ;tercer numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n3, al
    ;cuarto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n4, al  
    ;quinto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n5, al
    ;sexto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n6, al
    ;septimo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n7, al
    ;octavo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n8, al

    mov al,n1
    add al,n2
    add al,n3
    add al,n4
    add al,n5
    add al,n6
    add al,n7
    add al,n8
    
    aam
    mov dece,ah
    mov uni,al
endm
sumaNumeros2 macro
   
    ;---------------suma de los numeros-----------------------
    ;PIDIENDO DATOS
    movercursor 26,9
    mov ah, 1
    int 21h
    sub al, 30h             ; restar 30h/48d 
    mov n1, al              ; mover entrada a la variable n1
    ;segundo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n2, al
    ;tercer numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n3, al
    ;cuarto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n4, al  
    ;quinto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n5, al
    ;sexto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n6, al
    ;septimo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n7, al
    ;octavo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n8, al

    mov al,n1
    add al,n2
    add al,n3
    add al,n4
    add al,n5
    add al,n6
    add al,n7
    add al,n8
    
    aam
    mov dece,ah
    mov uni,al
endm
sumaNumeros3 macro

    ;---------------suma de los numeros-----------------------
    ;PIDIENDO DATOS
    movercursor 26,16
    mov ah, 1
    int 21h
    sub al, 30h             ; restar 30h/48d 
    mov n1, al              ; mover entrada a la variable n1
    ;segundo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n2, al
    ;tercer numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n3, al
    ;cuarto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n4, al  
    ;quinto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n5, al
    ;sexto numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n6, al
    ;septimo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n7, al
    ;octavo numero
    mov ah, 1
    int 21h
    sub al, 30h
    mov n8, al

    mov al,n1
    add al,n2
    add al,n3
    add al,n4
    add al,n5
    add al,n6
    add al,n7
    add al,n8
    
    aam
    mov dece,ah
    mov uni,al
endm

impresionSuma macro   
    
    mov  ah,02h
    mov  dl,dece
    add  dl,30h
    int  21h 
    
    mov  ah,02h
    mov  dl,uni
    add  dl,30h
    int  21h   

    mov ah,09
    lea dx,salto
    int 21h

    mov ah,09
    lea dx,salto
    int 21h

endm
.code
    start:
    ;posicion del top
    mov ax,@data
    mov ds,ax
    mov ax,seg top
    mov ds,ax 

    Estudiante1
    pedirNumeros1
    sumaNumeros1
    movercursor 46,5
    impresionSuma
    
    Estudiante2
    pedirNumeros2
    sumaNumeros2
    movercursor 46,12
    impresionSuma

    Estudiante3
    pedirNumeros3
    sumaNumeros3
    movercursor 46,19
    impresionSuma
    
    ;salida del codigo
    mov ah, 4ch             ; servicio de finalizacion
    int 21h

end start

