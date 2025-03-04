.model small
.stack 64

.data
    InitArray db 8, 2, 6, 3, 7, 18, 1, 14, 12, 11, 9, 10, 4, 5, 13, 16, 5, 19, 12, 10 
    FibInt dw 20 dup (?)           ; Array to store the calculated Fibonacci numbers

.code
main proc near
    ; Setup data segment
    mov AX, @data        
    mov DS, AX           
    mov ES, AX           

    mov CX, 0            ; Outer loop counter, starts at 0

L120:                    ; Outer loop for accessing array elements
    cmp CX, 20           ; Check if we've processed all 20 elements
    jz done              ; If CX == 20, we’re done

    mov DI, CX           ; DI = current array index
    mov AH, InitArray[DI]; AH = current array element (number of Fibonacci terms)

    ; Initialize the first two terms of the Fibonacci sequence
    mov BX, 0            ; BX = F(n-2)
    mov DX, 1            ; DX = F(n-1)

L121:                    ; Inner loop for calculating the nth Fibonacci number
    cmp AH, 0            ; If AH == 0, we’ve reached the desired term
    jz store             ; Jump to store the result

    mov SI, DX           ; Save F(n-1) into SI temporarily
    add BX, DX           ; BX = F(n-2) + F(n-1) = F(n)
    mov DX, BX           ; DX becomes the new F(n-1)
    mov BX, SI           ; BX becomes the previous term F(n-2)

    dec AH               ; Decrease term counter
    jmp L121             ; Repeat until AH == 0

store:                  ; Store the Fibonacci number into FibInt
    shl DI, 1            ; Multiply array index by 2 (since FibInt stores words)
    mov FibInt[DI], DX   ; Store the calculated Fibonacci number

    inc CX               ; Move to the next array element
    jmp L120             ; Go back to the outer loop

done:                   ; Program termination
    mov AX, 4C00H        ; DOS interrupt to terminate the program
    int 21H              

main endp
