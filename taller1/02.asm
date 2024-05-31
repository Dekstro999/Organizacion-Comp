section .data
    mensaje db 'Hola Mundo como esta', 0

section .text
    global _start

_start:
    ; Llamada al sistema para imprimir en la salida estándar
    mov eax, 4          ; Número de llamada al sistema para write
    mov ebx, 1          ; Descriptor de archivo: salida estándar
    mov ecx, mensaje    ; Puntero al mensaje "Hola Mundo como esta"
    mov edx, 20         ; Longitud del mensaje
    int 0x80            ; Interrupción del sistema operativo

    ; Llamada al sistema para salir del programa
    mov eax, 1          ; Número de llamada al sistema para exit
    xor ebx, ebx        ; Código de salida: 0
    int 0x80            ; Interrupción del sistema operativo
