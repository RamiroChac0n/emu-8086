
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

    MOV DH, 00
    MOV DL, 00 
    
    MOV AH, 00h 
    MOV AL, 13h
    INT 10h
    
    CALL mover_derecha         	       

ret 

interrupcion_16h_01h:
    MOV AH, 01
    INT 16h
RET 

control: 

            
    MOV AH, 00
    INT 16h 
                            
    CMP AL, izquierda    ;IZQUIERDA
    JE mover_izquierda
                                
    CMP AL, derecha    ;DERECHA 
    JE mover_derecha
       
    CMP AL, arriba    ;ARRIBA
    JE mover_arriba
        
    CMP AL, abajo    ;ABAJO
    JE mover_abajo 
    
    JMP control

RET       

mover_arriba:

    CALL repintar_caracter 
    CALL borde_superior_inferior 
    
    MOV AH, 02
    DEC DH          ;FILA
    INT 10h
    
    CALL interrupcion_16h_01h
    JZ mover_arriba  
    
    JMP control

RET

mover_abajo:

    CALL repintar_caracter
    CALL borde_superior_inferior
    
    MOV AH, 02
    INC DH          ;FILA
    INT 10h 
    
    CALL interrupcion_16h_01h
    JZ mover_abajo
    
    JMP control    

RET       
        
mover_derecha:  

    CALL repintar_caracter 
    CALL bordes_laterales
    
    MOV AH, 02
    INC DL          ;COLUMNA
    INT 10h
    
    CALL interrupcion_16h_01h
    JZ mover_derecha  
    
    JMP control

RET

mover_izquierda:  

    CALL repintar_caracter
    CALL bordes_laterales
    
    MOV AH, 02
    DEC DL          ;COLUMNA  
    INT 10h
    
    CALL interrupcion_16h_01h
    JZ mover_izquierda  

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

borde_superior_inferior:

    CMP DH, 0
    JBE arriba_abajo
    
    CMP DH, 24
    JGE abajo_arriba

RET

arriba_abajo:

    MOV DH, 24

RET

abajo_arriba:

    MOV DH, 00

RET 

bordes_laterales:

    CMP DL, 00
    JBE derecha_izquierda
    
    CMP DL, 39
    JGE izquierda_derecha

RET

derecha_izquierda:

    MOV DL, 39

RET

izquierda_derecha:

    MOV DL, 00

RET

izquierda   DB  61h  
derecha     DB  64h   
arriba      DB  77h
abajo       DB  73h 