.model small
.stack 100h

.code
main proc
    ; char input
    mov ah, 1
    int 21h
    mov bl, al

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; char input
    mov ah, 1
    int 21h
    mov bh, al

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; char output
    mov ah, 2
    mov dl, bl
    int 21h

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; char output
    mov ah, 2
    mov dl, bh
    int 21h

    ; beep sound
    mov ah, 2
    mov dl, 07
    int 21h

    ; exit
    mov ah, 4ch
    int 21h
main endp
end main
