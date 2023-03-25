section .data
    num1 dd 10
    num2 dd 20

section .text
    global _start

_start:
    ; Load the first number into the EAX register
    mov eax, [num1]
    
    ; Add the second number to the EAX register
    add eax, [num2]
    
    ; Move the result to the EBX register
    mov ebx, eax
    
    ; Exit the program
    mov eax, 1       ; system call for exit
    xor ebx, ebx     ; return 0 status
    int 0x80         ; call kernel
    
