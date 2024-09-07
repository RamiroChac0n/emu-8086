
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

    MOV DH, 00
    MOV DL, 00
    
    CALL control         	       

ret 

control: 

            
    MOV AH, 01
    INT 16h 
                            
    CMP AL, 61h    ;IZQUIERDA
    JNE izquierda                            
    CMP AL, 64h    ;DERECHA 
    JNE derecha   
    CMP AL, 77h    ;ARRIBA
    JNE arriba    
    CMP AL, 73h    ;ABAJO
    JNE abajo 
    
    JMP control

RET       

arriba:

    CALL repintar_caracter
    
    MOV AH, 02
    DEC DH          ;FILA 
    INT 10h  
    
    JMP control

RET

abajo:

    CALL repintar_caracter
    
    MOV AH, 02
    INC DH          ;FILA
    INT 10h
    
    JMP control    

RET       
        
derecha:  

    CALL repintar_caracter
    
    MOV AH, 02
    INC DL          ;COLUMNA  
    INT 10h  
    
    JMP control

RET

izquierda:  

    CALL repintar_caracter
    
    MOV AH, 02
    DEC DL          ;COLUMNA  
    INT 10h  

    JMP control

RET

repintar_caracter:

    MOV AH, 0Ah
    MOV AL, '0' 
    MOV CX, 1
    INT 10h      
    
    MOV AH, 09h
    MOV AL, '0' 
    MOV BL, 0000B
    MOV CX, 1
    INT 10h

RET 