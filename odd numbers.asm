section .data
    message db 'Odd numbers from 2 to 100:', 0Ah, 0
    format db '%d ', 0

section .text
    global _start

_start:
    ; Print message
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 23
    int 0x80
    
    ; Calculate and print odd numbers
    mov ecx, 2  ; Initialize counter to 2
    loop_start:
        cmp ecx, 101  ; Check if counter reached 101
        jge loop_end
        test ecx, 1  ; Check if counter is odd
        jz loop_continue
        push ecx  ; Save odd number on stack
        mov eax, ecx  ; Prepare argument for printf
        mov ebx, 1
        mov ecx, format
        mov edx, 3
        int 0x80
        add esp, 4  ; Remove odd number from stack
        loop_continue:
        inc ecx  ; Increment counter
        jmp loop_start
    loop_end:
    
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
