section .data

num1 dd 10     ; first number
num2 dd 20     ; second number
temp dd 0      ; temporary variable to hold one of the values

section .text
global _start

_start:
   ; exchange values of num1 and num2
   mov eax, [num1]   ; move num1 into eax
   mov ebx, [num2]   ; move num2 into ebx
   mov [temp], eax   ; move num1 into temp variable
   mov eax, ebx      ; move num2 into eax
   mov ebx, [temp]   ; move temp into ebx
   mov [num1], eax   ; move new num2 into num1
   mov [num2], ebx   ; move new num1 into num2

   ; exit program
   mov eax, 1        ; system call for exit
   xor ebx, ebx      ; return 0 status
   int 0x80          ; execute system call
