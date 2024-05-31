#include <stdio.h>
#include <math.h>

// Función para calcular el complemento a dos de un número binario
long long complementoDos(long long binario, int bits) {
    // Se inicializa la variable que almacenará el complemento a dos
    long long complemento = 0;

    // Se calcula el valor que se debe sumar al número binario para obtener su complemento a dos
    // Esto se logra invirtiendo los bits del número y sumando 1
    long long suma = pow(2, bits);

    // Se invierten los bits del número binario utilizando operaciones de bits
    // Se recorre cada bit del número original
    for (int i = 0; i < bits; i++) {
        // Se verifica si el bit en la posición actual es 1 o 0
        // Si es 1, se cambia a 0; si es 0, se cambia a 1
        if (!(binario & (1 << i))) {
            complemento |= (1 << i); // Se cambia el bit a 1
        }
    }

    // Se suma 1 al número binario invertido para obtener el complemento a dos
    complemento += suma;

    return complemento;
}

// Función principal
int main() {
    long long numeroBinario;
    int bits;

    // Se solicita al usuario que ingrese el número binario y la cantidad de bits
    printf("Ingrese el número binario: ");
    scanf("%lld", &numeroBinario);
    printf("Ingrese la cantidad de bits: ");
    scanf("%d", &bits);

    // Se calcula el complemento a dos del número binario
    long long complemento = complementoDos(numeroBinario, bits);

    // Se muestra el complemento a dos
    printf("El complemento a dos de %lld es %lld\n", numeroBinario, complemento);

    return 0;
}