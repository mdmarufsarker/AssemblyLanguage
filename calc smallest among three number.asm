section .data

num1 db 10     ; first number
num2 db 20     ; second number
num3 db 30     ; third number

section .text
global _start

_start:

    mov al, num1    ; move num1 to al register
    cmp al, num2    ; compare num1 with num2
    jle check_num3  ; jump to check_num3 if num1 <= num2
    mov al, num2    ; move num2 to al register if num1 > num2

check_num3:
    cmp al, num3    ; compare the smallest number with num3
    jle print_smallest   ; jump to print_smallest if the smallest number <= num3
    mov al, num3    ; move num3 to al register if the smallest number > num3

print_smallest:
    ; al register now contains the smallest number
    ; you can print or store it as per your requirement
    ; for example:
    mov dl, al     ; move the smallest number to dl register
    add dl, '0'    ; convert the number to ASCII code
    mov ah, 0x02   ; set the output function to display character
    int 0x21       ; call the DOS interrupt to print the smallest number

    ; exit program
    mov ah, 0x4c   ; set the exit function
    xor al, al     ; set the exit code to 0
    int 0x21       ; call the DOS interrupt to exit program
