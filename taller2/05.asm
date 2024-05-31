section .data
    numero1 dd 5        ; Declaración de la variable numero1 con valor inicial 5
    numero2 dd 7        ; Declaración de la variable numero2 con valor inicial 7
    resultado dd 0      ; Declaración de la variable resultado con valor inicial 0

section .text
    global _start

_start:
    ; Mover el valor de numero1 a eax
    mov eax, numero1
    ; Sumar el valor de numero2 a eax
    add eax, numero2
    ; Mover el resultado a la dirección de memoria de resultado
    mov [resultado], eax
    ; Terminar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
