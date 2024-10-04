#include <stdio.h>

int longitud = 0;

int longitudCadena(char *cadena){

    asm(
        "movl $-1, %%ecx;"
        :
        :
        :
    );

    avanzar:
    asm(
        "lodsb;"
        "incl %%ecx;"       
        "stosb;"       
        :   "+S" (cadena), "+D" (cadena)
        :
        : "ecx", "al"
    );

    asm goto(
        "cmpb $0, %%al;"
        "je %l[fin];"
        "jmp %l[avanzar];" 
        :
        :
        :   "al"
        :   avanzar, fin
    );

    fin:
    asm(
        "movl %%ecx, %[longitud];" 
        : [longitud] "=g" (longitud)
        :
        :
    );
    return longitud;
}

int main(void){

    char cadena[100];

    printf("Ingrese una cadena: ");
    fgets(cadena, sizeof(cadena), stdin);  

    longitudCadena(cadena);

    printf("La longitud de la cadena es: %d\n", longitud -1);

    return 0;
}