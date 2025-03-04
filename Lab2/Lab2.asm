.model small
.stack 64

.data

input dw 5
output dw ?


.code
    main proc near
        
    mov AX,@data
    mov DS,AX
    mov ES,AX
    
    mov AX, input 
    
    xor CX, CX
    

loop1:

    CMP AX, 1
    jz done
    
    inc CX
    test AX, 1
    jnz odd
    
 

even:
     xor DX, DX
     mov BX, 2
     DIV BX
     jmp loop1


odd:
    mov BX, 3
    MUL BX
    inc AX
    jmp loop1



done:

     mov output, CX
     mov AX,4C00h
     int 21h

main endp    