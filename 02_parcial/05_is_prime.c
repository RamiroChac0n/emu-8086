#include <stdio.h>

int isPrimo(int numero){
    int bandera = 0;
    return bandera;
}

int main(){
    int numero = 0;
    printf("Ingrese un numero: ");
    scanf("%d", &numero);

    int bandera = isPrimo(numero);

    if (bandera)
    {
        printf("Es primo!!!\n");
    }else
    {
        printf("No es primo :(\n");
    }
    
    

    return 0;
}