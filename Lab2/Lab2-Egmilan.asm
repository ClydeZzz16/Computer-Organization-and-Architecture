.stack 64 
.data 
   ;declare the variables from the memory map here
   input dw 5 
   output dw ?
    
.code 
   main proc near 
   mov AX,@data 
   mov DS,AX 
   mov ES,AX 
   
    
   ;Write your assembly code here
   
   mov AX, input
   
   xor CX, CX
   
loop:
   cmp AX, 1
   je done
   
   inc CX
   test AX, 1
   jnz odd

even:
   xor DX, DX
   mov BX, 2
   DIV BX
   jmp loop


odd:
   mov BX, 3
   mul BX
   add AX, 1
   jmp loop


done: 
   mov output, CX
 
 
 
   mov AX,4C00H 
   int 21H 
 
   main endp 