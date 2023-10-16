.model small
.stack 100h

.data
    msg db "I Love Bangladesh $"

.code
    main proc
    ; 1 -> single char input
    ; 2 -> single char output
    ; 9 -> string output

    ; data segment
    mov ax, @data
    mov ds, ax

    ; print string
    mov ah, 9
    lea dx, msg ; load effective address
    int 21h

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; input single char
    mov ah, 1
    int 21h
    mov bl, al

    ; output single char
    mov ah, 2
    mov dl, bl
    int 21h

    ; exit
    mov ah, 4ch
    int 21h

    main endp
end main