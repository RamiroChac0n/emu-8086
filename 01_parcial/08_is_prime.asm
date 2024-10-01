.model small
.stack 100h
.data
                            
    primo db 'Es primo$'                            
    noPrimo db 'No es primo$'                
    numero dw 0     ;Numero a testear              

.code

main:    

    mov ax, @data
    mov ds, ax
    
    mov ax, numero
    mov bx, ax 
    mov cx, 1 
    
    cmp ax, 2
    jb no_primo
    jmp buscar_divisores
    
buscar_divisores:
    inc cx
    
    cmp cx, bx
    je es_primo
    
    mov ax, bx
    
    div cl
    
    cmp ah, 0
    je no_primo 
    
    jmp buscar_divisores 
    
es_primo:
    
    mov dx, offset primo
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h     
    
no_primo:
    
    mov dx, offset noPrimo
    mov ah, 9
    int 21h
    
    mov ah, 4Ch
    int 21h                   

end main           