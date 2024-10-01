.model small
.stack 100h
.data
              
    mensaje1 db 'Hola$'
    mensaje2 db ', subrutina$' 
    mensaje3 db ' :D$'             
              
.code

main:
        
    mov ax, @data
    mov ds, ax 
     
    ;print msg1     
    mov dx, offset mensaje1
    mov ah, 9
    int 21h
    
    call subrutina 
     
    ;print msg3 
    mov dx, offset mensaje3
    mov ah, 9
    int 21h 
    
            
    ;Fin programa
    mov ah, 4Ch
    int 21h
    
subrutina:

    ;print msg2
    mov dx, offset mensaje2
    mov ah, 9
    int 21h
    ret          
        
end main