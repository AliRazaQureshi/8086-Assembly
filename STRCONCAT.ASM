TITLE PGM4_1: STRING CONCATENATION
.MODEL SMALL
.STACK 100H
.DATA 
string1 db 20
        db ?
	db 20 dup('$')
string2 db 20
        db ?
	db 20 dup('$')

.code
mov ax, @data
mov ds,ax
mov es, ax

lea dx,string1; INPUT STRING1
mov ah,0AH
int 21h

mov dl,0ah; PRINT A LINE FEED
mov ah,2
int 21h

lea dx,string2; INPUT STRING2
mov ah,0AH
int 21h

mov dl,0ah; PRINT A LINE FEED
mov ah,2
int 21h

LEA SI, [STRING2+2]; SETTING SI AND DI
MOV CL,[STRING2+1]
MOV CH,0
MOV BL,[STRING1+1]
MOV BH,0
ADD BL,2
LEA DI, [STRING1+BX]
CLD
REP MOVSB ; COPYING CHARACTERS

mov dx, offset string1+2; PRINTING CONCATENATED STRING
mov ah,9h
int 21h

MOV AH,4CH ; DOS exit
INT 21H
end

