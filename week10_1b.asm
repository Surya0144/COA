ORG 100h

MOV DX, OFFSET msg
MOV AH, 09h
INT 21h

MOV CX, 26
MOV AL, 'Z'

PrintLoop:
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    DEC AL
    LOOP PrintLoop

MOV AX, 4C00h
INT 21h

msg DB 'Printing characters from Z to A:$'