
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AH, 03H
MOV BH, 00H  ; PÁGINA 0
INT 10H
; AHORA DH CONTIENE LA FILA, DL CONTIENE LA COLUMNA


ret