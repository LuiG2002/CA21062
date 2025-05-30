org 100h

section .data
x dw 50
y dw 3
z dw 15

mensaje db 'Resultado: $'
buffer db '00', 13, 10, '$'

section .text
start:
    mov ax, x
    sub ax, y
    sub ax, z

    mov bx, 10
    xor dx, dx
    div bx

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
