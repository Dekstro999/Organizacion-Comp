#include <stdio.h>
#include <math.h>

#define MAX_SIZE 8 // Tamaño máximo para la parte entera y fraccionaria

// Función para convertir una cadena de dígitos binarios en un número flotante
float binarioAFlotante(char binaryNumber[], int size) {
    float result = 0.0;
    int exponent = 0;
    
    // Calcular el exponente de la parte entera
    for (int i = size - 2; i >= 0; i--) {
        result += (binaryNumber[i] - '0') * pow(2, exponent);
        exponent++;
    }
    
    // Calcular la parte fraccionaria
    float fractionalPart = 0.0;
    float fracExponent = -1.0;
    for (int i = size - 1; i < 2 * (size - 1); i++) {
        fractionalPart += (binaryNumber[i] - '0') * pow(2, fracExponent);
        fracExponent--;
    }
    
    // Sumar la parte entera y fraccionaria
    result += fractionalPart;
    
    return result;
}

// Función para convertir un número flotante en una cadena de dígitos binarios
void flotanteABinario(float number, char binaryNumber[]) {
    // Separar la parte entera y fraccionaria del número
    int integerPart = (int)number;
    float fractionalPart = number - integerPart;
    
    // Convertir la parte entera a binario
    int index = 0;
    while (integerPart > 0) {
        binaryNumber[index++] = (integerPart % 2) + '0';
        integerPart /= 2;
    }
    binaryNumber[index++] = '.';
    
    // Convertir la parte fraccionaria a binario
    while (fractionalPart > 0 && index < MAX_SIZE) {
        fractionalPart *= 2;
        int bit = (int)fractionalPart;
        binaryNumber[index++] = bit + '0';
        fractionalPart -= bit;
    }
}

// Función para sumar dos números binarios con punto flotante
void sumarBinariosFlotantes(char binaryNumber1[], char binaryNumber2[], char result[]) {
    float num1 = binarioAFlotante(binaryNumber1, MAX_SIZE);
    float num2 = binarioAFlotante(binaryNumber2, MAX_SIZE);
    float sum = num1 + num2;
    flotanteABinario(sum, result);
}

// Función para restar dos números binarios con punto flotante
void restarBinariosFlotantes(char binaryNumber1[], char binaryNumber2[], char result[]) {
    float num1 = binarioAFlotante(binaryNumber1, MAX_SIZE);
    float num2 = binarioAFlotante(binaryNumber2, MAX_SIZE);
    float difference = num1 - num2;
    flotanteABinario(difference, result);
}

int main() {
    char binaryNumber1[MAX_SIZE];
    char binaryNumber2[MAX_SIZE];
    char result[MAX_SIZE];

    printf("Ingrese el primer número binario con punto flotante: ");
    scanf("%s", binaryNumber1);

    printf("Ingrese el segundo número binario con punto flotante: ");
    scanf("%s", binaryNumber2);

    sumarBinariosFlotantes(binaryNumber1, binaryNumber2, result);
    printf("La suma es: %s\n", result);

    restarBinariosFlotantes(binaryNumber1, binaryNumber2, result);
    printf("La resta es: %s\n", result);

    return 0;
}