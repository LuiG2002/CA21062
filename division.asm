section .data
    dividendo dd 15
    divisor dd 3
    cociente dd 0
    residuo dd 0

    msg_cociente db "Cociente: ", 0
    msg_cociente_len equ $ - msg_cociente - 1

    msg_residuo db "Residuo: ", 0
    msg_residuo_len equ $ - msg_residuo - 1

    nueva_linea db 10
    buffer times 11 db 0

section .text
    global _start

_start:
    mov eax, [dividendo]
    xor edx, edx
    div dword [divisor]
    mov [cociente], eax
    mov [residuo], edx

    ; Mostrar mensaje: Cociente
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_cociente
    mov edx, msg_cociente_len
    int 0x80

    ; Mostrar valor del cociente
    mov eax, [cociente]
    call imprimir_numero

    ; Mostrar mensaje: Residuo
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_residuo
    mov edx, msg_residuo_len
    int 0x80

    ; Mostrar valor del residuo
    mov eax, [residuo]
    call imprimir_numero

    ; Salida del programa
    mov eax, 1
    mov ebx, 0
    int 0x80

imprimir_numero:
    mov ebx, buffer + 10
    mov byte [ebx], 0
    mov ecx, 10

.convertir:
    dec ebx
    xor edx, edx
    div ecx
    add dl, '0'
    mov [ebx], dl
    test eax, eax
    jnz .convertir

    mov eax, 4          ; syscall write
    mov ecx, ebx        ; puntero al número convertido
    mov edx, buffer + 10
    sub edx, ebx        ; longitud del número
    mov ebx, 1          ; stdout
    int 0x80
    ret
