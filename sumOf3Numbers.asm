.model small
.stack 100h

.data
    msg db ?

.code
main proc
    ; data segment
    mov ax, @data
    mov ds, ax

    ; first number
    mov ah, 1
    int 21h
    mov bl, al

    ; second number
    mov ah, 1
    int 21h
    mov bh, al

    ; third number
    mov ah, 1
    int 21h
    mov cl, al

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; add 3 numbers
    ; approach: add first 2 ta number add kore ans ekta register a store kore thn oi value ta 3rd number er shathe add kore ans print krte hobe

    ; a + b
    add bl, bh
    sub bl, 48
    mov ch, bl

    ; (a + b) + c
    add ch, cl
    sub ch, 48
    mov msg, ch

    ; print Sum
    mov ah, 2
    mov dl, msg
    int 21h

    ; exit
    mov ah, 4ch
    int 21h
main endp
end main