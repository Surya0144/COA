ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message "Enter the first digit: "
MOV DX, OFFSET msg_input1  ; Load the address of the first input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read the first digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer by subtracting '0'
MOV BL, AL         ; Store the first digit in BL

; Display message "Enter the second digit: "
MOV DX, OFFSET msg_input2  ; Load the address of the second input message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the message

; Read the second digit from the user
MOV AH, 01h        ; Function 01h of INT 21h is used to read a character
INT 21h            ; Call DOS interrupt to get the character
SUB AL, '0'        ; Convert ASCII to integer by subtracting '0'
MOV BH, AL         ; Store the second digit in BH

; Perform the subtraction (first digit - second digit)
MOV AL, BL         ; Move the first digit to AL
SUB BL, BH         ; Subtract the second digit from the first

; Check if the result is negative
JS Negative        ; Jump to Negative if the result is less than zero

; If result is positive or zero, display the result
ADD BL, '0'        ; Convert the result back to ASCII by adding '0'

; Display message "The result is: "
MOV DX, OFFSET msg_output  ; Load the address of the output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the output message

; Print the result of the subtraction
MOV DL, BL         ; Move the result to DL for printing
MOV AH, 02h        ; Function 02h of INT 21h is used to print a single character
INT 21h            ; Call DOS interrupt to print the result
JMP EndProgram     ; Jump to end of program

Negative:
; If the result is negative, display an alert message
MOV DX, OFFSET msg_output2  ; Load the address of the negative output message
MOV AH, 09h        ; Function 09h of INT 21h is used to display a string
INT 21h            ; Call DOS interrupt to print the negative alert message

EndProgram:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch of INT 21h terminates the program
INT 21h            ; Call DOS interrupt to exit

msg_input1  DB 'Enter the first digit: $'
msg_input2  DB 0Dh, 0Ah, 'Enter the second digit: $'
msg_output DB 0Dh, 0Ah, 'The result is: $'  ; Output message
msg_output2 DB 0Dh, 0Ah, 'The result is a negative number$'  ; Negative result message

END                ; End of program
