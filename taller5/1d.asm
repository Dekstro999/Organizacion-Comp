; Actividad 1d: Llamadas al BIOS
section .text
    global _start
_start:
    mov ah, 0x01 ; Función 01h: Chequear el estado del teclado
    int 0x16 ; Interrupción de BIOS para el teclado
    jz no_key ; Si ZF está establecido, no hay tecla
    ; Aquí iría el código para procesar la tecla
no_key:
    ; Salir del programa
    mov eax, 1 ; syscall número 1: sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80 ; Llamada al kernel