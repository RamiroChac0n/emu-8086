
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    mov bp, offset cadena
    
    jmp push_cadena_to_stack

ret 

push_cadena_to_stack:

    mov ax, [bp]
    push ax 
    add bp, 2                
    
    cmp al, '$'
    jne push_cadena_to_stack
           
    mov bp, offset cadena
    pop ax
    jmp pop_stack_to_cadena
    
pop_stack_to_cadena:
    
    pop ax
    mov bl, ah
    mov bh, al
    mov [bp], bx
    add bp, 2
    
    cmp [bp], '$'
    jne pop_stack_to_cadena 
    
    jmp imprimir
    
imprimir:
    
    mov dx, offset cadena
    mov ah, 9
    int 21h
    
    ret            

cadena db 'Hola mundos' , '$'