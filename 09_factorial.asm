.model small
.stack 100h
.data  

    numero dw 8

.code  

main:   

    mov ax, @data
    mov ds, ax 
    
    mov ax, numero
    mov bx, numero
    
    call factorial
    
    mov ah, 4Ch
    int 21h
    
factorial:
    dec bx
    mul bx
    cmp bx, 1
    jnbe factorial
    ret                        

end main