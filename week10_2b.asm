ORG 100h

; Display the message "Printing characters from A to Z:"
MOV DX, OFFSET msg       ; Load address of the message
MOV AH, 09h              ; DOS function to display a string
INT 21h                  ; Call DOS interrupt to print the string

MOV CX, 26               ; Set counter for 26 iterations (A to Z)
MOV AL, 'A'              ; Initialize AL with ASCII for 'A'

PrintLoop:
    MOV DL, AL           ; Move current ASCII character to DL for output
    MOV AH, 02h          ; DOS function to print a character
    INT 21h              ; Call DOS interrupt to print the character in DL

    INC AL               ; Increment AL to get the next ASCII character
    LOOP PrintLoop       ; Decrement CX and repeat loop if CX is not zero

; Exit program
MOV AX, 4C00h            ; DOS function to terminate program
INT 21h                  ; Terminate program

; Data section
msg DB 'Printing characters from A to Z:$'  ; Message to display before characters