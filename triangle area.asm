section .data
    prompt1 db "Enter the base of the triangle: ", 0
    prompt2 db "Enter the height of the triangle: ", 0
    result_msg db "The area of the triangle is: ", 0
    newline db 0Ah, 0Dh, 0
    
section .bss
    base resb 2
    height resb 2
    result resw 1
    
section .text
    global _start

_start:
    ; Prompt for and input the base of the triangle
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 29
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, base
    mov edx, 2
    int 0x80
    
    ; Prompt for and input the height of the triangle
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 31
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, height
    mov edx, 2
    int 0x80
    
    ; Convert base and height from ASCII to integer
    mov eax, 0
    mov ebx, base
    mov cl, [ebx]
    sub cl, 0x30
    mov ch, 10
    mul ch
    mov cl, [ebx+1]
    sub cl, 0x30
    add eax, ecx
    mov ebx, eax
    mov [base], bx
    
    mov eax, 0
    mov ebx, height
    mov cl, [ebx]
    sub cl, 0x30
    mov ch, 10
    mul ch
    mov cl, [ebx+1]
    sub cl, 0x30
    add eax, ecx
    mov ebx, eax
    mov [height], bx
    
    ; Calculate the area of the triangle
    mov ax, [base]
    mul word [height]
    mov ebx, eax
    
    ; Divide by 2 to get the final result
    shr ebx, 1
    mov [result], bx
    
    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 27
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, [result]
    add ecx, 0x30
    mov edx, 2
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 3
    int 0x80
    
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
