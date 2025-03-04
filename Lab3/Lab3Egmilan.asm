.model small 
.stack 64 
.data
 
 
   InitArray db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
   FibInit dw 20 dup (0)
   
.code 
   main proc near 
   mov AX,@data 
   mov DS,AX 
   mov ES,AX 
    
   ;Write your assembly code here
   

   mov CX,0   
     
     

Loop1:
    cmp CX, 20
    je done1
    
     
    mov DI,CX
    mov AH,InitArray[DI] 
    
    mov BX, 0
    mov DX, 1
    

Loop2:
    cmp AH, 0
    jz storage
    
    mov SI, DX
    add DX, BX  ;DX = DX + BX
    mov BX, SI  
    
    dec AH
    jmp loop2
  


storage:
    shl DI, 1      ;multiply the DI by 2 because FibInit is a word :) 
    mov FibInit[DI], DX
      
    inc CX       
    jmp loop1
    
done1: 
 
    
   mov AX,4C00H 
   int 21H 
 
   main endp  