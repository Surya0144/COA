ORG 100h          ; Origin, to specify that the program starts at 100h (COM file format)

; Print "Enter a character: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_enter_char ; Load address of the string
INT 21h           ; Call DOS interrupt to print the string

; Read a single character from the user
MOV AH, 01h       ; DOS function 01h: input single character
INT 21h           ; Call DOS interrupt to read the character
MOV DL, AL        ; Move the input character from AL to DL for printing
MOV BL,AL

; Print "The entered character is: "
MOV AH, 09h       ; DOS function 09h: print string
MOV DX, OFFSET msg_entered_char ; Load address of the second string
INT 21h           ; Call DOS interrupt to print the string

; Print the entered character
MOV DL ,BL
MOV AH, 02h       ; DOS function 02h: print single character
INT 21h           ; Call DOS interrupt to print the character

; Terminate the program
MOV AH, 4Ch       ; DOS function 4Ch: terminate program
INT 21h           ; Call DOS interrupt to exit

; Data section
msg_enter_char DB 'Enter a character: $'          ; Prompt message
msg_entered_char DB 0Dh, 0Ah, 'The entered character is: $' ; Newline and display message

END              ; End of program
