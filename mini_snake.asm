
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    CALL derecha         	       

ret        

arriba:
RET

abajo:
RET

derecha:

    MOV AH, 0Ah
    MOV AL, '0' 
    MOV CX, 1
    INT 10h      
    
    MOV AH, 09h
    MOV AL, '0' 
    MOV BL, 0000B
    MOV CX, 1
    INT 10h 
    
    MOV AH, 02
    MOV DH, 00  ;FILA
    INC DL  ;COLUMNA  
    INT 10h  
    
    JMP derecha

RET

izquierda:
RET