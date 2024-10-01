.model small
.stack 100h
.data         

    origen db 'Ramiro', 0
    destino db 20 dup (?) 
    cant_caracter db 0  
    
.code
    main:
        mov ax, @data
        mov ds, ax
        mov es, ax
        
        lea si, origen
        lea di, destino
        
    recorrer:
        lodsb
        stosb
        
        inc cant_caracter
        
        cmp al, 0
        jne recorrer
        
    mov ah, 4Ch
    int 21h                  