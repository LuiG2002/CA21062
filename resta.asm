section .data
    x dw 50
    y dw 3
    z dw 15
    r dw 0

    texto db "Resultado: "
    texto_len equ $ - texto

    salida db "00", 10
    salida_len equ $ - salida

section .text
    global _start

_start:
    mov ax, [x]
    sub ax, [y]
    sub ax, [z]
    mov [r], ax

    mov bl, 10
    xor dx, dx
    div bl
    add al, '0'
    add ah, '0'
    mov [salida], al
    mov [salida + 1], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, texto
    mov edx, texto_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, salida
    mov edx, salida_len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
