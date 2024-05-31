; Actividad 1c: Instrucciones Privilegiadas
section .text
    global _start
_start:
    sti ; Habilitar interrupciones
    ; Aquí iría el código principal del programa
    ; Salir del programa
    mov eax, 1 ; syscall número 1: sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80 ; Llamada al kernel
