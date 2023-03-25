section .data
    message db 'Even numbers from 2 to 100:', 10
    num_format db '%d', 10, 0
section .text
    global _start
_start:
    ; print message
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 27
    int 0x80
    
    ; loop through even numbers
    mov eax, 2
loop:
    ; print current number
    push eax
    mov eax, 4
    mov ebx, 1
    mov ecx, num_format
    mov edx, 3
    int 0x80
    add esp, 4
    
    ; increment number
    add eax, 2
    
    ; check if number is less than or equal to 100
    cmp eax, 101
    jle loop
    
    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
