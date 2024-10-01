
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov bp, offset frase

mayusculas:
    mov ax, [bp]
    cmp al, '$'
    je fin    
    sub ax, 20h
    mov [bp], al 
    inc bp
    jmp mayusculas
    
fin:
    mov ah, 9
    mov dx, offset frase
    int 21h
ret    

ret

    frase db 'hola mundo', '$'

end