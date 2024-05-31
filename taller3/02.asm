section.data
    msg_greater db "El número es mayor o igual a 10", 0xA
    len_msg_greater equ $ - msg_greater
    msg_lower db "El número es menor a 10", 0xA
    len_msg_lower equ $ - msg_lower

section.bss
    number resd 1

section.text
    global start

start:
    mov dword [number], 1   ; Asignar el valor 1 a la variable 'number'
    mov eax, dword [number] ; Cargar el valor de 'number' en eax
    cmp eax, 10             ; Comparar el valor con 10
    jge greater_than_or_equal ; Saltar si es mayor o igual a 10

    mov eax, 4              ; Cargar el sistema para imprimir
    mov ebx, 1              ; Configurar el descriptor de archivo para stdout
    mov ecx, msg_lower      ; Configurar el mensaje a imprimir
    mov edx, len_msg_lower  ; Configurar la longitud del mensaje
    int 0x80                ; Llamar a la interrupción del sistema para imprimir
    jmp end_if_else        ; Saltar al final de la estructura if-else

greater_than_or_equal:
    mov eax, 4              ; Cargar el sistema para imprimir
    mov ebx, 1              ; Configurar el descriptor de archivo para stdout
    mov ecx, msg_greater    ; Configurar el mensaje a imprimir
    mov edx, len_msg_greater; Configurar la longitud del mensaje
    int 0x80                ; Llamar a la interrupción del sistema para imprimir

end_if_else:
    mov eax, 1              ; Cargar el sistema para terminar el programa
    xor ebx, ebx            ; Limpiar ebx
    int 0x80                ; Llamar a la interrupción del sistema para terminar el programa
