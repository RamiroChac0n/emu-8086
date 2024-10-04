#include <stdio.h>

    int registroA = 11;
    int registroB = 17;
    int registroC = 8;
    int registroD = 14;

void suma(){

    asm(
        "movl %[num1], %%eax\n"
        "movl %[num2], %%ebx\n"
        "movl %[num3], %%ecx\n"
        "movl %[num4], %%edx\n"
        "addl %%edx, %%eax\n"
        "movl %%eax, %0\n"
        "movl %%ebx, %1\n"
        "movl %%ecx, %2\n"
        "movl %%edx, %3\n"
        : "=g" (registroA), "=g" (registroB), "=g" (registroC), "=g" (registroD)
        :[num1] "g" (registroA), [num2] "g" (registroB), [num3] "g" (registroC), [num4] "g" (registroD)
        :
    );
}

int main(){

    suma();

    printf("Registro A: %d\n", registroA);
    printf("Registro B: %d\n", registroB);
    printf("Registro C: %d\n", registroC);
    printf("Registro D: %d\n", registroD);

    return 0;
}
