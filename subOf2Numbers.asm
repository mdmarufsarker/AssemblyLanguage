.model small
.stack 100h

.data
    msg1 db "Enter 1st Digit : $"
    msg2 db 10, 13 "Enter 2nd Digit : $"
    msg3 db 10, 13 "Subtraction = $"
    res db ?

.code
main proc
    ; data segment
    mov ax, @data
    mov ds, ax

    ; print msg1
    mov ah, 9
    lea dx, msg1
    int 21h

    ; input n1
    mov ah, 1
    int 21h
    mov bl, al

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; print msg2
    mov ah, 9
    lea dx, msg2
    int 21h

    ; input n2
    mov ah, 1
    int 21h
    mov bh, al

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; print msg3
    mov ah, 9
    lea dx, msg3
    int 21h

    ; sub n1 and n2
    sub bl, bh
    add bl, 48  ; sub krte gele 48 add krte hoy
    mov res, bl

    ; print result
    mov ah, 2
    mov dl, res
    int 21h

    ; exit
    mov ah, 4ch
    int 21h
main endp
end main

