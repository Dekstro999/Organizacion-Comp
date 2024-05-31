; Actividad 6: Convenciones de Paso de Parámetros (Calling Conventions)

; cdecl (C Declaration)
section .text
    global _start
_start:
    push dword message
    call printf
    add esp, 4 ; Limpieza de la pila
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    message db 'Hello, World!', 0

; stdcall (Standard Call)
section .text
    global _start
    extern my_function
_start:
    push dword 2
    push dword 1
    call my_function
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; fastcall (Fast Call)
section .text
    global _start
    extern my_function
_start:
    mov ecx, 1
    mov edx, 2
    call my_function
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; thiscall (This Call)
section .text
    global _start
    extern my_method
_start:
    push dword 1
    mov ecx, instance ; Dirección de la instancia de la clase
    call my_method
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

; vectorcall (Vector Call)
section .text
    global _start
    extern my_function
_start:
    mov eax, 1
    mov edx, 2
    call my_function
    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
