section .data
    num1 dd 10        ; first number
    num2 dd 20        ; second number
    num3 dd 15        ; third number
    temp dd 0         ; temporary variable to store largest number

section .text
    global _start

_start:
    ; Compare num1 and num2
    mov eax, [num1]    ; move num1 to eax
    cmp eax, [num2]    ; compare with num2
    jge larger1        ; jump to larger1 if num1 >= num2
    mov eax, [num2]    ; move num2 to eax if num1 < num2

larger1:
    mov [temp], eax    ; store the largest number in temp
    
    ; Compare temp and num3
    mov eax, [temp]    ; move temp to eax
    cmp eax, [num3]    ; compare with num3
    jge larger2        ; jump to larger2 if temp >= num3
    mov eax, [num3]    ; move num3 to eax if temp < num3

larger2:
    ; eax now contains the largest number
    ; we can perform further operations here
    ; ...

    ; exit program
    mov eax, 1         ; system call for exit
    xor ebx, ebx       ; return value 0
    int 0x80           ; call kernel
