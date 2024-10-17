ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter 1st digit: "
MOV DX, OFFSET msg_input  
MOV AH, 09h        
INT 21h            

; Read the first digit
MOV AH, 01h       
INT 21h            
MOV BL, AL          ; Store the first digit in BL

; Check if the first character is a digit (0-9)
CMP AL, '0'        
JL NotDigit         
CMP AL, '9'        
JG NotDigit         

; Display message "Enter 2nd digit: "
MOV DX, OFFSET msg_input1  
MOV AH, 09h        
INT 21h            

; Read the second digit
MOV AH, 01h       
INT 21h            
MOV BH, AL          ; Store the second digit in BH

; Check if the second character is a digit (0-9)
CMP AL, '0'        
JL NotDigit        
CMP AL, '9'        
JG NotDigit        

; Display "The entered digit is: "
MOV DX, OFFSET msg_output  
MOV AH, 09h        
INT 21h            

; Print the first digit
MOV DL, BL         
MOV AH, 02h        
INT 21h            

; Print the second digit
MOV DL, BH         
MOV AH, 02h        
INT 21h            

JMP EndProgram     

NotDigit:
; If the input is not a digit, display an error message
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h            

EndProgram:
; Terminate the program
MOV AH, 4Ch        
INT 21h            

msg_input  DB 'Enter 1st digit: $'
msg_input1 DB 0Dh, 0Ah, 'Enter 2nd digit: $'
msg_output DB 0Dh, 0Ah, 'The entered digits are: $'
msg_error  DB 0Dh, 0Ah, 'Error: Not a digit! $'

END
