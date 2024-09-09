
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AH, 02H
MOV BH, 00H  ; PAGINA 0
MOV DH, 10H  ; FILA 16
MOV DL, 20H  ; COLUMNA 32
INT 10H

ret