
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

    CALL ingreso_numeros      
    CALL suma
    CALL acomodar_resultado
    CALL mostrar_resultado_pantalla

ret

ingreso_numeros: 

    ;Primer numero
    CALL pedir_digito
    CALL convertir_a_decimal
    MOV BH, AL
    
    CALL pedir_digito
    CALL convertir_a_decimal
    MOV BL, AL
    
    ;Segundo numero
    CALL pedir_digito
    CALL convertir_a_decimal
    MOV CH, AL
    
    CALL pedir_digito
    CALL convertir_a_decimal
    MOV CL, AL    

RET

convertir_a_decimal:

    SUB AL, 30h

RET

convertir_a_hexadecimal:

    ADD DL, 30h

RET 

pedir_digito:

    MOV AH, 1
    INT 21h

RET 

suma:

    ADD BH, CH
    ADD BL, CL

RET 

acomodar_resultado:

    ;Se mueve el Resultado a AX solo para 
    ;poder sumar el acarreo
    MOV AX, BX
    ADD AL, 0
    AAA
    
    ;El resultado se Mueve a CX
    MOV CX, AX

RET 

mostrar_resultado_pantalla:

    MOV DL, CH 
    CALL convertir_a_hexadecimal
    CALL mostrar_digito
    
    MOV DL, CL
    CALL convertir_a_hexadecimal
    CALL mostrar_digito

RET

mostrar_digito:

    MOV AH, 2
    INT 21h

RET