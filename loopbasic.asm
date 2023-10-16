.model small
.stack 100h

.data
    a db 'Loop Concept $'

.code
main proc
    ; data segment
    mov ax, @data
    mov ds, ax

    ; print string  
    mov ah, 9
    lea dx, a
    int 21h

    ; new line
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    ; print a to z
    ; loop er kaj cx register a kora hoy

    mov cx, 26 ; 26 ta letter ba loop ta 26 bar cholbe
    mov ah, 2
    mov dl, 'A'

    level1:
        int 21h
        inc dl  ; increment dl register to print next letter
        loop level1

    ; exit
    mov ah, 4ch
    int 21h
    
main endp
end main
