ORG 100h         ; Set origin for .COM program

MOV DX, OFFSET MSG  ; Load address of MSG into DX
MOV AH, 09h         ; DOS function 09h - Print string
INT 21h            ; Call DOS interrupt

MOV AH, 4Ch        ; DOS function 4Ch - Terminate program
INT 21h            ; Exit

MSG DB 'Hello, World!$'  ; Message with '$' string terminator




