;------------------------
;  REVERSE SCREEN (GRAPHICS MODE)
;     THIS ROUTINE WILL INVERT(CHANGE STATE) EVERY PIXEL ON THE SCREEN
;
;   FOR USE BY BASIC PROGRAMS ONLY.  NO CALLING ARGUMENTS.
;-------------------------
CDSEG	SEGMENT
	ASSUME	CS:CDSEG
RVSCRG	PROC	FAR
	PUSH	BP
	MOV	BP,SP
;
	PUSH	DS
	PUSH	ES
	PUSH	DI
	PUSH	SI
	MOV	AX,0B800H	;  BASE ADDR OF DISPLAY BUFFER
	MOV	ES,AX
	MOV	DS,AX
	MOV	AX,0
	MOV	SI,AX		;  SET BEGINING OFFSET FOR READING
	MOV	DI,AX		;  SET BEGINING OFFSET VALUE(0)
	MOV	CX,8192		;  NO. OF WORDS IN BUFFER TO FILL
	CLD			;  SET DRCTN FLAG TO INCR
REV1:
	LODSW			;  GET WORD FROM MEMORY
	NOT	AX		;  INVERT BITS
	STOSW			;  STORE NEW WORD INTO SAME LOCATION
	LOOP	REV1		;  DO UNTIL CX=0
;
	POP	SI
	POP	DI
	POP	ES
	POP	DS
	POP	BP
	RET
RVSCRG	ENDP
CDSEG	ENDS
	END
