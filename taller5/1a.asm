; Actividad 1a: Interrupciones del Sistema
section .data
    msg db 'Hello, World!', 0xA ; Mensaje a escribir, 0xA es salto de línea
    len equ $ - msg ; Longitud del mensaje

section .text
    global _start
_start:
    ; Llamar a la interrupción para escribir
    mov eax, 4 ; syscall número 4: sys_write
    mov ebx, 1 ; File descriptor 1: stdout
    mov ecx, msg ; Dirección del mensaje
    mov edx, len ; Longitud del mensaje
    int 0x80 ; Llamada al kernel
    ; Salir del programa
    mov eax, 1 ; syscall número 1: sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80 ; Llamada al kernel