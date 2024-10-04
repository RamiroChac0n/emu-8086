#include <stdio.h>

int contador = 0;
int limite = 28;

void counter(){

    bucle:
    asm(
        "incl %%eax\n"
        : "=a" (contador)
        :
        :
    );

    asm goto(
        "cmpl %[limite], %%eax\n"
        "jne %l[bucle]\n"
        :
        : [limite] "g" (limite)
        :"eax"
        : bucle
    );       
}

int main(){
    counter();
    printf("Contador: %d\n", contador);
    return 0;
}