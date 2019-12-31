.MODEL SMALL
.STACK 100H
.DATA
    MSG1   DB 10,13,'INPUT N:- $'
    MSG2   DB 10,13,'SUM TO N IS:- $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    MOV AH, 01H
    INT 21H
    SUB AL, 30H

    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    MOV AH, 0H
    MOV CX, AX
    MOV BX, 0H

SUM:
    ADD BX, CX
    LOOP SUM
    
    MOV CX, 4H

START:
    PUSH CX

    MOV CL, 4
    ROL BX, CL
    POP CX
    MOV DL, BL
    AND DL, 0FH
    ADD DL, 30H
    CMP DL, 39H
    JLE PRINT
    ADD DL, 07H

PRINT:
    MOV AH, 02H
    INT 21H

    LOOP START
    
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN