
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AH, 01H
MOV CH, 06H  ; LÍNEA DE INICIO DEL CURSOR
MOV CL, 07H  ; LÍNEA DE FIN DEL CURSOR
INT 10H


ret