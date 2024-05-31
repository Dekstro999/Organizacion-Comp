section .data
    debug_msg db "Debugging message", 0xA
    debug_len equ $ - debug_msg
    num1 db 0
    num2 db 0
    res db 0
    result db "El resultado es: ", 0xA
    len_result equ $ - result

section .text
    global _start

_start:

mov al, [num1]      ; Carga el primer número ingresado en AL
sub al, '0'         ; Convierte el carácter en valor numérico
mov bl, [num2]      ; Carga el segundo número ingresado en BL
sub bl, '0'         ; Convierte el carácter en valor numérico
add al, bl          ; Suma los dos números
add al, '0'         ; Convierte el resultado de nuevo a carácter
mov [res], al       ; Guarda el resultado de la suma

mov eax, 4          ; syscall número (write)
mov ebx, 1          ; file descriptor (stdout)
mov ecx, result     ; puntero al mensaje de resultado
mov edx, len_result ; longitud del mensaje de resultado
int 0x80

mov eax, 4          ; syscall número (write)
mov ebx, 1          ; file descriptor (stdout)
mov ecx, res        ; puntero al resultado
mov edx, 1          ; longitud de 1 byte
int 0x80

mov eax, 1          ; syscall número (exit)
xor ebx, ebx        ; código de salida 0
int 0x80
