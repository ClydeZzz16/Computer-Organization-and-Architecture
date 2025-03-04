.stack 64
.data
    num1  db  45H
    num2  dw  1650
    num3  dd  9254
    text  db  "HELLO"  ; ASCII: 'H' = 48H, 'E' = 45H, 'L' = 4CH, 'L' = 4CH, 'O' = 4FH
    table dw  3A5CH, 27F8H, 1983H, 4120H
    pairs dd  23789, 10526, 17892
.code
main proc near
    ; Data segment starts at 07650H
    mov AX, @data
    mov DS, AX

    ; Start tracing registers
    mov AL, num1
    mov BX, table
    add BL, AL
    mov CX, num2
    mov DX, pairs+4
    sub CH, DL
    mov AX, num3
    add AH, BH
    mov SI, table+6
    mov DI, pairs+8
    add SI, DI
    ; End tracing here

    mov DX, 04C00H
    mov AX, DX
    int 21H
main endp