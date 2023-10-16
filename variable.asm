.model small
.stack 100h
.data
    n1 db ?
    n2 db ?

.code
main proc
    ; initialize data segment
    mov ax, @data
    mov ds, ax

    ; read n1
    mov ah, 1   ; 1 = read character
    int 21h
    mov n1, al  ; save the character in n1

    ; read n2
    mov ah, 1
    int 21h
    mov n2, al

    ; print n1 + n2
    mov dl, n1  ; move n1 to dl
    add dl, n2  ; add n2 to dl
    mov ah, 2   ; 2 = print character
    int 21h

    ; exit
    mov ax, 4ch
    int 21h
main endp
end main
