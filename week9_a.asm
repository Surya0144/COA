ORG 100h

; Prompt for the first single-digit number
mov dx, offset msg_input1
mov ah, 09h
int 21h

; Get first digit
mov ah, 01h
int 21h
mov bl, al               ; Store first digit in BL
cmp al, '0'              ; Check if it's a valid digit
jl NotDigit
cmp al, '9'
jg NotDigit

; Display the first digit
mov dx, offset msg_output1
mov ah, 09h
int 21h
mov dl, bl
mov ah, 02h
int 21h

; Prompt for the second single-digit number
mov dx, offset msg_input2
mov ah, 09h
int 21h

; Get second digit
mov ah, 01h
int 21h
mov cl, al               ; Store second digit in CL
cmp al, '0'              ; Check if it's a valid digit
jl NotDigit
cmp al, '9'
jg NotDigit

; Display the second digit
mov dx, offset msg_output2
mov ah, 09h
int 21h
mov dl, cl
mov ah, 02h
int 21h


cmp bl, cl
je msg          
mov dx, offset msg_Notequal
mov ah, 09h
int 21h 
jmp endprogram


msg:
mov dx, offset msg_equal
mov ah, 09h
int 21h

jmp endprogram 


; Handle invalid input
NotDigit:
mov dx, offset msg_error
mov ah, 09h
int 21h

; End the program
endprogram:
mov ah, 4Ch
int 21h

; Data section
msg_input1 DB "Enter first digit: $"
msg_output1 DB 0Dh, 0Ah, "The first digit is: $"
msg_input2 DB 0Dh, 0Ah, "Enter second digit: $"
msg_output2 DB 0Dh, 0Ah, "The second digit is: $"
msg_equal DB 0Dh, 0Ah, "Both are Equal $" 
msg_Notequal DB 0Dh, 0Ah, "Both are Not Equal $"
msg_error DB 0Dh, 0Ah, "Error: Not a digit!$"
