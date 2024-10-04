#include <stdio.h>

int a = 0;
int e = 0;
int i = 0;
int o = 0;
int u = 0;

void contar_vocales(char *cadena){
    avanzar:
    asm goto(
        "lodsb;"
        "stosb;"
        "cmpb $0, %%al;"
        "je %l[fin];"
        "cmpb $'a', %%al;"
        "je %l[contarA];"
        "cmpb $'e', %%al;"
        "je %l[contarE];"
        "cmpb $'i', %%al;"
        "je %l[contarI];"
        "cmpb $'o', %%al;"
        "je %l[contarO];" 
        "cmpb $'u', %%al;"
        "je %l[contarU];" 
        "jmp %l[avanzar];"               
        :   "+S" (cadena), "+D" (cadena)
        :
        : "al"
        : avanzar, fin, contarA, contarE, contarI, contarO, contarU
    );

    contarA:
    asm goto(
        "incl %[a];"
        "movl %[a], %0;"
        "jmp %l[avanzar];"
        :   "=g" (a)
        :   [a] "g" (a)
        :
        :   avanzar
    ); 

    contarE:
    asm goto(
        "incl %[e];"
        "movl %[e], %0;"
        "jmp %l[avanzar];"
        :   "=g" (e)
        :   [e] "g" (e)
        :
        :   avanzar
    ); 

    contarI:
    asm goto(
        "incl %[i];"
        "movl %[i], %0;"
        "jmp %l[avanzar];"
        :   "=g" (i)
        :   [i] "g" (i)
        :
        :   avanzar        
    ); 

    contarO:
    asm goto(
        "incl %[o];"
        "movl %[o], %0;"
        "jmp %l[avanzar];"
        :   "=g" (o)
        :   [o] "g" (o)
        :
        :   avanzar
    );

    contarU:
    asm goto(
        "incl %[u];"
        "movl %[u], %0;"
        "jmp %l[avanzar];"
        :   "=g" (u)
        :   [u] "g" (u)
        :
        :   avanzar
    );

    fin:
    asm(
        ""
        :
        :
        :       
    );
}

int main(){
    char cadena[100];
    printf("Ingrese una cadena: ");
    fgets(cadena, sizeof(cadena), stdin);

    contar_vocales(cadena);

    printf("Cantidad de a: %d\n", a);    
    printf("Cantidad de e: %d\n", e);
    printf("Cantidad de i: %d\n", i);
    printf("Cantidad de o: %d\n", o);
    printf("Cantidad de u: %d\n", u);    
    return 0;
}