ORG 100h
MOV DX, OFFSET msg      
MOV AH, 09h              
INT 21h                  

MOV CX, 10             
MOV AL, '0'              

PrintLoop:
    MOV DL, AL           
    MOV AH, 02h          
    INT 21h              

    INC AL              
    LOOP PrintLoop       

MOV AX, 4C00h            
INT 21h                  
msg DB 'Printing numbers from 0 to 9:$'