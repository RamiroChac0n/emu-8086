
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model small
.stack 100h
.data
    contador db 0
    
.code

main:   

    mov ax, @data       ;Cargamos la direccion del segmento de datos en el registro AX
    mov ds, ax          ;y luego movemos ese valor al registro DS
    
    cmp contador, 0
    je inicio_contador
    
inicio_contador: 

    inc contador        ;Incrementa el contador en 1
    
    cmp contador, 10    ;Compara si es igual a 10 
    
    jb inicio_contador  ;Salta si es menor a 10
    je fin              ;Salta si es igual a 10
    
fin:
    mov ah, 4Ch
    int 21h    ; Terminar el programa        
    

end main    
