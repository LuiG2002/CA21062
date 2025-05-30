org 100h

section .data
x db 5
y db 3

mensaje db 'Resultado: $'
buffer db '00', 13, 10, '$'

section .text
start:
    mov al, [x]
    mov bl, [y]
    mul bl

    mov bl, 10
    div bl

    add al, '0'
    add ah, '0'
    mov [buffer], al
    mov [buffer+1], ah

    mov ah, 09h
    mov dx, mensaje
    int 21h

    mov dx, buffer
    int 21h

    mov ax, 4C00h
    int 21h