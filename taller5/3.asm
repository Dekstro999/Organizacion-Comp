; Actividad 3: Uso de la Pila (Stack) en Ensamblador x86

section .data
    msg db 'Factorial: ', 0xA, 0
    len equ $ - msg

section .text
    global _start
_start:
    mov eax, 5 ; Calcular factorial de 5
    call factorial ; Llamar a la función
    ; Mostrar resultado (simplemente para demostración, no funcional)
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

factorial:
    cmp eax, 1
    jle .done ; Si eax <= 1, terminar
    push eax ; Guardar eax en la pila
    dec eax ; eax = eax - 1
    call factorial ; Llamada recursiva
    pop ebx ; Restaurar valor original de eax
    mul ebx ; eax = eax * ebx
.done:
    ret ; Retornar
