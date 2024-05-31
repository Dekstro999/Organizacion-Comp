section .data
debug_msg db "Debugging message", 0xA
debug_len equ $ - debug_msg

section .text
global _start

_start:

mov eax, 4 ; Coloca el número de syscall para 'write' en eax (4 es la llamada al sistema 'write')
mov ebx, 1 ; Coloca el descriptor de archivo para stdout en ebx (1 es stdout)
mov ecx, debug_msg ; Coloca la dirección del mensaje a imprimir en ecx
mov edx, debug_len ; Coloca la longitud del mensaje en edx
int 0x80 ; Interrupción para llamar al sistema operativo

mov eax, 1 ; Coloca el número de syscall para 'exit' en eax (1 es la llamada al sistema 'exit')
xor ebx, ebx ; Coloca 0 en ebx (código de salida)
int 0x80 ; Interrupción para llamar al sistema operativo    