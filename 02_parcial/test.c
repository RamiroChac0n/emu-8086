#include <stdio.h>

int main(){
    char cadena[100]; //longitud de cadena
    int longitud=0;//guardar longitud

    printf("Ingrese una cadena:");
    fgets(cadena,sizeof(cadena),stdin);

      asm (
        "movl $0, %%ecx;"           
        "movl %1, %%esi;"          
    "loop_inicio:"                
        "movb (%%esi), %%al;"       //caracter acutal en AL
        "cmpb $0, %%al;"           // Comparar carcter ifn de cadena
        "je fin;"                  // Si es '\0', saltar a fin
        "incl %%ecx;"              // Incrementar el contador de longitud
        "incl %%esi;"              // avanzar
        "jmp loop_inicio;"        
    "fin:"
        "movl %%ecx, %0;"          
        : "=g" (longitud)          // Salida 
        : "g" (cadena)             // Entrada 
        : "%ecx", "%esi", "%al"    // Clobbereds
    );


    printf("la longitud de la cadena es:%d",(longitud-1));
}