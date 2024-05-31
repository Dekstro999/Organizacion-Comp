#include <stdio.h>
#include <math.h>

// Función para convertir un número binario a decimal
int binarioADecimal(long long n)
{
    int decimalNumber = 0, i = 0, remainder;
    while (n != 0)
    {
        remainder = n % 10;
        n /= 10;
        decimalNumber += remainder * pow(2, i);
        ++i;
    }
    return decimalNumber;
}


long long decimalABinario(int n) 
{
    long long binaryNumber = 0;
    int remainder, i = 1, step = 1;

    while (n != 0) // Función para convertir un número decimal a binario
    {
        remainder = n % 2;
        printf("Step %d: %d/2, Remainder = %d, Quotient = %d\n", step++, n, remainder, n / 2);
        n /= 2;
        binaryNumber += remainder * i;
        i *= 10;
    }
    return binaryNumber;
}


long long sumarBinarios(long long binary1, long long binary2)
{ // Función para sumar dos números binarios
    int i = 0, remainder = 0, sum[20];
    long long sumBinario = 0;

    while (binary1 != 0 || binary2 != 0)
    {
        sum[i++] = (binary1 % 10 + binary2 % 10 + remainder) % 2;
        remainder = (binary1 % 10 + binary2 % 10 + remainder) / 2;
        binary1 /= 10;
        binary2 /= 10;
    }
    if (remainder != 0)
    {
        sum[i++] = remainder;
    }
    --i;
    while (i >= 0)
    {
        sumBinario = sumBinario * 10 + sum[i--];
    }
    return sumBinario;
}

// Función principal
int main()
{
    long long binary1, binary2, sumBinario;
    int opcion;
    printf("Ingrese el primer número binario: ");
    scanf("%lld", &binary1);
    printf("Ingrese el segundo número binario: ");
    scanf("%lld", &binary2);

    // Mostrar menú de opciones
    printf("\nElija la operación a realizar:\n");
    printf("1. Suma\n");
    printf("2. Resta\n");
    printf("3. Multiplicación\n");
    printf("4. División\n");
    printf("Opción: ");
    scanf("%d", &opcion);

    switch (opcion)
    { // Realizar la operación seleccionada
    case 1:
        // Suma
        sumBinario = sumarBinarios(binary1, binary2);
        printf("Resultado de la suma: %lld\n", sumBinario);
        break;
    // Los otros casos (resta, multiplicación y división) pueden ser implementados de manera similar
    default:
        printf("Opción no válida\n");
    }

    return 0;
}