section .data
    ; Define los valores de ejemplo (pueden ser modificados según sea necesario)
    valor1 db 10101100b  ; Primer valor de 8 bits (en binario)
    valor2 db 11001010b  ; Segundo valor de 8 bits (en binario)

section .text
    global _start

_start:
    ; Carga los valores en los registros
    mov al, [valor1]
    mov bl, [valor2]

    ; Operación XOR bit a bit
    xor al, bl
    mov dl, al  ; Almacena el resultado en el registro DL

    ; Finaliza el programa
    mov eax, 60  ; Número de llamada al sistema para salir (sys_exit)
    xor edi, edi ; Código de salida (0)
    syscall      ; Llama al sistema para salir del programa
