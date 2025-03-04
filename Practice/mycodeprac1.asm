;lab1

;.model small 
;.stack 64 
;.data 
   ;declare the variables from the memory map here
;   var1 db 164
;   var2 dw 84FBH
;   var3 dd 85BA45FDH
;   set1 db 05H, 06H, 07H, 08H, 0AH, 0BH, 0CH
;   set2 dw 078AH, 9453H, 321AH
   
    
;.code 
;   main proc near 
 ;  mov AX,@data 
 ;  mov DS,AX 
 ;  mov ES,AX 
    
 ;  ;Write your assembly code here
   
 ;  mov AH, var1
  ; mov AL, set1
  ; mov BX, var2
  ; mov CX, set2
  ; mov DX, AX
   
  ; mov var1, CH
   ;mov set1, CL
  ; mov var2, AX
  ; mov set2, BX 
 
 
  ; mov AX,4C00H 
   ;int 21H 
 
   ;main endp 
   
   
; lab2

.model small 
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
   
   

loop1:
   cmp AX, 1
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
    mul BX
    inc AX
    jmp loop1


done: 
   mov output, CX 
 
 
 
   mov AX,4C00H 
   int 21H 
 
   main endp  