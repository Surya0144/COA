.MODEL SMALL
.STACK 100H
.DATA
    msg1 db 'Enter a single-digit number (1-9) for the nth Fibonacci term: $'
    msg2 db 13, 10, 'The nth Fibonacci term is: $'
    fibo_res db 0      ; To store the result (nth Fibonacci term) as a single byte
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message to the user
    MOV AH, 09H
    LEA DX, msg1
    INT 21H

    ; Read user input (single-digit number) from keyboard
    MOV AH, 01H
    INT 21H
    SUB AL, '0'          ; Convert ASCII to integer
    MOV CL, AL           ; Store the input number in CL for later use

    ; Check if input is valid (1-9)
    CMP CL, 1
    JB END_PROGRAM       ; If less than 1, end program (invalid input)
    CMP CL, 9
    JA END_PROGRAM       ; If greater than 9, end program (invalid input)

    ; Handle base cases for Fibonacci
    CMP CL, 1
    JE FIB_ONE           ; If n = 1, set result to 0
    CMP CL, 2
    JE FIB_TWO           ; If n = 2, set result to 1

    ; Initialize Fibonacci values for n > 2
    MOV AL, 0            ; First Fibonacci term
    MOV BL, 1            ; Second Fibonacci term

FIB_LOOP:
    MOV AH, AL           ; Save previous term in AH
    ADD AL, BL           ; AL = AL + BL (next Fibonacci term)
    MOV BL, AH           ; Update BL to previous term
    DEC CL               ; Decrement n (CL)
    CMP CL, 2
    JG FIB_LOOP          ; Continue if CL > 2

    ; Store the result in fibo_res
    MOV fibo_res, AL

DISPLAY_RESULT:
    ; Display result message
    MOV AH, 09H
    LEA DX, msg2
    INT 21H

    ; Convert result to ASCII and display
    MOV AL, fibo_res
    ; Check if result is a single-digit or needs multiple characters
    MOV AH, 0            ; Clear AH for division
    MOV BL, 10
    DIV BL               ; Divide result by 10; quotient in AL, remainder in AH

    ; Display quotient if greater than zero
    CMP AL, 0
    JE DISPLAY_REMAINDER
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H

DISPLAY_REMAINDER:
    ; Display remainder (last digit)
    MOV AL, AH
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H

END_PROGRAM:
    ; End program
    MOV AH, 4CH
    INT 21H

FIB_ONE:
    MOV AL, 0            ; First Fibonacci term is 0
    MOV fibo_res, AL
    JMP DISPLAY_RESULT

FIB_TWO:
    MOV AL, 1            ; Second Fibonacci term is 1
    MOV fibo_res, AL
    JMP DISPLAY_RESULT

MAIN ENDP
END MAIN
