.model small
.stack 100h
.data

    frase db 'hola mundo$' 
    fin db 20 dup(?)

.code                    
    
main:   

    mov ax, @data
    mov ds, ax
    
    mov si, offset frase
    mov di, offset fin 
    
uppercase: 

    mov ax, 0
    
    lodsb
    
    cmp al, '$'
    je fin_programa    
         
    sub al, 20h  
    push ax     
    
    jmp uppercase 
    
imprimir:
    mov dx, sp
    mov ah, 9
    int 21h
        
      
    
fin_programa:
    mov ah, 4Ch
    int 21h       

end main