
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

    mov bx, 1
    mov cx, 0  
    dec numero
    call fibonacci

ret

fibonacci: 
    dec numero
    mov ax, 0
    add ax, bx
    add ax, cx
    
    mov cx, bx
    mov bx, ax
    
    cmp numero, 0
    jne fibonacci
    ret 

numero dw 20