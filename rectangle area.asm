.model small
.stack 100h

.data
length dw 5
width dw 10
area dw ?

.code
main proc
    mov ax, length     ; move the length value into register ax
    mul width           ; multiply the length by the width
    mov area, ax        ; move the result into the area variable
    mov ah, 4ch        ; exit program
    int 21h
main endp
end main
