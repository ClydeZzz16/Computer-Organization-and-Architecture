                   .model small
.stack 64

.data

input dw 5            ; Input number for the Collatz sequence
output dw ?          ; Output to store the number of steps

.code
    main proc near
        
    ; Set up data segment
    mov AX,@data       ; Load address of data segment into AX
    mov DS,AX          ; Set DS (Data Segment) to AX
    mov ES,AX          ; Set ES (Extra Segment) to AX (not really needed here)
    
    mov AX, input      ; Move the input number into AX register
    
    xor CX, CX         ; Clear CX (step counter) to 0
    
loop1:

    CMP AX, 1          ; Compare AX with 1
    jz done            ; If AX == 1, jump to 'done'
    
    inc CX             ; Increment step counter
    test AX, 1         ; Check if AX is odd (bitwise AND with 1)
    jnz odd            ; If AX is odd, jump to 'odd'

even:
     xor DX, DX        ; Clear DX before division
     mov BX, 2         ; Move divisor 2 into BX
     DIV BX            ; Divide AX by BX, result in AX, remainder in DX
     jmp loop1         ; Jump back to loop1

odd:
    mov BX, 3          ; Move multiplier 3 into BX
    MUL BX             ; Multiply AX by BX
    inc AX             ; Add 1 to AX
    jmp loop1          ; Jump back to loop1



done:
     mov output, CX    ; Store the step count in 'output'
     mov AX,4C00h      ; Exit program
     int 21h           ; DOS interrupt to terminate program

main endp
