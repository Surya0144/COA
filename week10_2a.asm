ORG 100h

; Display the message "Printing numbers from 9 to 0:"
MOV DX, OFFSET msg       ; Load address of the message
MOV AH, 09h              ; DOS function to display a string
INT 21h                  ; Call DOS interrupt to print the string

MOV CX, 10               ; Set counter for 10 iterations (9 to 0)
MOV AL, '9'              ; Initialize AL with ASCII for '9'

PrintLoop:
    MOV DL, AL           ; Move current ASCII character to DL for output
    MOV AH, 02h          ; DOS function to print a character
    INT 21h              ; Call DOS interrupt to print the character in DL

    DEC AL               ; Decrement AL to get the previous ASCII character
    LOOP PrintLoop       ; Decrement CX and repeat loop if CX is not zero

; Exit program
MOV AX, 4C00h            ; DOS function to terminate program
INT 21h                  ; Terminate program

; Data section
msg DB 'Printing numbers from 9 to 0:$'  ; Message to display before the numbers