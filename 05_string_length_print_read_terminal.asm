.model small
.stack 100
.data
    frase_inicio db 20,0,20 dup ('$')
    frase_fin db 20 dup (?)
    
    bienvenido db 'Bienvenido...$'
    solicitud db 0Dh, 0Ah, 'Ingrese una frase: $'   
    respuesta db 0Dh, 0Ah, 'Su frase fue: $'
    longitud_frase db 0Dh, 0Ah, 'Su longitud es de: $' 
    longitud db 0
    
.code

    main:
    
        mov ax, @data
        mov ds, ax
        
        ;Mensaje de bienvenida
        mov ah, 09h
        lea dx, bienvenido
        int 21h  
        
        ;Solicitud de frase
        mov ah, 09h
        lea dx, solicitud
        int 21h 
        
        ;Lee frase desde teclado
        lea dx, frase_inicio
        mov ah, 0Ah
        int 21h 
        
        ;Resultado
        mov ah, 09h
        lea dx, respuesta
        int 21h
        
        lea dx, frase_inicio +2
        mov ah, 09h
        int 21h     
          
        ;Imprime longitud          
        mov ah, 09h
        lea dx, longitud_frase
        int 21h  
        
        lea si, frase_inicio
        lea di, frase_fin 
        
               
    ;Bucle de recorrido        
    contar_caracteres:
        lodsb
        stosb
        
        inc longitud
        
        cmp al, '$'
        jne contar_caracteres
        
        
    ;Longitud        
    mov ah, 09h
    lea dx, longitud
    int 21h        
        
    mov ah, 4Ch
    int 21h         