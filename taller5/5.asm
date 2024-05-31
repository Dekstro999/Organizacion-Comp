; Actividad 5: Instrucciones en Línea en Ensamblador (Inline Assembly)

; Código Inline Assembly en C para sumar dos números
#include <stdio.h>

int main() {
    int a = 5, b = 3, result;
    __asm__ (
        "movl %1, %%eax;"
        "addl %2, %%eax;"
        "movl %%eax, %0;"
        : "=r" (result)
        : "r" (a), "r" (b)
        : "%eax"
    );
    printf("Result: %d\n", result);
    return 0;
}
