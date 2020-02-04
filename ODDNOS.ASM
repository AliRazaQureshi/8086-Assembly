;code to print odd numbers form 1 to 100
.model small
.STACK 100H
.DATA
LF EQU '0DH'
.CODE
MAIN PROC
MOV CX,0001H
MOV DX,0
BACK: MOV DL, CH; printing CH
OR DL, 30H
MOV AH, 2
INT 21H
MOV DL, CL; printing CL
OR DL, 30H
MOV AH, 2
INT 21H
CMP CL, 9
MOV DL, 20H; printing space
MOV AH, 2
INT 21H
JGE UNITSREACHED
ADD CL, 2
JMP UNITSUNREACHED
UNITSREACHED:
ADD CH, 1; beginning the next cycle in counting
MOV CL, 1 ; units position start from 1 always
CMP CH , 9
JG EXIT
UNITSUNREACHED: JMP BACK
EXIT: MOV AH, 4CH
INT 21H
END MAIN 
MAIN ENDP
