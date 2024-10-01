.model small
.stack 100h
.data

    numero1 dw 25
    numero2 dw 5
    resultado dw ?

.code  

main: 

    mov ax, @data
    mov ds, ax
    
    mov ax, numero1
    mov bx, numero2 
    
    call multiplicacion
    call division
    
    
    ;Fin programa
    mov ah, 4Ch
    int 21h
    
multiplicacion:
    mul bx
    mov resultado, ax
    ret
    
division:
    div bx           
    mov resultado, ax
    ret        

end main