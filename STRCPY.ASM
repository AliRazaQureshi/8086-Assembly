; inputs a string string1, copies it to another location string2,prints total characters in string, introduces full segment definition
DATASEG  SEGMENT	

	STRING1  DB  20
                 DB  ?
                 DB 20 DUP('$')
        STRING2  DB 20 DUP('$')

DATASEG  ENDS	    

ASSUME  CS:CODESEG
ASSUME  DS:DATASEG

CODESEG  SEGMENT

    MAIN PROC

	MOV  AX,DATASEG
	MOV  DS,AX
        MOV  ES,AX

	MOV  AH,0Ah; input string1
        LEA  DX,STRING1
	INT  21H
        LEA  SI,STRING1+2
	LEA  DI,STRING2
	CLD
	MOV  CX,10
	REP  MOVSB; copy 10 characters of from input string to string 2
         
        mov ah,2h; printing new line
        mov dl,0ah
        int 21h


	LEA  DX,STRING2
	MOV  AH,9; printing string2
	INT  21H

        mov ah,2h; printing new line
        mov dl,0ah
        int 21h
	
        MOV  DL,STRING1+1; printing total number of characters in string1
	ADD  DL,30h ; if <=9, otherwise erroneous output 
	MOV  AH,2 
	INT  21H

        MOV AH,4CH
        INT 21H

    MAIN    ENDP

CODESEG ENDS

END

