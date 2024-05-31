%macro print_int 1
    mov eax, 4       ; Cargar la syscall para imprimir (sys_write)
    mov ebx, 1       ; Cargar el descriptor de archivo stdout
    mov ecx, %1      ; Cargar la dirección del entero a imprimir
    mov edx, 4       ; Longitud del entero a imprimir (4 bytes)
    int 0x80         ; Llamar al sistema
%endmacro

section .data
    array dd 1, 2, 3, 4, 5    ; Declaración del arreglo con valores 1, 2, 3, 4, 5

section .text
    global _start

_start:
    mov ecx, 0            ; Inicializar el contador del ciclo a 0
    mov eax, 0            ; Inicializar la suma en 0
bucle:
    mov ebx, [array + ecx*4]    ; Cargar el valor del arreglo en ebx
    add eax, ebx                 ; Sumar el valor actual del arreglo a la suma total
    inc ecx                      ; Incrementar el contador del ciclo
    cmp ecx, 5                   ; Comparar si hemos alcanzado el final del arreglo
    jl bucle                     ; Si no, continuar el ciclo
    print_int eax                ; Imprimir la suma total
    mov eax, 1                   ; Cargar syscall para terminar el programa (sys_exit)
    xor ebx, ebx                 ; Cargar código de salida 0
    int 0x80                     ; Llamar al sistema
