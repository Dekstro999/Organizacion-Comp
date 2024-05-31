section .data
    mensaje db 'Hola Mundo', 0

section .text
    global _start

_start:
    ; Llamada al sistema para imprimir en la salida estándar 
    ; Número de llamada al sistema para write
    mov eax, 4          ; sys_write
    mov ebx, 1          ; Descriptor de archivo: salida estándar (stdout)
    mov ecx, mensaje    ; Puntero al mensaje "Hola Mundo"
    mov edx, 11         ; Longitud del mensaje
    int 0x80            ; Interrupción del sistema operativo

    ; Llamada al sistema para salir del programa
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Código de salida: 0
    int 0x80            ; Interrupción del sistema operativo
