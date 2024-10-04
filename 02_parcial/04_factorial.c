#include <stdio.h>

int factorial(int numero){
    int factorial = 0;

    asm(
        "movl $1, %%eax;"
        "movl $0, %%ebx;"
        : 
        :
        :   "eax", "ebx"
    );

    bucle:
    asm(
        "incl %%ebx;"
        "mul %%ebx;"
        "movl %%eax, %[factorial];"
        :   [factorial] "=g" (factorial)
        :
        :
    );

    asm goto(
        "cmpl $0, %[numero];"
        "je %l[cero];"
        "cmpl %[numero], %%ebx;"
        "jne %l[bucle];"
        :
        : [numero] "g" (numero)
        :
        :   bucle, cero
    );

    cero:
    asm(
        "movl %%eax, %[factorial];"
        :   [factorial] "=g" (factorial)
        :
        :
    );    

    return factorial;
}

int main(){
    int numero = 0;
    printf("Ingrese el numero que desea saber su factorial: ");
    scanf("%d", &numero);

    printf("El factorial es: %d\n", factorial(numero));

    return 0;
}