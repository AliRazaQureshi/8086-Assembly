;calculate the sum of numbers in an array AND THEIR AVERAGE
.MODEL SMALL
.STACK 100H
.DATA
.DATA
    BYTELIST DB 1,2,3,4,5,6,7,8,9,10
    TOTAL DW ?
.CODE
     MOV AX, @DATA
     mov ds, ax
     MOV AX, 0
     MOV CX, 10
     MOV SI, OFFSET BYTELIST
NEXTBYTE:
     ADD AL, BYTE PTR [SI]
     INC SI
     LOOP NEXTBYTE
     MOV TOTAL, AX
     MOV CL, 10
     DIV CL

;DOS exit
MOV AH,4CH 
INT 21H
END
