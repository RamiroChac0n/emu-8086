
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov ah, 00h
mov al, 03h  ; Modo 03h: 80x25 texto, 16 colores
int 10h


ret
