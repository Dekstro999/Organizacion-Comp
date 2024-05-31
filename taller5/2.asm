; Actividad 2: Llamada a una Función Externa Escrita en C desde Ensamblador x86 y Viceversa

; Llamada de Ensamblador a C
section .text
    global _start
    extern my_function
_start:
    call my_function ; Llamar a la función C
    ; Salir del programa
    mov eax, 1 ; syscall número 1: sys_exit
    xor ebx, ebx ; Código de salida 0
    int 0x80 ; Llamada al kernel

; Llamada de C a Ensamblador
section .text
    global my_asm_function
my_asm_function:
    ; Imprimir mensaje desde ensamblador
    mov eax, 4 ; syscall número 4: sys_write
    mov ebx, 1 ; File descriptor 1: stdout
    mov ecx, message ; Dirección del mensaje
    mov edx, len ; Longitud del mensaje
    int 0x80 ; Llamada al kernel
    ret

section .data
    message db 'Hello from Assembly!', 0xA
    len equ $ - message
