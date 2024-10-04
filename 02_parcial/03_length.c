#include <stdio.h>

int longitud = 0;

int longitudCadena(char *cadena){

    asm(
        "movl $0, %%ecx;"
        "avanzar:;"
        "lodsb;"
        "cmpb $0, %%al;"
        "je fin;"
        "stosb;"
        "incl %%ecx;"
        "jmp avanzar;" 
        "fin:;"
        "movl %%ecx, %[longitud];"       
        :   "+S" (cadena), "+D" (cadena), [longitud] "=g" (longitud)
        :
        :   "ecx", "al"
    );
    return longitud;
}

int main(void){

    char cadena[100];
    char *ptr = cadena;

    printf("Ingrese una cadena: ");
    fgets(cadena, sizeof(cadena), stdin);  

    longitudCadena(ptr);

    printf("La longitud de la cadena es: %d\n", longitud -1);

    return 0;
}