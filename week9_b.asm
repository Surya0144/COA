ORG 100h
mov dx, offset msg_input1
mov ah, 09h
int 21h
mov ah, 01h
int 21h
mov bl, al
cmp al, '0'
jl NotDigit
cmp al, '9'
jg NotDigit
mov dx, offset msg_output1
mov ah, 09h
int 21h
mov dl, bl
mov ah, 02h
int 21h
sub bl, '0'
mov al, bl
mov ah, 0      
mov cl, 2     
div cl        
cmp ah, 0
je even
mov dx, offset msg_odd
mov ah, 09h
int 21h
jmp endprogram
even:
mov dx, offset msg_even
mov ah, 09h
int 21h
jmp endprogram
NotDigit:
mov dx, offset msg_error
mov ah, 09h
int 21h
endprogram:
mov ah, 4Ch
int 21h
msg_input1 DB "Enter a digit: $"
msg_output1 DB 0Dh, 0Ah, "The entered digit is: $"
msg_even DB 0Dh, 0Ah, "The entered digit is even$"
msg_odd DB 0Dh, 0Ah, "The entered digit is odd$"
msg_error DB 0Dh, 0Ah, "Error: Not a digit!$"