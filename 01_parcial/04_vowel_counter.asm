.model small
.stack 100h
.data 
    origen db 'Hola mundo', '$'
    destino db 20 dup (?)
    
    a db 0
    e db 0
    i db 0
    o db 0
    u db 0  
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
        
        cmp al, 'a'
        je add_a  
        
        cmp al, 'e'
        je add_e
         
        cmp al, 'i'
        je add_i
         
        cmp al, 'o'
        je add_o
         
        cmp al, 'u'
        je add_u
        
        cmp al, '$'
        jne recorrer 
        
        mov ah, 4Ch
        int 21h                     
        
        
    add_a:
        inc a 
        jmp recorrer
    add_e:   
        inc e 
        jmp recorrer
    add_i:   
        inc i       
        jmp recorrer
    add_o:   
        inc o       
        jmp recorrer
    add_u:   
        inc u       
        jmp recorrer          