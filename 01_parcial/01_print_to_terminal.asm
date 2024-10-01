
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
; Programa básico en ensamblador
.model small
.stack 100h
.data

mensaje db 'Hola mundo$', 0

.code

main:

    mov ax, @data
    mov ds, ax
    
    mov ah, 0x9h
    lea dx, mensaje
    int 0x21h
    
    mov ah, 0x4ch
    int 0x21h        
        
end main