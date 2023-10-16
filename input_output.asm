.model small
.stack 100h

.code
main proc
    ; first input
    mov ah, 1   ; function 1, read char from keyboard
    int 21h     ; call DOS
    mov bl, al  ; save char in bl

    ; second input
    mov ah, 1   ; function 1, read char from keyboard
    int 21h     ; call DOS
    mov bh, al  ; save char in bh

    ; output 1st input
    mov ah, 2   ; function 2, write char to screen
    mov dl, bl  ; move char from bl to dl (dl is the register for output)
    int 21h     ; call DOS

    ; output 2nd input
    mov ah, 2   ; function 2, write char to screen
    mov dl, bh  ; move char from bh to dl (dl is the register for output)
    int 21h     ; call DOS

    mov ax, 4ch ; exit program
    int 21h     ; call DOS
main endp
end main
