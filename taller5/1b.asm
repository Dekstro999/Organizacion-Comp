; Actividad 1b: Puertos de Entrada/Salida (I/O)
section .text
    global _start
_start:
    mov dx, 0x60 ; Puerto del teclado
    in al, dx ; Leer byte desde el puerto
    mov dx, 0x61 ; Puerto del speaker
    out dx, al ; Escribir byte al puerto
    ; Salir del programa
    mov eax, 1 ; syscall número 1: sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80 ; Llamada al kernel
