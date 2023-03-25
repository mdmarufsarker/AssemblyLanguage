section .data
    prompt db 'Enter the radius of the circle: ', 0
    result db 'The area of the circle is: ', 0
    pi dd 3.14159  ; constant pi value
    
section .bss
    radius resd 1   ; reserve space for the radius input
    
section .text
    global _start
    
_start:
    ; display prompt and read radius input
    mov eax, 4      ; system call to print prompt
    mov ebx, 1      ; file descriptor for stdout
    mov ecx, prompt
    mov edx, 30
    int 0x80        ; call kernel
    
    mov eax, 3      ; system call to read integer input
    mov ebx, 0      ; file descriptor for stdin
    mov ecx, radius
    mov edx, 4
    int 0x80        ; call kernel
    
    ; calculate and display the area
    fld dword [radius]  ; load radius into FPU
    fmul dword [radius] ; square radius
    fmul dword [pi]     ; multiply by pi
    mov eax, 4           ; system call to print result
    mov ebx, 1           ; file descriptor for stdout
    mov ecx, result
    mov edx, 28
    int 0x80             ; call kernel
    
    ; exit program
    mov eax, 1      ; system call to exit
    xor ebx, ebx    ; return 0 status
    int 0x80        ; call kernel
