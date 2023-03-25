section .data
    msg db "Enter a number: ", 0
    out_msg db "You entered: ", 0

section .bss
    num resb 2

section .text
    global _start

_start:
    ; output message asking user to enter a number
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 15
    int 0x80

    ; read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 2
    int 0x80

    ; output message with user input
    mov eax, 4
    mov ebx, 1
    mov ecx, out_msg
    mov edx, 13
    int 0x80

    ; output user input
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 2
    int 0x80

    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
