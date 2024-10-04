#include <stdio.h>

int longitudCadena(int *cadena){

    int longitud = 0;

    asm(
        "movl $-1, %%ecx;"
        :
        :
        :
    );

    avanzar:
    asm(
        "lodsl;"
        "incl %%ecx;"       
        "stosl;"       
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

int sumaTotal(int *arreglo){
    int suma = 0;

    sumaBucle:
    asm goto(
        "lodsl;"
        "stosl;"
        "cmpl $0, %%eax;"
        "je %l[fin];"
        "addl %%eax, %[suma];"
        "jmp %l[sumaBucle];"
        :   [suma] "+g" (suma), "+S" (arreglo), "+D" (arreglo)
        :
        :   "eax"
        :   fin, sumaBucle
    );

    fin:
    asm(
        ""
        :
        :
        :
    );

    return suma;
}

int promedio(int *arreglo){
    int promedio = 0;
    int total = sumaTotal(arreglo);
    int longitud = longitudCadena(arreglo);
    //promedio = total / longitudCadena(arreglo);

    asm(
        "movl %1, %%eax\n"
        "movl %2, %%ebx\n"
        "cltd\n"
        "idivl %%ebx\n"
        "movl %%eax, %0\n"
        : "=g" (promedio)
        : "g" (total), "g" (longitud)
    );

    return promedio;
}

int contarMayores(int *arreglo){
    int cantidad = 0;
    int promedioComparar = promedio(arreglo);

    comparar:
    asm goto(
        "lodsl;"
        "stosl;"
        "cmpl $0, %%eax;"
        "je %l[fin];"
        "cmpl %[promedioComparar], %%eax;"
        "jge %l[aumentar];"
        "jmp %l[comparar];"
        :   [cantidad] "+g" (cantidad), "+S" (arreglo), "+D" (arreglo)
        :   [promedioComparar] "g" (promedioComparar)
        :   "eax"
        :   fin, comparar, aumentar
    );

    aumentar:
    asm goto(
        "incl %[cantidad];"
        "jmp %l[comparar];"
        : [cantidad] "+g" (cantidad)
        :
        :
        :   comparar
    );

    fin:
    asm(
        ""
        :
        :
        :
    );    

    return cantidad;
}

int main(){

    int arreglo[] = {1,-20,3,35,-1,0};

    printf("La suma total es:%d\n", sumaTotal(arreglo));
    printf("La longitud es: %d\n", longitudCadena(arreglo));
    printf("El promedio es: %d\n", promedio(arreglo));
    printf("Valores mayores que el promedio: %d\n", contarMayores(arreglo));

    return 0;
}