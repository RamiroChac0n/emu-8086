#include <stdio.h>

int longitud = 0;

void longitudCadena(char *cadena){
    asm(
        "movl %[cadena], %%esi;"
        "movl $0, %%ecx;"
        :
        : [cadena] "g" (cadena)
        : "esi", "ecx"
    );

    contar:
    asm(
        "movb (%%esi), %%al;"
        :
        :
        :"ebx", "ecx", "al"
    );

    asm goto(
        "cmpb $0, %%al;"
        "je %l[fin];"
        "incl %%ecx;"
        "incl %%esi;"
        "jmp %l[contar];"
        :
        :
        :"ebx", "ecx", "al"
        :   contar, fin
    );

    fin:
    asm(
        "movl %%ecx, %[longitud];"
        :   [longitud] "=g" (longitud)
        :
        :
    );
}

int main(void){

    char cadena[100];

    printf("Ingrese una cadena: ");
    fgets(cadena, sizeof(cadena), stdin);  

    longitudCadena(cadena);

    printf("La longitud de la cadena es: %d\n", longitud);

    return 0;
}