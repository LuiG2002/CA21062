org 100h

section .data
x db 50
y db 3
z db 15

mensaje db 'Resultado: $'
buffer db '00', 13, 10, '$'

section .text
start:
    mov al, [x]
    sub al, [y]
    sub al, [z]

    mov bl, 10
    xor ah, ah
    div bl

    add al, '0'
    add ah, '0'
    mov [buffer], ah
    mov [buffer + 1], al

    mov ah, 09h
    mov dx, mensaje
    int 21h

    mov ah, 09h
    mov dx, buffer
    int 21h

    mov ax, 4C00h
    int 21h
