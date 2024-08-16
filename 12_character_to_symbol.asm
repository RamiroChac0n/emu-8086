
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov bp, offset cadena
    jmp recorrer_cadena
ret

recorrer_cadena:
    mov al, [bp] 
    
    cmp al, 'o'
    je cero
    
    cmp al, 'l'
    je uno
    
    cmp al, 'a'
    je arroba
               
    inc bp
                   
    cmp al, '$'
    jne recorrer_cadena
      
    jmp imprimir
    
cero:   
    mov al, 30h
    mov [bp], al
    inc bp 
    jmp recorrer_cadena
    
uno:    
    mov al, 31h 
    mov [bp], al
    inc bp
    jmp recorrer_cadena
    
arroba:    
    mov al,40h
    mov [bp], al
    inc bp 
    jmp recorrer_cadena 
    
imprimir:
    mov dx, offset cadena
    mov ah, 9
    int 21h
    jmp fin
    
fin:
    mov ah, 4Ch
    int 21h                   

cadena db 'Hola mundo', '$'